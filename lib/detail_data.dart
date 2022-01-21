import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shoeapp/home_page.dart';

class DetailData extends StatefulWidget {
  // const DetailData({ Key? key }) : super(key: key);
  List list;
  int index;
  DetailData({required this.index,required this.list});

  @override
  _DetailDataState createState() => _DetailDataState();
}

class _DetailDataState extends State<DetailData> {

  TextEditingController controllerMerk = new TextEditingController();
  TextEditingController controllerHarga = new TextEditingController();
  TextEditingController controllerImg = new TextEditingController();
  TextEditingController controllerSize = new TextEditingController();

  void addCart(){
    var url = "https://bayucrud.000webhostapp.com/addcart.php";
    http.post(Uri.parse(url),
    body: {
      "merkc": "${widget.list[widget.index]['merk']}",
      "hargac": "${widget.list[widget.index]['harga']}",
      "img_urlc": "${widget.list[widget.index]['img_url']}",
      "sizec": controllerSize.text
    } );
    Fluttertoast.showToast(
      msg: widget.list[widget.index]["merk"] +
      " Ditambahkan",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM);
  }

  void confrimCart(){
    AlertDialog alertDialog = new AlertDialog(
      title: Text("Masukan Size"),
      content: TextField(
        controller: controllerSize,
      ),
      actions: <Widget>[
        new MaterialButton(
          child: new Text("Beli",
          style: TextStyle(color: Colors.white),),
          color: Colors.green,
          onPressed: (){
          addCart();
          Navigator.push(context, MaterialPageRoute(builder: (context) => new HomePage()));
        })
      ],
    );
    showDialog(context: context, builder: (BuildContext context){
      return alertDialog;
    });
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      body:
      new SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          child: new Center(
            child: new Column(
              children: <Widget>[
                new Padding(padding: const EdgeInsets.only(top: 20.0)),
                new Text("${widget.list[widget.index]['merk']}",
                style: new TextStyle(fontSize: 20.0),
                ),
                new Padding(padding: const EdgeInsets.only(top: 20.0)),
                new Image.network("${widget.list[widget.index]['img_url']}"
                ),
                new Padding(padding: const EdgeInsets.only(top: 20.0)),
                new Text("${widget.list[widget.index]['deskripsi']}",
                style: new TextStyle(fontSize: 15.0),
                ),

                new Padding(padding: const EdgeInsets.only(top: 20.0)),
                new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new MaterialButton(
                      child: new Text("BELI"),
                      color: Colors.green,
                      onPressed: ()=>confrimCart(),
                      )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      
    );
  }
}
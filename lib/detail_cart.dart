import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'cart_page.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DetailCart extends StatefulWidget {
  // const DetailCart({ Key? key }) : super(key: key);
  List list;
  int index;
  DetailCart({required this.index, required this.list});

  @override
  _DetailCartState createState() => _DetailCartState();

  
}

class _DetailCartState extends State<DetailCart> {

  void deleteData(){
    var url = "https://bayucrud.000webhostapp.com/delete.php";
    http.post(Uri.parse(url),
    body: {"idbarang": widget.list[widget.index]['id']});

    Fluttertoast.showToast(
      msg: "Berita" + widget.list[widget.index]["merk"] +
      "berhasil dihapus",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM);
  }

  void confirm(){
    AlertDialog alertDialog = new AlertDialog(
      content: new Text(
        "Yakin Untuk menghapus : '${widget.list[widget.index]["merk"]}'"
      ),
      actions: <Widget>[
        new MaterialButton(
            child: new Text("HAPUS!",
            style: new TextStyle(color: Colors.black),),
            color: Colors.green,
          onPressed: (){
            deleteData();
            Navigator.push(
              context, MaterialPageRoute(builder: (context)=> new CartPage()),);
          })
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: new Text("${widget.list[widget.index]["merk"]}"),
      ),
      body: new SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          child: new Center(
            child: new Column(
              children: <Widget>[
                new Padding(padding: const EdgeInsets.only(top: 20.0)),
                new Text("${widget.list[widget.index]["merk"]}",
                style: new TextStyle(fontSize: 20.0),
                ),
                new Padding(padding: const EdgeInsets.only(top: 20.0)),
                new Image.network("${widget.list[widget.index]["img_url"]}"),
              ],
            ),
          ),
        ),
      ),
      
    );
  }
}
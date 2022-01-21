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
    TextEditingController controllerUpdate = new TextEditingController();

    Widget buildTitle(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Shoe App',
        style: TextStyle(
          color:  Colors.black54, fontSize: 24, fontWeight: FontWeight.bold
        ),
        )
      ],
    );
  }


  void deleteData(){
    var url = "https://bayucrud.000webhostapp.com/delete.php";
    http.post(Uri.parse(url),
    body: {"idbarang": widget.list[widget.index]['id'],

    });

    Fluttertoast.showToast(
      msg: widget.list[widget.index]["merk"] +
      " berhasil dihapus",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM);
  }
  

  void updateData(){
    var url = "https://bayucrud.000webhostapp.com/edit.php";
    http.post(Uri.parse(url),
    body: {"idbarang" : widget.list[widget.index]['id'],
        "edsize" : controllerUpdate.text});

        Fluttertoast.showToast(
      msg: widget.list[widget.index]["merk"] +
      " berhasil di Update",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM);
  }

  @override 
void initState(){
  controllerUpdate = new TextEditingController(
    text: widget.list[widget.index]['size']
  );
}

  void confirm(){
    AlertDialog alertDialog = new AlertDialog(
      content: new Text(
        "Yakin Untuk menghapus : '${widget.list[widget.index]['merk']}'"
      ),
      actions: <Widget>[
        new MaterialButton(
            child: new Text("HAPUS!",
            style: new TextStyle(color: Colors.white),),
            color: Colors.green,
          onPressed: (){
            deleteData();
            Navigator.push(
              context, MaterialPageRoute(builder: (context) => new CartPage()),);
              
          }),
          new MaterialButton(
            child: new Text("KEMBALI",
            style: new TextStyle(color: Colors.white),),
            color: Colors.green,
          onPressed: (){
            Navigator.push(
              context, MaterialPageRoute(builder: (context) => new CartPage()),);
              
          })
      ],
    );
    showDialog(context: context, builder: (BuildContext context){
      return alertDialog;
    });
  }

  void editSize(){
    AlertDialog alertDialog = new AlertDialog(
      title: Text("Masukan Nomor Size"),
      content: TextField(
        controller: controllerUpdate,
      ),
      actions: <Widget>[
        new MaterialButton(
          child: new Text("Update",
          style: new TextStyle(color: Colors.white),),
            color: Colors.green,
          
          onPressed: (){
            updateData();
            Navigator.push(
              context, MaterialPageRoute(builder: (context) => new CartPage()),);
          })
      ],
    );
    showDialog(context: context, builder: (BuildContext context){
      return alertDialog;});
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      body: new SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          child: new Center(
            child: new Column(
              children: <Widget>[
                SizedBox(),
                buildTitle(),
                new Padding(padding: const EdgeInsets.only(top: 20.0)),
                new Text(
                  "${widget.list[widget.index]['merk']}",
                style: new TextStyle(fontSize: 20.0),
                ),
                new Padding(padding: const EdgeInsets.only(top: 20.0)),
                new Image.network(
                  "${widget.list[widget.index]['img_url']}"),

                new Padding(padding: const EdgeInsets.only(top: 20.0)),
                new Text(
                  "${widget.list[widget.index]['size']}",
                style: new TextStyle(fontSize: 15.0),),

                new Padding(padding: const EdgeInsets.only(top: 20.0)),
                new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new MaterialButton(
                      child: new Text("EDIT ",
                      style: TextStyle(color: Colors.white),),
                      color: Colors.green,
                      onPressed: () => editSize(),
                      ),
                      SizedBox(width: 20,),
                      new MaterialButton(
                      child: new Text("HAPUS ",
                      style: TextStyle(color: Colors.white),),
                      color: Colors.green,
                      onPressed: () => confirm(),
                      ),
                  ],
                ),
                new Padding(padding: const EdgeInsets.only(top: 20.0))
              ],
            ),
          ),
        ),
      ),
      
    );
    
  }
  
}


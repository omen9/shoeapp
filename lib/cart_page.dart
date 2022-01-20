import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:shoeapp/detail_cart.dart';

class CartPage extends StatefulWidget {
  const CartPage({ Key? key }) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  Future<List> getData() async{
    final response = await http
    .get(Uri.parse("https://bayucrud.000webhostapp.com/listcart.php"));
    return json.decode(response.body);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FutureBuilder<List>(
          future: getData(),
          builder: (context, snapshot){
            if(snapshot.hasError) print(snapshot.error);

            return snapshot.hasData
            ? new ItemList(
              list: snapshot.requireData,
            )
            : new Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
      
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({required this.list});
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return new Container(
          padding: const EdgeInsets.all(10.0),
          child: new GestureDetector(
            onTap: () => Navigator.of(context).push(new MaterialPageRoute(
              builder: (BuildContext context) =>
              new DetailCart(list: list, index: i)
            )),
            child: new Card(
              child: new ListTile(
                title: new Text(list[i]['merk']),
                subtitle: new Text(list[i]['harga']),
                leading: new Image.network(list[i]['img_url'],
                width: 100, fit: BoxFit.contain,),
              )),
          ),
        );
      });
  }
}

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:shoeapp/cart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  Future<List> getData() async{
    final response = await http
    .get(Uri.parse("https://bayucrud.000webhostapp.com/listbarang.php"));
    return jsonDecode(response.body);
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
            ? new BarangList(
              list: snapshot.requireData,
            )
            : new Center(
              child: CircularProgressIndicator(),
            );
          }),
      ),
      
    );
  }
}

class BarangList extends StatelessWidget {
  final List list;
  BarangList({required this.list});
  // const BarangList({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i){
        return new Container(
          padding: const EdgeInsets.all(10.0),
          child: new GestureDetector(
            child: new Card(
              child: new ListTile(
                title: new Text(list[i]['merk']),
                subtitle: new Text(list[i]['harga']),
                leading: new Image.network(list[i]['img_url'],
                width: 100, fit: BoxFit.contain,),
              ),
            ),
          ),
        );
      },
      
    );
  }
}
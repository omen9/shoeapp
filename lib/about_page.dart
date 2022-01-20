import 'package:flutter/material.dart';
import 'themes/theme.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({ Key? key }) : super(key: key);

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

  Widget buildAbout(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
        'Kebutuhan menggunakan sneakers sudah menjadi kebutuhan yang banyak dicari orang, tidak hanya untuk cowok tapi juga cewek dan anak-anak.  Sayangnya di Indonesia ini banyak sepatu KW yang dijual dengan harga original dan fantastis, oleh karena itu kita membuat aplikasi penjualan sepatu dari luar negeri.',
        style: TextStyle(
            color: Colors.black54, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      Text(
        'Aplikasi ShoeApp ini original sudah mendapat verifikasi penjualan online terbaik dan terpercaya. Sudah ratusan testimoni yang mereka dapatkan karena menjual barang jaminan original dan juga tidak mengecewakan para pembelinya yang tersebar di dunia.',
        style: TextStyle(
            color: Colors.black54, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      SizedBox(
        height: 10,
      ),
      Text(
        'Copyright by',
        style: TextStyle(
            color: Colors.black54, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      SizedBox(
        height: 10,
      ),
      Text(
        'Bayu Pamungkas-19552011174',
        style: TextStyle(
            color: Colors.black54, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      Text(
        'Fitri Apriyani-19552011113',
        style: TextStyle(
            color: Colors.black54, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      Text(
        'M. Fadhil Aulia-19552011133',
        style: TextStyle(
            color: Colors.black54, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      Text(
        'Noorman Putra K-19552011120',
        style: TextStyle(
            color: Colors.black54, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      Text(
        'Yuda Rizki-19552011025',
        style: TextStyle(
            color: Colors.black54, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            SingleChildScrollView(
              child: Container(
                height: AppTheme.fullHeight(context) - 50,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xfffbfbfb),
                      Color(0xfff7f7f7),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 50,),
                    buildTitle(),
                    SizedBox(height: 50,) ,
                    buildAbout()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      
      
      
    );
  }
}
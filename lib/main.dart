import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../ProjectFrameWorkMobile/lib/ProductDataModel.dart';
import 'package:flutter/services.dart' as rootBundle;

import 'ProductDataModel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // MaterialApp sebagai root widget aplikasi.
      // Properti title digunakan untuk memberikan
      // judul aplikasi, theme digunakan untuk mengatur
      // tema aplikasi dengan menetapkan warna primer,
      // dan home digunakan untuk menentukan widget yang
      // akan ditampilkan sebagai halaman utama aplikasi.
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: ReadJsonData(),
        builder: (context,data){
          if(data.hasError){
            return Center(child: Text("${data.error}"));
          }else if(data.hasData){
            var items =data.data as List<ProductDataModel>;
            return ListView.builder(
              // return ListView.builder(...) digunakan dalam
              // Flutter untuk mengembalikan widget ListView.
              // builder yang membangun daftar item secara
              // dinamis berdasarkan data yang diberikan.
              itemCount: items == null? 0: items.length,
                itemBuilder: (context,index){
                  return Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(horizontal: 10,vertical: 6),
                    child: Container(
                      // child: Container(...) digunakan dalam Flutter untuk
                      // menambahkan widget Container sebagai child (anak)
                      // dari widget lainnya. Properti child digunakan untuk
                      // menempatkan satu widget tunggal ke dalam widget induk.
                      padding: EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        //  dua parameter yang digunakan untuk mengatur tata
                        //  letak (layout) dari widget di dalam sebuah container atau ruang terbatas.
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            child: Image(image: NetworkImage(items[index].imageURL.toString()),fit: BoxFit.fill,),
                          ), // diatas merupakan penggunaan widget Image dengan parameter image yang merupakan
                          // objek NetworkImage yang diinisialisasi dengan items[index].imageURL.toString().
                          // Kemudian, ada juga parameter fit yang diatur ke BoxFit.fill.
                          Expanded(child: Container(
                            padding: EdgeInsets.only(bottom: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(padding: EdgeInsets.only(left: 8,right: 8),child: Text(items[index].name.toString(),style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold
                                    // merupakan sebuah konstanta yang
                                  // digunakan untuk mengatur tebal (bold) dari
                                  // teks yang ditampilkan dalam widget.
                                ),),),
                                Padding(padding: EdgeInsets.only(left: 8,right: 8),child: Text(items[index].price.toString()),)
                              ],
                            ),
                          ))
                        ],
                      ),
                    ),
                  );
                }
            );
          }else{
            return Center(child: CircularProgressIndicator(),);
          }
        },
      )
    );
  }

  Future<List<ProductDataModel>>ReadJsonData() async{
     final jsondata = await rootBundle.rootBundle.loadString('jsonfile/productlist.json');
     // merupakan metode yang digunakan untuk memuat isi file dalam bentuk string menggunakan
     // objek rootBundle. Dalam contoh yang Anda berikan, jsonfile/productlist.json adalah path
     // atau lokasi file JSON yang akan dimuat.
     final list = json.decode(jsondata) as List<dynamic>;
     // merupakan metode yang digunakan untuk mengurai (decode) string JSON menjadi struktur data Dart.


     return list.map((e) => ProductDataModel.fromJson(e)).toList();
  }
  }



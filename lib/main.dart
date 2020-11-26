import 'package:flutter/material.dart';
import 'package:my_blog/pages/add_post.dart';
import 'pages/home.dart';
void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes:{
      '/':(context)=>Home(),
      '/add':(context)=>Add_post()
    },

  ));
}




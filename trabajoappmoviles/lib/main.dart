import 'package:flutter/material.dart';
import 'package:trabajoappmoviles/post_list.dart';

void main(){
  runApp(MaterialApp(
    title: "Post app",
    home: PostList(),// Este metodo sirve para poder correr la app
    debugShowCheckedModeBanner: false,
  ));
  }

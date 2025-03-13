import 'package:flutter/material.dart';
import 'package:todo_app/pages/edit_page.dart';
import 'package:todo_app/pages/home_page.dart';

void runner(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}
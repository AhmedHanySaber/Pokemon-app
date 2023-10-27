import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:podex_app/home_page.dart';

void main(){
  runApp(Pokemon());
}

class Pokemon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
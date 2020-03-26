import 'package:excapade_app/screens/cart.dart';
import 'package:excapade_app/screens/categorySelect.dart';
import 'package:excapade_app/screens/delivery.dart';
import 'package:excapade_app/screens/orders.dart';
import 'package:excapade_app/screens/products.dart';
import 'package:flutter/material.dart';
import 'package:excapade_app/screens/login.dart';
void main()
{
  runApp(MaterialApp(
    title: "Excapade",
    debugShowCheckedModeBanner: false,
    home: Login(),
    theme: ThemeData(
      backgroundColor: Color(0xffe5e9f2),
      primaryColor: Color(0xff8190a5),
      accentColor: Color(0xff47525e),
    ),
  ));
}







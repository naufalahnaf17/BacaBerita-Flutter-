import 'package:flutter/material.dart';
import 'package:bacaberita/screen/splash.dart';
import 'package:bacaberita/screen/home.dart';
import 'package:bacaberita/screen/content.dart';

void main() => runApp(MaterialApp(
  routes: {
    '/' : (context) => Splash() ,
    '/home' : (context) => Home() ,
    '/content' : (context) => Content(),
  },
));
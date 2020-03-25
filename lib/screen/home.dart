import 'package:flutter/material.dart';
import 'package:bacaberita/screen/headlines.dart';
import 'package:bacaberita/screen/business.dart';
import 'package:bacaberita/screen/entertaiment.dart';
import 'package:bacaberita/screen/health.dart';
import 'package:bacaberita/screen/science.dart';
import 'package:bacaberita/screen/sports.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Baca Berita' , style: TextStyle(color: Colors.black),),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: Colors.grey[900],
            unselectedLabelColor: Colors.grey[900],
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.black
            ),
            tabs: <Widget>[
              Tab(text: 'Headlines',),
              Tab(text: 'Business',),
              Tab(text: 'Entertaiment',),
              Tab(text: 'Health',),
              Tab(text: 'Science',),
              Tab(text: 'Sports',),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Headlines(),
            Business(),
            Entertaiment(),
            Health(),
            Science(),
            Sports(),
          ],
        ),
      ),
    );
  }
}

// ignore_for_file: use_key_in_widget_constructors, camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:travel_app/widget/most_popular.dart';
import 'package:travel_app/widget/travel_blot.dart';

class homePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(
              Icons.menu,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              'Travel Blog',
              style: TextStyle(fontSize: 28),
            ),
          ),
          Expanded(
            flex: 2,
            child: TravelB(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Most Popular',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  'View All',
                  style: TextStyle(color: Colors.deepOrange),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: mostPopular(),
          ),
        ],
      ),
    );
  }
}

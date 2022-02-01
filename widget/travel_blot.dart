// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_field

import 'package:flutter/material.dart';
import 'package:travel_app/detail.dart';
import 'package:travel_app/model/travel.dart';

class TravelB extends StatelessWidget {
  final _list = Travel.TraverlBlog();
  final _pageCtrl = PageController(viewportFraction: 0.9);
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: _pageCtrl,
        itemCount: _list.length,
        itemBuilder: (context, index) {
          var travel = _list[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return myDetail(travel: travel);
                  },
                ),
              );
            },
            child: Stack(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(right: 30, bottom: 20, top: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(
                      travel.url,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 30,
                  left: 15,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Material(
                        color: Colors.transparent,
                        child: Text(
                          travel.location,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: Text(
                          travel.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 60,
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}

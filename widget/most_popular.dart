// ignore_for_file: camel_case_types, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:travel_app/detail.dart';
import 'package:travel_app/model/travel.dart';

class mostPopular extends StatelessWidget {
  final _list = Travel.mostPopular();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
        scrollDirection: Axis.horizontal,
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
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    travel.url,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Material(
                        color: Colors.transparent,
                        child: Text(
                          travel.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: Text(
                          travel.location,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
        separatorBuilder: (_, index) => SizedBox(width: 15),
        itemCount: _list.length);
  }
}

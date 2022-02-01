// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, use_key_in_widget_constructors, camel_case_types, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:travel_app/model/travel.dart';

class myDetail extends StatelessWidget {
  final Travel travel;
  final double expandedHeight = 340;
  final double roundedContainerHeight = 50;
  myDetail({
    required this.travel,
  });

  Widget _sliverHead() {
    return SliverPersistentHeader(
      delegate: DetailSliverDelegate(
        travel: travel,
        expandedHeight: expandedHeight,
        roundedContainerHeight: roundedContainerHeight,
      ),
    );
  }

  Widget _userGetInfo() {
    return Container(
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 10, left: 15),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                travel.url,
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  travel.name,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  travel.location,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Icon(Icons.share),
        ],
      ),
    );
  }

  Widget _buildDetail() {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          _userGetInfo(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
              style: TextStyle(color: Colors.grey, fontSize: 15, height: 1.5),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Featured',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'View All',
                  style: TextStyle(fontSize: 15, color: Colors.deepOrange),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 165,
            child: featuredWidgets(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
              style: TextStyle(color: Colors.grey, fontSize: 15, height: 1.5),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              _sliverHead(),
              SliverToBoxAdapter(
                child: _buildDetail(),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top, right: 16, left: 16),
            child: SizedBox(
              height: kToolbarHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                  Icon(
                    Icons.menu,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DetailSliverDelegate extends SliverPersistentHeaderDelegate {
  final Travel travel;
  final double expandedHeight;
  final double roundedContainerHeight;
  DetailSliverDelegate({
    required this.travel,
    required this.expandedHeight,
    required this.roundedContainerHeight,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      children: [
        Opacity(
          opacity: 0.8,
          child: Image.asset(travel.url,
              width: MediaQuery.of(context).size.width,
              height: expandedHeight,
              fit: BoxFit.cover),
        ),
        Positioned(
          top: expandedHeight - roundedContainerHeight - shrinkOffset,
          left: 0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: roundedContainerHeight,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(17),
                topRight: Radius.circular(17),
              ),
            ),
          ),
        ),
        Positioned(
          top: expandedHeight - shrinkOffset - 120,
          left: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                travel.name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
              Text(
                travel.location,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => 0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

class featuredWidgets extends StatelessWidget {
  final _list = Travel.mostPopular();
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(20),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        var travel = _list[index];
        return Container(
          height: 100,
          width: 120,
          child: Image.asset(travel.url, fit: BoxFit.cover),
        );
      },
      separatorBuilder: (_, index) => SizedBox(
        width: 10,
      ),
      itemCount: _list.length,
    );
  }
}

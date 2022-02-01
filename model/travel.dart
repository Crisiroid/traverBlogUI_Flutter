// ignore_for_file: non_constant_identifier_names

import 'package:travel_app/widget/most_popular.dart';

class Travel {
  String name;
  String location;
  String url;
  Travel({required this.location, required this.name, required this.url});

  static List<Travel> TraverlBlog() {
    return [
      Travel(
        location: 'Spain',
        name: 'Madrid',
        url: 'assets/images/top1.jpg',
      ),
      Travel(
        location: 'USA',
        name: 'LA',
        url: 'assets/images/top2.jpg',
      ),
      Travel(
        location: 'Spain',
        name: 'Barcelona',
        url: 'assets/images/top3.jpg',
      ),
      Travel(
        location: 'Iran',
        name: 'Tehran',
        url: 'assets/images/top4.jpg',
      ),
    ];
  }

  static List<Travel> mostPopular() {
    return [
      Travel(
        location: 'Spain',
        name: 'Madrid',
        url: 'assets/images/bottom1.jpg',
      ),
      Travel(
        location: 'USA',
        name: 'LA',
        url: 'assets/images/bottom2.jpg',
      ),
      Travel(
        location: 'Spain',
        name: 'Barcelona',
        url: 'assets/images/bottom3.jpg',
      ),
      Travel(
        location: 'Iran',
        name: 'Tehran',
        url: 'assets/images/bottom4.jpg',
      ),
    ];
  }
}

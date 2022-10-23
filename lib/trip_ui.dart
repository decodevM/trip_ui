import 'package:flutter/material.dart';
import 'package:trip_ui/trip_model.dart';
import 'package:trip_ui/trip_page.dart';

class TripUI extends StatefulWidget {
  const TripUI({super.key});

  @override
  State<TripUI> createState() => _TripUIState();
}

class _TripUIState extends State<TripUI> {
  List<TripModel> trips = [
    TripModel(
      id: 1,
      image: '1.jpg',
      title: 'Yosemite National Park',
      rating: 4,
      likes: 1400,
      description:
          'Yosemite National Park is in California’s Sierra Nevada mountains. It’s famed for its giant, ancient sequoia trees, and for Tunnel View, the iconic vista of towering Bridalveil Fall and the granite cliffs of El Capitan and Half Dome.',
    ),
    TripModel(
      id: 2,
      image: '2.jpg',
      title: 'Golden Gate Bridge',
      rating: 5,
      likes: 3600,
      description:
          'The Golden Gate Bridge is a suspension bridge spanning the Golden Gate, the one-mile-wide strait connecting San Francisco Bay and the Pacific Ocean.',
    ),
    TripModel(
      id: 3,
      image: '3.jpg',
      title: 'Sedona',
      rating: 3,
      likes: 2000,
      description:
          "Sedona is regularly described as one of America's most beautiful places. Nowhere else will you find a landscape as dramatically colorful.",
    ),
    TripModel(
      id: 4,
      image: '4.jpg',
      title: 'Savannah',
      rating: 4,
      likes: 2200,
      description:
          "Savannah, with its Spanish moss, Southern accents and creepy graveyards, is a lot like Charleston, South Carolina. But this city about 100 miles to the south has an eccentric streak.",
    ),
  ];

  late final PageController _pageController;
  void changePage() {}

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
    )..addListener(changePage);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          ...trips.map((trip) => TripPage(trip: trip)).toList(),
        ],
      ),
    );
  }
}

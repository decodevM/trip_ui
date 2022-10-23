import 'package:flutter/material.dart';
import 'package:trip_ui/counter.dart';
import 'package:trip_ui/evaluation.dart';
import 'package:trip_ui/trip_model.dart';

class TripPage extends StatefulWidget {
  final TripModel trip;
  final int totalImage;

  const TripPage({super.key, required this.trip, this.totalImage = 4});

  @override
  State<TripPage> createState() => _TripPageState();
}

class _TripPageState extends State<TripPage> {
  bool isReadMore = false;
  void readMore() {
    setState(() {
      isReadMore = !isReadMore;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/${widget.trip.image}',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top,
            bottom: MediaQuery.of(context).padding.bottom,
            left: 20,
            right: 20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black.withOpacity(.8),
              Colors.black.withOpacity(.3),
              Colors.white.withOpacity(0),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            // stops: [0.2, .4, 1],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Counter(
              id: widget.trip.id,
              totalImage: widget.totalImage,
            ),
            const Spacer(),
            Text(
              widget.trip.title,
              style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 10,
            ),
            Evaluation(
              rating: widget.trip.rating,
              likes: widget.trip.likes,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.trip.description,
              style: TextStyle(
                  color: Colors.white.withOpacity(.8),
                  fontSize: 16,
                  height: 1.5,
                  overflow: isReadMore ? null : TextOverflow.ellipsis),
              maxLines: isReadMore ? null : 1,
            ),
            TextButton(
              onPressed: readMore,
              child: const Text('Read more'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Evaluation extends StatelessWidget {
  final int? rating;
  final int? likes;
  const Evaluation({Key? key, this.rating, this.likes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
          rating!,
          (index) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
        ),
        ...List.generate(
          5 - rating!,
          (index) => const Icon(
            Icons.star,
            color: Colors.grey,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          '($likes)',
          style: TextStyle(
            color: Colors.white.withOpacity(.8),
          ),
        ),
      ],
    );
  }
}

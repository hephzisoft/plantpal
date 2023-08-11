import 'package:flutter/material.dart';

import '../config/image_string.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Container(child: Image.asset(seed_image)),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../config/colors.dart';
import '../config/image_string.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      elevation: 5,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: cardBackgroundColor,
                borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(10),
            child: Image.asset(seed_image),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                const Text(
                  'Plantasfasf',
                  textAlign: TextAlign.left,
                ),
                const Text('Plantasfasf'),
                Container(
                  width: 150,
                  child: Row(
                    children: [
                      const Text('\$12'),
                      const Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(IconlyBold.heart),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

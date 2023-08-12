import 'package:flutter/material.dart';

import '../../../common_widgets/item_card.dart';

class NewArrival extends StatelessWidget {
  const NewArrival({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ItemCard(),
          ItemCard(),
          ItemCard(),
          ItemCard(),
        ],
      ),
    );
  }
}

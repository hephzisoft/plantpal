import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

import '../../config/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          // The logo section.
          Row(
            children: [
              Text(
                'PLANTPAL',
                style: GoogleFonts.montserrat(
                  color: primaryColor,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  IconlyBold.bag,
                  color: primaryColor,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          // The search section
          const Card(
            elevation: 12,
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(IconlyLight.search),
                filled: true,
                labelText: 'Search Plants',
                fillColor: Colors.white,
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          // categories section

          Container(
            child: Column(children: [
              Row(
                children: [
                  const Text('Categories'),
                  const Spacer(),
                  TextButton(onPressed: () {}, child: const Text('See all'))
                ],
              ),
              const Row(
                children: [],
              ),
            ]),
          )
        ],
      ),
    ));
  }
}

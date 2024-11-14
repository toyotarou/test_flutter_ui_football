import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../models/live_match_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: <Widget>[
          const SizedBox(width: 20),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Material(
              elevation: 0.2,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(8),
                child: const Icon(Iconsax.category),
              ),
            ),
          ),
          const Spacer(),
          const Row(
            children: <Widget>[
              Text(
                'S',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                  letterSpacing: -2,
                ),
              ),
              Icon(
                Icons.sports_soccer,
                color: Colors.orangeAccent,
                size: 25,
              ),
              Text(
                'ccer',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                  letterSpacing: -2,
                ),
              ),
              Text(
                'Nerds',
                style: TextStyle(
                  color: Colors.orangeAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                  letterSpacing: -2,
                ),
              ),
            ],
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Material(
              elevation: 0.2,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(8),
                child: const Stack(
                  children: <Widget>[
                    Icon(Iconsax.notification),
                    Positioned(
                      top: 4,
                      right: 4,
                      child: CircleAvatar(
                        radius: 4,
                        backgroundColor: Colors.orangeAccent,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: Column(
        children: <Widget>[
          const LiveMatch(),
          SizedBox(
            height: 230,
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 230,
                    margin: const EdgeInsets.only(right: 20),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    decoration: BoxDecoration(
                      color: liveMatches[index].color,
                      borderRadius: BorderRadius.circular(35),
                      image: liveMatches[index].backgroundImage,
                    ),
                    child: Column(
                      children: <Widget>[
                        Text(
                          liveMatches[index].stadium,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: liveMatches[index].textColors,
                            letterSpacing: -1,
                          ),
                        ),
                        Text(
                          'Week 13',
                          style: TextStyle(
                            color: liveMatches[index].textColors,
                            letterSpacing: -1,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              shrinkWrap: true,
              padding: const EdgeInsets.only(left: 20),
              scrollDirection: Axis.horizontal,
              itemCount: liveMatches.length,
            ),
          ),
        ],
      ),
    );
  }
}

class LiveMatch extends StatelessWidget {
  const LiveMatch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: <Widget>[
          const Text(
            'Live Match',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 24,
              color: Colors.black54,
              letterSpacing: -1.5,
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black12.withOpacity(0.08),
                  blurRadius: 20,
                )
              ],
            ),
            child: Row(
              children: <Widget>[
                Image.asset(
                  'assets/images/pl.png',
                  width: 30,
                  height: 30,
                ),
                const SizedBox(width: 3),
                const Text(
                  'Premier League',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -1,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 5),
                const Icon(Icons.keyboard_arrow_down_outlined),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../models/live_match_model.dart';
import '../../models/up_coming_model.dart';

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
          const LiveMatchData(),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: <Widget>[
                const Text(
                  'Up-Coming Matches',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                    letterSpacing: -1.5,
                    color: Colors.black54,
                  ),
                ),
                const Spacer(),
                TextButton(
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.orangeAccent),
                  onPressed: () {},
                  child: const Text(
                    'See All',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    child: Stack(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(top: 5, bottom: 5),
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 15,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.white,
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                offset: const Offset(0, -5),
                                color: upcomingMatches[index].isFavorite
                                    ? Colors.orangeAccent
                                    : Colors.black12,
                              )
                            ],
                          ),
                          child: Row(
                            children: <Widget>[
                              Text(
                                upcomingMatches[index].homeTitle,
                                style: TextStyle(
                                  fontSize: 16.5,
                                  letterSpacing: -1,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                              const Spacer(),
                              Column(
                                children: <Widget>[
                                  Image.asset(
                                    upcomingMatches[index].homeLogo,
                                    height: 45,
                                    width: 45,
                                  ),
                                  const Text(
                                    'Home',
                                    style: TextStyle(
                                      fontSize: 11,
                                      letterSpacing: -1,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 10),
                              Column(
                                children: <Widget>[
                                  Text(
                                    upcomingMatches[index].date,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      letterSpacing: -1,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    upcomingMatches[index].time,
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 10),
                              Column(
                                children: <Widget>[
                                  Image.asset(
                                    upcomingMatches[index].awayLogo,
                                    height: 45,
                                    width: 45,
                                  ),
                                  const Text(
                                    'Away',
                                    style: TextStyle(
                                      fontSize: 11,
                                      letterSpacing: -1,
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Text(
                                upcomingMatches[index].awayTitle,
                                style: TextStyle(
                                  fontSize: 16.5,
                                  letterSpacing: -1,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 12,
                          left: 12,
                          child: Icon(
                            Icons.star,
                            color: upcomingMatches[index].isFavorite
                                ? Colors.orangeAccent
                                : Colors.white,
                          ),
                        )
                      ],
                    ),
                  );
                },
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: upcomingMatches.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LiveMatchData extends StatelessWidget {
  const LiveMatchData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Image.asset(
                            liveMatches[index].homeLogo,
                            height: 90,
                            width: 90,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            liveMatches[index].homeTitle.toUpperCase(),
                            style: TextStyle(
                              color: liveMatches[index].textColors,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              letterSpacing: -1,
                            ),
                          ),
                          Text(
                            'Home',
                            style: TextStyle(
                              color: liveMatches[index].textColors,
                              fontSize: 13,
                              letterSpacing: -1,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 20),
                      Column(
                        children: <Widget>[
                          const SizedBox(height: 5),
                          Text(
                            '${liveMatches[index].time}',
                            style: TextStyle(
                              fontSize: 14,
                              color: liveMatches[index].textColors,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text.rich(
                            TextSpan(
                              children: <InlineSpan>[
                                TextSpan(
                                  text: '${liveMatches[index].homeGoal}',
                                  style: TextStyle(
                                    fontSize: 36,
                                    fontWeight: FontWeight.bold,
                                    color: liveMatches[index].onTheWinner
                                        ? Colors.orangeAccent
                                        : liveMatches[index].textColors,
                                  ),
                                ),
                                TextSpan(
                                  text: ' : ${liveMatches[index].awayGoal}',
                                  style: TextStyle(
                                    fontSize: 36,
                                    fontWeight: FontWeight.bold,
                                    color: liveMatches[index].onTheWinner
                                        ? liveMatches[index].textColors
                                        : Colors.orangeAccent,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 20),
                      Column(
                        children: <Widget>[
                          Image.asset(
                            liveMatches[index].awayLogo,
                            height: 90,
                            width: 90,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            liveMatches[index].awayTitle.toUpperCase(),
                            style: TextStyle(
                              color: liveMatches[index].textColors,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              letterSpacing: -1,
                            ),
                          ),
                          Text(
                            'Home',
                            style: TextStyle(
                              color: liveMatches[index].textColors,
                              fontSize: 13,
                              letterSpacing: -1,
                            ),
                          ),
                        ],
                      ),
                    ],
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

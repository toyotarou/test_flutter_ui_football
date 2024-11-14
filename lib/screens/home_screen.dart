import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'pages/home_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentTab = 0;

  List<Widget> screens = <Widget>[
    const HomePage(),
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
  ];

  List<IconData> icons = <IconData>[
    Iconsax.home,
    Iconsax.calendar_1,
    Iconsax.chart,
    Icons.person_outline,
  ];

  List<String> titles = <String>[
    'Home',
    'Calendar',
    'Standing',
    'Account',
  ];

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 80,
        padding: const EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black12.withOpacity(0.015),
              blurRadius: 8,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          // ignore: always_specify_types
          children: List.generate(4, (int index) {
            return MyBottomNavBarItems(
              title: titles[index],
              isActive: currentTab == index,
              onTap: () {
                setState(() {
                  currentTab = index;
                });
              },
              icon: icons[index],
            );
          }),
        ),
      ),
      body: screens[currentTab],
    );
  }
}

class MyBottomNavBarItems extends StatefulWidget {
  const MyBottomNavBarItems(
      {super.key,
      required this.title,
      required this.isActive,
      required this.onTap,
      required this.icon});

  final String title;
  final bool isActive;
  // ignore: inference_failure_on_function_return_type
  final Function() onTap;
  final IconData icon;

  @override
  State<MyBottomNavBarItems> createState() => _MyBottomNavBarItemsState();
}

class _MyBottomNavBarItemsState extends State<MyBottomNavBarItems> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: widget.isActive ? Colors.orangeAccent : Colors.white,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          children: <Widget>[
            Icon(
              widget.icon,
              color: widget.isActive ? Colors.white : Colors.grey,
            ),
            if (widget.isActive)
              Text(
                widget.title,
                style: const TextStyle(color: Colors.white, fontSize: 14),
              ),
          ],
        ),
      ),
    );
  }
}

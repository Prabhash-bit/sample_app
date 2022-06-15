import 'package:flutter/material.dart';

import 'package:avaproject/listoforder.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int tabselected = 0;
  void onTabTapped(int index) {
    setState(() {
      tabselected = index;
    });
  }

  final _pageOptions = [
    const ListOfOrder(),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _pageOptions[tabselected],
        bottomNavigationBar: BottomAppBar(
          //color: Colors.white,
          shape: const CircularNotchedRectangle(),
          notchMargin: 5,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                height: 65,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    children: [
                      IconButton(
                        iconSize: 30,
                        icon: Icon(
                          Icons.home,
                          color: tabselected == 0
                              ? const Color.fromRGBO(255, 216, 49, 1)
                              : const Color(0xFF1C212D),
                        ),
                        onPressed: () {
                          onTabTapped(0);
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 65,
                child: Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child: Column(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.check_box,
                          color: tabselected == 1
                              ? const Color.fromRGBO(255, 216, 49, 1)
                              : const Color(0xFF1C212D),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 65,
                child: Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Column(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.time_to_leave,
                          color: tabselected == 2
                              ? const Color.fromRGBO(255, 216, 49, 1)
                              : const Color(0xFF1C212D),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 65,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Column(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.people,
                          color: tabselected == 3
                              ? const Color.fromRGBO(255, 216, 49, 1)
                              : const Color(0xFF1C212D),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

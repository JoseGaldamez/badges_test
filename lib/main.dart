import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Badge app',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showBadge = false;
  int _notificationCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Badges app'),
        ),
        body: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            children: [
              badges.Badge(
                badgeContent: const Text(
                  '😂',
                  style: TextStyle(color: Colors.white),
                ),
                showBadge: _showBadge,
                badgeStyle: const badges.BadgeStyle(
                    badgeColor: Colors.white,
                    borderSide: BorderSide(
                        width: 2, color: Color.fromARGB(255, 206, 206, 206))),
                child: InkWell(
                  onLongPress: () {
                    setState(() {
                      _showBadge = !_showBadge;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blue,
                        width: 2,
                      ),
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: const Text(
                      "This is a badge",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                _notificationCount++;
              });
            },
            child: const Icon(Icons.add)),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: badges.Badge(
                showBadge: _notificationCount > 0,
                badgeContent: Text(
                  _notificationCount.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
                badgeAnimation: const badges.BadgeAnimation.scale(
                  loopAnimation: false,
                  curve: Curves.fastOutSlowIn,
                  colorChangeAnimationCurve: Curves.easeInCubic,
                ),
                badgeStyle: const badges.BadgeStyle(
                    shape: badges.BadgeShape.circle,
                    elevation: 0,
                    badgeColor: Colors.red,
                    padding: EdgeInsets.all(5.0)),
                child: const Icon(Icons.home),
              ),
              label: 'Home',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Business',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'School',
            ),
          ],
        ));
  }
}

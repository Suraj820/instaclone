import 'package:flutter/material.dart';
import 'package:instaclone/pages/feed_page.dart';
import 'package:instaclone/pages/profile_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  int _currentPage = 0 ;
  final List<Widget> _pages =[FeedPage(),ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Finstagram"),
        actions: [
          GestureDetector(
            onTap: () {},
            child: const Icon(Icons.add_a_photo),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35.0, right: 25.0),
            child: GestureDetector(
              onTap: () {},
              child: const Icon(Icons.logout),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _bottomNavigationBar(),
      body:_pages[_currentPage] ,
    );
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentPage,
      onTap: (_index){
        setState(() {
          _currentPage = _index;
        });

      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.feed), label: "Feed"),
        BottomNavigationBarItem(icon: Icon(Icons.account_box), label: "Profile"),
      ],
    );
  }
}

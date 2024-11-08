import 'package:flutter/material.dart';
import 'package:flutter_projects/Update.dart';
import 'Add.dart';
import 'Delete.dart';
import 'Search.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Only one MaterialApp should exist at the root
      home: HomePage(), // Start from HomePage
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Example of maintaining state (for now, we can keep track of a selected item)
  String selectedTab = "HOME"; // This will track which menu item is selected

  // Method to handle tab selection
  void _onTabSelected(String tab) {
    setState(() {
      selectedTab = tab;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          backgroundColor: Colors.black87,
          title: Container(
            margin: EdgeInsets.only(left: 50, top: 20),
            child: const Text(
              "SHOWDANE",
              style: TextStyle(
                color: Colors.yellow,
                fontWeight: FontWeight.bold,
                fontSize: 34,
                letterSpacing: 2,
              ),
            ),
          ),
          leading: Container(
            margin: EdgeInsets.only(left: 30),
            child: Icon(
              Icons.book,
              color: Colors.white,
              size: 60,
            ),
          ),
          actions: [
            Container(
              margin: EdgeInsets.only(right: 100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Home Tab
                  GestureDetector(
                    onTap: () {
                      _onTabSelected("HOME");
                    },
                    child: Text(
                      "HOME",
                      style: TextStyle(
                        color: selectedTab == "HOME" ? Colors.yellow : Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  SizedBox(width: 50),
                  // Add Tab
                  GestureDetector(
                    onTap: () {
                      _onTabSelected("ADD");
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => Add()), // Navigate to Add page
                      );
                    },
                    child: Text(
                      "ADD",
                      style: TextStyle(
                        color: selectedTab == "ADD" ? Colors.yellow : Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  SizedBox(width: 50),

                  GestureDetector(
                    onTap: () {
                      _onTabSelected("UPDATE");
                      Navigator.push(
                          context,
                        MaterialPageRoute(builder: (_)=> Update()),
                      );
                    },
                    child: Text(
                      "UPDATE",
                      style: TextStyle(
                        color: selectedTab == "UPDATE" ? Colors.yellow : Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  SizedBox(width: 50),
                  // Search Tab
                  GestureDetector(
                    onTap: () {
                      _onTabSelected("SEARCH");
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => Search()), // Navigate to Search page
                      );
                    },
                    child: Text(
                      "SEARCH",
                      style: TextStyle(
                        color: selectedTab == "SEARCH" ? Colors.yellow : Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  SizedBox(width: 50),

                  GestureDetector(
                    onTap: () {
                      _onTabSelected("DELETE");
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_)=> Delete()),
                      );
                    },
                    child: Text(
                      "DELETE",
                      style: TextStyle(
                        color: selectedTab == "DELETE" ? Colors.yellow : Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  SizedBox(width: 50),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: NetworkImage("https://th.bing.com/th/id/R.efd35a6d841953060a0c4b10f763f08c?rik=CJ9NMgFci1tVmg&riu=http%3a%2f%2fgetwallpapers.com%2fwallpaper%2ffull%2ff%2f8%2f4%2f888661-beautiful-library-background-images-1920x1080-iphone.jpg&ehk=4sDpXGMv3dZdR6sK7WCIqhrxrVTpmPIyg8Nr3dm9nl0%3d&risl=&pid=ImgRaw&r=0"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

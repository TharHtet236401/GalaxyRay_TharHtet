import 'package:flutter/material.dart';
import 'package:flutter_app/screens/post_form.dart';
import 'package:flutter_app/screens/post_screen.dart';
import 'package:flutter_app/screens/watchList.dart';
import '../services/user_service.dart';
import 'login.dart';
import 'notifications.dart';


class Nav extends StatefulWidget {
  const Nav({super.key});

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    const PostScreen(),
    WatchList(),

  ];
  String username = 'Richard';
  String email = 'thureinrichard3@gmail.com';
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            // Add your logo image here
            Image.asset(
              'images/receipt.png', // Replace with the path to your logo image
              width: 40, // Adjust the width as needed
              height: 40, // Adjust the height as needed
            ),
            const SizedBox(
                width: 8), // Add some spacing between the logo and title

          ],
        ),
        actions: [
          // Add a notification icon button here
          IconButton(
            icon: const Icon(Icons.notification_add),
            color: const Color(0xFFD84356),
            iconSize: 32,
            onPressed: () {
              // Navigate to the notifications.dart page when the button is pressed
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotificationsPage(),
                ),
              );
            },
          ),

          IconButton(
            icon: const Icon(Icons.exit_to_app),
            color: const Color(0xFFD84356),
            iconSize: 32,
            onPressed: (){
              logout().then((value) => {
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>Login()), (route) => false)
              });
            },
          )






        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFD84356),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => PostForm(
                    title: 'Add new post',
                  )));
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 30,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.money),
            label: 'Receipts',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.check_box),
            label: 'To Review',
          ),

        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFFD84356),
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}

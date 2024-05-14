import 'package:flutter/material.dart';
import 'package:project_if22a/config/asset.dart';
import 'package:project_if22a/screen/admin/home_screen.dart';

class DashboardAdmin extends StatefulWidget {
  const DashboardAdmin({super.key});

  @override
  State<DashboardAdmin> createState() => _DashboardAdminState();
}

class _DashboardAdminState extends State<DashboardAdmin> {
  int _selectedIndex = 0;
  String _title = '';

  final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _title = 'default';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: AppBar(
          elevation: 2,
          toolbarHeight: 60,
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          centerTitle: true,
          title: _title == 'default' ? Container(
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: [
                          Text(
                            'Hai, ',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Asset.colorPrimary,
                            ),
                          ),
                          Text(
                            'Prayogi',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Asset.colorPrimary,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Administrator',
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 12,
                          // fontWeight: FontWeight.bold,
                          color: Asset.colorPrimaryDark,
                        ),
                      ),
                    ],
                  ),
                ),
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Asset.colorPrimary,
                  child: CircleAvatar(
                    radius: 27,
                    backgroundImage: AssetImage('assets/images/teknokrat.png'),
                    backgroundColor: Asset.colorPrimaryDark,
                  ),
                ),
              ],
            ),
          ) : Text(
              _title,
              maxLines: 1,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
              ),
          ),
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex: _selectedIndex,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          unselectedItemColor: Asset.colorSecondary,
          selectedItemColor: Asset.colorPrimary,
          items: const [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: "navbar 1",
              icon: Icon(Icons.explore),
            ),
            BottomNavigationBarItem(
              label: "navbar 2",
              icon: Icon(Icons.bar_chart),
            ),
            BottomNavigationBarItem(
              label: "navbar 3",
              icon: Icon(Icons.calendar_today),
            ),
          ],
        ),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          {
            _title = 'default';
          }
          break;
        case 1:
          {
            _title = 'navbar 1';
          }
          break;
        case 2:
          {
            _title = 'navbar 2';
          }
          break;
        case 3:
          {
            _title = 'navbar 3';
          }
          break;
      }
    });
  }
}
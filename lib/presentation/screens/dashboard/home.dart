import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../domain/colors/colors.dart';
import '../../../domain/plugins/toast_message.dart';
import '../../../domain/routes/route.dart';
import '../../components/custom_autotext.dart';
import '../community/community.dart';
import '../configs/configs.dart';
import '../senstivites/senstivities.dart';
import 'dashboard.dart';
import 'sidebar/sidebar.dart';

class HomeUI extends StatefulWidget {
  // coins data
  const HomeUI({super.key});

  @override
  State<HomeUI> createState() => HomeUIState();
}

class HomeUIState extends State<HomeUI> {
  final userData = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  int _currentIndex = 0;
  List<Widget> screenList = [
    const DashBoardUI(),
    const CommunityUI(),
    const ConfigUI(),
    MyHomePage(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const SideBarUI(),
        // drawerScrimColor: CustomColors.primaryColor,
        appBar: AppBar(
          titleSpacing: 5,
          title: AutoSizeText('Hi, ${userData!.displayName}',
              fontSize: 20,
              color: CustomColors.blackColor,
              fontWeight: FontWeight.w500),
          titleTextStyle:
              const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, RouteNames.notifications);
              },
              icon: const Icon(Icons.notifications_none),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: InkWell(
                onTap: () {
                  Utils.showToastMsg(
                      'Earn Money Feature Available in 1.1 Update!');
                },
                child: const Row(
                  children: [
                    Image(
                      image: AssetImage("assets/gifs/dollar.gif"),
                      height: 30,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        body: screenList[_currentIndex],
        bottomNavigationBar: _bottomNavigationbar());
  }

  // navigation bars
  Widget _bottomNavigationbar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: _onTabTapped,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      unselectedItemColor: CustomColors.darkGreyColor,
      selectedItemColor: CustomColors.primaryColor,
      type: BottomNavigationBarType.fixed,
      backgroundColor: CustomColors.otherColor,
      iconSize: 20,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home_filled,
          ),
          label: 'Dashboard',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.people_outline_rounded,
          ),
          label: 'Community',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.folder_open_rounded,
          ),
          label: 'GFX Files',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.display_settings_rounded,
          ),
          label: 'Senstivities',
        ),
      ],
    );
  }
}

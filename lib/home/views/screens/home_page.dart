import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soko_beauty/core/utils/camera_utils.dart';
import 'package:soko_beauty/core/utils/permission_utils.dart';
import 'package:soko_beauty/feautures/post/views/services/camera_bloc.dart';
import 'package:soko_beauty/home/views/screens/camera_page.dart';
import 'package:soko_beauty/config/colors/colors.dart';
import 'package:soko_beauty/home/views/screens/chats.dart';
import 'package:soko_beauty/home/views/screens/market.dart';
import 'package:soko_beauty/home/views/screens/my_account.dart';
import 'package:soko_beauty/home/views/screens/videos.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    VideoPage(),
    MarketPage(),
    ChatsPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: _screens[_currentIndex],
          bottomNavigationBar: BottomAppBar(
            shape: CircularNotchedRectangle(),
            notchMargin: 15,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildNavItem(0, Icons.home_filled, 'Home'),
                buildNavItem(1, Icons.shop, 'Shop'),
                FloatingActionButton(
                  backgroundColor: Theme.of(context).bottomAppBarTheme.color,
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => BlocProvider(
                          create: (context) {
                            return CameraBloc(
                              cameraUtils: CameraUtils(),
                              permissionUtils: PermissionUtils(),
                            )..add(const CameraInitialize(recordingLimit: 15));
                          },
                          child: const CameraPage(),
                        ),
                      ),
                    );
                  },
                  mini: true,
                  child: Icon(
                    Icons.add_circle_outline_rounded,
                    size: 30,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                buildNavItemWithBadge(
                    2, Icons.mark_chat_unread_rounded, 'Inbox', 3),
                buildNavItem(3, Icons.person, 'Profile'),
              ],
            ),
          ),
          floatingActionButton: SizedBox(
            width: 10,
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        ),
      ],
    );
  }

  Widget buildNavItem(int index, IconData icon, String label) {
    return TextButton(
      style: TextButton.styleFrom(padding: EdgeInsets.all(0.0)),
      onPressed: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: _currentIndex == index ? sbbrickRed : null,
          ),
          Text(label,
              style: TextStyle(
                  fontSize: 10,
                  color: _currentIndex == index ? sbbrickRed : null)),
        ],
      ),
    );
  }

  Widget buildNavItemWithBadge(
      int index, IconData icon, String label, int badgeCount) {
    return Stack(
      children: [
        buildNavItem(index, icon, label),
        if (badgeCount > 0)
          Positioned(
            right: 0,
            child: Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: sbwarmRed,
                borderRadius: BorderRadius.circular(10),
              ),
              constraints: BoxConstraints(
                minWidth: 16,
                minHeight: 16,
              ),
              child: Text(
                '$badgeCount',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }
}

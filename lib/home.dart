import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'listing.dart';

final GlobalKey<NavigatorState> firstTabNavKey = GlobalKey<NavigatorState>();

final GlobalKey<NavigatorState> secondTabNavKey = GlobalKey<NavigatorState>();

final GlobalKey<NavigatorState> thirdTabNavKey = GlobalKey<NavigatorState>();

final GlobalKey<NavigatorState> fourthTabNavKey = GlobalKey<NavigatorState>();

void main() {
  runApp(
    new CupertinoApp(
      home: new HomeScreen(),
      localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
        DefaultMaterialLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
    ),
  );
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: ('Tab 1'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: ('Tab 2'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: ('Tab 3'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_rounded),
              label: ('Tab 4'),
            ),
          ],
        ),
        tabBuilder: (context, index) {
          if (index == 0) {
            return CupertinoTabView(
              navigatorKey: firstTabNavKey,
              builder: (BuildContext context) => Listing(),
            );
          } else if (index == 1) {
            return CupertinoTabView(
              navigatorKey: secondTabNavKey,
              builder: (BuildContext context) => MySecondTab(),
            );
          } else if (index == 2) {
            return CupertinoTabView(
              navigatorKey: thirdTabNavKey,
              builder: (BuildContext context) => MyThirdTab(),
            );
          } else {
            return CupertinoTabView(
              navigatorKey: fourthTabNavKey,
              builder: (BuildContext context) => MyFourthTab(),
            );
          }
        });
  }
}

//各タブのクラス

class MySecondTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.greenAccent,
    );
  }
}

class MyThirdTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent,
    );
  }
}

class MyFourthTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellowAccent,
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../Cupertino_Tabs/home_screen.dart';
import '../Cupertino_Tabs/settings_screen.dart';
import '../Providers/platform_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> pages = [HomeScreen(), SettingsScreen()];
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
          activeColor: CupertinoColors.activeOrange,
          inactiveColor: CupertinoColors.systemGreen,
          currentIndex: Provider.of<PlatformProvider>(context).selected,
          onTap: (val) {
            Provider.of<PlatformProvider>(context, listen: false)
                .selectedPage(val);
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.settings,
                ),
                label: "Settings"),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.clock), label: "Clock")
          ]),
      tabBuilder: (context, index) => CupertinoTabView(builder: (BuildContext) {
        return pages[index];
      }),
    );
  }
}

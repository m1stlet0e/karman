import 'package:flutter/cupertino.dart';
import 'package:karman_app/pages/more/more_page.dart';
import 'package:karman_app/pages/habit/habits_page.dart';
import 'package:karman_app/pages/task/tasks_page.dart';
import 'package:karman_app/pages/focus/focus_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppShell extends StatefulWidget {
  static final GlobalKey<AppShellState> globalKey = GlobalKey<AppShellState>();
  final int initialTabIndex;

  const AppShell({super.key, required this.initialTabIndex});

  @override
  AppShellState createState() => AppShellState();
}

class AppShellState extends State<AppShell> {
  late final CupertinoTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = CupertinoTabController(initialIndex: widget.initialTabIndex);
    _controller.addListener(_handleTabChange);
  }

  @override
  void dispose() {
    _controller.removeListener(_handleTabChange);
    _controller.dispose();
    super.dispose();
  }

  void _handleTabChange() {
    _saveLastUsedTabIndex(_controller.index);
  }

  Future<void> _saveLastUsedTabIndex(int index) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('lastUsedTabIndex', index);
  }

  void switchToTab(int index) {
    setState(() {
      _controller.index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    
    return CupertinoTabScaffold(
      controller: _controller,
      tabBar: CupertinoTabBar(
        iconSize: 32,
        backgroundColor: CupertinoColors.black,
        activeColor: CupertinoColors.white,
        height: 60,
        border: null,
        items: [
          BottomNavigationBarItem(
            icon: const Padding(
              padding: EdgeInsets.only(top: 8),
              child: Icon(CupertinoIcons.repeat),
            ),
            label: localizations.habits,
          ),
          BottomNavigationBarItem(
            icon: const Padding(
              padding: EdgeInsets.only(top: 8),
              child: Icon(CupertinoIcons.list_bullet),
            ),
            label: localizations.tasks,
          ),
          BottomNavigationBarItem(
            icon: const Padding(
              padding: EdgeInsets.only(top: 8),
              child: Icon(CupertinoIcons.hourglass),
            ),
            label: localizations.focus,
          ),
          BottomNavigationBarItem(
            icon: const Padding(
              padding: EdgeInsets.only(top: 8),
              child: Icon(CupertinoIcons.square_grid_2x2),
            ),
            label: localizations.more,
          ),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(builder: (context) => HabitsPage());
          case 1:
            return CupertinoTabView(builder: (context) => TasksPage());
          case 2:
            return CupertinoTabView(builder: (context) => FocusPage());
          case 3:
            return CupertinoTabView(builder: (context) => MorePage());
          default:
            return CupertinoTabView(builder: (context) => TasksPage());
        }
      },
    );
  }
}

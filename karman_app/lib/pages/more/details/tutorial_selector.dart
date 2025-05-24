import 'package:flutter/cupertino.dart';
import 'package:karman_app/pages/tutorial/habit_tutorial.dart';
import 'package:karman_app/pages/tutorial/task_tutorial.dart';
import 'package:karman_app/pages/tutorial/focus_tutorial.dart';
import 'package:karman_app/pages/tutorial/pomodoro_tutorial.dart';
import 'package:karman_app/app_shell.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void showTutorialOptions(BuildContext context) {
  final localizations = AppLocalizations.of(context)!;
  
  showCupertinoModalPopup(
    context: context,
    builder: (BuildContext context) => CupertinoActionSheet(
      title: Text(
        localizations.selectTutorial,
        style: TextStyle(
          color: CupertinoColors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      message: Text(
        localizations.whichTutorialRevisit,
        style: TextStyle(
          color: CupertinoColors.white,
          fontSize: 14,
        ),
      ),
      actions: <Widget>[
        _buildTutorialOption(
          context,
          localizations.tasks,
          localizations.learnManageTasks,
          CupertinoIcons.list_bullet,
          () => _showSelectedTutorial(context, 'tasks'),
        ),
        _buildTutorialOption(
          context,
          localizations.habits,
          localizations.discoverBuildHabits,
          CupertinoIcons.repeat,
          () => _showSelectedTutorial(context, 'habits'),
        ),
        _buildTutorialOption(
          context,
          localizations.focus,
          localizations.masterConcentration,
          CupertinoIcons.timer,
          () => _showSelectedTutorial(context, 'focus'),
        ),
        _buildTutorialOption(
          context,
          localizations.pomodoroTimer,
          localizations.learnPomodoroTechnique,
          CupertinoIcons.time,
          () => _showSelectedTutorial(context, 'pomodoro'),
        ),
      ],
      cancelButton: CupertinoActionSheetAction(
        isDestructiveAction: true,
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text(localizations.cancel,
            style: TextStyle(color: CupertinoColors.destructiveRed)),
      ),
    ),
  );
}

Widget _buildTutorialOption(BuildContext context, String title,
    String description, IconData icon, VoidCallback onPressed) {
  return CupertinoActionSheetAction(
    onPressed: () {
      Navigator.pop(context);
      onPressed();
    },
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(icon, color: CupertinoColors.white, size: 28),
            SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: CupertinoColors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    color: CupertinoColors.systemGrey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
        Icon(CupertinoIcons.right_chevron,
            color: CupertinoColors.systemGrey2, size: 20),
      ],
    ),
  );
}

void _showSelectedTutorial(BuildContext context, String tutorialType) {
  final appShellState = AppShell.globalKey.currentState;
  if (appShellState != null) {
    switch (tutorialType) {
      case 'tasks':
        appShellState.switchToTab(1);
        _showTutorialOverlay(context, TasksTutorial.build);
        break;
      case 'habits':
        appShellState.switchToTab(0);
        _showTutorialOverlay(context, HabitsTutorial.build);
        break;
      case 'focus':
        appShellState.switchToTab(2);
        _showTutorialOverlay(context, FocusTutorial.build);
        break;
      case 'pomodoro':
        appShellState.switchToTab(2);
        _showTutorialOverlay(context, PomodoroTutorial.build);
        break;
    }
  }
}

void _showTutorialOverlay(BuildContext context,
    Widget Function(BuildContext, VoidCallback) tutorialBuilder) {
  late OverlayEntry overlayEntry;
  overlayEntry = OverlayEntry(
    builder: (context) => tutorialBuilder(
      context,
      () {
        overlayEntry.remove();
      },
    ),
  );
  Overlay.of(context).insert(overlayEntry);
}

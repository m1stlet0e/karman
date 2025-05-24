import 'package:flutter/cupertino.dart';
import 'tutorial_overlay.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HabitsTutorial {
  static List<TutorialPage> getPages(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    return [
      TutorialPage(
        instruction: localizations.createNewHabits,
        imageAsset: 'lib/assets/tutorials/habits/create_habit.png',
      ),
      TutorialPage(
        instruction: localizations.tapCircleToComplete,
        imageAsset: 'lib/assets/tutorials/habits/complete_habit.png',
      ),
      TutorialPage(
        instruction: localizations.logDailyRoutine,
        imageAsset: 'lib/assets/tutorials/habits/log_routine.png',
      ),
      TutorialPage(
        instruction: localizations.swipeRightToComplete,
        imageAsset: 'lib/assets/tutorials/habits/swipe_complete.png',
      ),
      TutorialPage(
        instruction: localizations.viewCurrentStreak,
        imageAsset: 'lib/assets/tutorials/habits/view_streak.png',
      ),
      TutorialPage(
        instruction: localizations.tapHabitToViewDetails,
        imageAsset: 'lib/assets/tutorials/habits/habit_details.png',
      ),
      TutorialPage(
        instruction: localizations.swipeLeftToDelete,
        imageAsset: 'lib/assets/tutorials/habits/delete_habit.png',
      ),
    ];
  }

  static Widget build(BuildContext context, VoidCallback onComplete) {
    return TutorialOverlay(
      pages: getPages(context),
      onComplete: onComplete,
    );
  }
}

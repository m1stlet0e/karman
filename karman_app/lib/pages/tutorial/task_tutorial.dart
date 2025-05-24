import 'package:flutter/cupertino.dart';
import 'tutorial_overlay.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TasksTutorial {
  static List<TutorialPage> getPages(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    return [
      TutorialPage(
        instruction: localizations.createNewTasks,
        imageAsset: 'lib/assets/tutorials/tasks/create_task.png',
      ),
      TutorialPage(
        instruction: localizations.accomplishYourTasks,
        imageAsset: 'lib/assets/tutorials/tasks/complete_task.png',
      ),
      TutorialPage(
        instruction: localizations.setPriorityReminders,
        imageAsset: 'lib/assets/tutorials/tasks/task_details.png',
      ),
      TutorialPage(
        instruction: localizations.clearAllCompleted,
        imageAsset: 'lib/assets/tutorials/tasks/clear_completed.png',
      ),
      TutorialPage(
        instruction: localizations.swipeTaskLeftToDelete,
        imageAsset: 'lib/assets/tutorials/tasks/delete_task.png',
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

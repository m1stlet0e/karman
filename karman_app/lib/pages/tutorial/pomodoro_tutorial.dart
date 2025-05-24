import 'package:flutter/cupertino.dart';
import 'tutorial_overlay.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PomodoroTutorial {
  static List<TutorialPage> getPages(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    return [
      TutorialPage(
        instruction: localizations.setFocusBreakDurations,
        imageAsset: 'lib/assets/tutorials/pomodoro/set_durations.png',
      ),
      TutorialPage(
        instruction: localizations.startPomodoroSession,
        imageAsset: 'lib/assets/tutorials/pomodoro/start_session.png',
      ),
      TutorialPage(
        instruction: localizations.trackYourSession,
        imageAsset: 'lib/assets/tutorials/pomodoro/track_session.png',
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

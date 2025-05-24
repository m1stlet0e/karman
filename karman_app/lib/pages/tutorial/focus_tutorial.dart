import 'package:flutter/cupertino.dart';
import 'tutorial_overlay.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FocusTutorial {
  static List<TutorialPage> getPages(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    return [
      TutorialPage(
        instruction: localizations.dragToSetTime,
        imageAsset: 'lib/assets/tutorials/focus/set_time.png',
      ),
      TutorialPage(
        instruction: localizations.tapPlayToStart,
        imageAsset: 'lib/assets/tutorials/focus/start_timer.png',
      ),
      TutorialPage(
        instruction: localizations.listenToRelaxingSounds,
        imageAsset: 'lib/assets/tutorials/focus/relaxing_sounds.png',
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

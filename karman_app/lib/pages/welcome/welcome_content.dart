import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WelcomePageContent {
  final String Function(BuildContext) title;
  final String lottieAsset;
  final String Function(BuildContext) description;

  WelcomePageContent({
    required this.title,
    required this.lottieAsset,
    required this.description,
  });
}

List<WelcomePageContent> getWelcomePages() => [
  WelcomePageContent(
    title: (context) => AppLocalizations.of(context)!.organizeYourDay,
    lottieAsset: "lib/assets/lottie/tasks.json",
    description: (context) => AppLocalizations.of(context)!.organizeDayDescription,
  ),
  WelcomePageContent(
    title: (context) => AppLocalizations.of(context)!.buildGoodHabits,
    lottieAsset: "lib/assets/lottie/habits.json",
    description: (context) => AppLocalizations.of(context)!.buildHabitsDescription,
  ),
  WelcomePageContent(
    title: (context) => AppLocalizations.of(context)!.stayFocused,
    lottieAsset: "lib/assets/lottie/focus.json",
    description: (context) => AppLocalizations.of(context)!.stayFocusedDescription,
  ),
];
import 'package:flutter/cupertino.dart';
import 'package:karman_app/pages/more/badges/focus_badges_page.dart';
import 'package:karman_app/pages/more/badges/habit_badges_page.dart';
import 'package:karman_app/pages/more/details/community_page.dart';
import 'package:karman_app/pages/more/details/contribution_page.dart';
import 'package:karman_app/pages/more/details/support_page.dart';
import 'package:karman_app/pages/more/details/tutorial_selector.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.black,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.black,
      ),
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            Text(
              localizations.achievements,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: CupertinoColors.white,
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildActionTile(
                    context,
                    localizations.focus,
                    'lib/assets/images/badges/focus_badge.png',
                    () => Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => FocusBadgesPage(),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: _buildActionTile(
                    context,
                    localizations.habits,
                    'lib/assets/images/badges/habit_badge.png',
                    () => Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => HabitBadgesPage(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            Text(
              localizations.makeKarmanBetter,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: CupertinoColors.white,
              ),
            ),
            SizedBox(height: 16),
            _buildNavigationTile(
              context,
              localizations.contributeGitHub,
              CupertinoIcons.cube_box,
              () => Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => contributionPage,
                ),
              ),
            ),
            SizedBox(height: 16),
            _buildNavigationTile(
              context,
              localizations.joinCommunity,
              CupertinoIcons.group,
              () => Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => communityPage,
                ),
              ),
            ),
            SizedBox(height: 16),
            _buildNavigationTile(
              context,
              localizations.supportProject,
              CupertinoIcons.heart,
              () => Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => supportPage,
                ),
              ),
            ),
            SizedBox(height: 40),
            Text(
              localizations.help,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: CupertinoColors.white,
              ),
            ),
            SizedBox(height: 16),
            _buildNavigationTile(
              context,
              localizations.repeatTutorial,
              CupertinoIcons.refresh,
              () => showTutorialOptions(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionTile(BuildContext context, String title, String imagePath,
      VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: CupertinoColors.darkBackgroundGray,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 80,
              height: 80,
            ),
            SizedBox(height: 16),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: CupertinoColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationTile(
      BuildContext context, String title, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: CupertinoColors.darkBackgroundGray,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(icon, size: 24, color: CupertinoColors.white),
            SizedBox(width: 16),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: CupertinoColors.white,
              ),
            ),
            Spacer(),
            Icon(CupertinoIcons.right_chevron, color: CupertinoColors.white),
          ],
        ),
      ),
    );
  }
}

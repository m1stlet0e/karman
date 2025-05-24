import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DeleteConfirmationDialog extends StatelessWidget {
  final String itemName;
  final VoidCallback onDelete;

  const DeleteConfirmationDialog({
    super.key,
    required this.itemName,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    
    return CupertinoAlertDialog(
      title: Text(localizations.deleteItemQuestion(itemName)),
      content: Text(localizations.deleteItemWarning(itemName)),
      actions: [
        CupertinoDialogAction(
          child: Text(localizations.cancel),
          onPressed: () => Navigator.of(context).pop(),
        ),
        CupertinoDialogAction(
          isDestructiveAction: true,
          onPressed: () {
            onDelete();
            Navigator.of(context).pop();
          },
          child: Text(localizations.delete),
        ),
      ],
    );
  }
}
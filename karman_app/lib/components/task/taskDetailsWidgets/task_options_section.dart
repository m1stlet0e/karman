import 'package:flutter/cupertino.dart';
import 'package:karman_app/components/reminders/date_option.dart';
import 'package:karman_app/components/reminders/task_reminder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TaskOptionsSection extends StatelessWidget {
  final bool isDateEnabled;
  final bool isReminderEnabled;
  final DateTime? dueDate;
  final DateTime? reminder;
  final Function(bool) onDateToggle;
  final Function(bool) onReminderToggle;
  final Function(DateTime?) onDateSelected;
  final Function(DateTime?) onReminderSet;

  const TaskOptionsSection({
    super.key,
    required this.isDateEnabled,
    required this.isReminderEnabled,
    required this.dueDate,
    required this.reminder,
    required this.onDateToggle,
    required this.onReminderToggle,
    required this.onDateSelected,
    required this.onReminderSet,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    
    return Column(
      children: [
        DateOptionWidget(
          isEnabled: isDateEnabled,
          date: dueDate,
          onToggle: onDateToggle,
          onDateSelected: onDateSelected,
          title: localizations.dueDate,
          placeholder: localizations.dueDate,
        ),
        SizedBox(height: 20),
        TaskReminder(
          isEnabled: isReminderEnabled,
          dateTime: reminder ?? dueDate,
          onToggle: onReminderToggle,
          onDateTimeSelected: onReminderSet,
          title: localizations.reminder,
          placeholder: localizations.reminder,
        ),
      ],
    );
  }
}

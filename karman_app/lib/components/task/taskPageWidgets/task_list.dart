import 'package:flutter/cupertino.dart';
import 'package:karman_app/controllers/task_controller.dart';
import 'package:karman_app/models/task/task.dart';
import 'package:karman_app/components/task/taskPageWidgets/priority_section.dart';
import 'package:karman_app/components/task/taskPageWidgets/completed_section.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TaskList extends StatelessWidget {
  final List<Task> tasks;
  final Map<int, bool> expandedSections;
  final Function(int) onToggleSection;
  final Function(Task) onTaskToggle;
  final Function(BuildContext, int) onTaskDelete;
  final Function(Task) onTaskTap;
  final Function(int, Task, int) onTaskReorder;

  const TaskList({
    super.key,
    required this.tasks,
    required this.expandedSections,
    required this.onToggleSection,
    required this.onTaskToggle,
    required this.onTaskDelete,
    required this.onTaskTap,
    required this.onTaskReorder,
  });

  @override
  Widget build(BuildContext context) {
    return tasks.isEmpty
        ? Center(
            child: Text(
              AppLocalizations.of(context)!.thisSpaceCravesIdeas,
              style: TextStyle(
                fontSize: 18,
                color: CupertinoColors.systemGrey,
              ),
              textAlign: TextAlign.center,
            ),
          )
        : CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate([
                  PrioritySection(
                    priority: 3,
                    tasks: tasks,
                    isExpanded: expandedSections[3]!,
                    onToggle: onToggleSection,
                    onTaskToggle: onTaskToggle,
                    onTaskDelete: onTaskDelete,
                    onTaskTap: onTaskTap,
                    onTaskReorder: (priority, task, newIndex) {
                      context
                          .read<TaskController>()
                          .reorderTasks(priority, task, newIndex);
                    },
                  ),
                  PrioritySection(
                    priority: 2,
                    tasks: tasks,
                    isExpanded: expandedSections[2]!,
                    onToggle: onToggleSection,
                    onTaskToggle: onTaskToggle,
                    onTaskDelete: onTaskDelete,
                    onTaskTap: onTaskTap,
                    onTaskReorder: (priority, task, newIndex) {
                      context
                          .read<TaskController>()
                          .reorderTasks(priority, task, newIndex);
                    },
                  ),
                  PrioritySection(
                    priority: 1,
                    tasks: tasks,
                    isExpanded: expandedSections[1]!,
                    onToggle: onToggleSection,
                    onTaskToggle: onTaskToggle,
                    onTaskDelete: onTaskDelete,
                    onTaskTap: onTaskTap,
                    onTaskReorder: (priority, task, newIndex) {
                      context
                          .read<TaskController>()
                          .reorderTasks(priority, task, newIndex);
                    },
                  ),
                  CompletedSection(
                    tasks: tasks,
                    isExpanded: expandedSections[0]!,
                    onToggle: () => onToggleSection(0),
                    onTaskToggle: onTaskToggle,
                    onTaskDelete: onTaskDelete,
                    onTaskTap: onTaskTap,
                  ),
                ]),
              ),
            ],
          );
  }
}

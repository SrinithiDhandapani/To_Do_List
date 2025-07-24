import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task.dart';
import '../providers/task_provider.dart';
import 'add_edit_task_screen.dart';
import 'package:intl/intl.dart';

class TaskDetailsScreen extends StatelessWidget {
  static const routeName = '/task_details';
  const TaskDetailsScreen({Key? key}) : super(key: key);

  Color _getPriorityColor(TaskPriority priority) {
    switch (priority) {
      case TaskPriority.high:
        return Colors.red;
      case TaskPriority.medium:
        return Colors.orange;
      case TaskPriority.low:
      default:
        return Colors.green;
    }
  }

  Icon _getStatusIcon(bool isCompleted) {
    return Icon(
      isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
      color: isCompleted ? Colors.green : Colors.grey,
    );
  }

  @override
  Widget build(BuildContext context) {
    final String? taskId =
        ModalRoute.of(context)?.settings.arguments as String?;
    final task = taskId == null
        ? null
        : Provider.of<TaskProvider>(context).getTaskById(taskId);

    if (task == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Task Details')),
        body: const Center(child: Text('Task not found.')),
      );
    }

    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Details'),
        actions: [
          IconButton(
            tooltip: 'Edit Task',
            icon: const Icon(Icons.edit),
            onPressed: () {
              Navigator.pushNamed(
                context,
                AddEditTaskScreen.routeName,
                arguments: task.id,
              );
            },
          ),
          IconButton(
            tooltip: 'Delete Task',
            icon: const Icon(Icons.delete),
            onPressed: () {
              Provider.of<TaskProvider>(context, listen: false)
                  .deleteTask(task.id);
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      task.title,
                      style: textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Priority and status
                    Row(
                      children: [
                        Chip(
                          label: Text(
                            task.priority.name[0].toUpperCase() +
                                task.priority.name.substring(1),
                            style: const TextStyle(color: Colors.white),
                          ),
                          backgroundColor: _getPriorityColor(task.priority),
                        ),
                        const SizedBox(width: 16),
                        _getStatusIcon(task.isCompleted),
                        const SizedBox(width: 8),
                        Text(task.isCompleted ? 'Completed' : 'Pending'),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Due Date
                    Row(
                      children: [
                        const Icon(Icons.calendar_today, size: 20),
                        const SizedBox(width: 8),
                        Text(
                          'Due: ${DateFormat.yMMMd().format(task.dueDate)}',
                          style: textTheme.bodyLarge,
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Description
                    Text('Description',
                        style: textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: theme.colorScheme.secondary)),
                    const SizedBox(height: 8),
                    Text(
                      task.description.isNotEmpty
                          ? task.description
                          : 'No description provided.',
                      style: textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

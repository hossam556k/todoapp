import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todoapprev/tasks/task_widget.dart';

class TaskView extends StatefulWidget {
  const TaskView({super.key});

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var theme = Theme.of(context);
    final EasyInfiniteDateTimelineController _controller =
        EasyInfiniteDateTimelineController();
    var _focusDate = DateTime.now();

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 60),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 50, left: 15, right: 15),
                width: mediaQuery.size.width,
                height: mediaQuery.size.height * 0.2,
                color: theme.primaryColor,
                child: Text(
                  "To Do List",
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Positioned(
                top: 120,
                child: SizedBox(
                  width: mediaQuery.size.width,
                  child: EasyInfiniteDateTimeLine(
                    showTimelineHeader: false,
                    dayProps: EasyDayProps(
                      activeDayStyle: DayStyle(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        dayNumStyle: theme.textTheme.titleMedium?.copyWith(
                          color: theme.primaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        dayStrStyle: theme.textTheme.titleMedium?.copyWith(
                          color: theme.primaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        monthStrStyle: theme.textTheme.titleMedium?.copyWith(
                          color: theme.primaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      inactiveDayStyle: DayStyle(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        dayNumStyle: theme.textTheme.titleMedium?.copyWith(
                          color: Colors.black87,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        dayStrStyle: theme.textTheme.titleMedium?.copyWith(
                          color: Colors.black87,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        monthStrStyle: theme.textTheme.titleMedium?.copyWith(
                          color: Colors.black87,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    controller: _controller,
                    firstDate: DateTime(2025),
                    focusDate: _focusDate,
                    lastDate: DateTime.now().add(Duration(days: 365)),
                    onDateChange: (selectedDate) {
                      setState(() {
                        _focusDate = selectedDate;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return TaskWidget();
            },
            itemCount: 20,
          ),
        ),
      ],
    );
  }
}

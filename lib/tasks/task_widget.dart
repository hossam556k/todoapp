import 'package:flutter/material.dart';

class TaskWidget extends StatefulWidget {
  const TaskWidget({super.key});

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: Container(
          width: 6,
          height: 100,
          decoration: BoxDecoration(color: theme.primaryColor),
        ),
        title: Row(
          children: [
            Column(
              children: [
                Text(
                  "Play football",
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: theme.primaryColor,
                    fontSize: 16,
                  ),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [Icon(Icons.alarm, size: 16), Text("10:30 am")],
                ),
              ],
            ),
            Spacer(),
            Container(
              width: 50,
              height: 25,
              decoration: BoxDecoration(
                color: theme.primaryColor,

                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(Icons.check, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

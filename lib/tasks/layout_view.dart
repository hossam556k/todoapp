import 'package:flutter/material.dart';
import 'package:todoapprev/spalsh/settings/settings_view.dart';
import 'package:todoapprev/tasks/add_task_bottom.dart';
import 'package:todoapprev/tasks/task_view.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  int currIndex = 0;
  List<Widget> screensList = [const TaskView(), const SettingsView()];
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => AddTaskBottom(),
          );
        },
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: CircleAvatar(
          radius: 25,
          backgroundColor: theme.primaryColor,
          child: const Icon(Icons.add, color: Colors.white, size: 30),
        ),
      ),
      body: screensList[currIndex],
      bottomNavigationBar: BottomAppBar(
        padding: const EdgeInsets.all(0),
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        clipBehavior: Clip.antiAlias,
        color: Colors.white,
        child: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          currentIndex: currIndex,
          onTap: (value) {
            setState(() {
              currIndex = value;
            });
          },
          items: [
            const BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/images/Icon awesome-list.png"),
              ),
              label: 'Task',
            ),
            const BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/images/settings_icn.png")),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}

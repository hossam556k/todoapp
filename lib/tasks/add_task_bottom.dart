import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddTaskBottom extends StatefulWidget {
  AddTaskBottom({super.key});

  @override
  State<AddTaskBottom> createState() => _AddTaskBottomState();
}

DateTime selectedDate = DateTime.now();

class _AddTaskBottomState extends State<AddTaskBottom> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.only(top: 30, bottom: 20, left: 20, right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [
          Text(
            "Add New TasK",
            textAlign: TextAlign.center,
            style: theme.textTheme.titleSmall?.copyWith(color: Colors.black87),
          ),
          const SizedBox(height: 10),
          TextFormField(
            decoration: const InputDecoration(hintText: "Enter Task Title"),
          ),
          const SizedBox(height: 15),

          TextFormField(
            maxLines: 3,
            decoration: const InputDecoration(
              hintText: "Enter Task Description",
            ),
          ),
          const SizedBox(height: 15),

          Text(
            "Select Time",
            style: theme.textTheme.titleSmall?.copyWith(color: Colors.black87),
          ),
          const SizedBox(height: 15),
          InkWell(
            onTap: () {
              getSelectDate();
            },
            child: Text(
              textAlign: TextAlign.center,
              DateFormat("dd MMM yyyy").format(selectedDate),
              style: theme.textTheme.titleSmall?.copyWith(
                color: Colors.black87,
              ),
            ),
          ),
          const Spacer(),
          FilledButton(
            onPressed: () {},
            style: FilledButton.styleFrom(
              backgroundColor: theme.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text("Save", style: theme.textTheme.titleMedium),
          ),
        ],
      ),
    );
  }

  getSelectDate() async {
    var curDate = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (curDate != null) {
      setState(() {
        selectedDate = curDate;
      });
    }
  }
}

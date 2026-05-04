import 'package:flutter/material.dart';

class AddTask extends StatelessWidget {
  final Future<void> Function(String) addTask;

  const AddTask({super.key, required this.addTask});

  @override
  Widget build(BuildContext context) {
    String task = "";
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Text(
            "Add Task",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.blueAccent, fontSize: 40),
          ),
          SizedBox(height: 10),
          TextField(
            onChanged: (value) {
              task = value;
            },
            cursorColor: Colors.black,
            autofocus: true,
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.blueAccent, width: 2),
              ),
            ),
          ),
          SizedBox(height: 20),
          TextButton(
            onPressed: () async {
              if (task.trim().isNotEmpty) {
                await addTask(task.trim());

                if (context.mounted) {
                  Navigator.pop(context);
                }
              }
            },
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.blueAccent),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            child: Text("Add", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}

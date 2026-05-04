import 'package:flutter/material.dart';

class TextTitle extends StatelessWidget {
  final String taskText;
  final bool isDone;
  final VoidCallback onLongPress;
  final Function(bool?) onChanged;

  const TextTitle({
    super.key,
    required this.taskText,
    required this.isDone,
    required this.onLongPress,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: onLongPress,
      child: ListTile(
        title: Row(
          children: [
            Text("• ", style: TextStyle(fontSize: 20)),
            Text(
              taskText,
              style: TextStyle(
                fontSize: 18,
                decoration: isDone
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),
          ],
        ),
        trailing: Checkbox(
          value: isDone,
          activeColor: Colors.blueAccent,
          onChanged: onChanged,
        ),
      ),
    );
  }
}

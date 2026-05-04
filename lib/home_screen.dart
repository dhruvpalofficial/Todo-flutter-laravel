import 'package:flutter/material.dart';
import 'task_area.dart';
import 'add_task.dart';
import 'todo_model.dart';
import 'todo_server.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Todo> taskList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchTodos();
  }

  Future<void> fetchTodos() async {
    try {
      final data = await TodoService.getTodos();

      setState(() {
        taskList = data;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      debugPrint(e.toString());
    }
  }

  Future<void> addTask(String task) async {
    await TodoService.addTodo(task);
    await fetchTodos();
  }

  Future<void> deleteTask(int id) async {
    await TodoService.deleteTodo(id);
    fetchTodos();
  }

  Future<void> updateTask(int id, bool isDone) async {
    await TodoService.updateTodo(id, isDone);
    fetchTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: AddTask(addTask: addTask),
              ),
            ),
          );
        },
        backgroundColor: Colors.blueAccent,
        child: Icon(Icons.add, color: Colors.white),
      ),
      backgroundColor: Colors.blueAccent,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 30, bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 27,
                    child: Icon(Icons.list, color: Colors.blueAccent, size: 30),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Today",
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "${taskList.length} Tasks",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            ),
            Expanded(
              child: isLoading
                  ? Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    )
                  : TaskArea(
                      taskList: taskList,
                      deleteTask: deleteTask,
                      updateTask: updateTask,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:todolist/view/drawer.dart';

import './controller.dart';

class TodoListAppView extends StatefulWidget {
  const TodoListAppView({Key? key}) : super(key: key);

  @override
  State<TodoListAppView> createState() => _TodoListAppViewState();
}

class _TodoListAppViewState extends TodoListAppController {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo List"),
        actions: const [],
      ),
      drawer: const MyDrawer(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey[200],
                    backgroundImage: const NetworkImage(
                      "https://i.ibb.co/QrTHd59/woman.jpg",
                    ),
                  ),
                  title: const Text("Jessica Doe"),
                  subtitle: const Text("Programmer"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

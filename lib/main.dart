import 'package:flutter/material.dart';
import 'package:todolist/adddata/view.dart';
import 'package:todolist/homepage/homepageview.dart';

import 'package:todolist/todolistapp/view.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "/adddata",
    routes: {
      '/': (context) => const HomePage(),
      '/todoapp': (context) => const TodoListAppView(),
      '/adddata': (context) => const AddDataView(),
    },
  ));
}

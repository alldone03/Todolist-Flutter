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
                child: FutureBuilder(
                  future: getdatalist(),
                  builder: ((context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      var countlist = snapshot.data as List;
                      // print(countlist);
                      return ListView.builder(
                        itemCount: countlist.length,
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        itemBuilder: (context, index) {
                          // var item = {};
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.grey[200],
                            ),
                            title: Text(countlist[index].title.toString()),
                            subtitle:
                                Text(countlist[index].description.toString()),
                          );
                        },
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

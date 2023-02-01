import 'package:flutter/material.dart';
import 'package:todolist/adddata/controller.dart';
import 'package:todolist/view/drawer.dart';

class AddDataView extends StatefulWidget {
  const AddDataView({Key? key}) : super(key: key);

  @override
  State<AddDataView> createState() => _AddDataViewState();
}

class _AddDataViewState extends AddDataController {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff9EA1D4),
      appBar: AppBar(
        backgroundColor: Color(0xff9EA1D4),
        title: const Text("Add Data"),
        actions: const [],
      ),
      drawer: const MyDrawer(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            color: const Color(0xffA8D1D1),
            shadowColor: Colors.blue,
            elevation: 5,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.only(),
                  child: TextFormField(
                    style: TextStyle(color: Color.fromARGB(255, 109, 111, 153)),
                    initialValue: '',
                    maxLength: 20,
                    decoration: const InputDecoration(
                      labelText: 'Label',
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    onChanged: (value) {
                      dataLabel = value;
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.only(),
                  child: TextFormField(
                    style: TextStyle(color: Color.fromARGB(255, 109, 111, 153)),
                    initialValue: '',
                    maxLength: 20,
                    decoration: const InputDecoration(
                      labelText: 'Description',
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    onChanged: (value) {
                      datadescription = value;
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    printdata();
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffFD8A8A)),
                  child: const Text("Submit"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

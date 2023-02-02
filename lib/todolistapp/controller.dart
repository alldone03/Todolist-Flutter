import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todolist/adddata/model.dart';

import './view.dart';

abstract class TodoListAppController extends State<TodoListAppView> {
  final Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  // List<DataListFormModel> datalist = [];
  // var datalist = "";
  Future getdatalist() async {
    try {
      var result = await _pref.then((value) => value.getString('datalist'));

      // print(result);
      Map<String, dynamic> datalist = await jsonDecode(result!.toString());
      print("ini daata ${datalist['title']}");
    } catch (e) {
      print(e);
    }
    // print("mydatalist : " + datalist);
    // return datalist;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdatalist();
  }
}

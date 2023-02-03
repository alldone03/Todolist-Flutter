import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todolist/adddata/model.dart';

import './view.dart';

abstract class TodoListAppController extends State<TodoListAppView> {
  final Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  // List<DataListFormModel> datalist = [];
  List datalist = [];
  // var datalist = "";
  Future getdatalist() async {
    try {
      var result = await _pref.then((value) => value.getString('datalist'));

      datalist = await jsonDecode(result!.toString());
    } catch (e) {
      print(e);
    }
    List<DataListFormModel> listdata = [];
    for (var datajson in datalist) {
      DataListFormModel modeldata = DataListFormModel(
        datajson['title'],
        datajson['description'],
      );
      listdata.add(modeldata);
      // print("mydatalist : " + listdata.toString());
    }

    return listdata;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdatalist();
  }
}

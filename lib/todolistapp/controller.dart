import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todolist/adddata/model.dart';

import './view.dart';

abstract class TodoListAppController extends State<TodoListAppView> {
  final Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdatalist();
  }

  // List<DataListFormModel> datalist = [];
  List datalist = [];
  List<DataListFormModel> mydatalistform = [];
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
    }

    return listdata;
  }
  //FIXME: error remove array

  deleteindex(int index) async {
    final SharedPreferences pref = await _pref;
    dynamic res = datalist.removeAt(index);
    print("data : ${res}");
    Object tojson = datalist.map(
      (e) {
        return {
          "title": e.title,
          "description": e.description,
        };
      },
    ).toList();
    pref.setString("datalist", jsonEncode(tojson));
    setState(() {});
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:todolist/adddata/model.dart';
import 'package:todolist/adddata/view.dart';

abstract class AddDataController extends State<AddDataView> {
  final Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  int indexdata = 0;
  String dataLabel = "";
  String datadescription = "";
  var mydatalistform =
      List<DataListFormModel>.filled(2, DataListFormModel("", ""));

  printdata() async {
    final SharedPreferences pref = await _pref;
    try {
      mydatalistform[1] = DataListFormModel(dataLabel, datadescription);
      pref.setString("datalist", jsonEncode(mydatalistform[1].toJson()));
    } catch (e) {
      // print(e);
    }

    var result = await _pref.then((value) => value.getString('datalist'));
    showAlertDialog(context);
    // print(result);

    // print(mydatalistform[0].toJson());
    // pref.setStringList('datamodal', ["", "", ""]);

    // print(mydatalistform[0].title + " " + mydatalistform[0].description);
  }

  showAlertDialog(BuildContext context) {
    // set up the button

    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("My title"),
      content: Text("This is my message."),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:todolist/adddata/model.dart';
import 'package:todolist/adddata/view.dart';

abstract class AddDataController extends State<AddDataView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdatahistory();
  }

  final Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  int indexdata = 0;
  String dataLabel = "";
  String datadescription = "";
  List<DataListFormModel> mydatalistform = [];

  //TODO: getter data from shareredpreference to get history data
  Future getdatahistory() async {
    var resultgetdatahistory =
        await _pref.then((value) => value.getString('datalist'));
    List datafromjsondecode =
        await jsonDecode(resultgetdatahistory!.toString());
    for (var data in datafromjsondecode) {
      DataListFormModel modeldata =
          DataListFormModel(data['title'], data['description']);
      mydatalistform.add(modeldata);
    }

    print(mydatalistform);
  }

  int? checkdata(List<DataListFormModel> data) {
    for (var mydata in data) {
      if (dataLabel == mydata.title) {
        return 1;
      }
    }
    return 0;
  }

  printdata() async {
    final SharedPreferences pref = await _pref;
    try {
      if (checkdata(mydatalistform) != 1) {
        mydatalistform.add(DataListFormModel(dataLabel, datadescription));
        showAlertDialog(context,
            "Data ${mydatalistform[mydatalistform.length - 1].title ?? ""} Telah ditambahkan.");
      } else {
        showAlertDialog(context, "Data Gagal Ditambahkan!!!");
      }
      Object tojson = mydatalistform.map(
        (e) {
          return {
            "title": e.title,
            "description": e.description,
          };
        },
      ).toList();
      // print("sdkfhoasdklfja:  ${tojson}");

      print("datajson : ${jsonEncode(tojson).toString()}");
      pref.setString("datalist", jsonEncode(tojson));
    } catch (e) {
      print(e);
    }
    // for (var data in mydatalistform) {
    //   print("title: ${data.title}\ndata: ${data.description}");
    // }

    // var result = await _pref.then((value) => value.getString('datalist'));
    // Map<String, dynamic> datalist = await jsonDecode(result!.toString());

    // showAlertDialog(context, datalist['title']);
  }

  showAlertDialog(BuildContext context, String data) {
    // set up the button

    Widget okButton = TextButton(
      child: const Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Alert"),
      content: Text(data),
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

import 'package:flutter/material.dart';
import 'package:todolist/adddata/view.dart';

abstract class AddDataController extends State<AddDataView> {
  String dataLabel = "";
  String datadescription = "";
  var datalistform = new List<String,String>(2);

  printdata() {}
}

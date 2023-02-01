import 'package:flutter/material.dart';
import './homepageview.dart';

abstract class Homepagecontroller extends State<HomePage> {
  int counter = 0;
  tambahdata() {
    counter++;
    setState(() {});
  }

  kurangdata() {
    counter--;
    setState(() {});
  }
}

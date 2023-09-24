import 'package:flutter/material.dart';

class JobData extends ChangeNotifier {
  List<Map<String, String>> workList = [];

  void addDescription(
      String description, String date, String location, String phonenum,  String name) {
    workList.add({
      'description': description,
      'date': date,
      'location': location,
      'phoneNumber': phonenum,
      'Name': name,
    });
    notifyListeners();
  }
}

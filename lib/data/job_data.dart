import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class JobData extends ChangeNotifier {
  List<Map<String, String>> workList = [];

  JobData() {
    _loadData();
  }

  void addDescription(String description, String date, String location,
      String phoneNumber, String name) {
    workList.add({
      'description': description,
      'date': date,
      'location': location,
      'phoneNumber': phoneNumber,
      'Name': name,
    });
    _saveData();
    notifyListeners();
  }

  void removeDescription(String description) {
    workList.removeWhere((work) => work['description'] == description);
    _saveData();
    notifyListeners();
  }

  // Load data from SharedPreferences
  void _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final workListJson = prefs.getString('workList');
    if (workListJson != null) {
      final List<dynamic> decodedList = json.decode(workListJson);
      workList = decodedList.map((item) => Map<String, String>.from(item)).toList();
      notifyListeners();
    }
  }

  // Save data to SharedPreferences
  void _saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final workListJson = json.encode(workList);
    prefs.setString('workList', workListJson);
  }
}

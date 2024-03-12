import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:q_copy/model/user_list_model.dart';

class UserListApi extends ChangeNotifier {
  List<Leader> datas = [];
  static const url =
      "https://e811e307-bc1a-4f80-8e1f-af2d64f41348.mock.pstmn.io/leaderboard";

  final Box<Leader> _hiveBox = Hive.box<Leader>('leaderBox');
  final Connectivity _connectivity = Connectivity();

  Future<void> fetchData() async {
    var connectivityResult = await _connectivity.checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      // Device is offline, load data from Hive
      datas = _loadFromHive();
      notifyListeners();
      return;
    }

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(response.body)["leaders"];
      datas = jsonData.map((e) => Leader.fromJson(e)).toList();

      // Add data to Hive
      await _addToHive(datas);

      notifyListeners();
      print(datas);
    } else {
      throw Exception("failed to fetch datas");
    }
  }

  // Function to load data from Hive
  List<Leader> _loadFromHive() {
    return _hiveBox.values.toList();
  }

  // Function to add data to Hive
  Future<void> _addToHive(List<Leader> data) async {
    await _hiveBox.clear(); // Clear existing data
    for (var leader in data) {
      await _hiveBox.add(leader); // Add each leader object to Hive box
    }
  }
}

// class UserListApi extends ChangeNotifier {
//   List<Leader> datas = [];
//   static const url =
//       "https://e811e307-bc1a-4f80-8e1f-af2d64f41348.mock.pstmn.io/leaderboard";
//   Future<void> fetchData() async {
//     final response = await http.get(Uri.parse(url));
//     if (response.statusCode == 200) {
//       List<dynamic> jsonData = jsonDecode(response.body)["leaders"];
//       datas = jsonData.map((e) => Leader.fromJson(e)).toList();
//       notifyListeners();
//       print(datas);
//     } else {
//       throw Exception("failed to fetch datas");
//     }
//   }

  
// }

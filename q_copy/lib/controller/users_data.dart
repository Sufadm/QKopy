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

  late final Box<Leader> _hiveBox; // Declare _hiveBox as late

  UserListApi() {
    _initHive();
  }

  Future<void> _initHive() async {
    _hiveBox = await Hive.openBox<Leader>('leaderBox');
  }

  final Connectivity _connectivity = Connectivity();
  Future<void> fetchData() async {
    var connectivityResult = await _connectivity.checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      datas = _loadFromHive();
      notifyListeners();
      return;
    }

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        List<dynamic> jsonData = jsonDecode(response.body)["leaders"];
        datas = jsonData.map((e) => Leader.fromJson(e)).toList();
        await _addToHive(datas);
        notifyListeners();
      } else {
        throw Exception("Failed to fetch data: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching data: $e");
      datas = _loadFromHive();
      notifyListeners();
    }
  }

  List<Leader> _loadFromHive() {
    return _hiveBox.values.toList();
  }

  Future<void> _addToHive(List<Leader> data) async {
    await _hiveBox.clear();
    for (var leader in data) {
      await _hiveBox.add(leader);
    }
  }
}

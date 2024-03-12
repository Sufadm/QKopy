import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:q_copy/model/user_list_model.dart';

class UserListApi extends ChangeNotifier {
  List<Leader> datas = [];
  static const url =
      "https://e811e307-bc1a-4f80-8e1f-af2d64f41348.mock.pstmn.io/leaderboard";
  Future<void> fetchData() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(response.body)["leaders"];
      datas = jsonData.map((e) => Leader.fromJson(e)).toList();
      notifyListeners();
      print(datas);
    } else {
      throw Exception("failed to fetch datas");
    }
  }
}

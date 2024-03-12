import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:q_copy/controller/users_data.dart';
import 'package:q_copy/view/dashboard_screen.dart';

void main() {
  UserListApi().fetchData();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserListApi(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const DashboardScreen()),
    );
  }
}

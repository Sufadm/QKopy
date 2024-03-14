import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:q_copy/controller/bottom_prov.dart';
import 'package:q_copy/controller/users_data.dart';
import 'package:q_copy/model/user_list_model.dart';
import 'package:q_copy/view/screens/dashboard_screen.dart';
import 'package:q_copy/view/nav_bar.dart/navigation_bar.dart';
import 'package:q_copy/view/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);

  Hive.initFlutter();
  if (!Hive.isAdapterRegistered(LeaderAdapter().typeId)) {
    Hive.registerAdapter(LeaderAdapter());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserListApi()),
        StreamProvider<ConnectivityResult>(
          create: (_) => Connectivity().onConnectivityChanged,
          initialData:
              ConnectivityResult.none, // Provide initial non-null value
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(scaffoldBackgroundColor: Colors.black),
        title: 'Your App',
        home: const BottomNav(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shared_preferences_tutorial/pages/home_page.dart';
import 'package:shared_preferences_tutorial/pages/login_page.dart';
import 'package:shared_preferences_tutorial/services/local_storage_impl.dart';
import 'package:shared_preferences_tutorial/utils/keys.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool? isUserLoggedIn;
  @override
  void initState() {
    init();
    super.initState();
  }

  void init() async {
    isUserLoggedIn ??= await SharedPrefs.getBool(AppKeys.isUserLoggedIn);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: isUserLoggedIn == true ? const HomePage() : const LoginPage(),
    );
  }
}

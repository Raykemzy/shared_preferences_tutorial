import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences_tutorial/pages/checkbox_page.dart';
import 'package:shared_preferences_tutorial/services/local_storage_impl.dart';
import 'package:shared_preferences_tutorial/utils/keys.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? userName;
  @override
  void initState() {
    init();
    super.initState();
  }

  void init() async {
    userName ??= await SharedPrefs.getUserName(AppKeys.userName);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: userName == ""
            ? const Text("Welcome")
            : Text("Welcome back $userName"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () async {
                final value =
                    SharedPrefs.getBool(AppKeys.isUserLoggedIn);
                log(value.toString());
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CheckBoxPage()),
                );
              },
              child: const Text("Click here"),
            ),
          ),
        ],
      ),
    );
  }
}
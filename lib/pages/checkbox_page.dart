import 'package:flutter/material.dart';
import 'package:shared_preferences_tutorial/pages/login_page.dart';
import 'package:shared_preferences_tutorial/services/local_storage_impl.dart';
import 'package:shared_preferences_tutorial/utils/keys.dart';

class CheckBoxPage extends StatefulWidget {
  const CheckBoxPage({super.key});

  @override
  State<CheckBoxPage> createState() => _CheckBoxPageState();
}

class _CheckBoxPageState extends State<CheckBoxPage> {
  bool? isChecked;
  @override
  void initState() {
    init();
    super.initState();
  }

  void init() async {
    isChecked ??= await SharedPrefs.getBool(AppKeys.isChecked);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Check the Box"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 200),
            Center(
              child: CheckboxListTile(
                title: const Text("Check the box"),
                value: isChecked ?? false,
                onChanged: (value) {
                  setState(() => isChecked = !isChecked!);
                  SharedPrefs.setBool(AppKeys.isChecked, value!);
                },
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton.icon(
              onPressed: () {
                SharedPrefs.clearPrefs();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                  (route) => false,
                );
              },
              icon: const Icon(Icons.logout),
              label: const Text("Log out"),
            ),
          ],
        ),
      ),
    );
  }
}

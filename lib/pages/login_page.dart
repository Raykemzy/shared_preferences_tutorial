import 'package:flutter/material.dart';
import 'package:shared_preferences_tutorial/pages/home_page.dart';
import 'package:shared_preferences_tutorial/services/local_storage_impl.dart';
import 'package:shared_preferences_tutorial/utils/keys.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController nameController;
  late TextEditingController passwordController;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    passwordController = TextEditingController();
  }

  _changeLoadState() {
    isLoading = true;
    setState(() {});

    Future.delayed(const Duration(milliseconds: 500), () {
      isLoading = false;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(label: Text("Enter name")),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(label: Text("Enter password")),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                _changeLoadState();
                SharedPrefs.setUserName(AppKeys.userName, nameController.text);
                SharedPrefs.setBool(AppKeys.isUserLoggedIn, true);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
              child: isLoading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(),
                    )
                  : const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}

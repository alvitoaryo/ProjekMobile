import 'dart:convert';

import 'package:covid_19/pages/bottom_navbar.dart';
import 'package:covid_19/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:covid_19/helper/hive_database.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:crypto/crypto.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void initState() {
    super.initState();
    checkIsLogin();
  }

  void checkIsLogin() async {
    final SharedPreferences userdata = await SharedPreferences.getInstance();
    print(userdata.getString('username'));

    bool? isLogin = (userdata.getString('username') != null) ? true : false;

    if(isLogin && mounted){
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
        builder: (context) => const Navbar(),
      ),
              (route) => false);
    }
  }

  void validateAndSave() {
    final FormState? form = _formKey.currentState;
    if (form != null) {
      if (form.validate()) {
        // ignore: avoid_print
        print('Form is valid');
      } else {
        // ignore: avoid_print
        print('Form is invalid');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                    labelText: "Username",
                  ),
                  validator: (value) =>
                      value!.isEmpty ? 'Username cannot be blank' : null,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(),
                    labelText: "Password",
                  ),
                  obscureText: true,
                  validator: (value) =>
                      value!.isEmpty ? 'Password cannot be blank' : null,
                ),
              ),
              _buildLoginButton(),
              _buildRegisterButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _commonSubmitButton({
    required String labelButton,
    required Function(String) submitCallback,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: 150,
      child: ElevatedButton(
        child: Text(labelButton),
        onPressed: () {
          submitCallback(labelButton);
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return _commonSubmitButton(
      labelButton: "Login",
      submitCallback: (value) {
        validateAndSave();
        final hashedPassword = sha256.convert(utf8.encode(_passwordController.value.text)).toString();
        String currentUsername = _usernameController.value.text;
        String currentPassword = hashedPassword;

        _processLogin(currentUsername, currentPassword);
      },
    );
  }

  void _processLogin(String username, String password) async {
    final HiveDatabase _hive = HiveDatabase();
    bool found = false;

    found = _hive.checkLogin(username, password);

    String message = "";
    if (!found) {
      message = "Login Failed";

      SnackBar snackBar = SnackBar(content: Text(message));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      final SharedPreferences userdata = await SharedPreferences.getInstance();
      userdata.setString('username', username); // Simpan username pengguna

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const Navbar(),
        ),
      );
    }
  }

  Widget _buildRegisterButton() {
    return Row(
      children: [
        const Text('Does not have account?'),
        TextButton(
          style: TextButton.styleFrom(
            primary: Colors.blue,
          ),
          child: const Text(
            'Sign Up',
            style: TextStyle(fontSize: 14),
          ),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const RegisterPage(),
              ),
            );
          },
        )
      ],
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }
}

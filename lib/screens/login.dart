import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:week_4/main.dart';
import 'package:week_4/screens/home.dart';

class ScreenLogin extends StatefulWidget {
  ScreenLogin({super.key});

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  var user = 'habeeb';
  var pass = 'rahman';
  bool _isObscure = true;

  final _textController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(
                        'assets/images/mobile-login-concept-illustration_114360-83.jpg'),
                    radius: 90,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Username',
                      suffixIcon: Align(
                        widthFactor: 1.0,
                        heightFactor: 1.0,
                        child: IconButton(
                          onPressed: () {
                            _usernameController.clear();
                          },
                          icon: Icon(Icons.cancel),
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value != user) {
                        return 'Invalid Username';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    obscureText: _isObscure,
                    controller: _passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Password',
                      suffixIcon: Align(
                        widthFactor: 1.0,
                        heightFactor: 1.0,
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                          icon: Icon(
                            _isObscure
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value != pass) {
                        return 'Invalid Password';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot Password',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 200,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    child: ElevatedButton.icon(
                      onPressed: () async {
                        if (_formKey.currentState!.validate() == true) {
                          await CheckLogin(context);
                        }
                      },
                      icon: Icon(Icons.check),
                      label: Text(
                        'Login',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 200,
                  ),
                  Text(
                    'New User? Create Account',
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> CheckLogin(BuildContext ctx) async {
    final _username = _usernameController.text;
    final _password = _passwordController.text;

    if (_username == user && _password == pass) {
      final _sharedPrefes = await SharedPreferences.getInstance();
      await _sharedPrefes.setBool(SAVE_KEY_NAME, true);
      Navigator.of(ctx).pushReplacement(
        MaterialPageRoute(
          builder: (ctx1) => ScreenHome(),
        ),
      );
    } else {
      return null;
    }
  }
}

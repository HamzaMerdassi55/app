import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/Auth/forgetpassword.dart';
import 'package:flutter_application_1/Auth/signup.dart';
import 'package:flutter_application_1/mainscreenpage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isPasswordVisible = false;
  late TextEditingController _emailcntrl;
  late TextEditingController _passwordcntrl;
  bool isObscrued = true;
  String _emailerror = '';
  String _passworderror = '';
  @override
  void initState() {
    super.initState();
    _emailcntrl = TextEditingController();
    _passwordcntrl = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _emailcntrl.dispose();
    _passwordcntrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Image.asset(
              'assets/icons/user.png',
              height: 100.0,
              width: 100.0,
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Welcome',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Container(
                    width: double.infinity,
                    height: 55.0,
                    child: TextField(
                      onTap: () {
                        setState(() {
                          if (_emailcntrl.text.isEmpty) {
                            _emailerror = "Email should not be empty";
                          } else
                            _emailerror = "";
                        });
                      },
                      onChanged: (value) {
                        setState(() {
                          if (_emailcntrl.text.isEmpty) {
                            _emailerror = "Email should not be empty";
                          } else
                            _emailerror = "";
                        });
                      },
                      controller: _emailcntrl,
                      style: const TextStyle(color: Colors.black),
                      cursorColor: Color.fromARGB(255, 0, 0, 0),
                      decoration: InputDecoration(
                        labelText: "Email or username",
                        labelStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.purple),
                        ),
                        suffixIcon: Icon(Icons.email),
                        errorText: _emailerror.isEmpty ? null : _emailerror,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  Container(
                    width: double.infinity,
                    height: 55.0,
                    child: TextField(
                      onTap: () {
                        setState(() {
                          if (_passwordcntrl.text.length < 7) {
                            _passworderror =
                                "password should be at least 8 caractere ";
                          } else
                            _passworderror = "";
                        });
                      },
                      onChanged: (value) {
                        setState(() {
                          if (_passwordcntrl.text.length < 7) {
                            _passworderror =
                                "password should be at least 8 characters";
                          } else
                            _passworderror = "";
                        });
                      },
                      controller: _passwordcntrl,
                      obscureText: !_isPasswordVisible,
                      style: TextStyle(color: Colors.black),
                      cursorColor: Color.fromARGB(255, 0, 0, 0),
                      decoration: InputDecoration(
                          labelText: "Password",
                          labelStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.purple),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                            icon: Icon(
                              _isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),
                          errorText:
                              _passworderror.isEmpty ? null : _passworderror),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.purple,
                      padding: EdgeInsets.symmetric(
                          horizontal: 60.0, vertical: 10.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      if (_emailcntrl.text.isNotEmpty &&
                          _passwordcntrl.text.length > 7) {
                        Navigator.pushReplacement(
                            context,
                            CupertinoPageRoute(
                                builder: ((context) => const MainScreenPage())));
                      }
                      if (_emailcntrl.text.isEmpty) {
                        setState(() {
                          _emailerror = "Email should not be empty";
                        });
                      }
                      if (_passwordcntrl.text.length < 7) {
                        setState(() {
                          _passworderror =
                            "password should be at least 8 characters";
                        });
                      }
                    },
                  ),
                  const SizedBox(height: 10.0),
                  GestureDetector(
                    onTap: () {
                      // Navigate to the ForgetPassword page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgetPassword()),
                      );
                    },
                    child: Text(
                      'Forget Password?',
                      style: TextStyle(
                        color: Colors.purple,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    'Or sign in using :',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildCircleIcon("assets/icons/twitterx.png"),
                      _buildCircleIcon("assets/icons/insta.png"),
                      _buildCircleIcon("assets/icons/tiktok.png"),
                      _buildCircleIcon("assets/icons/facebook.png"),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  GestureDetector(
                    onTap: () {
                      // Navigate to the Signup page when the "Get Started" link is clicked
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignupPage()),
                      );
                    },
                    child: SizedBox(
                      width: double.infinity,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account? ",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "Get Started",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.purple,
                              ),
                            ),
                          ]),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCircleIcon(String imagePath) {
    return Container(
      margin: EdgeInsets.all(10.0),
      width: 40.0,
      height: 40.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: Image.asset(imagePath),
    );
  }
}

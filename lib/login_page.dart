import 'package:flutter/material.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  String usernameAdmin = '';
  String passwordAdmin = '';
  bool isLoginStatus = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            'Login Screen',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _flutterLogoImage(),
            _containerForm(context),
          ],
        ),
      ),
    );
  }

  Widget _containerForm(context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        children: [
          _usernameInput(),
          SizedBox(height: 20),
          _passwordInput(),
          SizedBox(height: 20),
          _loginButton(context),
          SizedBox(height: 20),
          _registerprompt(),
        ],
      ),
    );
  }

  Widget _flutterLogoImage() {
    return const FlutterLogo(size: 150);
  }

  Widget _usernameInput() {
    return TextFormField(
      onChanged: (value) {
        setState(() {usernameAdmin = value;});
      },
      decoration: InputDecoration(
        labelText: 'Username',
        hintText: 'Enter your username',
        prefixIcon: Icon(Icons.person),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  Widget _passwordInput() {
    return TextFormField(
      onChanged: (value) {
        setState(() {passwordAdmin = value;});
      },
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Enter your password',
        prefixIcon: Icon(Icons.lock),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  Widget _loginButton(context) {
    return Container(
      height: 50,
      width: 200,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextButton(
        onPressed: () {
          String messageLogin = '';
          if (usernameAdmin == 'admin' && passwordAdmin == 'admin') {
            setState(() {
              isLoginStatus = true;
              messageLogin = 'Login Success';
            });
          } else {
            setState(() {
              isLoginStatus = false;
              messageLogin = 'Login Failed';
            });
          }
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(messageLogin),
              duration: Duration(seconds: 5),
            ),
          );

          if (isLoginStatus == true) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return home_page(usermessage: usernameAdmin);
                },
              ),
            );
          }
        },
        child: Text(
          'Sign In',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
    );
  }

  Widget _registerprompt() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Don\'t have an account?'),
        TextButton(
          onPressed: () {},
          child: Text('Register'),
        ),
      ],
    );
  }
}

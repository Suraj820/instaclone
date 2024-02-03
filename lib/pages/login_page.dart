import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  double? _deviceHeight, _deviceWidth;

  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();

  String? _email;
  String? _password;
  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: _deviceWidth! * 0.05),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _titleWidget(),
                _loginWidget(),
                _loginButton(),
                _registerPageLink(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _titleWidget() {
    return const Text(
      "Finstagram",
      style: TextStyle(
        color: Colors.black,
        fontSize: 25,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _loginWidget() {
    return SizedBox(
      height: _deviceHeight! * 0.20,
      child: Form(
        key: _loginFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _emailTextField(),
            _passwordTextField(),
          ],
        ),
      ),
    );
  }

  Widget _emailTextField() {
    return TextFormField(
      decoration: const InputDecoration(hintText: "Email..."),
      onSaved: (value) {
        setState(() {
          _email = value;
        });
      },
      validator: (value) {
        bool result = value!.contains(
          RegExp(
            r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$',
          ),
        );
        return result ? null : "Please Enter a valid email";
      },
    );
  }

  Widget _passwordTextField() {
    return TextFormField(
      decoration: const InputDecoration(hintText: "Password..."),
      obscureText: true,
      onSaved: (value) {
        setState(() {
          _password = value;
        });
      },
      validator: (value)=> value!.length> 6? null :"Please enter a Password greater then 6 characters ",
    );
  }

  Widget _registerPageLink(){
    return GestureDetector(
      onTap: ()=>Navigator.pushNamed(context, "registration"),
      child: const Text("Don't have an Account ?",style: TextStyle(color: Colors.blue,fontSize: 15,fontWeight: FontWeight.w200),),
    );
  }

  Widget _loginButton() {
    return MaterialButton(
      onPressed: _loginUser,
      textColor: Colors.white,
      minWidth: _deviceWidth! * 0.70,
      height: _deviceHeight! * 0.06,
      color: Colors.red,
      child: const Text("Login"),
    );
  }

  void _loginUser(){
    if(_loginFormKey.currentState!.validate()){

    }
  }
}

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';


class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _RegistrationPageState();
  }
}

class _RegistrationPageState extends State<RegistrationPage> {
  double? _deviceHeight, _deviceWidth;
  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  String? _name;
  String? _email;
  String? _password;
  File? _image;
  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: _deviceWidth! * 0.05,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _titleWidget(),
                _profileImage(),
                _registrationWidget(),
                _registrationButton(),
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

  Widget _registrationWidget() {
    return Container(
      height: _deviceHeight! * 0.30,
      child: Form(
        key: _registerFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _nameTextField(),
            _emailTextField(),
            _passwordTextField(),
          ],
        ),
      ),
    );
  }

  Widget _nameTextField() {
    return TextFormField(
      decoration: const InputDecoration(hintText: "Name..."),
      onSaved: (value) {
        setState(() {
          _name = value;
        });
      },
      validator: (value) => value!.isNotEmpty ? null : "Please enter a Name",
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
  Widget _profileImage(){
    var _imageProvider = _image != null ? FileImage(_image!) : const NetworkImage("http://i.pravatar.cc/300");
    return GestureDetector(
      onTap: (){
        FilePicker.platform.pickFiles(type: FileType.image).then((_result) {
          setState(() {
            _image = File(_result!.files.first.path!);
          });
        });
      },
      child: Container(
        height: _deviceHeight! * 0.15,
        width: _deviceHeight! * 0.15,
        decoration:BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: _imageProvider as ImageProvider,
          ),
        ),
      ),
    );
  }

  Widget _registrationButton() {
    return MaterialButton(
      onPressed: _registerUser,
      textColor: Colors.white,
      minWidth: _deviceWidth! * 0.70,
      height: _deviceHeight! * 0.06,
      color: Colors.red,
      child: const Text("Register"),
    );
  }

  void _registerUser(){
    if(_registerFormKey.currentState!.validate() && _image != null){
      _registerFormKey.currentState!.save();
    }
  }
}

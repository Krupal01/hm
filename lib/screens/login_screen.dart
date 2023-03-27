import 'package:flutter/material.dart';
import 'package:hotel_management/widgets/custom_buttons.dart';
import 'package:hotel_management/widgets/custom_edit_text.dart';

import '../widgets/styles.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Login",
                style: primaryTextStyles['34B'],
              ),
              SizedBox(
                height: 30,
              ),
              CustomTextField(
                labelText: 'Email Id Or Mobile Number',
                hintText: 'Enter email or mobile number',
                textEditingController: _emailController,
                validator: (value) => validateEmailOrMobile(value),
              ),
              SizedBox(
                height: 12,
              ),
              CustomTextField(
                labelText: 'Password',
                hintText: 'Enter password',
                obscureText: true,
                textEditingController: _passwordController,
                validator: (value) => validatePassword(value),
              ),
              SizedBox(
                height: 12,
              ),
              CustomButton(
                text: 'Login',
                onPress: () => _submitForm(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      print('Login successful');
    }
  }

  String? validateEmailOrMobile(String? input) {
    if (validateEmail(input) == null || validateMobileNumber(input) == null) {
      return null;
    }
    return 'Please enter a valid mobile number or email address.';
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    } else if (!isValidEmail(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? validateMobileNumber(String? mobileNumber) {
    if (mobileNumber == null || mobileNumber.isEmpty) {
      return 'Please enter valida mobile number';
    }
    mobileNumber = mobileNumber.replaceAll(RegExp(r'[^0-9]'), '');
    if (!isValidMobileNumberLength(mobileNumber) &&
        !isValidMobileNumberPattern(mobileNumber)) {
      return 'Please enter valida mobile number';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else if (!isValidPassword(value)) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  bool isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,}$').hasMatch(email);
  }

  bool isValidPassword(String password) {
    return password.length >= 6;
  }

  bool isValidMobileNumberLength(String mobileNumber) {
    return mobileNumber.length == 10;
  }

  bool isValidMobileNumberPattern(String mobileNumber) {
    return RegExp(r'^[6-9][0-9]{9}$').hasMatch(mobileNumber);
  }
}

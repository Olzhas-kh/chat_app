import 'package:chat_app/core/custom/app_text_style.dart';
import 'package:chat_app/core/custom/custom_button.dart';
import 'package:chat_app/core/custom/custom_textfield.dart';
import 'package:chat_app/core/extensions/num_extension.dart';
import 'package:chat_app/core/resources/constants.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _fullNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Register",
          style: appstyle(20, AppConst.kBlack, FontWeight.w500, 1),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            140.height,
            CustomTextField(
                hintText: "Full Name",
                controller: _fullNameController,
                obscureText: false,
                borderColor: AppConst.kBlack,
                hintColor: AppConst.kHint),
            10.height,
            CustomTextField(
                hintText: "Email",
                controller: _emailController,
                obscureText: false,
                borderColor: AppConst.kBlack,
                hintColor: AppConst.kHint),
            10.height,
            CustomTextField(
                hintText: "Password",
                controller: _passwordController,
                obscureText: true,
                borderColor: AppConst.kBlack,
                hintColor: AppConst.kHint),
            10.height,
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: CustomButton(
          text: 'Register',
          color: Colors.black,
          onTap: () {},
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

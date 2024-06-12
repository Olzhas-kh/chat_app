import 'package:chat_app/core/custom/app_text_style.dart';
import 'package:chat_app/core/custom/custom_button.dart';
import 'package:chat_app/core/custom/custom_textfield.dart';
import 'package:chat_app/core/extensions/num_extension.dart';
import 'package:chat_app/core/resources/constants.dart';
import 'package:chat_app/feature/auth/login/logic/provider/auth_provider.dart';
import 'package:chat_app/feature/auth/login/presentation/screens/register_screen.dart';
import 'package:chat_app/feature/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    final _authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Login",
          style: appstyle(20, AppConst.kBlack, FontWeight.w500, 1),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            140.height,
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
            Row(
              children: [
                const Text("У вас нет аккаунта? "),
                10.width,
                InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const RegisterScreen()));
                    },
                    child: const Text(
                      "Регистрация",
                      style: TextStyle(decoration: TextDecoration.underline),
                    ))
              ],
            )
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: CustomButton(
          text: 'Login',
          color: Colors.black,
          onTap: () async {
            try {
              await _authProvider.signIn(
                  _emailController.text, _passwordController.text);
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => HomeScreen()));
            } catch (e) {
              print(e);
            }
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

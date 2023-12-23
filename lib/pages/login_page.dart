import 'package:chat_app/constant.dart';
import 'package:chat_app/pages/register_page.dart';
import 'package:chat_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';

class LoginPage extends StatelessWidget {
  static const String routeName = 'Login-Page';

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
        ),
        child: ListView(
          children: [
            Image.asset(
              'assets/images/scholar.png',
              height: 150,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Scholar Chat',
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                    fontFamily: 'pacifico',
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 75,
            ),
            const Row(
              children: [
                Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const CustomTextField(
              hintText: 'E-mail',
            ),
            const SizedBox(
              height: 10,
            ),
            const CustomTextField(
              hintText: 'Password',
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomButton(text: 'Login'),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'don\'t have an account ?',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, RegisterPage.routeName);
                  },
                  child: const Text(
                    ' Register',
                    style: TextStyle(
                      color: Color(0xFFC7EDE6),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}

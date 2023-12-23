import 'package:chat_app/constant.dart';
import 'package:chat_app/helper/show_snake_bar.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// ignore: must_be_immutable
class RegisterPage extends StatefulWidget {
  static const String routeName = 'Register-Page';
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? email, password;

  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    ScaffoldMessengerState message = ScaffoldMessenger.of(context);

    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
          ),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                Image.asset(
                  'assets/images/scholar.png',
                  height: 100,
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
                  height: 30,
                ),
                const Row(
                  children: [
                    Text(
                      'Sign Up',
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
                // CustomTextField(
                //   validator: (text) {
                //     if (text == null || text.trim().isEmpty) {
                //       return 'Please enter task';
                //     }
                //     return null;
                //   },
                //   hintText: 'Full Name',
                // ),
                // const SizedBox(
                //   height: 10,
                // ),
                // CustomTextField(
                //   validator: (text) {
                //     if (text == null || text.trim().isEmpty) {
                //       return 'Please enter task';
                //     }
                //     return null;
                //   },
                //   hintText: 'Mobile Number',
                // ),
                // const SizedBox(
                //   height: 10,
                // ),
                CustomTextFormField(
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                  onChange: (data) {
                    email = data;
                  },
                  hintText: 'E-mail',
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return 'Please enter a password';
                    }
                    return null;
                  },
                  onChange: (data) {
                    password = data;
                  },
                  hintText: 'Password',
                ),
                // const SizedBox(
                //   height: 10,
                // ),
                // CustomTextField(
                //   hintText: 'Confirm Password',
                // ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  text: 'Register',
                  onTap: () async {
                    isLoading = true;
                    setState(() {});
                    if (formKey.currentState!.validate()) {
                      try {
                        UserCredential user = await registerUser();

                        showSnakeBar(message, 'Welcome ${user.user!.email}');
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          showSnakeBar(message, 'The password is to weak.');
                        } else if (e.code == 'email-already-in-use') {
                          showSnakeBar(message,
                              'The account already exists for that email.');
                        } else {
                          showSnakeBar(message, e.code);
                        }
                      } catch (e) {
                        showSnakeBar(message, e.toString());
                      }
                      isLoading = false;
                      setState(() {});
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account ?',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        ' Login',
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
        ),
      ),
    );
  }

  Future<UserCredential> registerUser() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
    return user;
  }
}

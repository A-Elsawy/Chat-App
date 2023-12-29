import 'package:flutter/material.dart';

typedef Validator = String? Function(String?);

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final Function(String)? onChange;
  final Validator? validator;
  final bool? isObscure;
  const CustomTextFormField({
    super.key,
    this.hintText,
    this.onChange,
    this.validator,
    this.isObscure,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onChanged: onChange,
      obscureText: isObscure ?? false,
      style: const TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
        // focusedBorder: OutlineInputBorder(
        //   borderSide: BorderSide(
        //     color: Colors.white,
        //   ),
        // ),

        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.white,
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

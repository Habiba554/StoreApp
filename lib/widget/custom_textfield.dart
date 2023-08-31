// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import '../constants/style.dart';
class CustomTextField  extends StatefulWidget {
  String? hint;
  IconData? suffix;
  IconData? prefix;
  TextInputType? inputType;
  Function(String)? onChanged;
  CustomTextField({super.key, required this.hint,this.suffix,this.prefix,this.isObscureText = false,this.onChanged,this.inputType});
  late bool isObscureText;


  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isPasswordShown = false;
  bool get isPasswordShownGetter => isPasswordShown;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return  Padding(
      padding: EdgeInsets.all(mediaQuery.size.width * 0.02),
      child: TextField(
        keyboardType: widget.inputType,
        onChanged: widget.onChanged,
        obscureText:widget.isObscureText ? !isPasswordShown : false,
        style: const TextStyle(color:kPrimaryColor),
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
            hintText: widget.hint ,
            hintStyle: const TextStyle(color: kPrimaryColor),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: kPrimaryColor,
                  width: 1,
                )
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: kPrimaryColor,
                  width: 2,
                )
            ),
            suffixIcon: widget.isObscureText
                ? IconButton(
              icon: Icon(
                isPasswordShown
                    ? Icons.visibility
                    : Icons.visibility_off,
                color:kPrimaryColor,
              ),
              onPressed: () {
                setState(() {
                  isPasswordShown = !isPasswordShown;
                });
              },
            )
                : null,
            prefixIcon: Icon(widget.prefix),
            prefixIconColor: kPrimaryColor

        ),
      ),
    );
  }
}

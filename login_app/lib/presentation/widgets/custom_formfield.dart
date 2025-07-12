import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_app/config/theme/app_theme.dart';

class CustomFormField extends StatelessWidget {
  final String headingText;
  final String hintText;
  final bool obsecureText;
  final Widget suffixIcon;
  final TextEditingController controller;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;


  const CustomFormField(
      {Key? key,
      required this.obsecureText,
      required this.suffixIcon,
      required this.controller,
      this.inputFormatters, 
      required this.validator, 
      required this.headingText, required this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData appTheme = AppTheme().getTheme();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 10,
          ),
          child: Text(
            headingText,
            //style: TextStyle.,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          decoration: BoxDecoration(
            //color: appTheme.,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child:TextFormField(
              inputFormatters: inputFormatters,
              validator: validator,
              controller: controller,
              obscureText: obsecureText,
               decoration: InputDecoration(
                                //border:OutlineInputBorder(borderSide: BorderSide(color: Color(Colors.white))),
                                suffixIcon: suffixIcon,
                                hintText: hintText
                              ),
            ),

          ),
        )
      ],
    );
  }
}


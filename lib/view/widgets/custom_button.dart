import 'package:flutter/material.dart';

import 'package:ecommerce_app/view/widgets/custom_text.dart';

import '../../constant.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  CustomButton({this.text='', required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.all(20),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5)
      ),
      onPressed:onPressed ,
      child:  CustomText(
        text:text,
        alignment: Alignment.center,
        color: whiteColor,
      ),
      color: primaryColor,
    );
  }
}

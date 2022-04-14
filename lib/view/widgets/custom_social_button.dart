import 'package:flutter/material.dart';

import 'package:ecommerce_app/view/widgets/custom_text.dart';

class CustomSocialButton extends StatelessWidget {
  final String imagePath;
  final String text;
  final VoidCallback  onPressed;
  CustomSocialButton({this.imagePath = '', this.text = '',required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: const EdgeInsets.all(20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
        side: const BorderSide(
          color: Color(0xffDDDDDD),
          width: 1,
          style: BorderStyle.solid,
        ),
      ),
      onPressed:onPressed,
      child: Row(
        children: [
          Image.asset(imagePath),
          const SizedBox(width: 90),
          CustomText(
            text: text,
            alignment: Alignment.center,
          ),
        ],
      ),
    );
  }
}


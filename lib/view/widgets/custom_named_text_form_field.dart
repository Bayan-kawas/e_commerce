import 'package:ecommerce_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import '../../constant.dart';

class CustomNamedTextFormField extends StatelessWidget {
  final String nameField;
  final String hintText;
  final Color colorNameField;
  final Color colorHinText;
final void Function(String?)? onSaved;
  final String? Function(String?)? validation;
  CustomNamedTextFormField(
      {this.nameField = "",
      this.hintText = "",
      this.colorNameField = greyColor,
      this.colorHinText = blackColor,
      this.onSaved,
        this.validation,
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CustomText(
            text: nameField,
            color: colorNameField,
            fontSize: 14,
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(color: colorHinText, fontSize: 14),
            ),
            cursorColor: primaryColor,
            onSaved:onSaved ,
            validator: validation,
          ),
        ],
      ),
    );
  }
}

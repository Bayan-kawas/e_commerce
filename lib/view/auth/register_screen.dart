import 'package:ecommerce_app/view/widgets/custom_button.dart';
import 'package:ecommerce_app/view/widgets/custom_named_text_form_field.dart';
import 'package:ecommerce_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_app/core/viewModel/auth_view_model.dart';
import '../../constant.dart';
import 'package:ecommerce_app/view/auth/login_screen.dart';

class RegisterScreen extends StatelessWidget {
  GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AuthViewModel authViewModel =
        Provider.of<AuthViewModel>(context, listen: false);
    return Scaffold(
      key: authViewModel.scaffoldKey2,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context, LoginScreen());
            },
            child: Icon(Icons.arrow_back, color: Colors.black)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
          child: Column(
            children: [
              Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 10, bottom: 10),
                  child: Column(
                    children: [
                      const CustomText(
                        text: 'Sign Up',
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomNamedTextFormField(
                        nameField: 'Name',
                        hintText: 'David Spade',
                        onSaved: (value) {
                          authViewModel.name != value;
                        },
                        validation: (value) {
                          if (value == null) {
                            print('error');
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomNamedTextFormField(
                        nameField: 'Email',
                        hintText: 'iamdavid@gmail.com',
                        onSaved: (value) {
                          authViewModel.email != value;
                        },
                        validation: (value) {
                          if (value == null) {
                            print('error');
                          }
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomNamedTextFormField(
                        nameField: 'Password',
                        hintText: '**********',
                        onSaved: (value) {
                          authViewModel.password != value;
                        },
                        validation: (value) {
                          if (value == null) {
                            print('error');
                          }
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomButton(
                        onPressed: () {
                          authViewModel
                              .createAccountWithEmailAndPassword(context);
                        },
                        text: 'SIGN UP',
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

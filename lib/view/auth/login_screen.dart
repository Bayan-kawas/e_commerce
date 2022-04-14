import 'package:ecommerce_app/constant.dart';
import 'package:ecommerce_app/core/viewModel/auth_view_model.dart';
import 'package:ecommerce_app/view/auth/register_screen.dart';
import 'package:get/get.dart';
import '../widgets/custom_named_text_form_field.dart';
import 'package:ecommerce_app/view/widgets/custom_button.dart';
import 'package:ecommerce_app/view/widgets/custom_social_button.dart';
import 'package:ecommerce_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/view/widgets/custom_text.dart';
import "package:ecommerce_app/view/home/home_screen.dart";
import "package:provider/provider.dart";
class LoginScreen extends StatelessWidget{
 GlobalKey<FormState> _formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AuthViewModel authViewModel=Provider.of<AuthViewModel>(context,listen:false);

    return Scaffold(
      key: authViewModel.scaffoldKey,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
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
                  child: Form(
                    key:_formKey,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: 'Welcome,',
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                            GestureDetector(
                              onTap:(){
                                Navigator.push(
                                  context,MaterialPageRoute(
                                  builder:(context)=>RegisterScreen()
                                ),
                                );
                              },
                              child: GestureDetector(
                                onTap: (){
                              authViewModel.navigateTo(context,RegisterScreen());
                             //      Navigator.push(
                             //        context,MaterialPageRoute(builder:(context)=>RegisterScreen())
                             //      );
                                },
                                child: CustomText(

                                  text: 'Sign Up',
                                  color: primaryColor,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const CustomText(
                          text: 'Sign in to Continue',
                          color: greyColor,
                          fontSize: 14,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomNamedTextFormField(
                          nameField: 'Email',
                          hintText: 'iamdavid@gmail.com',
                          onSaved: (value){
                           authViewModel.email=value!;
                          },
                          validation: (value){
                            if(value==null){
                              print('error');
                            }
                          },
                        ),
                        const SizedBox(height: 20),
                        CustomNamedTextFormField(
                          nameField: 'Password',
                          hintText: '**********',
                          onSaved: (value){
                            authViewModel.password=value!;
                            },
                          validation: (value){
                            if(value==null){
                              print('error');
                            }
                         },
                        ),
                        const SizedBox(height: 20),
                        const CustomText(
                          text: "Forgot Password?",
                          fontSize: 14,
                          alignment: Alignment.topRight,
                        ),
                        const SizedBox(height: 10),
                        CustomButton(
                          onPressed: () {
                            _formKey.currentState!.save();
                            if(_formKey.currentState!.validate()) {
                              authViewModel.signInWithEmailAndPasswordMethod(context);
                            }
                          },
                          text: 'SIGN IN',
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    const Text(
                      '-OR-',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 10),
                    CustomSocialButton(
                      imagePath: 'assets/images/facebook.png',
                      text: 'Sign In with Facebook',
                      onPressed: () {
                        authViewModel.facebookSignInMethod();
                      },
                    ),
                    const SizedBox(height: 10),
                    CustomSocialButton(
                      imagePath: 'assets/images/google.png',
                      text: 'Sign In with Google',
                      onPressed: () {
                     authViewModel.googleSignInMethod();
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

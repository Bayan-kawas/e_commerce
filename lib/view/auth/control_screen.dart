import 'package:ecommerce_app/core/viewModel/auth_view_model.dart';
import 'package:ecommerce_app/view/auth/login_screen.dart';
import 'package:ecommerce_app/view/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ControlScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthViewModel authViewModel=Provider.of<AuthViewModel>(context,listen:true);
return (authViewModel.currentUser==null)?LoginScreen():HomeScreen();
  }
}

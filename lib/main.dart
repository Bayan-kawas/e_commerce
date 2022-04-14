import 'package:ecommerce_app/core/viewModel/auth_view_model.dart';
import 'package:ecommerce_app/view/auth/login_screen.dart';
import 'package:ecommerce_app/view/auth/register_screen.dart';
import 'package:ecommerce_app/view/home/home_screen.dart';
import 'core/viewModel/home_view_model.dart';
import 'view/auth/control_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => AuthViewModel()),
            ChangeNotifierProvider(create:(_)=>HomeViewModel()),
            ],
            child: MaterialApp(
                debugShowCheckedModeBanner: false,
                home: HomeScreen()));
  }
}

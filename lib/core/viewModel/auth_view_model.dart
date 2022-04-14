import 'package:ecommerce_app/core/services/firestore_user.dart';
import 'package:ecommerce_app/model/user_model.dart';
import 'package:ecommerce_app/view/auth/login_screen.dart';
import 'package:ecommerce_app/view/home/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:provider/provider.dart';

class AuthViewModel with ChangeNotifier {
  //scaffold key
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> scaffoldKey2 = GlobalKey<ScaffoldState>();

  //auth variables
  String email = '', password = '', name = '';

  var currentUser = FirebaseAuth.instance.currentUser;

  //instance of firebaseAuth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //instance of google Sign in
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
    ],
  );

//instance of flutter login facebook
  final FacebookLogin _facebookLogin = FacebookLogin();

// sign in with google
  void googleSignInMethod() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    print(googleUser);
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser!.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );

    await _auth.signInWithCredential(credential).then((user){
      saveUserInFireStore(user);
    });
  }

//sign in with facebook

  void facebookSignInMethod() async {
    FacebookLoginResult result = await _facebookLogin.logIn(permissions: [
      FacebookPermission.email,
    ]);

    final accessToken = result.accessToken!.token;

    if (result.status == FacebookLoginStatus.success) {
      OAuthCredential credential = FacebookAuthProvider.credential(accessToken);

      await _auth.signInWithCredential(credential).then((user){
        saveUserInFireStore(user);
      });
    }
  }

//sign in with email and password
  void signInWithEmailAndPasswordMethod(context) async {
    try {
      await _auth
          .signInWithEmailAndPassword(
              email: email.trim(), password: password.trim())
          .then((user)async{
        saveUserInFireStore(user);
      });

      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ));
    } catch (e) {
      scaffoldKey.currentState!.showSnackBar(
        SnackBar(
          content: Text(e.toString()),
          padding: EdgeInsets.all(20),
        ),
      );
    }
    notifyListeners();
  }

//register a new Account user
  void createAccountWithEmailAndPassword(context) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(
              email: email.trim(), password: password.trim())
          .then((user) async {
        UserModel userModel = UserModel(
          userId: user.user!.
          uid,
          email: user.user!.email,
          name: name,
          img: '',
        );
      //  await FireStoreUser().addUserToFireStore(userModel);
      });

      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ));
    } catch (e) {
      scaffoldKey2.currentState!.showSnackBar(
        SnackBar(
          content: Text(e.toString()),
          padding: EdgeInsets.all(20),
        ),
      );
    }
  }

  //save user in fireStore
  Future<void> saveUserInFireStore(UserCredential user)async{
    // await FireStoreUser().addUserToFireStore(UserModel(
    //   userId: user.user!.uid,
    //   name:name==null?user.user!.displayName:name,
    //   email: user.user!.email,
    //   img: '',
    // ));
  }

  //sign out method
  void signOutMethod() {
    _auth.signOut();
  }

  //Navigate to new page
  void navigateTo(context, Widget pageName) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => pageName));
  }
}

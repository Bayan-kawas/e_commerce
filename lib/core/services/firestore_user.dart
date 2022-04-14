import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/model/user_model.dart';

class FireStoreUser {
  // Create a CollectionReference called users that references the firestore collection
  CollectionReference _userCollectionRef = FirebaseFirestore.instance.collection('users');

  Future<void> addUserToFireStore(UserModel userModel) async {
 //   Call the user's CollectionReference to add a new user
 return await _userCollectionRef.doc(userModel.userId).set(userModel.toJson());
  }
}

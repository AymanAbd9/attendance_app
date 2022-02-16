
import 'package:attendance_app/src/data_models/general_user_model.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService extends ChangeNotifier {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  GeneralUser? generalUser;
  User? user = FirebaseAuth.instance.currentUser;

  void setTheUser(theUser) {
    user = theUser;
  }

  void setTheGUser(GeneralUser theGeneralUser) {
    debugPrint(theGeneralUser.uid);
    generalUser = theGeneralUser;
    notifyListeners();
  }

   Future<UserCredential?> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential theUserCredentials = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      setTheUser(theUserCredentials.user);
      return theUserCredentials;
    } on FirebaseAuthException catch (e) {
      debugPrint(e.message);
    }
  }

//method to login the user using email and password
// error handling
  Future<UserCredential?> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential theUserCredentials = await _auth
          .signInWithEmailAndPassword(email: email, password: password);
      setTheUser(theUserCredentials.user);
      return theUserCredentials;
    } on FirebaseAuthException catch (err) {
      debugPrint(err.message!);
      debugPrint("==========>>>>>>" + err.message!);
    }
  }

  Future<void> addtheUserToTheDatabase(GeneralUser gUser) async {
    await _firestore
        .collection('users')
        .doc(gUser.uid)
        .set(gUser.toMap(), SetOptions(merge: true));

    setTheGUser(gUser);
  }


   Future<bool> fetchUserInfo(String uid) async {
    DocumentSnapshot _userSnap =
        await _firestore.collection('users').doc(uid).get();
    if (_userSnap.exists) {
      //map the data to a general_user data model
      GeneralUser _generalUser =
          GeneralUser.fromMap(_userSnap.data() as Map<String, dynamic>);
      setTheGUser(_generalUser);
      return true;
    } else {
      return false;
    }
  }


  logOut() async {
    await _auth.signOut();
    setTheUser(null);
  }

  Stream<User?> get authStatusChanges => _auth.authStateChanges();


}
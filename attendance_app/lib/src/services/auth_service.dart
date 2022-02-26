
import 'package:attendance_app/src/data_models/classroom_model.dart';
import 'package:attendance_app/src/data_models/general_user_model.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService extends ChangeNotifier {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  GeneralUser? generalUser;
  User? user = FirebaseAuth.instance.currentUser;
  Classroom? classroom;

   String? theError;

  //a void func to set the error message
  void setTheError(String? err) {
    theError = err;
    notifyListeners();
  }

  void setTheUser(theUser) {
    // we have uid after login and register
    user = theUser;
  }

  void setTheGUser(GeneralUser theGeneralUser) {
    // debugPrint(theGeneralUser.uid);
    generalUser = theGeneralUser;
    notifyListeners();
  }

   Future<UserCredential?> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential theUserCredentials = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      setTheUser(theUserCredentials.user);
      setTheError(null);
      return theUserCredentials;
    } on FirebaseAuthException catch (e) {
      setTheError('email already exists');
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
      setTheError(null);
      return theUserCredentials;
    } on FirebaseAuthException catch (err) {
      setTheError('invalid username or password');
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

  // Future<void> fetchClassroom(String uid) {
  //   DocumentSnapshot _teacherClassroom
  // }


  logOut() async {
    await _auth.signOut();
    setTheUser(null);
  }

  Stream<User?> get authStatusChanges => _auth.authStateChanges();


}
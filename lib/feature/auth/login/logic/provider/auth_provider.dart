import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? get currentUser => _auth.currentUser;
  bool get isSignedIn => currentUser !=null;
  Future<void> signIn(String email, String password)async{
    await _auth.signInWithEmailAndPassword(email: email, password: password);
    notifyListeners();
  }
  Future<void> signUp(String email, String password, String fullname)async{
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    await _firestore.collection('users', ).doc(userCredential.user!.uid).set({
      'uid': userCredential.user!.uid,
      'email':email,
      'fullname': fullname

    });
    notifyListeners();
  }
  Future<void> signOut()async{
    await _auth.signOut();
    notifyListeners();
  }
}
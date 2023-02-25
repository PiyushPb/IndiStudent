import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:indistudent/providers/firebase_providors.dart';

final authRepositoryProvider = Provider((ref) => AuthRepository(
      firestore: ref.read(fireStoreProvider),
      auth: ref.read(authProvidor),
      googleSignIn: ref.read(googleSignProvidor),
    ));

class AuthRepository {
  FirebaseFirestore _firestore;
  FirebaseAuth _auth;
  GoogleSignIn _googleSignIn;

  AuthRepository({
    required FirebaseFirestore firestore,
    required FirebaseAuth auth,
    required GoogleSignIn googleSignIn,
  })  : _auth = auth,
        _firestore = firestore,
        _googleSignIn = googleSignIn;

  void signInWithGoogle() async {
    UserCredential userCredential;
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      final googleAuth = await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      userCredential = await _auth.signInWithCredential(credential);

      print(userCredential.user?.email);
    } catch (e) {
      print(e);
    }
  }
}

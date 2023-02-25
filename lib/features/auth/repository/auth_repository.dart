import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:indistudent/common/constants/constants.dart';
import 'package:indistudent/common/constants/firebase_constants.dart';
import 'package:indistudent/models/user_mode.dart';
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

  CollectionReference get _users =>
      _firestore.collection(FirebaseConstants.usersCollection);

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

      if (userCredential.additionalUserInfo!.isNewUser) {
        UserModel userModel = UserModel(
          name: userCredential.user!.displayName ?? 'Untitled',
          email: userCredential.user!.email!,
          profilePic: userCredential.user!.photoURL ?? Constants.avatarDefault,
          uid: userCredential.user!.uid,
          isAuthenticated: true,
          karma: 0,
          awards: [],
        );

        await _users.doc(userCredential.user!.uid).set(userModel.toMap());
      }
    } catch (e) {
      rethrow;
    }
  }
}

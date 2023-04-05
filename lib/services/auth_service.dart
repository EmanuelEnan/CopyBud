// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:copy_bud/scrn/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../scrn/login_page.dart';
import '../scrn/new_landing_page.dart';

class AuthService {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  // GoogleSignInAccount? _user;
  // GoogleSignInAccount? get user => _user;

  handleAuthState() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasData) {
          return const HomePage();
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('something went wrong'),
          );
        } else {
          return const LoginPage();
          // return const LandingPage();
        }
      },
    );
  }

  Future signInWithGoogle() async {
    // bool result = false;
    // final GoogleSignInAccount? googleUser =
    //     await GoogleSignIn(scopes: ['email']).signIn();

    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      // if (googleUser == null) return;
      // _user = googleUser;

      // googleUser.id;
      // googleUser.displayName;

      // await FirebaseFirestore.instance.collection('usersData').add(
      //   {
      //     "email": googleUser.email,
      //     "userName": googleUser.displayName,
      //     "permission": true
      //   },
      // );

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth?.idToken,
        accessToken: googleAuth?.accessToken,
      );

      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      User? user = userCredential.user;

      // if (user != null) {
      if (userCredential.additionalUserInfo!.isNewUser) {
        FirebaseFirestore.instance.collection('usersData').doc(user?.uid).set(
          {
            "email": user?.email,
            "userName": user?.displayName,
            "userId": user?.uid,
            "permission": true
          },
        );
      }
      // result = true;
      // }
      // return result;
    } on FirebaseException catch (e) {
      if (e.code == 'user-disabled') {
        // FirebaseAuth.instance.currentUser!.reload();
        const Center(
          child:
              Text('having some difficulties to present your account\'s data'),
        );
        debugPrint('user disabled');
      } else {
        const Center(
          child:
              Text('having some difficulties to present your account\'s data'),
        );
        debugPrint(
          e.toString(),
        );
      }
    }
    // return result;
  }

  Future signOut() async {
    await googleSignIn.signOut();
    FirebaseAuth.instance.signOut();
  }
}

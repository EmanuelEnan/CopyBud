import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../services/auth_service.dart';

Widget statusChange() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasData) {
          return Text(
              'welcome, ${FirebaseAuth.instance.currentUser!.displayName}');
        } else if (!snapshot.hasData) {
          return const Center(
            child: Text('You\'re logged out'),
          );
        } else {
          // return const LoginPage();
          return const Text('waiting...');
        }
      },
    );
  }

  Widget buttonChange() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasData) {
          return TextButton(
            onPressed: () {
              AuthService().signOut();
            },
            child: const Text('sign out'),
          );
        } else if (!snapshot.hasData) {
          return TextButton(
            onPressed: () {
              AuthService().signInWithGoogle();
            },
            child: const Text('sign-in'),
          );
        } else {
          // return const LoginPage();
          return const Text('waiting...');
        }
      },
    );
  }
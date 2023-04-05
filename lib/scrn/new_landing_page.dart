import 'dart:math';

import 'package:copy_bud/scrn/ad_aida_page.dart';
import 'package:copy_bud/scrn/bullet_points_page.dart';
import 'package:copy_bud/scrn/hashtags_page.dart';
import 'package:copy_bud/scrn/questions_page.dart';
import 'package:copy_bud/scrn/sales_copy_page.dart';
import 'package:copy_bud/scrn/tagline_page.dart';
import 'package:copy_bud/scrn/value_props_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../services/auth_service.dart';
import '../widgets/template.dart';
import 'ad_copy_page.dart';

import 'headline_page.dart';
import 'marketing_ideas_page.dart';

class NewLandingPage extends StatefulWidget {
  const NewLandingPage({Key? key}) : super(key: key);

  @override
  State<NewLandingPage> createState() => _NewLandingPageState();
}

final uid = FirebaseAuth.instance.currentUser!.uid;

class _NewLandingPageState extends State<NewLandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Options'),
        actions: [
          buttonChange(),
        ],
      ),
      body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance
            .collection('usersData')
            .doc(uid)
            .snapshots(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData && snapshot.data != null) {
            final userData = snapshot.data!.data();

            if (userData != null) {
              if (userData['userId'] == uid) {
                // final List trueDocs = userData.values
                //     .where((doc) => doc.get('permission') == true)
                //     .toList();
                // final falseDocs = snapshot.data!.docs
                //     .where((doc) => doc.get('permission') == false);

                if (userData['permission'] == true) {
                  return Column(
                    children: [
                      Text(
                        userData['userName'],
                      ),
                    ],
                  );
                } else {
                  return const Text('some restrictions');
                }

                // if (trueDocs.isEmpty) {
                //   return const Padding(
                //     padding: EdgeInsets.all(12.0),
                //     child: Center(
                //       child: Text(
                //           'Some restriction issues happened! Sorry for any inconveniences..'),
                //     ),
                //   );
                // }
              }
            }
          } else {
            return const Text('Some error');
          }
          return const Text('spme new error');

          // if (trueDocs.isNotEmpty) {
          //   // Display data for true documents

          // } else {
          //   // Display data for false documents

          // }
        },
      ),
    );
  }

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

  // createUser(UserModel user) async {
  //   await _db.collection("Users").add(user.tosJson());
  // }
}

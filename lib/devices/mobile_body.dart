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

import '../scrn/ad_copy_page.dart';
import '../scrn/headline_page.dart';
import '../scrn/marketing_ideas_page.dart';
import '../services/auth_service.dart';
import '../widgets/template.dart';

class MobileBody extends StatefulWidget {
  const MobileBody({Key? key}) : super(key: key);

  @override
  State<MobileBody> createState() => _MobileBodyState();
}

final uid = FirebaseAuth.instance.currentUser!.uid;

class _MobileBodyState extends State<MobileBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    'FEATURES',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  buttonChange(),
                ],
              ),
            ),
            StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
              stream: FirebaseFirestore.instance
                  .collection('usersData')
                  .doc(uid)
                  .snapshots(),
              builder: (BuildContext context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasData && snapshot.data != null
                    // && uid == FirebaseFirestore.instance.collection('usersData').doc(uid)
                    ) {
                  final userData = snapshot.data!.data();

                  if (userData != null) {
                    if (userData['userId'] == uid) {
                      if (userData['permission'] == true) {
                        return Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Center(
                            child: Column(
                              children: [
                                statusChange(),
                                const SizedBox(
                                  height: 12,
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: template(
                                    'Ad Copy in AIDA Model',
                                    'Make a powerful Ad Copy for advertisements in the proven AIDA model',
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const AdAIDAPage(),
                                          ),
                                        );
                                      },
                                      child: const Text('Try This Template'),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * .6,
                                  child: template(
                                    'Ad Copy in Traditional Model',
                                    'Make a powerful Ad Copy for advertisements',
                                    ElevatedButton(
                                      onPressed: () {
                                        // FirebaseAuth.instance.currentUser != null
                                        //     ?
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const AdCopyPage(),
                                          ),
                                        );
                                        // :
                                        // AlertDialog(
                                        //     title: const Text('Thanks for being here!'),
                                        //     content: const Text(
                                        //         'You have to login first to access the features'),
                                        //     actions: [
                                        //       TextButton(
                                        //         onPressed: () {
                                        //           Navigator.pop(context);
                                        //         },
                                        //         child: const Text('CANCEL'),
                                        //       ),
                                        //       TextButton(
                                        //         // color: Colors.black,
                                        //         onPressed: () {
                                        //           AuthService().signInWithGoogle();
                                        //         },
                                        //         child: const Text('LOGIN'),
                                        //       ),
                                        //     ],
                                        //   );
                                        // print('unlogged');
                                        // : ScaffoldMessenger.of(context)
                                        //     .showSnackBar(
                                        //     const SnackBar(
                                        //       content:
                                        //           Text('You need to log-in first'),
                                        //     ),
                                        //   );
                                      },
                                      child: const Text('Try This Template'),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * .6,
                                  child: template(
                                    'Sales Copy',
                                    'Make a powerful Sales Copy for advertisements',
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const SalesCopyPage(),
                                          ),
                                        );
                                      },
                                      child: const Text('Try This Template'),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * .6,
                                  child: template(
                                    'Ad Headline',
                                    'Generate scroll-stopping headlines for your Facebook Ads to get prospects to click, and ultimately buy.',
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const HeadlinePage(),
                                          ),
                                        );
                                      },
                                      child: const Text('Try This Template'),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * .6,
                                  child: template(
                                    'Tagline',
                                    'Generate amazing tagline for your Ads to get prospects to click, and ultimately buy.',
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const TaglinePage(),
                                          ),
                                        );
                                      },
                                      child: const Text('Try This Template'),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * .6,
                                  child: template(
                                    'Ridiculous Marketing Ideas',
                                    'Bit of a crazy template that generates somewhat awful marketing ideas. Like throwing a football at a TV! But you never know what can be useful. Have a try!',
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const MarketingIdeasPage(),
                                          ),
                                        );
                                      },
                                      child: const Text('Try This Template'),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * .6,
                                  child: template(
                                    'Persuasive bullet points',
                                    'Generate persuasive bullet points to insert into landing pages, emails, and more.',
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const BulletPointsPage(),
                                          ),
                                        );
                                      },
                                      child: const Text('Try This Template'),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * .6,
                                  child: template(
                                    'Unique Value Propositions',
                                    'Create a clear statement that describes the benefit of your offer in a powerful way.',
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const ValuePropsPage(),
                                          ),
                                        );
                                      },
                                      child: const Text('Try This Template'),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * .6,
                                  child: template(
                                    'Brand Hashtags',
                                    'Make a list of relevant hashtags',
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const HashtagsPage(),
                                          ),
                                        );
                                      },
                                      child: const Text('Try This Template'),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * .6,
                                  child: template(
                                    'Engaging Questions',
                                    'Ask your audience creative questions to increase engagement.',
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const QuestionsPage(),
                                          ),
                                        );
                                      },
                                      child: const Text('Try This Template'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      } else if (userData['permission'] == false) {
                        return const Center(
                          child: Text(
                              'Some restriction issues happened! Sorry for any inconveniences..'),
                        );
                      }
                    }
                  }
                } else {
                  return const Text('Some error');
                }
                return const Text('Hold on! We\'ll get back shortly..');
              },
            ),
          ],
        ),
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

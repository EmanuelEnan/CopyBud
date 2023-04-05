// StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
//                   builder: (BuildContext context, snapshot) {
//                     if (!snapshot.hasData ||
//                         snapshot.connectionState == ConnectionState.waiting) {
//                       return SizedBox(
//                         height: MediaQuery.of(context).size.height,
//                         width: MediaQuery.of(context).size.width * .5,
//                         child: const Center(
//                           child: CircularProgressIndicator(),
//                         ),
//                       );
//                     } else if (snapshot.hasData && snapshot.data != null
//                         // && uid == FirebaseFirestore.instance.collection('usersData').doc(uid)
//                         ) {
//                       final userData = snapshot.data!.data();

//                       if (userData != null) {
//                         if (userData['userId'] == uid) {
//                           if (userData['permission'] == true) {
//                             return SingleChildScrollView(
//                               child: Container(
//                                 height: MediaQuery.of(context).size.height,
//                                 width: MediaQuery.of(context).size.width * .5,
//                                 color: Colors.black87,
//                                 child: GridView.count(
//                                   // shrinkWrap: true,
//                                   crossAxisCount: 3,
//                                   crossAxisSpacing: 4.0,
//                                   mainAxisSpacing: 8.0,
//                                   children: [
//                                     SizedBox(
//                                       child: template(
//                                         'Ad Copy in AIDA Model',
//                                         'Make a powerful Ad Copy for advertisements in the proven AIDA model',
//                                         ElevatedButton(
//                                           onPressed: () {
//                                             print('pressed');
//                                             setState(() {
//                                               c = SizedBox(
//                                                 height: MediaQuery.of(context)
//                                                     .size
//                                                     .height,
//                                                 width: MediaQuery.of(context)
//                                                         .size
//                                                         .width *
//                                                     .3,
//                                                 child: const AdAIDAPage(),
//                                               );
//                                             });
//                                           },
//                                           child:
//                                               const Text('Try This Template'),
//                                         ),
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       // width: MediaQuery.of(context).size.width * .6,
//                                       child: template(
//                                         'Ad Copy in Traditional Model',
//                                         'Make a powerful Ad Copy for advertisements',
//                                         ElevatedButton(
//                                           onPressed: () {
//                                             setState(() {
//                                               print('pressed1');
//                                               c = SizedBox(
//                                                 height: MediaQuery.of(context)
//                                                     .size
//                                                     .height,
//                                                 width: MediaQuery.of(context)
//                                                         .size
//                                                         .width *
//                                                     .3,
//                                                 child: const AdCopyPage(),
//                                               );
//                                             });
//                                           },
//                                           child:
//                                               const Text('Try This Template'),
//                                         ),
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       // width: MediaQuery.of(context).size.width * .6,
//                                       child: template(
//                                         'Sales Copy',
//                                         'Make a powerful Sales Copy for advertisements',
//                                         ElevatedButton(
//                                           onPressed: () {
//                                             setState(() {
//                                               c = SizedBox(
//                                                 height: MediaQuery.of(context)
//                                                     .size
//                                                     .height,
//                                                 width: MediaQuery.of(context)
//                                                         .size
//                                                         .width *
//                                                     .3,
//                                                 child: const SalesCopyPage(),
//                                               );
//                                             });
//                                           },
//                                           child:
//                                               const Text('Try This Template'),
//                                         ),
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       // width: MediaQuery.of(context).size.width * .6,
//                                       child: template(
//                                         'Ad Headline',
//                                         'Generate scroll-stopping headlines for your Facebook Ads to get prospects to click, and ultimately buy.',
//                                         ElevatedButton(
//                                           onPressed: () {
//                                             setState(() {
//                                               c = SizedBox(
//                                                 height: MediaQuery.of(context)
//                                                     .size
//                                                     .height,
//                                                 width: MediaQuery.of(context)
//                                                         .size
//                                                         .width *
//                                                     .3,
//                                                 child: const HeadlinePage(),
//                                               );
//                                             });
//                                           },
//                                           child:
//                                               const Text('Try This Template'),
//                                         ),
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       width: MediaQuery.of(context).size.width *
//                                           .6,
//                                       child: template(
//                                         'Tagline',
//                                         'Generate amazing tagline for your Ads to get prospects to click, and ultimately buy.',
//                                         ElevatedButton(
//                                           onPressed: () {
//                                             setState(() {
//                                               c = SizedBox(
//                                                 height: MediaQuery.of(context)
//                                                     .size
//                                                     .height,
//                                                 width: MediaQuery.of(context)
//                                                         .size
//                                                         .width *
//                                                     .3,
//                                                 child: const TaglinePage(),
//                                               );
//                                             });
//                                           },
//                                           child:
//                                               const Text('Try This Template'),
//                                         ),
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       width: MediaQuery.of(context).size.width *
//                                           .6,
//                                       child: template(
//                                         'Ridiculous Marketing Ideas',
//                                         'Bit of a crazy template that generates somewhat awful marketing ideas. Like throwing a football at a TV! But you never know what can be useful. Have a try!',
//                                         ElevatedButton(
//                                           onPressed: () {
//                                             setState(() {
//                                               c = SizedBox(
//                                                 height: MediaQuery.of(context)
//                                                     .size
//                                                     .height,
//                                                 width: MediaQuery.of(context)
//                                                         .size
//                                                         .width *
//                                                     .3,
//                                                 child:
//                                                     const MarketingIdeasPage(),
//                                               );
//                                             });
//                                           },
//                                           child:
//                                               const Text('Try This Template'),
//                                         ),
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       width: MediaQuery.of(context).size.width *
//                                           .6,
//                                       child: template(
//                                         'Persuasive bullet points',
//                                         'Generate persuasive bullet points to insert into landing pages, emails, and more.',
//                                         ElevatedButton(
//                                           onPressed: () {
//                                             setState(() {
//                                               c = SizedBox(
//                                                 height: MediaQuery.of(context)
//                                                     .size
//                                                     .height,
//                                                 width: MediaQuery.of(context)
//                                                         .size
//                                                         .width *
//                                                     .3,
//                                                 child: const BulletPointsPage(),
//                                               );
//                                             });
//                                           },
//                                           child:
//                                               const Text('Try This Template'),
//                                         ),
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       width: MediaQuery.of(context).size.width *
//                                           .6,
//                                       child: template(
//                                         'Unique Value Propositions',
//                                         'Create a clear statement that describes the benefit of your offer in a powerful way.',
//                                         ElevatedButton(
//                                           onPressed: () {
//                                             setState(() {
//                                               c = SizedBox(
//                                                 height: MediaQuery.of(context)
//                                                     .size
//                                                     .height,
//                                                 width: MediaQuery.of(context)
//                                                         .size
//                                                         .width *
//                                                     .3,
//                                                 child: const ValuePropsPage(),
//                                               );
//                                             });
//                                           },
//                                           child:
//                                               const Text('Try This Template'),
//                                         ),
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       width: MediaQuery.of(context).size.width *
//                                           .6,
//                                       child: template(
//                                         'Brand Hashtags',
//                                         'Make a list of relevant hashtags',
//                                         ElevatedButton(
//                                           onPressed: () {
//                                             setState(() {
//                                               c = SizedBox(
//                                                 height: MediaQuery.of(context)
//                                                     .size
//                                                     .height,
//                                                 width: MediaQuery.of(context)
//                                                         .size
//                                                         .width *
//                                                     .3,
//                                                 child: const HashtagsPage(),
//                                               );
//                                             });
//                                           },
//                                           child:
//                                               const Text('Try This Template'),
//                                         ),
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       width: MediaQuery.of(context).size.width *
//                                           .6,
//                                       child: template(
//                                         'Engaging Questions',
//                                         'Ask your audience creative questions to increase engagement.',
//                                         ElevatedButton(
//                                           onPressed: () {
//                                             setState(() {
//                                               c = SizedBox(
//                                                 height: MediaQuery.of(context)
//                                                     .size
//                                                     .height,
//                                                 width: MediaQuery.of(context)
//                                                         .size
//                                                         .width *
//                                                     .3,
//                                                 child: const QuestionsPage(),
//                                               );
//                                             });
//                                           },
//                                           child:
//                                               const Text('Try This Template'),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             );
//                           } else if (userData['permission'] == false) {
//                             return const Center(
//                               child: Text(
//                                   'Some restriction issues happened! Sorry for any inconveniences..'),
//                             );
//                           }
//                         }
//                       }
//                     } else {
//                       return const Text('Some error');
//                     }
//                     return Text(snapshot.error.toString());
//                   },
//                 ),
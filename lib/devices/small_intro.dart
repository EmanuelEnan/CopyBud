import 'package:copy_bud/widgets/text_design.dart';

import 'package:flutter/material.dart';

import 'package:video_player/video_player.dart';

import '../services/auth_service.dart';
import '../widgets/video_player_widget.dart';

class SmallIntro extends StatefulWidget {
  const SmallIntro({super.key});

  @override
  State<SmallIntro> createState() => _SmallIntroState();
}

class _SmallIntroState extends State<SmallIntro> {
  final authService = AuthService();

  // final asset = 'assets/video_1.mp4';
  // VideoPlayerController? controller;

  // @override
  // void initState() {
  //   super.initState();
  //   controller = VideoPlayerController.asset(asset)
  //     ..addListener(() => setState(() {}))
  //     ..setLooping(true)
  //     ..initialize().then((_) => controller?.play());
  // }

  // @override
  // void dispose() {
  //   controller?.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Container(
            padding: const EdgeInsets.only(
              top: 35,
              bottom: 35,
              right: 18,
              left: 18,
            ),
            width: MediaQuery.of(context).size.width * .6,
            // height: MediaQuery.of(context).size.height,
            child: Center(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        'Copy Buddy',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 0, 155, 155),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => authService.handleAuthState(),
                            ),
                          );
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(11.0),
                          child: Text(
                            'Start Now - It\'s Free',
                            style: TextStyle(fontSize: 19),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  const Text(
                    'Say \'hello\' \nto Your Premium Sales & Marketing Assistant',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w800,
                      color: Color.fromARGB(255, 0, 190, 190),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  // Text(
                  //   'Generate fresh ad creative that\'s designed to convert.',
                  //   textAlign: TextAlign.center,
                  //   style: GoogleFonts.lato(
                  //     textStyle: const TextStyle(
                  //       fontSize: 24,
                  //       fontWeight: FontWeight.w600,
                  //     ),
                  //   ),
                  // ),
                  const Text(
                    'Are you struggling to create compelling marketing and advertising copies for your company? \nCopy Buddy is here to help! Our revolutionary new tool will transform the way \nyou write copy for your business and advertisements.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 0, 155, 155),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => authService.handleAuthState(),
                        ),
                      );
                      // print(FirebaseAuth.instance.currentUser!.uid);
                      // print(FirebaseFirestore.instance
                      //     .collection('usersData')
                      //     .doc('uid')
                      //     .id);
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(14.0),
                      child: Text(
                        'Start Now - It\'s Free',
                        style: TextStyle(fontSize: 22),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  const Text(
                    '( no cc required, just login to enter )',
                    style: TextStyle(
                        color: Colors.black87, fontWeight: FontWeight.w200),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  // VideoPlayerWidget(controller: controller),
                  // const SizedBox(
                  //   height: 90,
                  // ),
                  SizedBox(
                    height: 500,
                    // width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Copy Buddy helps you to \nproduce exceptional copies of',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        textDesign(
                          '1. Ad Copy',
                        ),
                        textDesign(
                          '2. Sales Copy',
                        ),
                        textDesign(
                          '3. Persuasive bullet points',
                        ),
                        textDesign(
                          '4. Ad headline',
                        ),
                        textDesign(
                          '5. Tagline',
                        ),
                        textDesign(
                          '6. Hashtags',
                        ),
                        textDesign(
                          '7. Unique value propositions',
                        ),
                        textDesign(
                          '8. Engaging questions for audience',
                        ),
                      ],
                    ),
                  ),
                  // Image.asset(
                  //   'assets/img_1.png',
                  //   height: 500,
                  //   // width: 250,
                  //   fit: BoxFit.cover,
                  // ),
                  const SizedBox(
                    height: 90,
                  ),
                  const Text(
                    'How it works',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Image.asset(
                    'assets/img_1.png',
                    height: 400,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  const Text(
                    '1. Choose a template that you want your copy for',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Image.asset(
                    'assets/img_2.png',
                    height: 400,
                    fit: BoxFit.cover,
                  ),
                  const Text(
                    '2. Give a product name and a short \ndescription of your product',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w300,
                    ),
                  ),

                  const SizedBox(
                    height: 30,
                  ),
                  Image.asset(
                    'assets/img_3.png',
                    height: 400,
                    fit: BoxFit.cover,
                  ),
                  const Text(
                    '3. Select a tone from the dropdown \nto fine-tune your copy more',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  const Text(
                    'Ready to step-up?',
                    style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Text(
                    'Whether you\'re a small business owner or a marketing professional, \nCopy Buddy is the perfect solution for anyone \nwho wants to create high-quality copy quickly and easily. \nSimply input your key messages and desired tone, \nand let our software do the rest.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 0, 155, 155),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => authService.handleAuthState(),
                        ),
                      );
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(14.0),
                      child: Text(
                        'Start Now - It\'s Free',
                        style: TextStyle(fontSize: 22),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

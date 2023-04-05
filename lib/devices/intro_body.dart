import 'package:copy_bud/devices/small_intro.dart';
import 'package:copy_bud/scrn/intro_page.dart';

import 'package:flutter/material.dart';

import 'mobile_intro.dart';

class IntroBody extends StatelessWidget {
  const IntroBody({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return size < 680
        ? const SmallIntro()
        : size < 1220
            ? const MobileIntro()
            : const IntroPage();
    // LayoutBuilder(builder: (context, BoxConstraints constraints) {
    //   if (constraints.maxWidth < 580) {
    //     const SmallIntro();
    //   }
    //   if (constraints.maxWidth < 1220) {
    //     return const MobileIntro();
    //   }
    //   else {
    //     return const IntroPage();
    //   }

    //   // return const Text('loading...');
    // });
  }
}

import 'package:flutter/material.dart';

import '../devices/desktop_body.dart';
import '../devices/mobile_body.dart';
import '../devices/new_desktop.dart';
import '../responsive/responsive_design.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Responsive(
        mobileBody: MobileBody(),
        desktopBody: DesktopBody(),
      ),
    );
  }
}

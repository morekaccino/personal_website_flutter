import 'dart:ui';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoCardWidget extends StatefulWidget {
  const InfoCardWidget({Key? key}) : super(key: key);

  @override
  _InfoCardWidgetState createState() => _InfoCardWidgetState();
}

class _InfoCardWidgetState extends State<InfoCardWidget> {
  final BorderRadius _radius = const BorderRadius.all(Radius.circular(40));
  final FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  void initState() {
    super.initState();
    analytics.logAppOpen();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: ClipRRect(
          borderRadius: _radius,
          child: BackdropFilter(
            blendMode: BlendMode.srcIn,
            filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
            child: Container(
              width: 400.0,
              // height: 250.0,
              decoration: BoxDecoration(
                // color: Colors.grey.shade200.withOpacity(0.4),
                gradient: LinearGradient(
                  colors: [
                    Colors.black12.withOpacity(0.3),
                    Colors.grey.shade600.withOpacity(0.4)
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: _radius,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 40,),
                  // const Center(
                  //   child: CircleAvatar(
                  //     radius: 70,
                  //     backgroundImage: AssetImage("images/avatar.jpeg",),
                  //     backgroundColor: Colors.transparent,
                  //   ),
                  // ),
                  const Text(
                    "Mohamad Kazemi",
                    style: TextStyle(
                        fontFamily: "Pevanytta",
                        color: Colors.white,
                        fontSize: 45),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Text(
                      "Hi, I'm Mohamad! I love computers, programming, and aviation. I enjoy solving problems and learning new things.",
                      style: GoogleFonts.ubuntu(color: Colors.white38, fontSize: 20),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        child: IconButton(
                          onPressed: () async {
                            await analytics.logEvent(
                                name: "linksClicked",
                                parameters: {'social': 'GitHub'});
                            launch('https://www.github.com/morekaccino');
                          },
                          icon: const Icon(
                            SimpleIcons.github,
                            color: Colors.white38,
                          ),
                        ),
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        child: IconButton(
                          onPressed: () async {
                            await analytics.logEvent(
                                name: "linksClicked",
                                parameters: {'social': 'LinkedIn'});
                            launch('https://www.linkedin.com/in/mowhamadrexa/');
                          },
                          icon: const Icon(
                            SimpleIcons.linkedin,
                            color: Colors.white38,
                          ),
                        ),
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        child: IconButton(
                          onPressed: () async {
                            await analytics.logEvent(
                                name: "linksClicked",
                                parameters: {'social': 'email'});
                            launch('mailto:mrkazemi95@gmail.com');
                          },
                          icon: const Icon(
                            SimpleIcons.gmail,
                            color: Colors.white38,
                          ),
                        ),
                      ),
                      // Container(
                      //   width: 50,
                      //   height: 50,
                      //   child: IconButton(
                      //     onPressed: () async {
                      //       await analytics.logEvent(
                      //           name: "linksClicked",
                      //           parameters: {'social': 'Telegram'});
                      //       launch('http://t.me/morekaccino');
                      //     },
                      //     icon: const Icon(
                      //       SimpleIcons.telegram,
                      //       color: Colors.white38,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                  const SizedBox(height: 40,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

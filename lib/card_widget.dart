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
                  Padding(
                    padding: EdgeInsets.all(40.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Center(
                          child: CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage(
                              "images/me.JPG",
                            ),
                            backgroundColor: Colors.transparent,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Flexible(
                          child: FittedBox(
                            child: Text("Mohamad Kazemi",
                                style: GoogleFonts.ubuntu(
                                  fontSize: 400,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0, right: 40.0, bottom: 40.0),
                    child: Text(
                      "Hi, I'm Mohamad! I love computers, programming, and aviation. I enjoy solving problems and learning new things.",
                      style: GoogleFonts.ubuntu(
                          color: Colors.white70, fontSize: 20),
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
                            color: Colors.white,
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
                            color: Colors.white,
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
                                parameters: {'social': 'twitter'});
                            launch('https://twitter.com/_moreka_');
                          },
                          icon: const Icon(
                            SimpleIcons.twitter,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
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

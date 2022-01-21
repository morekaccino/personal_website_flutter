import 'dart:ui';
import 'dart:html' as html;

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:simple_icons/simple_icons.dart';

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
              height: 400.0,
              decoration: BoxDecoration(
                color: Colors.grey.shade200.withOpacity(0.5),
                borderRadius: _radius,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Center(
                    child: CircleAvatar(
                      radius: 70,
                      backgroundImage: AssetImage("images/me.png"),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                  const Text(
                    "Mohamad Kazemi",
                    style: TextStyle(
                        fontFamily: "Pevanytta",
                        color: Colors.black54,
                        fontSize: 45),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () async {
                          await analytics.logEvent(
                              name: "linksClicked",
                              parameters: {'social': 'GitHub'});
                          html.window.open(
                              'https://www.github.com/morekaccino', "_blank");
                        },
                        icon: const Icon(
                          SimpleIcons.github,
                          color: Colors.black54,
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          await analytics.logEvent(
                              name: "linksClicked",
                              parameters: {'social': 'LinkedIn'});
                          html.window.open(
                              'https://www.linkedin.com/in/mowhamadrexa/',
                              "_blank");
                        },
                        icon: const Icon(
                          SimpleIcons.linkedin,
                          color: Colors.black54,
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          await analytics.logEvent(
                              name: "linksClicked",
                              parameters: {'social': 'Twitter'});
                          html.window
                              .open('https://twitter.com/_Moreka_', "_blank");
                        },
                        icon: const Icon(
                          SimpleIcons.twitter,
                          color: Colors.black54,
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          await analytics.logEvent(
                              name: "linksClicked",
                              parameters: {'social': 'Telegram'});
                          html.window
                              .open('http://t.me/morekaccino', "_blank");
                        },
                        icon: const Icon(
                          SimpleIcons.telegram,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

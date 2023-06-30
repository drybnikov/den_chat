import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutInfoActionWidget extends StatelessWidget {
  const AboutInfoActionWidget({super.key});

  @override
  Widget build(BuildContext context) => IconButton(
        onPressed: () => showAboutDialog(
          context: context,
          applicationIcon: const FlutterLogo(),
          applicationLegalese: '\u{a9} 2023 By Denis Rybnikov',
        ),
        icon: const Icon(CupertinoIcons.info),
      );
}

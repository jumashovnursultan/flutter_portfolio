import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MenuRowWidget extends StatelessWidget {
  const MenuRowWidget(
      {super.key,
      required this.onAboutPressed,
      required this.onProjectsPressed,
      required this.onContactPressed});

  final Function() onAboutPressed;
  final Function() onProjectsPressed;
  final Function() onContactPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: onAboutPressed,
          child: Text(
            context.locale.countryCode == 'US' ? 'About' : 'О себе',
          ),
        ),
        const SizedBox(width: 20),
        TextButton(
          onPressed: onProjectsPressed,
          child: Text(
            'projects'.tr(),
          ),
        ),
        const SizedBox(width: 20),
        TextButton(
          onPressed: () => launchUrl(
            Uri.parse('https://github.com/jumashovnursultan'),
            mode: LaunchMode.externalApplication,
          ),
          child: const Text(
            'Github',
            style: TextStyle(),
          ),
        ),
        const SizedBox(width: 20),
        TextButton(
          onPressed: onContactPressed,
          child: Text(
            'contacts'.tr(),
          ),
        ),
      ],
    );
  }
}

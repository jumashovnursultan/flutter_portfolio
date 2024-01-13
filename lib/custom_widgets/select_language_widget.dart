import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../const/localization_checker.dart';

class SelectLanguageWidget extends StatelessWidget {
  const SelectLanguageWidget({super.key});

  final String en = 'US';
  final String ru = 'RU';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SvgPicture.asset('assets/icons/language.svg'),
        const SizedBox(width: 8),
        Builder(
          builder: (context) {
            return GestureDetector(
              onTap: () {
                showMenu(
                  constraints: const BoxConstraints(
                    minWidth: 132,
                    maxWidth: 132,
                  ),
                  shadowColor: const Color(0x26474747),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  elevation: 5,
                  context: context,
                  position: buttonMenuPosition(context),
                  items: [
                    buildPopupMenuItem(
                      context,
                      value: ru,
                      text: 'Русский',
                      isSelected: context.locale.countryCode == ru,
                      onTap: () {
                        EasyLocalization.of(context)!
                            .setLocale(const Locale('ru', 'RU'));
                      },
                    ),
                    buildPopupMenuItem(
                      context,
                      value: en,
                      text: 'English',
                      isSelected: context.locale.countryCode == en,
                      onTap: () {
                        EasyLocalization.of(context)!
                            .setLocale(const Locale('en', 'US'));
                      },
                    ),
                  ],
                );
              },
              child: SizedBox(
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      context.locale.countryCode == ru ? 'Русский' : 'English',
                    ),
                    const SizedBox(width: 4),
                    SvgPicture.asset('assets/icons/drop_down_icon.svg'),
                  ],
                ),
              ),
            );
          },
        ),
        const SizedBox(width: 20)
      ],
    );
  }

  RelativeRect buttonMenuPosition(BuildContext context) {
    final RenderBox bar = context.findRenderObject() as RenderBox;
    final size = bar.size;

    final bottomOfWidget = bar.localToGlobal(Offset.zero).dy + size.height + 10;
    final leftOfWidget = bar.localToGlobal(Offset.zero).dx - 40;

    final position = RelativeRect.fromLTRB(
      leftOfWidget,
      bottomOfWidget,
      leftOfWidget,
      bottomOfWidget,
    );

    return position;
  }

  PopupMenuItem<String> buildPopupMenuItem(
    BuildContext context, {
    required final String value,
    required final String text,
    required final bool isSelected,
    required final Function() onTap,
  }) {
    return PopupMenuItem<String>(
      value: value,
      onTap: onTap,
      child: SizedBox(
        width: 213,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 10),
            Text(
              text,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 4),
            if (isSelected)
              SvgPicture.asset('assets/icons/check_icon.svg')
            else
              const SizedBox(width: 14)
          ],
        ),
      ),
    );
  }
}

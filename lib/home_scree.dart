import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 70,
            leadingWidth: 58,
            leading: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: SvgPicture.asset('assets/icons/logo.svg'),
            ),
            backgroundColor: const Color(0xFFF4F4F4),
            title: const Text('dev'),
            titleSpacing: 10,
            centerTitle: false,
            actions: [
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset('assets/icons/menu.svg'),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  const TitleTextWidget(
                    firstText: 'Welcome',
                    secondText: '!',
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: Image.asset(
                      'assets/images/ilustration.png',
                      height: 300,
                      width: 300,
                    ),
                  ),
                  const SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleTextWidget(
                          firstText: 'About',
                          secondText: 'me',
                        ),
                        const Text(
                          'I am Talgat, Mobile App Developer from Kyrgyzstan. Have experience Flutter for android, ios. Also in UI/UX design.',
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/icons/gmail.svg'),
                      const SizedBox(width: 10),
                      SvgPicture.asset('assets/icons/github.svg'),
                      const SizedBox(width: 10),
                      SvgPicture.asset('assets/icons/telegram.svg'),
                      const SizedBox(width: 10),
                      SvgPicture.asset('assets/icons/instagram.svg'),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Social contacts',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFFE3E3E3),
                    ),
                  ),
                  const SizedBox(height: 50),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleTextWidget(firstText: 'Experience'),
                        Text(
                          'I am Talgat, Mobile App Developer from Kyrgyzstan. Have experience Flutter for android, ios. Also in UI/UX design.',
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(height: 40),
                        WorkExperienceWidget(
                          companyName: 'Oracle Digital',
                          position: 'Flutter developer',
                          date: '2022 August - 2023 September',
                        ),
                        SizedBox(height: 50),
                        Divider(
                          color: Color(0xFFE3E3E3),
                          thickness: 1,
                        ),
                        SizedBox(height: 50),
                        TitleTextWidget(
                          firstText: 'My',
                          secondText: 'Skills',
                        )
                      ],
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

class TitleTextWidget extends StatelessWidget {
  const TitleTextWidget({
    super.key,
    required this.firstText,
    this.secondText,
  });

  final String firstText;
  final String? secondText;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: firstText,
        style: secondText != null
            ? AppStyle.styleWBlackW600S40
            : AppStyle.styleWGreenW600S40,
        children: [
          TextSpan(
            text: secondText,
            style: AppStyle.styleWGreenW600S40,
          ),
        ],
      ),
    );
  }
}

class WorkExperienceWidget extends StatelessWidget {
  const WorkExperienceWidget({
    super.key,
    required this.companyName,
    required this.position,
    required this.date,
  });

  final String companyName;
  final String position;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          companyName,
          style: AppStyle.styleWBlackW600S40,
        ),
        const SizedBox(height: 15),
        Text(
          position,
          style: const TextStyle(fontSize: 20),
        ),
        Text(
          date,
          style: const TextStyle(
            fontSize: 20,
            color: Color(0xFF34C759),
          ),
        ),
      ],
    );
  }
}

class AppStyle {
  static const styleWGreenW600S40 = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.w600,
    color: Color(0xFF34C759),
  );
  static const styleWBlackW600S40 = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.w600,
    color: Color(0xFF202020),
  );
}

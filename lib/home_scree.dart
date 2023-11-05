import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_portfolio_app/custom_widgets/menu_row_widget.dart';
import 'package:my_portfolio_app/custom_widgets/title_text_widget.dart';
import 'package:my_portfolio_app/custom_widgets/work_experience_widget.dart';
import 'package:my_portfolio_app/utils.dart';
import 'package:url_launcher/url_launcher.dart';

import 'custom_widgets/hard_skills_widget.dart';
import 'custom_widgets/last_projects_carousel_slider_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  bool showBottomAppbar = false;

  Future<void> _postInit(double scrollExtent) async {
    await Future.delayed(const Duration(milliseconds: 100));
    _scrollController.animateTo(
      scrollExtent,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    return ColoredBox(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            bottom: showBottomAppbar
                ? PreferredSize(
                    preferredSize: const Size.fromHeight(50),
                    child: MenuRowWidget(
                      onAboutPressed: () => _postInit(350),
                      onProjectsPressed: () =>
                          _postInit(_scrollController.position.maxScrollExtent),
                      onContactPressed: () => _postInit(450),
                    ),
                  )
                : null,
            toolbarHeight: 70,
            leadingWidth: 58,
            leading: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: SvgPicture.asset('assets/icons/logo.svg'),
            ),
            backgroundColor: const Color(0xFFF4F4F4),
            title: const Text('NursultanDev'),
            titleSpacing: 10,
            centerTitle: false,
            actions: [
              if (maxWidth < 550)
                IconButton(
                  onPressed: () => setState(() {
                    showBottomAppbar = !showBottomAppbar;
                  }),
                  icon: SvgPicture.asset('assets/icons/menu.svg'),
                )
              else
                MenuRowWidget(
                  onAboutPressed: () => _postInit(350),
                  onProjectsPressed: () =>
                      _postInit(_scrollController.position.maxScrollExtent),
                  onContactPressed: () => _postInit(450),
                ),
            ],
          ),
          body: SingleChildScrollView(
            controller: _scrollController,
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
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: getHorizontalPaddingValue(context),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TitleTextWidget(
                            firstText: 'About ',
                            secondText: 'Me',
                          ),
                          SizedBox(height: 10),
                          SizedBox(
                            width: 500,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'I am Nursultan, Mobile App Developer from Kyrgyzstan.',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  'I have experience developing alone and in a company. Have experience with native Flutter for android, ios.',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () => launchUrl(
                                Uri.parse(
                                    'mailto:nursultanjumashovv@gmail.com'),
                                mode: LaunchMode.externalApplication,
                              ),
                          child: SvgPicture.asset('assets/icons/gmail.svg')),
                      const SizedBox(width: 10),
                      InkWell(
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () => launchUrl(
                                Uri.parse(
                                    'https://github.com/jumashovnursultan'),
                                mode: LaunchMode.externalApplication,
                              ),
                          child: SvgPicture.asset('assets/icons/github.svg')),
                      const SizedBox(width: 10),
                      InkWell(
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () => launchUrl(
                                Uri.parse('tg://t.me/nursultanjumashov'),
                                mode: LaunchMode.externalApplication,
                              ),
                          child: SvgPicture.asset('assets/icons/telegram.svg')),
                      const SizedBox(width: 10),
                      InkWell(
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () => launchUrl(
                                Uri.parse(
                                    'https://www.instagram.com/nursultanjumashov_/'),
                                mode: LaunchMode.externalApplication,
                              ),
                          child:
                              SvgPicture.asset('assets/icons/instagram.svg')),
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
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getHorizontalPaddingValue(context)),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleTextWidget(firstText: 'Experience'),
                        SizedBox(
                          width: 500,
                          child: Text(
                            'As a dedicated Flutter Developer with 1.5 years of professional experience, I have played a pivotal role in delivering high-quality mobile applications for diverse clients at Outsourcing Company XYZ. My work has been instrumental in meeting client expectations and ensuring the successful execution of various projects.',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        SizedBox(height: 40),
                        WorkExperienceWidget(
                          companyName: 'Oracle Digital',
                          position: 'Flutter developer',
                          date: '2022 August - 2023 November',
                        ),
                        SizedBox(height: 50),
                        Divider(
                          color: Color(0xFFE3E3E3),
                          thickness: 1,
                        ),
                        SizedBox(height: 50),
                        TitleTextWidget(
                          firstText: 'My ',
                          secondText: 'Skills',
                        ),
                        SizedBox(height: 40),
                        HardSkillsWidget(
                          value: 2.5,
                          text: 'Flutter: Dart',
                        ),
                        SizedBox(height: 40),
                        HardSkillsWidget(
                          value: 1,
                          text: 'Android: Kotlin',
                        ),
                        SizedBox(height: 70),
                        TitleTextWidget(
                          firstText: 'Last projects',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  const LastProjectsCarouselSliderWidget(),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

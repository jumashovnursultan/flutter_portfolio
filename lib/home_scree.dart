import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_portfolio_app/custom_widgets/menu_row_widget.dart';
import 'package:my_portfolio_app/custom_widgets/title_text_widget.dart';
import 'package:my_portfolio_app/custom_widgets/work_experience_widget.dart';
import 'package:my_portfolio_app/utils.dart';
import 'package:url_launcher/url_launcher.dart';
import 'custom_widgets/hard_skills_widget.dart';
import 'custom_widgets/last_projects_carousel_slider_widget.dart';
import 'custom_widgets/select_language_widget.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

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
            leading: InkWell(
              highlightColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {
                html.window.location.reload();
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: SvgPicture.asset('assets/icons/logo.svg'),
              ),
            ),
            backgroundColor: const Color(0xFFF4F4F4),
            title: const SelectableText('NursultanDev'),
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
              const SizedBox(width: 20),
              const Align(
                alignment: Alignment.center,
                child: SelectLanguageWidget(),
              ),
            ],
          ),
          body: SingleChildScrollView(
            controller: _scrollController,
            child: Center(
              child: Column(
                children: [
                  // Text(WidgetsBinding.instance.window.locale.toString()),
                  const SizedBox(height: 40),
                  TitleTextWidget(
                    firstText: 'welcome'.tr(),
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TitleTextWidget(
                            firstText: 'about'.tr(),
                            secondText: 'me'.tr(),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            width: 500,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SelectableText(
                                  'hello'.tr(),
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                SelectableText(
                                  'about_me'.tr(),
                                  style: const TextStyle(
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
                  SelectableText(
                    'social_contacts'.tr(),
                    style: const TextStyle(
                      fontSize: 20,
                      color: Color(0xFFE3E3E3),
                    ),
                  ),
                  const SizedBox(height: 50),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getHorizontalPaddingValue(context)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleTextWidget(firstText: 'experience'.tr()),
                        SizedBox(
                          width: 500,
                          child: SelectableText(
                            'experience_text'.tr(),
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                        const SizedBox(height: 40),
                        WorkExperienceWidget(
                          companyName: 'Oracle Digital',
                          position: 'Flutter developer',
                          date:
                              '2022 ${'february'.tr()} - ${DateFormat('y').format(DateTime.now())} ${context.locale.countryCode == 'US' ? DateFormat('MMMM').format(DateTime.now()) : DateFormat('MMMM', 'ru_RU').format(DateTime.now())[0].toUpperCase() + DateFormat('MMMM', 'ru_RU').format(DateTime.now()).substring(1)}',
                        ),
                        // const SizedBox(height: 40),
                        // const WorkExperienceWidget(
                        //   companyName: 'Freelancing',
                        //   position: 'Flutter developer',
                        //   date: '2021 - 2022',
                        // ),
                        const SizedBox(height: 50),
                        const Divider(
                          color: Color(0xFFE3E3E3),
                          thickness: 1,
                        ),
                        const SizedBox(height: 50),
                        TitleTextWidget(
                          firstText: 'my'.tr(),
                          secondText: 'skills'.tr(),
                        ),
                        const SizedBox(height: 40),
                        const HardSkillsWidget(
                          value: 2.5,
                          text: 'Flutter: Dart',
                        ),
                        const SizedBox(height: 40),
                        const HardSkillsWidget(
                          value: 1,
                          text: 'Android: Kotlin',
                        ),
                        const SizedBox(height: 70),
                        TitleTextWidget(
                          firstText: 'last'.tr(),
                          secondText: 'projects'.tr(),
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

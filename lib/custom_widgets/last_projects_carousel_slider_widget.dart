import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_portfolio_app/const/custom_scroll_behavior.dart';
import 'package:my_portfolio_app/data/list_of_application_model.dart';
import 'package:url_launcher/url_launcher.dart';

final listOfApplication = [
  ApplicationModel(
    logo: 'assets/icons/ak_emgek_logo.png',
    name: 'Ак-Эмгек',
    language: 'Flutter',
    playMarketLink:
        'https://play.google.com/store/apps/details?id=dev.odigital.ak_emgek',
    appStoreLink:
        'https://apps.apple.com/kg/app/%D0%B0%D0%BA-%D1%8D%D0%BC%D0%B3%D0%B5%D0%BA/id1667796373',
  ),
  ApplicationModel(
    logo: 'assets/icons/osh_logo.png',
    name: 'Ош online',
    language: 'Flutter',
    playMarketLink:
        'https://play.google.com/store/apps/details?id=com.tologon.kudaiberdiuulu.osh.online',
    appStoreLink: 'https://apps.apple.com/app/ош-online/id6444031624', /////
  ),
  ApplicationModel(
    logo: 'assets/icons/e_service_logo.png',
    name: 'Электроника сервис',
    language: 'Flutter',
    playMarketLink:
        'https://play.google.com/store/apps/details?id=dev.electronica_service_mob',
    // appStoreLink: '',
  ),
  ApplicationModel(
    logo: 'assets/icons/jalal_abad_logo.jpg',
    name: 'Жалал-Абад Online',
    language: 'Flutter',
    playMarketLink:
        'https://play.google.com/store/apps/details?id=com.tologon.kudaiberdiuulu.jalalabad.online',
    appStoreLink: 'https://apps.apple.com/app/ош-online/id6444031624',
  ),
  ApplicationModel(
    logo: 'assets/icons/kara_balta_logo.png',
    name: 'Кара-Балта 3133',
    language: 'Flutter',
    playMarketLink:
        'https://play.google.com/store/apps/details?id=dev.kara_balta.odigital',
    appStoreLink: 'https://apps.apple.com/app/ош-online/id6444031624',
  ),
  ApplicationModel(
    logo: 'assets/icons/willex_cargo_logo.png',
    name: 'Willex Cargo',
    language: 'Flutter',
    playMarketLink:
        'https://play.google.com/store/apps/details?id=dev.odigital.willex',
    appStoreLink: 'https://apps.apple.com/kg/app/willex/id6457265010',
  ),
  ApplicationModel(
    logo: 'assets/icons/sapat_cargo_logo.png',
    name: 'Sapat Cargo',
    language: 'Flutter',
    playMarketLink:
        'https://play.google.com/store/apps/details?id=dev.sapat_cargo_mob',
    appStoreLink: 'https://apps.apple.com/kg/app/sapat-cargo/id6466813542',
  ),
  ApplicationModel(
    logo: 'assets/icons/manas_logis_logo.png',
    name: 'Manas Logis',
    language: 'Flutter',
    playMarketLink:
        'https://play.google.com/store/apps/details?id=dev.odigital.manas_logis',
    appStoreLink: 'https://apps.apple.com/kg/app/manas-logis/id6464329215',
  ),
  ApplicationModel(
    logo: 'assets/icons/taura_express_logo.png',
    name: 'Taura Express',
    language: 'Flutter',
    playMarketLink:
        'https://play.google.com/store/apps/details?id=dev.odigital.taura_express',
    appStoreLink: 'https://apps.apple.com/kg/app/taura-express/id6450018127',
    webLink: 'https://taurakg.com/',
  ),
  ApplicationModel(
    logo: 'assets/icons/opop_logo.webp',
    name: 'OPOP',
    language: 'Flutter',
    playMarketLink:
        'https://play.google.com/store/apps/details?id=app.odigital.opop',
    appStoreLink: 'https://apps.apple.com/kg/app/opop/id6444595393',
  ),
];

class LastProjectsCarouselSliderWidget extends StatelessWidget {
  const LastProjectsCarouselSliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return ScrollConfiguration(
      behavior: CustomScrollBehavior(),
      child: SizedBox(
        height: 360,
        child: PageView.builder(
          controller: PageController(
            viewportFraction: getAdaptiveViewPortFraction(context),
            initialPage: width >= 1290 ? 1 : 0,
          ),
          itemCount: listOfApplication.length,
          itemBuilder: (context, index) {
            final item = listOfApplication[index];
            return Container(
              margin: const EdgeInsets.only(right: 30, top: 10, bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      item.logo,
                      height: 100,
                      width: 100,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Text(
                    item.name,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    item.language,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (item.appStoreLink != null)
                        InkWell(
                          onTap: () => launchUrl(
                            Uri.parse(item.appStoreLink!),
                            mode: LaunchMode.externalApplication,
                          ),
                          child: SvgPicture.asset(
                            'assets/icons/app-store_logo.svg',
                            height: 23,
                            width: 23,
                          ),
                        ),
                      if (item.playMarketLink != null) ...[
                        const SizedBox(width: 10),
                        InkWell(
                          onTap: () => launchUrl(
                            Uri.parse(item.playMarketLink!),
                            mode: LaunchMode.externalApplication,
                          ),
                          child: SvgPicture.asset(
                            'assets/icons/play-store_logo.svg',
                            height: 20,
                            width: 20,
                          ),
                        ),
                      ],
                      if (item.webLink != null) ...[
                        const SizedBox(width: 10),
                        InkWell(
                          onTap: () => launchUrl(
                            Uri.parse(item.webLink!),
                            mode: LaunchMode.externalApplication,
                          ),
                          child: SvgPicture.asset(
                            'assets/icons/chrome_logo.svg',
                            height: 20,
                            width: 20,
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  double getAdaptiveViewPortFraction(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth <= 280) {
      return 0.95;
    } else if (screenWidth <= 320) {
      return 0.9;
    } else if (screenWidth <= 360) {
      return 0.8;
    } else if (screenWidth <= 400) {
      return 0.7;
    } else if (screenWidth <= 440) {
      return 0.6;
    } else if (screenWidth <= 480) {
      return 0.55;
    } else if (screenWidth <= 520) {
      return 0.5;
    } else if (screenWidth <= 560) {
      return 0.5;
    } else if (screenWidth <= 600) {
      return 0.45;
    } else if (screenWidth <= 640) {
      return 0.4;
    } else if (screenWidth <= 680) {
      return 0.4;
    } else if (screenWidth <= 720) {
      return 0.4;
    } else if (screenWidth <= 760) {
      return 0.35;
    } else if (screenWidth <= 800) {
      return 0.35;
    } else if (screenWidth <= 840) {
      return 0.3;
    } else if (screenWidth <= 880) {
      return 0.3;
    } else if (screenWidth <= 920) {
      return 0.3;
    } else if (screenWidth <= 960) {
      return 0.3;
    } else if (screenWidth <= 1000) {
      return 0.28;
    } else if (screenWidth <= 1040) {
      return 0.28;
    } else if (screenWidth <= 1080) {
      return 0.25;
    } else if (screenWidth <= 1120) {
      return 0.25;
    } else if (screenWidth <= 1260) {
      return 0.22;
    } else if (screenWidth <= 1300) {
      return 0.21;
    } else if (screenWidth <= 1340) {
      return 0.20;
    } else if (screenWidth <= 1380) {
      return 0.19;
    } else if (screenWidth <= 1420) {
      return 0.18;
    } else if (screenWidth <= 1460) {
      return 0.17;
    } else if (screenWidth <= 1500) {
      return 0.16;
    } else if (screenWidth <= 1540) {
      return 0.15;
    } else if (screenWidth <= 1580) {
      return 0.14;
    } else {
      return 0.13;
    }
  }
}

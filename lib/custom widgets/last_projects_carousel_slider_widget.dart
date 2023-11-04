import 'package:flutter/material.dart';
import 'package:my_portfolio_app/const/custom_scroll_behavior.dart';
import 'package:my_portfolio_app/data/list_of_application_model.dart';

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
    appStoreLink: 'https://apps.apple.com/app/ош-online/id6444031624',
  ),
  ApplicationModel(
    logo: 'assets/icons/e_service_logo.png',
    name: 'Электроника сервис',
    language: 'Flutter',
    playMarketLink:
        'https://play.google.com/store/apps/details?id=dev.electronica_service_mob',
    appStoreLink: '',
  ),
  ApplicationModel(
    logo: 'assets/icons/jalal_abad_logo.jpg',
    name: 'Жалал-Абад Online',
    language: 'Flutter',
    playMarketLink:
        'https://play.google.com/store/apps/details?id=com.tologon.kudaiberdiuulu.jalalabad.online',
    appStoreLink: '',
  ),
  ApplicationModel(
    logo: 'assets/icons/kara_balta_logo.png',
    name: 'Кара-Балта 3133',
    language: 'Flutter',
    playMarketLink:
        'https://play.google.com/store/apps/details?id=dev.kara_balta.odigital',
    appStoreLink: '',
  ),
  ApplicationModel(
    logo: 'assets/icons/willex_cargo_logo.png',
    name: 'Willex Cargo',
    language: 'Flutter',
    playMarketLink:
        'https://play.google.com/store/apps/details?id=dev.odigital.willex',
    appStoreLink: '',
  ),
  ApplicationModel(
    logo: 'assets/icons/sapat_cargo_logo.png',
    name: 'Sapat Cargo',
    language: 'Flutter',
    playMarketLink:
        'https://play.google.com/store/apps/details?id=dev.sapat_cargo_mob',
    appStoreLink: '',
  ),
  ApplicationModel(
    logo: 'assets/icons/manas_logis_logo.png',
    name: 'Manas Logis',
    language: 'Flutter',
    playMarketLink:
        'https://play.google.com/store/apps/details?id=dev.odigital.manas_logis',
    appStoreLink: '',
  ),
  ApplicationModel(
    logo: 'assets/icons/taura_express_logo.png',
    name: 'Taura Express',
    language: 'Flutter',
    playMarketLink:
        'https://play.google.com/store/apps/details?id=dev.odigital.taura_express',
    appStoreLink: '',
  ),
  ApplicationModel(
    logo: 'assets/icons/opop_logo.webp',
    name: 'OPOP',
    language: 'Flutter',
    playMarketLink:
        'https://play.google.com/store/apps/details?id=app.odigital.opop',
    appStoreLink: '',
  ),
  ApplicationModel(
    logo: 'taura_trans_logistic_logo.png',
    name: 'Taura TRANS Logistic',
    language: 'Flutter',
    webLink: 'https://taurakg.com/',
  ),
];

class LastProjectsCarouselSliderWidget extends StatelessWidget {
  const LastProjectsCarouselSliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return ScrollConfiguration(
      behavior: CustomScrollBehavior(),
      child:
          // CarouselSlider.builder(
          //   options: CarouselOptions(
          //       viewportFraction: 0.6,
          //       autoPlay: true,
          //       enableInfiniteScroll: false,
          //       // autoPlayInterval: const Duration(seconds: 10),
          //       onPageChanged: (index, reason) {}
          //       // setState(() => activIndex = index),
          //       ),
          //   itemCount: 10,
          //   itemBuilder: (context, index, realIndex) {
          //     // final urlImage = widget.images[index];
          //     return Container(
          //       margin: const EdgeInsets.symmetric(horizontal: 20),
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(20),
          //         color: index == 0
          //             ? Colors.red
          //             : index == 1
          //                 ? Colors.green
          //                 : Colors.blue,
          //       ),
          //       height: 1,
          //     );
          //   },
          // ),
          SizedBox(
        height: 340,
        child: PageView.builder(
          controller: PageController(
            viewportFraction: getAdaptiveViewPortFraction(context),
            initialPage: width >= 1290 ? 1 : 0,
          ),
          itemCount: listOfApplication.length,
          itemBuilder: (context, index) {
            final item = listOfApplication[index];
            return Container(
              margin: const EdgeInsets.only(right: 30),
              color: Colors.transparent,
              // color: index == 0
              //     ? Colors.red
              //     : index == 1
              //         ? Colors.green
              //         : index == 2
              //             ? Colors.blue
              //             : index == 3
              //                 ? Colors.yellow
              //                 : index == 4
              //                     ? Colors.purple
              //                     : index == 5
              //                         ? Colors.orange
              //                         : index == 6
              //                             ? Colors.pink
              //                             : index == 7
              //                                 ? Colors.teal
              //                                 : index == 8
              //                                     ? Colors.brown
              //                                     : index == 9
              //                                         ? Colors.grey
              //                                         : Colors.black,
              child: Column(
                children: [
                  Image.asset(
                    item.logo,
                    height: 200,
                    width: 200,
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
    if (screenWidth >= 1400) {
      return 0.25;
    } else if (screenWidth >= 1200) {
      return 0.3;
    } else if (screenWidth >= 800) {
      return 0.35;
    } else if (screenWidth >= 700) {
      return 0.45;
    } else if (screenWidth >= 600) {
      return 0.5;
    } else if (screenWidth >= 500) {
      return 0.6;
    } else if (screenWidth >= 400) {
      return 0.8;
    } else if (screenWidth >= 300) {
      return 0.9;
    } else if (screenWidth >= 200) {
      return 1.2;
    } else {
      return 1.3;
    }
  }
}

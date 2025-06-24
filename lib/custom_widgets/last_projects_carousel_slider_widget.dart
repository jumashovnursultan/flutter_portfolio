import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_portfolio_app/custom_widgets/animated_grid_view/animated_grid_view.dart';
import 'package:my_portfolio_app/data/list_of_application_model.dart';
import 'package:url_launcher/url_launcher.dart';

class LastProjectsGridWidget extends StatelessWidget {
  const LastProjectsGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final listOfApplication = [
      ApplicationModel(
        description: 'topDescription'.tr(),
        logo: 'assets/icons/top_logo.png',
        name: 'TOP',
        language: 'Flutter',
        playMarketLink:
            'https://play.google.com/store/apps/details?id=dev.odigital.topkg&pcampaignid=web_share',
        // appStoreLink:
        //     'https://apps.apple.com/kg/app/%D0%B0%D0%BA-%D1%8D%D0%BC%D0%B3%D0%B5%D0%BA/id1667796373',
      ),
      ApplicationModel(
        description: '',
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
        description: '',
        language: 'Flutter',
        playMarketLink:
            'https://play.google.com/store/apps/details?id=com.tologon.kudaiberdiuulu.osh.online',
        appStoreLink: 'https://apps.apple.com/app/ош-online/id6444031624', /////
      ),
      ApplicationModel(
        logo: 'assets/icons/e_service_logo.png',
        name: 'Электроника сервис',
        description: '',
        language: 'Flutter',
        playMarketLink:
            'https://play.google.com/store/apps/details?id=dev.electronica_service_mob',
        // appStoreLink: '',
      ),
      ApplicationModel(
        logo: 'assets/icons/jalal_abad_logo.jpg',
        name: 'Жалал-Абад Online',
        description: '',
        language: 'Flutter',
        playMarketLink:
            'https://play.google.com/store/apps/details?id=com.tologon.kudaiberdiuulu.jalalabad.online',
        appStoreLink: 'https://apps.apple.com/app/ош-online/id6444031624',
      ),
      ApplicationModel(
        logo: 'assets/icons/kara_balta_logo.png',
        name: 'Кара-Балта 3133',
        description: '',
        language: 'Flutter',
        playMarketLink:
            'https://play.google.com/store/apps/details?id=dev.kara_balta.odigital',
        appStoreLink: 'https://apps.apple.com/app/ош-online/id6444031624',
      ),
      ApplicationModel(
        logo: 'assets/icons/willex_cargo_logo.png',
        name: 'Willex Cargo',
        description: '',
        language: 'Flutter',
        playMarketLink:
            'https://play.google.com/store/apps/details?id=dev.odigital.willex',
        appStoreLink: 'https://apps.apple.com/kg/app/willex/id6457265010',
      ),
      ApplicationModel(
        logo: 'assets/icons/sapat_cargo_logo.png',
        name: 'Sapat Cargo',
        description: '',
        language: 'Flutter',
        playMarketLink:
            'https://play.google.com/store/apps/details?id=dev.sapat_cargo_mob',
        appStoreLink: 'https://apps.apple.com/kg/app/sapat-cargo/id6466813542',
      ),
      ApplicationModel(
        logo: 'assets/icons/manas_logis_logo.png',
        name: 'Manas Logis',
        description: '',
        language: 'Flutter',
        playMarketLink:
            'https://play.google.com/store/apps/details?id=dev.odigital.manas_logis',
        appStoreLink: 'https://apps.apple.com/kg/app/manas-logis/id6464329215',
      ),
      ApplicationModel(
        logo: 'assets/icons/taura_express_logo.png',
        name: 'Taura Express',
        description: '',
        language: 'Flutter',
        playMarketLink:
            'https://play.google.com/store/apps/details?id=dev.odigital.taura_express',
        appStoreLink:
            'https://apps.apple.com/kg/app/taura-express/id6450018127',
        webLink: 'https://taurakg.com/',
      ),
      ApplicationModel(
        logo: 'assets/icons/opop_logo.webp',
        name: 'OPOP',
        description: '',
        language: 'Flutter',
        playMarketLink:
            'https://play.google.com/store/apps/details?id=app.odigital.opop',
        appStoreLink: 'https://apps.apple.com/kg/app/opop/id6444595393',
      ),
      ApplicationModel(
        logo: 'assets/icons/favicon.png',
        name: 'portfolio',
        description: '',
        language: 'Flutter',
        webLink: 'https://jumashovnursultan.github.io/',
        githubLink: 'https://github.com/jumashovnursultan/flutter_portfolio',
      ),
    ];

    return AnimatedGridView(
      itemCount: listOfApplication.length,
      shrinkWrap: true,
      mainAxisSpacing: 15,
      crossAxisSpacing: 12,
      padding: const EdgeInsets.fromLTRB(11, 10, 11, 21),
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: calculateCards(context, 400),
      builder: (context, index) {
        final item = listOfApplication[index];

        return Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    item.logo,
                    height: 80,
                    width: 80,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                item.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                item.description,
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.black87,
                ),
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 15),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFFF1F7FF),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  item.language,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF3F74EE),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Wrap(
                spacing: 20,
                runSpacing: 20,
                children: [
                  if (item.appStoreLink != null)
                    InkWell(
                      onTap: () => launchUrl(
                        Uri.parse(item.appStoreLink!),
                        mode: LaunchMode.externalApplication,
                      ),
                      child: SvgPicture.asset(
                        'assets/icons/app-store_logo.svg',
                        height: 20,
                      ),
                    ),
                  if (item.playMarketLink != null)
                    InkWell(
                      onTap: () => launchUrl(
                        Uri.parse(item.playMarketLink!),
                        mode: LaunchMode.externalApplication,
                      ),
                      child: SvgPicture.asset(
                        'assets/icons/play-store_logo.svg',
                        height: 20,
                      ),
                    ),
                  if (item.webLink != null)
                    InkWell(
                      onTap: () => launchUrl(
                        Uri.parse(item.webLink!),
                        mode: LaunchMode.externalApplication,
                      ),
                      child: SvgPicture.asset(
                        'assets/icons/chrome_logo.svg',
                        height: 20,
                      ),
                    ),
                  if (item.githubLink != null)
                    InkWell(
                      onTap: () => launchUrl(
                        Uri.parse(item.githubLink!),
                        mode: LaunchMode.externalApplication,
                      ),
                      child: SvgPicture.asset(
                        'assets/icons/github_logo.svg',
                        height: 20,
                      ),
                    ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  static int calculateCards(BuildContext context, double width) {
    double screenWidth = MediaQuery.of(context).size.width;
    double cardWidth = width;
    int crossAxisCount = screenWidth ~/ cardWidth;

    return crossAxisCount;
  }
}

class ApplicationModel {
  final String logo;
  final String name;
  final String language;
  final String? playMarketLink;
  final String? appStoreLink;
  final String? webLink;

  ApplicationModel({
    required this.logo,
    required this.name,
    required this.language,
    this.playMarketLink,
    this.appStoreLink,
    this.webLink,
  });
}

class ApplicationModel {
  final String logo;
  final String name;
  final String language;
  final String? playMarketLink;
  final String? appStoreLink;
  final String? webLink;
  final String? githubLink;

  ApplicationModel({
    required this.logo,
    required this.name,
    required this.language,
    this.playMarketLink,
    this.appStoreLink,
    this.webLink,
    this.githubLink,
  });
}

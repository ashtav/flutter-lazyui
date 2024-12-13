part of 'icons.dart';

// source: https://hugeicons.com/icons?style=Stroke&type=Rounded

/// [HugeIconData] is a base class for all Huge Icons. It is used to
/// generate the HugeIcons class.
class HugeIconData extends IconData {
  /// Creates a const [HugeIconData] by requiring a [codePoint]
  /// and using a default [fontFamily].
  ///
  /// The [codePoint] is the Unicode point of the icon. For example, the
  /// [codePoint] for a specific Tabler icon might be 0xe800.
  ///
  /// The [fontFamily] for Tabler icons is predefined as 'HugeIcons' and is
  /// bundled within the 'lazyui' package.
  ///
  /// Note: If you are using these icons in your application, ensure that the
  /// 'HugeIcons' font is included in your pubspec.yaml and properly bundled.
  const HugeIconData(super.codePoint)
      : super(
          fontFamily: 'packages/lazyui/HgiStrokeRounded',
          // The fontPackage can be uncommented and set appropriately if the icons are
          // included as part of a separate Dart package.
          // fontPackage: 'your_package_name',
        );
}

// to fix camelCase, CTRL + F, paste: static const IconData ([A-Z])([a-zA-Z0-9]*) = HugeIconData,
// replace with: static const IconData \l$1$2 = HugeIconData

/// A collection of stroke-rounded icons for use in Flutter applications.
///
/// The [HugeIcons] class provides a comprehensive set of stroke-rounded icons
/// for enhancing the UI design of your Flutter applications.
class Hi {
  /// IconData for the 'strokeRoundedAbacus' icon.
  static const IconData abacus = HugeIconData(0x3a9c);

  /// IconData for the 'strokeRoundedAbsolute' icon.
  static const IconData absolute = HugeIconData(0x3a9d);

  /// IconData for the 'strokeRoundedAcceleration' icon.
  static const IconData acceleration = HugeIconData(0x3a9e);

  /// IconData for the 'strokeRoundedAccess' icon.
  static const IconData access = HugeIconData(0x3a9f);

  /// IconData for the 'strokeRoundedAccident' icon.
  static const IconData accident = HugeIconData(0x3aa0);

  /// IconData for the 'strokeRoundedAccountSetting01' icon.
  static const IconData accountSetting01 = HugeIconData(0x3aa1);

  /// IconData for the 'strokeRoundedAccountSetting02' icon.
  static const IconData accountSetting02 = HugeIconData(0x3aa2);

  /// IconData for the 'strokeRoundedAccountSetting03' icon.
  static const IconData accountSetting03 = HugeIconData(0x3aa3);

  /// IconData for the 'strokeRoundedActivity01' icon.
  static const IconData activity01 = HugeIconData(0x3aa4);

  /// IconData for the 'strokeRoundedActivity02' icon.
  static const IconData activity02 = HugeIconData(0x3aa5);

  /// IconData for the 'strokeRoundedActivity03' icon.
  static const IconData activity03 = HugeIconData(0x3aa6);

  /// IconData for the 'strokeRoundedActivity04' icon.
  static const IconData activity04 = HugeIconData(0x3aa7);

  /// IconData for the 'strokeRoundedAcute' icon.
  static const IconData acute = HugeIconData(0x3aa8);

  /// IconData for the 'strokeRoundedAdd01' icon.
  static const IconData add01 = HugeIconData(0x3aa9);

  /// IconData for the 'strokeRoundedAdd02' icon.
  static const IconData add02 = HugeIconData(0x3aaa);

  /// IconData for the 'strokeRoundedAddCircleHalfDot' icon.
  static const IconData addCircleHalfDot = HugeIconData(0x3aab);

  /// IconData for the 'strokeRoundedAddCircle' icon.
  static const IconData addCircle = HugeIconData(0x3aac);

  /// IconData for the 'strokeRoundedAddSquare' icon.
  static const IconData addSquare = HugeIconData(0x3aad);

  /// IconData for the 'strokeRoundedAddTeam' icon.
  static const IconData addTeam = HugeIconData(0x3aae);

  /// IconData for the 'strokeRoundedAddressBook' icon.
  static const IconData addressBook = HugeIconData(0x3aaf);

  /// IconData for the 'strokeRoundedAdobeAfterEffect' icon.
  static const IconData adobeAfterEffect = HugeIconData(0x3ab0);

  /// IconData for the 'strokeRoundedAdobeIllustrator' icon.
  static const IconData adobeIllustrator = HugeIconData(0x3ab1);

  /// IconData for the 'strokeRoundedAdobeIndesign' icon.
  static const IconData adobeIndesign = HugeIconData(0x3ab2);

  /// IconData for the 'strokeRoundedAdobePhotoshop' icon.
  static const IconData adobePhotoshop = HugeIconData(0x3ab3);

  /// IconData for the 'strokeRoundedAdobePremier' icon.
  static const IconData adobePremier = HugeIconData(0x3ab4);

  /// IconData for the 'strokeRoundedAdobeXd' icon.
  static const IconData adobeXd = HugeIconData(0x3ab5);

  /// IconData for the 'strokeRoundedAdventure' icon.
  static const IconData adventure = HugeIconData(0x3ab6);

  /// IconData for the 'strokeRoundedAdvertisiment' icon.
  static const IconData advertisiment = HugeIconData(0x3ab7);

  /// IconData for the 'strokeRoundedAdzan' icon.
  static const IconData adzan = HugeIconData(0x3ab8);

  /// IconData for the 'strokeRoundedAffiliate' icon.
  static const IconData affiliate = HugeIconData(0x3ab9);

  /// IconData for the 'strokeRoundedAgreement01' icon.
  static const IconData agreement01 = HugeIconData(0x3aba);

  /// IconData for the 'strokeRoundedAgreement02' icon.
  static const IconData agreement02 = HugeIconData(0x3abb);

  /// IconData for the 'strokeRoundedAgreement03' icon.
  static const IconData agreement03 = HugeIconData(0x3abc);

  /// IconData for the 'strokeRoundedAiBeautify' icon.
  static const IconData aiBeautify = HugeIconData(0x3abd);

  /// IconData for the 'strokeRoundedAiBook' icon.
  static const IconData aiBook = HugeIconData(0x3abe);

  /// IconData for the 'strokeRoundedAiBrain01' icon.
  static const IconData aiBrain01 = HugeIconData(0x3abf);

  /// IconData for the 'strokeRoundedAiBrain02' icon.
  static const IconData aiBrain02 = HugeIconData(0x3ac0);

  /// IconData for the 'strokeRoundedAiBrain03' icon.
  static const IconData aiBrain03 = HugeIconData(0x3ac1);

  /// IconData for the 'strokeRoundedAiBrain04' icon.
  static const IconData aiBrain04 = HugeIconData(0x3ac2);

  /// IconData for the 'strokeRoundedAiBrain05' icon.
  static const IconData aiBrain05 = HugeIconData(0x3ac3);

  /// IconData for the 'strokeRoundedAiBrowser' icon.
  static const IconData aiBrowser = HugeIconData(0x3ac4);

  /// IconData for the 'strokeRoundedAiChat01' icon.
  static const IconData aiChat01 = HugeIconData(0x3ac5);

  /// IconData for the 'strokeRoundedAiChat02' icon.
  static const IconData aiChat02 = HugeIconData(0x3ac6);

  /// IconData for the 'strokeRoundedAiCloud01' icon.
  static const IconData aiCloud01 = HugeIconData(0x3ac7);

  /// IconData for the 'strokeRoundedAiCloud02' icon.
  static const IconData aiCloud02 = HugeIconData(0x3ac8);

  /// IconData for the 'strokeRoundedAiCloud' icon.
  static const IconData aiCloud = HugeIconData(0x3ac9);

  /// IconData for the 'strokeRoundedAiComputer' icon.
  static const IconData aiComputer = HugeIconData(0x3aca);

  /// IconData for the 'strokeRoundedAiDna' icon.
  static const IconData aiDna = HugeIconData(0x3acb);

  /// IconData for the 'strokeRoundedAiEraser' icon.
  static const IconData aiEraser = HugeIconData(0x3acc);

  /// IconData for the 'strokeRoundedAiFolder01' icon.
  static const IconData aiFolder01 = HugeIconData(0x3acd);

  /// IconData for the 'strokeRoundedAiFolder02' icon.
  static const IconData aiFolder02 = HugeIconData(0x3ace);

  /// IconData for the 'strokeRoundedAiGame' icon.
  static const IconData aiGame = HugeIconData(0x3acf);

  /// IconData for the 'strokeRoundedAiGenerative' icon.
  static const IconData aiGenerative = HugeIconData(0x3ad0);

  /// IconData for the 'strokeRoundedAiIdea' icon.
  static const IconData aiIdea = HugeIconData(0x3ad1);

  /// IconData for the 'strokeRoundedAiImage' icon.
  static const IconData aiImage = HugeIconData(0x3ad2);

  /// IconData for the 'strokeRoundedAiInnovation01' icon.
  static const IconData aiInnovation01 = HugeIconData(0x3ad3);

  /// IconData for the 'strokeRoundedAiInnovation02' icon.
  static const IconData aiInnovation02 = HugeIconData(0x3ad4);

  /// IconData for the 'strokeRoundedAiInnovation03' icon.
  static const IconData aiInnovation03 = HugeIconData(0x3ad5);

  /// IconData for the 'strokeRoundedAiLaptop' icon.
  static const IconData aiLaptop = HugeIconData(0x3ad6);

  /// IconData for the 'strokeRoundedAiLearning' icon.
  static const IconData aiLearning = HugeIconData(0x3ad7);

  /// IconData for the 'strokeRoundedAiLock' icon.
  static const IconData aiLock = HugeIconData(0x3ad8);

  /// IconData for the 'strokeRoundedAiMagic' icon.
  static const IconData aiMagic = HugeIconData(0x3ad9);

  /// IconData for the 'strokeRoundedAiMail01' icon.
  static const IconData aiMail01 = HugeIconData(0x3ada);

  /// IconData for the 'strokeRoundedAiMail02' icon.
  static const IconData aiMail02 = HugeIconData(0x3adb);

  /// IconData for the 'strokeRoundedAiMail' icon.
  static const IconData aiMail = HugeIconData(0x3adc);

  /// IconData for the 'strokeRoundedAiNetwork' icon.
  static const IconData aiNetwork = HugeIconData(0x3add);

  /// IconData for the 'strokeRoundedAiPhone01' icon.
  static const IconData aiPhone01 = HugeIconData(0x3ade);

  /// IconData for the 'strokeRoundedAiPhone02' icon.
  static const IconData aiPhone02 = HugeIconData(0x3adf);

  /// IconData for the 'strokeRoundedAiProgramming' icon.
  static const IconData aiProgramming = HugeIconData(0x3ae0);

  /// IconData for the 'strokeRoundedAiSearch' icon.
  static const IconData aiSearch = HugeIconData(0x3ae1);

  /// IconData for the 'strokeRoundedAiSecurity01' icon.
  static const IconData aiSecurity01 = HugeIconData(0x3ae2);

  /// IconData for the 'strokeRoundedAiSecurity02' icon.
  static const IconData aiSecurity02 = HugeIconData(0x3ae3);

  /// IconData for the 'strokeRoundedAiSetting' icon.
  static const IconData aiSetting = HugeIconData(0x3ae4);

  /// IconData for the 'strokeRoundedAiSmartwatch' icon.
  static const IconData aiSmartwatch = HugeIconData(0x3ae5);

  /// IconData for the 'strokeRoundedAiUser' icon.
  static const IconData aiUser = HugeIconData(0x3ae6);

  /// IconData for the 'strokeRoundedAiVideo' icon.
  static const IconData aiVideo = HugeIconData(0x3ae7);

  /// IconData for the 'strokeRoundedAiView' icon.
  static const IconData aiView = HugeIconData(0x3ae8);

  /// IconData for the 'strokeRoundedAids' icon.
  static const IconData aids = HugeIconData(0x3ae9);

  /// IconData for the 'strokeRoundedAirbnb' icon.
  static const IconData airbnb = HugeIconData(0x3aea);

  /// IconData for the 'strokeRoundedAircraftGame' icon.
  static const IconData aircraftGame = HugeIconData(0x3aeb);

  /// IconData for the 'strokeRoundedAirdrop' icon.
  static const IconData airdrop = HugeIconData(0x3aec);

  /// IconData for the 'strokeRoundedAirplane01' icon.
  static const IconData airplane01 = HugeIconData(0x3aed);

  /// IconData for the 'strokeRoundedAirplane02' icon.
  static const IconData airplane02 = HugeIconData(0x3aee);

  /// IconData for the 'strokeRoundedAirplaneLanding01' icon.
  static const IconData airplaneLanding01 = HugeIconData(0x3aef);

  /// IconData for the 'strokeRoundedAirplaneLanding02' icon.
  static const IconData airplaneLanding02 = HugeIconData(0x3af0);

  /// IconData for the 'strokeRoundedAirplaneModeOff' icon.
  static const IconData airplaneModeOff = HugeIconData(0x3af1);

  /// IconData for the 'strokeRoundedAirplaneMode' icon.
  static const IconData airplaneMode = HugeIconData(0x3af2);

  /// IconData for the 'strokeRoundedAirplaneSeat' icon.
  static const IconData airplaneSeat = HugeIconData(0x3af3);

  /// IconData for the 'strokeRoundedAirplaneTakeOff01' icon.
  static const IconData airplaneTakeOff01 = HugeIconData(0x3af4);

  /// IconData for the 'strokeRoundedAirplaneTakeOff02' icon.
  static const IconData airplaneTakeOff02 = HugeIconData(0x3af5);

  /// IconData for the 'strokeRoundedAirplayLine' icon.
  static const IconData airplayLine = HugeIconData(0x3af6);

  /// IconData for the 'strokeRoundedAirpod01' icon.
  static const IconData airpod01 = HugeIconData(0x3af7);

  /// IconData for the 'strokeRoundedAirpod02' icon.
  static const IconData airpod02 = HugeIconData(0x3af8);

  /// IconData for the 'strokeRoundedAirpod03' icon.
  static const IconData airpod03 = HugeIconData(0x3af9);

  /// IconData for the 'strokeRoundedAirport' icon.
  static const IconData airport = HugeIconData(0x3afa);

  /// IconData for the 'strokeRoundedAlAqsaMosque' icon.
  static const IconData alAqsaMosque = HugeIconData(0x3afb);

  /// IconData for the 'strokeRoundedAlarmClock' icon.
  static const IconData alarmClock = HugeIconData(0x3afc);

  /// IconData for the 'strokeRoundedAlbum01' icon.
  static const IconData album01 = HugeIconData(0x3afd);

  /// IconData for the 'strokeRoundedAlbum02' icon.
  static const IconData album02 = HugeIconData(0x3afe);

  /// IconData for the 'strokeRoundedAlbumNotFound01' icon.
  static const IconData albumNotFound01 = HugeIconData(0x3aff);

  /// IconData for the 'strokeRoundedAlbumNotFound02' icon.
  static const IconData albumNotFound02 = HugeIconData(0x3b00);

  /// IconData for the 'strokeRoundedAlert01' icon.
  static const IconData alert01 = HugeIconData(0x3b01);

  /// IconData for the 'strokeRoundedAlert02' icon.
  static const IconData alert02 = HugeIconData(0x3b02);

  /// IconData for the 'strokeRoundedAlertCircle' icon.
  static const IconData alertCircle = HugeIconData(0x3b03);

  /// IconData for the 'strokeRoundedAlertDiamond' icon.
  static const IconData alertDiamond = HugeIconData(0x3b04);

  /// IconData for the 'strokeRoundedAlertSquare' icon.
  static const IconData alertSquare = HugeIconData(0x3b05);

  /// IconData for the 'strokeRoundedAlgorithm' icon.
  static const IconData algorithm = HugeIconData(0x3b06);

  /// IconData for the 'strokeRoundedAlien01' icon.
  static const IconData alien01 = HugeIconData(0x3b07);

  /// IconData for the 'strokeRoundedAlien02' icon.
  static const IconData alien02 = HugeIconData(0x3b08);

  /// IconData for the 'strokeRoundedAlignBottom' icon.
  static const IconData alignBottom = HugeIconData(0x3b09);

  /// IconData for the 'strokeRoundedAlignBoxBottomCenter' icon.
  static const IconData alignBoxBottomCenter = HugeIconData(0x3b0a);

  /// IconData for the 'strokeRoundedAlignBoxBottomLeft' icon.
  static const IconData alignBoxBottomLeft = HugeIconData(0x3b0b);

  /// IconData for the 'strokeRoundedAlignBoxBottomRight' icon.
  static const IconData alignBoxBottomRight = HugeIconData(0x3b0c);

  /// IconData for the 'strokeRoundedAlignBoxMiddleCenter' icon.
  static const IconData alignBoxMiddleCenter = HugeIconData(0x3b0d);

  /// IconData for the 'strokeRoundedAlignBoxMiddleLeft' icon.
  static const IconData alignBoxMiddleLeft = HugeIconData(0x3b0e);

  /// IconData for the 'strokeRoundedAlignBoxMiddleRight' icon.
  static const IconData alignBoxMiddleRight = HugeIconData(0x3b0f);

  /// IconData for the 'strokeRoundedAlignBoxTopCenter' icon.
  static const IconData alignBoxTopCenter = HugeIconData(0x3b10);

  /// IconData for the 'strokeRoundedAlignBoxTopLeft' icon.
  static const IconData alignBoxTopLeft = HugeIconData(0x3b11);

  /// IconData for the 'strokeRoundedAlignBoxTopRight' icon.
  static const IconData alignBoxTopRight = HugeIconData(0x3b12);

  /// IconData for the 'strokeRoundedAlignHorizontalCenter' icon.
  static const IconData alignHorizontalCenter = HugeIconData(0x3b13);

  /// IconData for the 'strokeRoundedAlignKeyObject' icon.
  static const IconData alignKeyObject = HugeIconData(0x3b14);

  /// IconData for the 'strokeRoundedAlignLeft' icon.
  static const IconData alignLeft = HugeIconData(0x3b15);

  /// IconData for the 'strokeRoundedAlignRight' icon.
  static const IconData alignRight = HugeIconData(0x3b16);

  /// IconData for the 'strokeRoundedAlignSelection' icon.
  static const IconData alignSelection = HugeIconData(0x3b17);

  /// IconData for the 'strokeRoundedAlignTop' icon.
  static const IconData alignTop = HugeIconData(0x3b18);

  /// IconData for the 'strokeRoundedAlignVerticalCenter' icon.
  static const IconData alignVerticalCenter = HugeIconData(0x3b19);

  /// IconData for the 'strokeRoundedAllBookmark' icon.
  static const IconData allBookmark = HugeIconData(0x3b1a);

  /// IconData for the 'strokeRoundedAllah' icon.
  static const IconData allah = HugeIconData(0x3b1b);

  /// IconData for the 'strokeRoundedAlms' icon.
  static const IconData alms = HugeIconData(0x3b1c);

  /// IconData for the 'strokeRoundedAlphaCircle' icon.
  static const IconData alphaCircle = HugeIconData(0x3b1d);

  /// IconData for the 'strokeRoundedAlphaSquare' icon.
  static const IconData alphaSquare = HugeIconData(0x3b1e);

  /// IconData for the 'strokeRoundedAlpha' icon.
  static const IconData alpha = HugeIconData(0x3b1f);

  /// IconData for the 'strokeRoundedAlphabetArabic' icon.
  static const IconData alphabetArabic = HugeIconData(0x3b20);

  /// IconData for the 'strokeRoundedAlphabetBangla' icon.
  static const IconData alphabetBangla = HugeIconData(0x3b21);

  /// IconData for the 'strokeRoundedAlphabetChinese' icon.
  static const IconData alphabetChinese = HugeIconData(0x3b22);

  /// IconData for the 'strokeRoundedAlphabetGreek' icon.
  static const IconData alphabetGreek = HugeIconData(0x3b23);

  /// IconData for the 'strokeRoundedAlphabetHebrew' icon.
  static const IconData alphabetHebrew = HugeIconData(0x3b24);

  /// IconData for the 'strokeRoundedAlphabetHindi' icon.
  static const IconData alphabetHindi = HugeIconData(0x3b25);

  /// IconData for the 'strokeRoundedAlphabetJapanese' icon.
  static const IconData alphabetJapanese = HugeIconData(0x3b26);

  /// IconData for the 'strokeRoundedAlphabetKorean' icon.
  static const IconData alphabetKorean = HugeIconData(0x3b27);

  /// IconData for the 'strokeRoundedAlphabetThai' icon.
  static const IconData alphabetThai = HugeIconData(0x3b28);

  /// IconData for the 'strokeRoundedAmazon' icon.
  static const IconData amazon = HugeIconData(0x3b29);

  /// IconData for the 'strokeRoundedAmbulance' icon.
  static const IconData ambulance = HugeIconData(0x3b2a);

  /// IconData for the 'strokeRoundedAmericanFootball' icon.
  static const IconData americanFootball = HugeIconData(0x3b2b);

  /// IconData for the 'strokeRoundedAmie' icon.
  static const IconData amie = HugeIconData(0x3b2c);

  /// IconData for the 'strokeRoundedAmpoule' icon.
  static const IconData ampoule = HugeIconData(0x3b2d);

  /// IconData for the 'strokeRoundedAnalysisTextLink' icon.
  static const IconData analysisTextLink = HugeIconData(0x3b2e);

  /// IconData for the 'strokeRoundedAnalytics01' icon.
  static const IconData analytics01 = HugeIconData(0x3b2f);

  /// IconData for the 'strokeRoundedAnalytics02' icon.
  static const IconData analytics02 = HugeIconData(0x3b30);

  /// IconData for the 'strokeRoundedAnalyticsDown' icon.
  static const IconData analyticsDown = HugeIconData(0x3b31);

  /// IconData for the 'strokeRoundedAnalyticsUp' icon.
  static const IconData analyticsUp = HugeIconData(0x3b32);

  /// IconData for the 'strokeRoundedAnchorPoint' icon.
  static const IconData anchorPoint = HugeIconData(0x3b33);

  /// IconData for the 'strokeRoundedAndroid' icon.
  static const IconData android = HugeIconData(0x3b34);

  /// IconData for the 'strokeRoundedAngel' icon.
  static const IconData angel = HugeIconData(0x3b35);

  /// IconData for the 'strokeRoundedAngle01' icon.
  static const IconData angle01 = HugeIconData(0x3b36);

  /// IconData for the 'strokeRoundedAngle' icon.
  static const IconData angle = HugeIconData(0x3b37);

  /// IconData for the 'strokeRoundedAngryBird' icon.
  static const IconData angryBird = HugeIconData(0x3b38);

  /// IconData for the 'strokeRoundedAngry' icon.
  static const IconData angry = HugeIconData(0x3b39);

  /// IconData for the 'strokeRoundedAnonymous' icon.
  static const IconData anonymous = HugeIconData(0x3b3a);

  /// IconData for the 'strokeRoundedApi' icon.
  static const IconData api = HugeIconData(0x3b3b);

  /// IconData for the 'strokeRoundedAppStore' icon.
  static const IconData appStore = HugeIconData(0x3b3c);

  /// IconData for the 'strokeRoundedApple01' icon.
  static const IconData apple01 = HugeIconData(0x3b3d);

  /// IconData for the 'strokeRoundedAppleFinder' icon.
  static const IconData appleFinder = HugeIconData(0x3b3e);

  /// IconData for the 'strokeRoundedAppleNews' icon.
  static const IconData appleNews = HugeIconData(0x3b3f);

  /// IconData for the 'strokeRoundedApplePie' icon.
  static const IconData applePie = HugeIconData(0x3b40);

  /// IconData for the 'strokeRoundedAppleReminder' icon.
  static const IconData appleReminder = HugeIconData(0x3b41);

  /// IconData for the 'strokeRoundedAppleStocks' icon.
  static const IconData appleStocks = HugeIconData(0x3b42);

  /// IconData for the 'strokeRoundedAppleVisionPro' icon.
  static const IconData appleVisionPro = HugeIconData(0x3b43);

  /// IconData for the 'strokeRoundedApple' icon.
  static const IconData apple = HugeIconData(0x3b44);

  /// IconData for the 'strokeRoundedApproximatelyEqualCircle' icon.
  static const IconData approximatelyEqualCircle = HugeIconData(0x3b45);

  /// IconData for the 'strokeRoundedApproximatelyEqualSquare' icon.
  static const IconData approximatelyEqualSquare = HugeIconData(0x3b46);

  /// IconData for the 'strokeRoundedApproximatelyEqual' icon.
  static const IconData approximatelyEqual = HugeIconData(0x3b47);

  /// IconData for the 'strokeRoundedApricot' icon.
  static const IconData apricot = HugeIconData(0x3b48);

  /// IconData for the 'strokeRoundedApron' icon.
  static const IconData apron = HugeIconData(0x3b49);

  /// IconData for the 'strokeRoundedArcBrowser' icon.
  static const IconData arcBrowser = HugeIconData(0x3b4a);

  /// IconData for the 'strokeRoundedArcher' icon.
  static const IconData archer = HugeIconData(0x3b4b);

  /// IconData for the 'strokeRoundedArchive01' icon.
  static const IconData archive01 = HugeIconData(0x3b4c);

  /// IconData for the 'strokeRoundedArchive02' icon.
  static const IconData archive02 = HugeIconData(0x3b4d);

  /// IconData for the 'strokeRoundedArchive' icon.
  static const IconData archive = HugeIconData(0x3b4e);

  /// IconData for the 'strokeRoundedArmoredBoot' icon.
  static const IconData armoredBoot = HugeIconData(0x3b4f);

  /// IconData for the 'strokeRoundedArrangeByLettersAZ' icon.
  static const IconData arrangeByLettersAZ = HugeIconData(0x3b50);

  /// IconData for the 'strokeRoundedArrangeByLettersZA' icon.
  static const IconData arrangeByLettersZA = HugeIconData(0x3b51);

  /// IconData for the 'strokeRoundedArrangeByNumbers19' icon.
  static const IconData arrangeByNumbers19 = HugeIconData(0x3b52);

  /// IconData for the 'strokeRoundedArrangeByNumbers91' icon.
  static const IconData arrangeByNumbers91 = HugeIconData(0x3b53);

  /// IconData for the 'strokeRoundedArrange' icon.
  static const IconData arrange = HugeIconData(0x3b54);

  /// IconData for the 'strokeRoundedArrowAllDirection' icon.
  static const IconData arrowAllDirection = HugeIconData(0x3b55);

  /// IconData for the 'strokeRoundedArrowDataTransferDiagonal' icon.
  static const IconData arrowDataTransferDiagonal = HugeIconData(0x3b56);

  /// IconData for the 'strokeRoundedArrowDataTransferHorizontal' icon.
  static const IconData arrowDataTransferHorizontal = HugeIconData(0x3b57);

  /// IconData for the 'strokeRoundedArrowDataTransferVertical' icon.
  static const IconData arrowDataTransferVertical = HugeIconData(0x3b58);

  /// IconData for the 'strokeRoundedArrowDiagonal' icon.
  static const IconData arrowDiagonal = HugeIconData(0x3b59);

  /// IconData for the 'strokeRoundedArrowDown01' icon.
  static const IconData arrowDown01 = HugeIconData(0x3b5a);

  /// IconData for the 'strokeRoundedArrowDown02' icon.
  static const IconData arrowDown02 = HugeIconData(0x3b5b);

  /// IconData for the 'strokeRoundedArrowDown03' icon.
  static const IconData arrowDown03 = HugeIconData(0x3b5c);

  /// IconData for the 'strokeRoundedArrowDown04' icon.
  static const IconData arrowDown04 = HugeIconData(0x3b5d);

  /// IconData for the 'strokeRoundedArrowDown05' icon.
  static const IconData arrowDown05 = HugeIconData(0x3b5e);

  /// IconData for the 'strokeRoundedArrowDownDouble' icon.
  static const IconData arrowDownDouble = HugeIconData(0x3b5f);

  /// IconData for the 'strokeRoundedArrowDownLeft01' icon.
  static const IconData arrowDownLeft01 = HugeIconData(0x3b60);

  /// IconData for the 'strokeRoundedArrowDownLeft02' icon.
  static const IconData arrowDownLeft02 = HugeIconData(0x3b61);

  /// IconData for the 'strokeRoundedArrowDownRight01' icon.
  static const IconData arrowDownRight01 = HugeIconData(0x3b62);

  /// IconData for the 'strokeRoundedArrowDownRight02' icon.
  static const IconData arrowDownRight02 = HugeIconData(0x3b63);

  /// IconData for the 'strokeRoundedArrowExpand01' icon.
  static const IconData arrowExpand01 = HugeIconData(0x3b64);

  /// IconData for the 'strokeRoundedArrowExpand02' icon.
  static const IconData arrowExpand02 = HugeIconData(0x3b65);

  /// IconData for the 'strokeRoundedArrowExpandDiagonal01' icon.
  static const IconData arrowExpandDiagonal01 = HugeIconData(0x3b66);

  /// IconData for the 'strokeRoundedArrowExpandDiagonal02' icon.
  static const IconData arrowExpandDiagonal02 = HugeIconData(0x3b67);

  /// IconData for the 'strokeRoundedArrowExpand' icon.
  static const IconData arrowExpand = HugeIconData(0x3b68);

  /// IconData for the 'strokeRoundedArrowHorizontal' icon.
  static const IconData arrowHorizontal = HugeIconData(0x3b69);

  /// IconData for the 'strokeRoundedArrowLeft01' icon.
  static const IconData arrowLeft01 = HugeIconData(0x3b6a);

  /// IconData for the 'strokeRoundedArrowLeft02' icon.
  static const IconData arrowLeft02 = HugeIconData(0x3b6b);

  /// IconData for the 'strokeRoundedArrowLeft03' icon.
  static const IconData arrowLeft03 = HugeIconData(0x3b6c);

  /// IconData for the 'strokeRoundedArrowLeft04' icon.
  static const IconData arrowLeft04 = HugeIconData(0x3b6d);

  /// IconData for the 'strokeRoundedArrowLeft05' icon.
  static const IconData arrowLeft05 = HugeIconData(0x3b6e);

  /// IconData for the 'strokeRoundedArrowLeftDouble' icon.
  static const IconData arrowLeftDouble = HugeIconData(0x3b6f);

  /// IconData for the 'strokeRoundedArrowLeftRight' icon.
  static const IconData arrowLeftRight = HugeIconData(0x3b70);

  /// IconData for the 'strokeRoundedArrowMoveDownLeft' icon.
  static const IconData arrowMoveDownLeft = HugeIconData(0x3b71);

  /// IconData for the 'strokeRoundedArrowMoveDownRight' icon.
  static const IconData arrowMoveDownRight = HugeIconData(0x3b72);

  /// IconData for the 'strokeRoundedArrowMoveLeftDown' icon.
  static const IconData arrowMoveLeftDown = HugeIconData(0x3b73);

  /// IconData for the 'strokeRoundedArrowMoveRightDown' icon.
  static const IconData arrowMoveRightDown = HugeIconData(0x3b74);

  /// IconData for the 'strokeRoundedArrowMoveUpLeft' icon.
  static const IconData arrowMoveUpLeft = HugeIconData(0x3b75);

  /// IconData for the 'strokeRoundedArrowMoveUpRight' icon.
  static const IconData arrowMoveUpRight = HugeIconData(0x3b76);

  /// IconData for the 'strokeRoundedArrowReloadHorizontal' icon.
  static const IconData arrowReloadHorizontal = HugeIconData(0x3b77);

  /// IconData for the 'strokeRoundedArrowReloadVertical' icon.
  static const IconData arrowReloadVertical = HugeIconData(0x3b78);

  /// IconData for the 'strokeRoundedArrowRight01' icon.
  static const IconData arrowRight01 = HugeIconData(0x3b79);

  /// IconData for the 'strokeRoundedArrowRight02' icon.
  static const IconData arrowRight02 = HugeIconData(0x3b7a);

  /// IconData for the 'strokeRoundedArrowRight03' icon.
  static const IconData arrowRight03 = HugeIconData(0x3b7b);

  /// IconData for the 'strokeRoundedArrowRight04' icon.
  static const IconData arrowRight04 = HugeIconData(0x3b7c);

  /// IconData for the 'strokeRoundedArrowRight05' icon.
  static const IconData arrowRight05 = HugeIconData(0x3b7d);

  /// IconData for the 'strokeRoundedArrowRightDouble' icon.
  static const IconData arrowRightDouble = HugeIconData(0x3b7e);

  /// IconData for the 'strokeRoundedArrowShrink01' icon.
  static const IconData arrowShrink01 = HugeIconData(0x3b7f);

  /// IconData for the 'strokeRoundedArrowShrink02' icon.
  static const IconData arrowShrink02 = HugeIconData(0x3b80);

  /// IconData for the 'strokeRoundedArrowShrink' icon.
  static const IconData arrowShrink = HugeIconData(0x3b81);

  /// IconData for the 'strokeRoundedArrowTurnBackward' icon.
  static const IconData arrowTurnBackward = HugeIconData(0x3b82);

  /// IconData for the 'strokeRoundedArrowTurnDown' icon.
  static const IconData arrowTurnDown = HugeIconData(0x3b83);

  /// IconData for the 'strokeRoundedArrowTurnForward' icon.
  static const IconData arrowTurnForward = HugeIconData(0x3b84);

  /// IconData for the 'strokeRoundedArrowTurnUp' icon.
  static const IconData arrowTurnUp = HugeIconData(0x3b85);

  /// IconData for the 'strokeRoundedArrowUp01' icon.
  static const IconData arrowUp01 = HugeIconData(0x3b86);

  /// IconData for the 'strokeRoundedArrowUp02' icon.
  static const IconData arrowUp02 = HugeIconData(0x3b87);

  /// IconData for the 'strokeRoundedArrowUp03' icon.
  static const IconData arrowUp03 = HugeIconData(0x3b88);

  /// IconData for the 'strokeRoundedArrowUp04' icon.
  static const IconData arrowUp04 = HugeIconData(0x3b89);

  /// IconData for the 'strokeRoundedArrowUp05' icon.
  static const IconData arrowUp05 = HugeIconData(0x3b8a);

  /// IconData for the 'strokeRoundedArrowUpDouble' icon.
  static const IconData arrowUpDouble = HugeIconData(0x3b8b);

  /// IconData for the 'strokeRoundedArrowUpDown' icon.
  static const IconData arrowUpDown = HugeIconData(0x3b8c);

  /// IconData for the 'strokeRoundedArrowUpLeft01' icon.
  static const IconData arrowUpLeft01 = HugeIconData(0x3b8d);

  /// IconData for the 'strokeRoundedArrowUpLeft02' icon.
  static const IconData arrowUpLeft02 = HugeIconData(0x3b8e);

  /// IconData for the 'strokeRoundedArrowUpRight01' icon.
  static const IconData arrowUpRight01 = HugeIconData(0x3b8f);

  /// IconData for the 'strokeRoundedArrowUpRight02' icon.
  static const IconData arrowUpRight02 = HugeIconData(0x3b90);

  /// IconData for the 'strokeRoundedArrowVertical' icon.
  static const IconData arrowVertical = HugeIconData(0x3b91);

  /// IconData for the 'strokeRoundedArtboardTool' icon.
  static const IconData artboardTool = HugeIconData(0x3b92);

  /// IconData for the 'strokeRoundedArtboard' icon.
  static const IconData artboard = HugeIconData(0x3b93);

  /// IconData for the 'strokeRoundedArtificialIntelligence01' icon.
  static const IconData artificialIntelligence01 = HugeIconData(0x3b94);

  /// IconData for the 'strokeRoundedArtificialIntelligence02' icon.
  static const IconData artificialIntelligence02 = HugeIconData(0x3b95);

  /// IconData for the 'strokeRoundedArtificialIntelligence03' icon.
  static const IconData artificialIntelligence03 = HugeIconData(0x3b96);

  /// IconData for the 'strokeRoundedArtificialIntelligence04' icon.
  static const IconData artificialIntelligence04 = HugeIconData(0x3b97);

  /// IconData for the 'strokeRoundedArtificialIntelligence05' icon.
  static const IconData artificialIntelligence05 = HugeIconData(0x3b98);

  /// IconData for the 'strokeRoundedArtificialIntelligence06' icon.
  static const IconData artificialIntelligence06 = HugeIconData(0x3b99);

  /// IconData for the 'strokeRoundedArtificialIntelligence07' icon.
  static const IconData artificialIntelligence07 = HugeIconData(0x3b9a);

  /// IconData for the 'strokeRoundedAspectRatio' icon.
  static const IconData aspectRatio = HugeIconData(0x3b9b);

  /// IconData for the 'strokeRoundedAssignments' icon.
  static const IconData assignments = HugeIconData(0x3b9c);

  /// IconData for the 'strokeRoundedAsteroid01' icon.
  static const IconData asteroid01 = HugeIconData(0x3b9d);

  /// IconData for the 'strokeRoundedAsteroid02' icon.
  static const IconData asteroid02 = HugeIconData(0x3b9e);

  /// IconData for the 'strokeRoundedAstronaut01' icon.
  static const IconData astronaut01 = HugeIconData(0x3b9f);

  /// IconData for the 'strokeRoundedAstronaut02' icon.
  static const IconData astronaut02 = HugeIconData(0x3ba0);

  /// IconData for the 'strokeRoundedAt' icon.
  static const IconData at = HugeIconData(0x3ba1);

  /// IconData for the 'strokeRoundedAtm01' icon.
  static const IconData atm01 = HugeIconData(0x3ba2);

  /// IconData for the 'strokeRoundedAtm02' icon.
  static const IconData atm02 = HugeIconData(0x3ba3);

  /// IconData for the 'strokeRoundedAtom01' icon.
  static const IconData atom01 = HugeIconData(0x3ba4);

  /// IconData for the 'strokeRoundedAtom02' icon.
  static const IconData atom02 = HugeIconData(0x3ba5);

  /// IconData for the 'strokeRoundedAtomicPower' icon.
  static const IconData atomicPower = HugeIconData(0x3ba6);

  /// IconData for the 'strokeRoundedAttachment01' icon.
  static const IconData attachment01 = HugeIconData(0x3ba7);

  /// IconData for the 'strokeRoundedAttachment02' icon.
  static const IconData attachment02 = HugeIconData(0x3ba8);

  /// IconData for the 'strokeRoundedAttachmentCircle' icon.
  static const IconData attachmentCircle = HugeIconData(0x3ba9);

  /// IconData for the 'strokeRoundedAttachmentSquare' icon.
  static const IconData attachmentSquare = HugeIconData(0x3baa);

  /// IconData for the 'strokeRoundedAttachment' icon.
  static const IconData attachment = HugeIconData(0x3bab);

  /// IconData for the 'strokeRoundedAuction' icon.
  static const IconData auction = HugeIconData(0x3bac);

  /// IconData for the 'strokeRoundedAudioBook01' icon.
  static const IconData audioBook01 = HugeIconData(0x3bad);

  /// IconData for the 'strokeRoundedAudioBook02' icon.
  static const IconData audioBook02 = HugeIconData(0x3bae);

  /// IconData for the 'strokeRoundedAudioBook03' icon.
  static const IconData audioBook03 = HugeIconData(0x3baf);

  /// IconData for the 'strokeRoundedAudioBook04' icon.
  static const IconData audioBook04 = HugeIconData(0x3bb0);

  /// IconData for the 'strokeRoundedAudit01' icon.
  static const IconData audit01 = HugeIconData(0x3bb1);

  /// IconData for the 'strokeRoundedAudit02' icon.
  static const IconData audit02 = HugeIconData(0x3bb2);

  /// IconData for the 'strokeRoundedAugmentedRealityAr' icon.
  static const IconData augmentedRealityAr = HugeIconData(0x3bb3);

  /// IconData for the 'strokeRoundedAuthorized' icon.
  static const IconData authorized = HugeIconData(0x3bb4);

  /// IconData for the 'strokeRoundedAutoConversations' icon.
  static const IconData autoConversations = HugeIconData(0x3bb5);

  /// IconData for the 'strokeRoundedAutomotiveBattery01' icon.
  static const IconData automotiveBattery01 = HugeIconData(0x3bb6);

  /// IconData for the 'strokeRoundedAutomotiveBattery02' icon.
  static const IconData automotiveBattery02 = HugeIconData(0x3bb7);

  /// IconData for the 'strokeRoundedAvalanche' icon.
  static const IconData avalanche = HugeIconData(0x3bb8);

  /// IconData for the 'strokeRoundedAvocado' icon.
  static const IconData avocado = HugeIconData(0x3bb9);

  /// IconData for the 'strokeRoundedAward01' icon.
  static const IconData award01 = HugeIconData(0x3bba);

  /// IconData for the 'strokeRoundedAward02' icon.
  static const IconData award02 = HugeIconData(0x3bbb);

  /// IconData for the 'strokeRoundedAward03' icon.
  static const IconData award03 = HugeIconData(0x3bbc);

  /// IconData for the 'strokeRoundedAward04' icon.
  static const IconData award04 = HugeIconData(0x3bbd);

  /// IconData for the 'strokeRoundedAward05' icon.
  static const IconData award05 = HugeIconData(0x3bbe);

  /// IconData for the 'strokeRoundedBaby01' icon.
  static const IconData baby01 = HugeIconData(0x3bbf);

  /// IconData for the 'strokeRoundedBaby02' icon.
  static const IconData baby02 = HugeIconData(0x3bc0);

  /// IconData for the 'strokeRoundedBabyBed01' icon.
  static const IconData babyBed01 = HugeIconData(0x3bc1);

  /// IconData for the 'strokeRoundedBabyBed02' icon.
  static const IconData babyBed02 = HugeIconData(0x3bc2);

  /// IconData for the 'strokeRoundedBabyBottle' icon.
  static const IconData babyBottle = HugeIconData(0x3bc3);

  /// IconData for the 'strokeRoundedBabyBoyDress' icon.
  static const IconData babyBoyDress = HugeIconData(0x3bc4);

  /// IconData for the 'strokeRoundedBabyGirlDress' icon.
  static const IconData babyGirlDress = HugeIconData(0x3bc5);

  /// IconData for the 'strokeRoundedBackpack01' icon.
  static const IconData backpack01 = HugeIconData(0x3bc6);

  /// IconData for the 'strokeRoundedBackpack02' icon.
  static const IconData backpack02 = HugeIconData(0x3bc7);

  /// IconData for the 'strokeRoundedBackpack03' icon.
  static const IconData backpack03 = HugeIconData(0x3bc8);

  /// IconData for the 'strokeRoundedBackward01' icon.
  static const IconData backward01 = HugeIconData(0x3bc9);

  /// IconData for the 'strokeRoundedBackward02' icon.
  static const IconData backward02 = HugeIconData(0x3bca);

  /// IconData for the 'strokeRoundedBacteria' icon.
  static const IconData bacteria = HugeIconData(0x3bcb);

  /// IconData for the 'strokeRoundedBadmintonShuttle' icon.
  static const IconData badmintonShuttle = HugeIconData(0x3bcc);

  /// IconData for the 'strokeRoundedBadminton' icon.
  static const IconData badminton = HugeIconData(0x3bcd);

  /// IconData for the 'strokeRoundedBanana' icon.
  static const IconData banana = HugeIconData(0x3bce);

  /// IconData for the 'strokeRoundedBandage' icon.
  static const IconData bandage = HugeIconData(0x3bcf);

  /// IconData for the 'strokeRoundedBank' icon.
  static const IconData bank = HugeIconData(0x3bd0);

  /// IconData for the 'strokeRoundedBarCode01' icon.
  static const IconData barCode01 = HugeIconData(0x3bd1);

  /// IconData for the 'strokeRoundedBarCode02' icon.
  static const IconData barCode02 = HugeIconData(0x3bd2);

  /// IconData for the 'strokeRoundedBarns' icon.
  static const IconData barns = HugeIconData(0x3bd3);

  /// IconData for the 'strokeRoundedBaseballBat' icon.
  static const IconData baseballBat = HugeIconData(0x3bd4);

  /// IconData for the 'strokeRoundedBaseballHelmet' icon.
  static const IconData baseballHelmet = HugeIconData(0x3bd5);

  /// IconData for the 'strokeRoundedBaseball' icon.
  static const IconData baseball = HugeIconData(0x3bd6);

  /// IconData for the 'strokeRoundedBasketball01' icon.
  static const IconData basketball01 = HugeIconData(0x3bd7);

  /// IconData for the 'strokeRoundedBasketball02' icon.
  static const IconData basketball02 = HugeIconData(0x3bd8);

  /// IconData for the 'strokeRoundedBasketballHoop' icon.
  static const IconData basketballHoop = HugeIconData(0x3bd9);

  /// IconData for the 'strokeRoundedBathtub01' icon.
  static const IconData bathtub01 = HugeIconData(0x3bda);

  /// IconData for the 'strokeRoundedBathtub02' icon.
  static const IconData bathtub02 = HugeIconData(0x3bdb);

  /// IconData for the 'strokeRoundedBatteriesEnergy' icon.
  static const IconData batteriesEnergy = HugeIconData(0x3bdc);

  /// IconData for the 'strokeRoundedBatteryCharging01' icon.
  static const IconData batteryCharging01 = HugeIconData(0x3bdd);

  /// IconData for the 'strokeRoundedBatteryCharging02' icon.
  static const IconData batteryCharging02 = HugeIconData(0x3bde);

  /// IconData for the 'strokeRoundedBatteryEcoCharging' icon.
  static const IconData batteryEcoCharging = HugeIconData(0x3bdf);

  /// IconData for the 'strokeRoundedBatteryEmpty' icon.
  static const IconData batteryEmpty = HugeIconData(0x3be0);

  /// IconData for the 'strokeRoundedBatteryFull' icon.
  static const IconData batteryFull = HugeIconData(0x3be1);

  /// IconData for the 'strokeRoundedBatteryLow' icon.
  static const IconData batteryLow = HugeIconData(0x3be2);

  /// IconData for the 'strokeRoundedBatteryMedium01' icon.
  static const IconData batteryMedium01 = HugeIconData(0x3be3);

  /// IconData for the 'strokeRoundedBatteryMedium02' icon.
  static const IconData batteryMedium02 = HugeIconData(0x3be4);

  /// IconData for the 'strokeRoundedBbqGrill' icon.
  static const IconData bbqGrill = HugeIconData(0x3be5);

  /// IconData for the 'strokeRoundedBeach02' icon.
  static const IconData beach02 = HugeIconData(0x3be6);

  /// IconData for the 'strokeRoundedBeach' icon.
  static const IconData beach = HugeIconData(0x3be7);

  /// IconData for the 'strokeRoundedBeater' icon.
  static const IconData beater = HugeIconData(0x3be8);

  /// IconData for the 'strokeRoundedBebo' icon.
  static const IconData bebo = HugeIconData(0x3be9);

  /// IconData for the 'strokeRoundedBedBunk' icon.
  static const IconData bedBunk = HugeIconData(0x3bea);

  /// IconData for the 'strokeRoundedBedDouble' icon.
  static const IconData bedDouble = HugeIconData(0x3beb);

  /// IconData for the 'strokeRoundedBedSingle01' icon.
  static const IconData bedSingle01 = HugeIconData(0x3bec);

  /// IconData for the 'strokeRoundedBedSingle02' icon.
  static const IconData bedSingle02 = HugeIconData(0x3bed);

  /// IconData for the 'strokeRoundedBed' icon.
  static const IconData bed = HugeIconData(0x3bee);

  /// IconData for the 'strokeRoundedBedug01' icon.
  static const IconData bedug01 = HugeIconData(0x3bef);

  /// IconData for the 'strokeRoundedBedug02' icon.
  static const IconData bedug02 = HugeIconData(0x3bf0);

  /// IconData for the 'strokeRoundedBehance01' icon.
  static const IconData behance01 = HugeIconData(0x3bf1);

  /// IconData for the 'strokeRoundedBehance02' icon.
  static const IconData behance02 = HugeIconData(0x3bf2);

  /// IconData for the 'strokeRoundedBelt' icon.
  static const IconData belt = HugeIconData(0x3bf3);

  /// IconData for the 'strokeRoundedBendTool' icon.
  static const IconData bendTool = HugeIconData(0x3bf4);

  /// IconData for the 'strokeRoundedBerlinTower' icon.
  static const IconData berlinTower = HugeIconData(0x3bf5);

  /// IconData for the 'strokeRoundedBerlin' icon.
  static const IconData berlin = HugeIconData(0x3bf6);

  /// IconData for the 'strokeRoundedBeta' icon.
  static const IconData beta = HugeIconData(0x3bf7);

  /// IconData for the 'strokeRoundedBicycle01' icon.
  static const IconData bicycle01 = HugeIconData(0x3bf8);

  /// IconData for the 'strokeRoundedBicycle' icon.
  static const IconData bicycle = HugeIconData(0x3bf9);

  /// IconData for the 'strokeRoundedBilliard01' icon.
  static const IconData billiard01 = HugeIconData(0x3bfa);

  /// IconData for the 'strokeRoundedBilliard02' icon.
  static const IconData billiard02 = HugeIconData(0x3bfb);

  /// IconData for the 'strokeRoundedBinaryCode' icon.
  static const IconData binaryCode = HugeIconData(0x3bfc);

  /// IconData for the 'strokeRoundedBing' icon.
  static const IconData bing = HugeIconData(0x3bfd);

  /// IconData for the 'strokeRoundedBioEnergy' icon.
  static const IconData bioEnergy = HugeIconData(0x3bfe);

  /// IconData for the 'strokeRoundedBiomassEnergy' icon.
  static const IconData biomassEnergy = HugeIconData(0x3bff);

  /// IconData for the 'strokeRoundedBiometricAccess' icon.
  static const IconData biometricAccess = HugeIconData(0x3c00);

  /// IconData for the 'strokeRoundedBiometricDevice' icon.
  static const IconData biometricDevice = HugeIconData(0x3c01);

  /// IconData for the 'strokeRoundedBirthdayCake' icon.
  static const IconData birthdayCake = HugeIconData(0x3c02);

  /// IconData for the 'strokeRoundedBiscuit' icon.
  static const IconData biscuit = HugeIconData(0x3c03);

  /// IconData for the 'strokeRoundedBitcoin01' icon.
  static const IconData bitcoin01 = HugeIconData(0x3c04);

  /// IconData for the 'strokeRoundedBitcoin02' icon.
  static const IconData bitcoin02 = HugeIconData(0x3c05);

  /// IconData for the 'strokeRoundedBitcoin03' icon.
  static const IconData bitcoin03 = HugeIconData(0x3c06);

  /// IconData for the 'strokeRoundedBitcoin04' icon.
  static const IconData bitcoin04 = HugeIconData(0x3c07);

  /// IconData for the 'strokeRoundedBitcoinBag' icon.
  static const IconData bitcoinBag = HugeIconData(0x3c08);

  /// IconData for the 'strokeRoundedBitcoinCircle' icon.
  static const IconData bitcoinCircle = HugeIconData(0x3c09);

  /// IconData for the 'strokeRoundedBitcoinCloud' icon.
  static const IconData bitcoinCloud = HugeIconData(0x3c0a);

  /// IconData for the 'strokeRoundedBitcoinCpu' icon.
  static const IconData bitcoinCpu = HugeIconData(0x3c0b);

  /// IconData for the 'strokeRoundedBitcoinCreditCard' icon.
  static const IconData bitcoinCreditCard = HugeIconData(0x3c0c);

  /// IconData for the 'strokeRoundedBitcoinDatabase' icon.
  static const IconData bitcoinDatabase = HugeIconData(0x3c0d);

  /// IconData for the 'strokeRoundedBitcoinDown01' icon.
  static const IconData bitcoinDown01 = HugeIconData(0x3c0e);

  /// IconData for the 'strokeRoundedBitcoinDown02' icon.
  static const IconData bitcoinDown02 = HugeIconData(0x3c0f);

  /// IconData for the 'strokeRoundedBitcoinEllipse' icon.
  static const IconData bitcoinEllipse = HugeIconData(0x3c10);

  /// IconData for the 'strokeRoundedBitcoinEye' icon.
  static const IconData bitcoinEye = HugeIconData(0x3c11);

  /// IconData for the 'strokeRoundedBitcoinFilter' icon.
  static const IconData bitcoinFilter = HugeIconData(0x3c12);

  /// IconData for the 'strokeRoundedBitcoinFlashdisk' icon.
  static const IconData bitcoinFlashdisk = HugeIconData(0x3c13);

  /// IconData for the 'strokeRoundedBitcoinGraph' icon.
  static const IconData bitcoinGraph = HugeIconData(0x3c14);

  /// IconData for the 'strokeRoundedBitcoinInvoice' icon.
  static const IconData bitcoinInvoice = HugeIconData(0x3c15);

  /// IconData for the 'strokeRoundedBitcoinKey' icon.
  static const IconData bitcoinKey = HugeIconData(0x3c16);

  /// IconData for the 'strokeRoundedBitcoinLocation' icon.
  static const IconData bitcoinLocation = HugeIconData(0x3c17);

  /// IconData for the 'strokeRoundedBitcoinLock' icon.
  static const IconData bitcoinLock = HugeIconData(0x3c18);

  /// IconData for the 'strokeRoundedBitcoinMail' icon.
  static const IconData bitcoinMail = HugeIconData(0x3c19);

  /// IconData for the 'strokeRoundedBitcoinMind' icon.
  static const IconData bitcoinMind = HugeIconData(0x3c1a);

  /// IconData for the 'strokeRoundedBitcoinMoney01' icon.
  static const IconData bitcoinMoney01 = HugeIconData(0x3c1b);

  /// IconData for the 'strokeRoundedBitcoinMoney02' icon.
  static const IconData bitcoinMoney02 = HugeIconData(0x3c1c);

  /// IconData for the 'strokeRoundedBitcoinPieChart' icon.
  static const IconData bitcoinPieChart = HugeIconData(0x3c1d);

  /// IconData for the 'strokeRoundedBitcoinPiggyBank' icon.
  static const IconData bitcoinPiggyBank = HugeIconData(0x3c1e);

  /// IconData for the 'strokeRoundedBitcoinPresentation' icon.
  static const IconData bitcoinPresentation = HugeIconData(0x3c1f);

  /// IconData for the 'strokeRoundedBitcoinReceipt' icon.
  static const IconData bitcoinReceipt = HugeIconData(0x3c20);

  /// IconData for the 'strokeRoundedBitcoinReceive' icon.
  static const IconData bitcoinReceive = HugeIconData(0x3c21);

  /// IconData for the 'strokeRoundedBitcoinRectangle' icon.
  static const IconData bitcoinRectangle = HugeIconData(0x3c22);

  /// IconData for the 'strokeRoundedBitcoinSafe' icon.
  static const IconData bitcoinSafe = HugeIconData(0x3c23);

  /// IconData for the 'strokeRoundedBitcoinSearch' icon.
  static const IconData bitcoinSearch = HugeIconData(0x3c24);

  /// IconData for the 'strokeRoundedBitcoinSend' icon.
  static const IconData bitcoinSend = HugeIconData(0x3c25);

  /// IconData for the 'strokeRoundedBitcoinSetting' icon.
  static const IconData bitcoinSetting = HugeIconData(0x3c26);

  /// IconData for the 'strokeRoundedBitcoinShield' icon.
  static const IconData bitcoinShield = HugeIconData(0x3c27);

  /// IconData for the 'strokeRoundedBitcoinShopping' icon.
  static const IconData bitcoinShopping = HugeIconData(0x3c28);

  /// IconData for the 'strokeRoundedBitcoinSmartphone01' icon.
  static const IconData bitcoinSmartphone01 = HugeIconData(0x3c29);

  /// IconData for the 'strokeRoundedBitcoinSmartphone02' icon.
  static const IconData bitcoinSmartphone02 = HugeIconData(0x3c2a);

  /// IconData for the 'strokeRoundedBitcoinSquare' icon.
  static const IconData bitcoinSquare = HugeIconData(0x3c2b);

  /// IconData for the 'strokeRoundedBitcoinStore' icon.
  static const IconData bitcoinStore = HugeIconData(0x3c2c);

  /// IconData for the 'strokeRoundedBitcoinTag' icon.
  static const IconData bitcoinTag = HugeIconData(0x3c2d);

  /// IconData for the 'strokeRoundedBitcoinTarget' icon.
  static const IconData bitcoinTarget = HugeIconData(0x3c2e);

  /// IconData for the 'strokeRoundedBitcoinTransaction' icon.
  static const IconData bitcoinTransaction = HugeIconData(0x3c2f);

  /// IconData for the 'strokeRoundedBitcoinUp01' icon.
  static const IconData bitcoinUp01 = HugeIconData(0x3c30);

  /// IconData for the 'strokeRoundedBitcoinUp02' icon.
  static const IconData bitcoinUp02 = HugeIconData(0x3c31);

  /// IconData for the 'strokeRoundedBitcoinWallet' icon.
  static const IconData bitcoinWallet = HugeIconData(0x3c32);

  /// IconData for the 'strokeRoundedBitcoinWithdraw' icon.
  static const IconData bitcoinWithdraw = HugeIconData(0x3c33);

  /// IconData for the 'strokeRoundedBitcoin' icon.
  static const IconData bitcoin = HugeIconData(0x3c34);

  /// IconData for the 'strokeRoundedBlackHole01' icon.
  static const IconData blackHole01 = HugeIconData(0x3c35);

  /// IconData for the 'strokeRoundedBlackHole' icon.
  static const IconData blackHole = HugeIconData(0x3c36);

  /// IconData for the 'strokeRoundedBlend' icon.
  static const IconData blend = HugeIconData(0x3c37);

  /// IconData for the 'strokeRoundedBlender' icon.
  static const IconData blender = HugeIconData(0x3c38);

  /// IconData for the 'strokeRoundedBlockGame' icon.
  static const IconData blockGame = HugeIconData(0x3c39);

  /// IconData for the 'strokeRoundedBlockchain01' icon.
  static const IconData blockchain01 = HugeIconData(0x3c3a);

  /// IconData for the 'strokeRoundedBlockchain02' icon.
  static const IconData blockchain02 = HugeIconData(0x3c3b);

  /// IconData for the 'strokeRoundedBlockchain03' icon.
  static const IconData blockchain03 = HugeIconData(0x3c3c);

  /// IconData for the 'strokeRoundedBlockchain04' icon.
  static const IconData blockchain04 = HugeIconData(0x3c3d);

  /// IconData for the 'strokeRoundedBlockchain05' icon.
  static const IconData blockchain05 = HugeIconData(0x3c3e);

  /// IconData for the 'strokeRoundedBlockchain06' icon.
  static const IconData blockchain06 = HugeIconData(0x3c3f);

  /// IconData for the 'strokeRoundedBlockchain07' icon.
  static const IconData blockchain07 = HugeIconData(0x3c40);

  /// IconData for the 'strokeRoundedBlocked' icon.
  static const IconData blocked = HugeIconData(0x3c41);

  /// IconData for the 'strokeRoundedBlogger' icon.
  static const IconData blogger = HugeIconData(0x3c42);

  /// IconData for the 'strokeRoundedBloodBag' icon.
  static const IconData bloodBag = HugeIconData(0x3c43);

  /// IconData for the 'strokeRoundedBloodBottle' icon.
  static const IconData bloodBottle = HugeIconData(0x3c44);

  /// IconData for the 'strokeRoundedBloodPressure' icon.
  static const IconData bloodPressure = HugeIconData(0x3c45);

  /// IconData for the 'strokeRoundedBloodType' icon.
  static const IconData bloodType = HugeIconData(0x3c46);

  /// IconData for the 'strokeRoundedBlood' icon.
  static const IconData blood = HugeIconData(0x3c47);

  /// IconData for the 'strokeRoundedBluetoothCircle' icon.
  static const IconData bluetoothCircle = HugeIconData(0x3c48);

  /// IconData for the 'strokeRoundedBluetoothNotConnected' icon.
  static const IconData bluetoothNotConnected = HugeIconData(0x3c49);

  /// IconData for the 'strokeRoundedBluetoothSearch' icon.
  static const IconData bluetoothSearch = HugeIconData(0x3c4a);

  /// IconData for the 'strokeRoundedBluetoothSquare' icon.
  static const IconData bluetoothSquare = HugeIconData(0x3c4b);

  /// IconData for the 'strokeRoundedBluetooth' icon.
  static const IconData bluetooth = HugeIconData(0x3c4c);

  /// IconData for the 'strokeRoundedBlur' icon.
  static const IconData blur = HugeIconData(0x3c4d);

  /// IconData for the 'strokeRoundedBlushBrush01' icon.
  static const IconData blushBrush01 = HugeIconData(0x3c4e);

  /// IconData for the 'strokeRoundedBlushBrush02' icon.
  static const IconData blushBrush02 = HugeIconData(0x3c4f);

  /// IconData for the 'strokeRoundedBoardMath' icon.
  static const IconData boardMath = HugeIconData(0x3c50);

  /// IconData for the 'strokeRoundedBoat' icon.
  static const IconData boat = HugeIconData(0x3c51);

  /// IconData for the 'strokeRoundedBodyArmor' icon.
  static const IconData bodyArmor = HugeIconData(0x3c52);

  /// IconData for the 'strokeRoundedBodyPartLeg' icon.
  static const IconData bodyPartLeg = HugeIconData(0x3c53);

  /// IconData for the 'strokeRoundedBodyPartMuscle' icon.
  static const IconData bodyPartMuscle = HugeIconData(0x3c54);

  /// IconData for the 'strokeRoundedBodyPartSixPack' icon.
  static const IconData bodyPartSixPack = HugeIconData(0x3c55);

  /// IconData for the 'strokeRoundedBodySoap' icon.
  static const IconData bodySoap = HugeIconData(0x3c56);

  /// IconData for the 'strokeRoundedBodyWeight' icon.
  static const IconData bodyWeight = HugeIconData(0x3c57);

  /// IconData for the 'strokeRoundedBomb' icon.
  static const IconData bomb = HugeIconData(0x3c58);

  /// IconData for the 'strokeRoundedBone01' icon.
  static const IconData bone01 = HugeIconData(0x3c59);

  /// IconData for the 'strokeRoundedBone02' icon.
  static const IconData bone02 = HugeIconData(0x3c5a);

  /// IconData for the 'strokeRoundedBook01' icon.
  static const IconData book01 = HugeIconData(0x3c5b);

  /// IconData for the 'strokeRoundedBook02' icon.
  static const IconData book02 = HugeIconData(0x3c5c);

  /// IconData for the 'strokeRoundedBook03' icon.
  static const IconData book03 = HugeIconData(0x3c5d);

  /// IconData for the 'strokeRoundedBook04' icon.
  static const IconData book04 = HugeIconData(0x3c5e);

  /// IconData for the 'strokeRoundedBookBookmark01' icon.
  static const IconData bookBookmark01 = HugeIconData(0x3c5f);

  /// IconData for the 'strokeRoundedBookBookmark02' icon.
  static const IconData bookBookmark02 = HugeIconData(0x3c60);

  /// IconData for the 'strokeRoundedBookDownload' icon.
  static const IconData bookDownload = HugeIconData(0x3c61);

  /// IconData for the 'strokeRoundedBookEdit' icon.
  static const IconData bookEdit = HugeIconData(0x3c62);

  /// IconData for the 'strokeRoundedBookOpen01' icon.
  static const IconData bookOpen01 = HugeIconData(0x3c63);

  /// IconData for the 'strokeRoundedBookOpen02' icon.
  static const IconData bookOpen02 = HugeIconData(0x3c64);

  /// IconData for the 'strokeRoundedBookUpload' icon.
  static const IconData bookUpload = HugeIconData(0x3c65);

  /// IconData for the 'strokeRoundedBookmark01' icon.
  static const IconData bookmark01 = HugeIconData(0x3c66);

  /// IconData for the 'strokeRoundedBookmark02' icon.
  static const IconData bookmark02 = HugeIconData(0x3c67);

  /// IconData for the 'strokeRoundedBookmark03' icon.
  static const IconData bookmark03 = HugeIconData(0x3c68);

  /// IconData for the 'strokeRoundedBookmarkAdd01' icon.
  static const IconData bookmarkAdd01 = HugeIconData(0x3c69);

  /// IconData for the 'strokeRoundedBookmarkAdd02' icon.
  static const IconData bookmarkAdd02 = HugeIconData(0x3c6a);

  /// IconData for the 'strokeRoundedBookmarkBlock01' icon.
  static const IconData bookmarkBlock01 = HugeIconData(0x3c6b);

  /// IconData for the 'strokeRoundedBookmarkBlock02' icon.
  static const IconData bookmarkBlock02 = HugeIconData(0x3c6c);

  /// IconData for the 'strokeRoundedBookmarkCheck01' icon.
  static const IconData bookmarkCheck01 = HugeIconData(0x3c6d);

  /// IconData for the 'strokeRoundedBookmarkCheck02' icon.
  static const IconData bookmarkCheck02 = HugeIconData(0x3c6e);

  /// IconData for the 'strokeRoundedBookmarkMinus01' icon.
  static const IconData bookmarkMinus01 = HugeIconData(0x3c6f);

  /// IconData for the 'strokeRoundedBookmarkMinus02' icon.
  static const IconData bookmarkMinus02 = HugeIconData(0x3c70);

  /// IconData for the 'strokeRoundedBookmarkOff01' icon.
  static const IconData bookmarkOff01 = HugeIconData(0x3c71);

  /// IconData for the 'strokeRoundedBookmarkOff02' icon.
  static const IconData bookmarkOff02 = HugeIconData(0x3c72);

  /// IconData for the 'strokeRoundedBookmarkRemove01' icon.
  static const IconData bookmarkRemove01 = HugeIconData(0x3c73);

  /// IconData for the 'strokeRoundedBookmarkRemove02' icon.
  static const IconData bookmarkRemove02 = HugeIconData(0x3c74);

  /// IconData for the 'strokeRoundedBooks01' icon.
  static const IconData books01 = HugeIconData(0x3c75);

  /// IconData for the 'strokeRoundedBooks02' icon.
  static const IconData books02 = HugeIconData(0x3c76);

  /// IconData for the 'strokeRoundedBookshelf01' icon.
  static const IconData bookshelf01 = HugeIconData(0x3c77);

  /// IconData for the 'strokeRoundedBookshelf02' icon.
  static const IconData bookshelf02 = HugeIconData(0x3c78);

  /// IconData for the 'strokeRoundedBookshelf03' icon.
  static const IconData bookshelf03 = HugeIconData(0x3c79);

  /// IconData for the 'strokeRoundedBootstrap' icon.
  static const IconData bootstrap = HugeIconData(0x3c7a);

  /// IconData for the 'strokeRoundedBorderAll01' icon.
  static const IconData borderAll01 = HugeIconData(0x3c7b);

  /// IconData for the 'strokeRoundedBorderAll02' icon.
  static const IconData borderAll02 = HugeIconData(0x3c7c);

  /// IconData for the 'strokeRoundedBorderBottom01' icon.
  static const IconData borderBottom01 = HugeIconData(0x3c7d);

  /// IconData for the 'strokeRoundedBorderBottom02' icon.
  static const IconData borderBottom02 = HugeIconData(0x3c7e);

  /// IconData for the 'strokeRoundedBorderFull' icon.
  static const IconData borderFull = HugeIconData(0x3c7f);

  /// IconData for the 'strokeRoundedBorderHorizontal' icon.
  static const IconData borderHorizontal = HugeIconData(0x3c80);

  /// IconData for the 'strokeRoundedBorderInner' icon.
  static const IconData borderInner = HugeIconData(0x3c81);

  /// IconData for the 'strokeRoundedBorderLeft01' icon.
  static const IconData borderLeft01 = HugeIconData(0x3c82);

  /// IconData for the 'strokeRoundedBorderLeft02' icon.
  static const IconData borderLeft02 = HugeIconData(0x3c83);

  /// IconData for the 'strokeRoundedBorderNone01' icon.
  static const IconData borderNone01 = HugeIconData(0x3c84);

  /// IconData for the 'strokeRoundedBorderNone02' icon.
  static const IconData borderNone02 = HugeIconData(0x3c85);

  /// IconData for the 'strokeRoundedBorderRight01' icon.
  static const IconData borderRight01 = HugeIconData(0x3c86);

  /// IconData for the 'strokeRoundedBorderRight02' icon.
  static const IconData borderRight02 = HugeIconData(0x3c87);

  /// IconData for the 'strokeRoundedBorderTop01' icon.
  static const IconData borderTop01 = HugeIconData(0x3c88);

  /// IconData for the 'strokeRoundedBorderTop02' icon.
  static const IconData borderTop02 = HugeIconData(0x3c89);

  /// IconData for the 'strokeRoundedBorderVertical' icon.
  static const IconData borderVertical = HugeIconData(0x3c8a);

  /// IconData for the 'strokeRoundedBorobudur' icon.
  static const IconData borobudur = HugeIconData(0x3c8b);

  /// IconData for the 'strokeRoundedBot' icon.
  static const IconData bot = HugeIconData(0x3c8c);

  /// IconData for the 'strokeRoundedBounceLeft' icon.
  static const IconData bounceLeft = HugeIconData(0x3c8d);

  /// IconData for the 'strokeRoundedBounceRight' icon.
  static const IconData bounceRight = HugeIconData(0x3c8e);

  /// IconData for the 'strokeRoundedBoundingBox' icon.
  static const IconData boundingBox = HugeIconData(0x3c8f);

  /// IconData for the 'strokeRoundedBowTie' icon.
  static const IconData bowTie = HugeIconData(0x3c90);

  /// IconData for the 'strokeRoundedBowlingPins' icon.
  static const IconData bowlingPins = HugeIconData(0x3c91);

  /// IconData for the 'strokeRoundedBowling' icon.
  static const IconData bowling = HugeIconData(0x3c92);

  /// IconData for the 'strokeRoundedBoxer' icon.
  static const IconData boxer = HugeIconData(0x3c93);

  /// IconData for the 'strokeRoundedBoxingBag' icon.
  static const IconData boxingBag = HugeIconData(0x3c94);

  /// IconData for the 'strokeRoundedBoxingGlove01' icon.
  static const IconData boxingGlove01 = HugeIconData(0x3c95);

  /// IconData for the 'strokeRoundedBoxingGlove' icon.
  static const IconData boxingGlove = HugeIconData(0x3c96);

  /// IconData for the 'strokeRoundedBrain01' icon.
  static const IconData brain01 = HugeIconData(0x3c97);

  /// IconData for the 'strokeRoundedBrain02' icon.
  static const IconData brain02 = HugeIconData(0x3c98);

  /// IconData for the 'strokeRoundedBrain' icon.
  static const IconData brain = HugeIconData(0x3c99);

  /// IconData for the 'strokeRoundedBrandfetch' icon.
  static const IconData brandfetch = HugeIconData(0x3c9a);

  /// IconData for the 'strokeRoundedBread01' icon.
  static const IconData bread01 = HugeIconData(0x3c9b);

  /// IconData for the 'strokeRoundedBread02' icon.
  static const IconData bread02 = HugeIconData(0x3c9c);

  /// IconData for the 'strokeRoundedBread03' icon.
  static const IconData bread03 = HugeIconData(0x3c9d);

  /// IconData for the 'strokeRoundedBread04' icon.
  static const IconData bread04 = HugeIconData(0x3c9e);

  /// IconData for the 'strokeRoundedBreastPump' icon.
  static const IconData breastPump = HugeIconData(0x3c9f);

  /// IconData for the 'strokeRoundedBridge' icon.
  static const IconData bridge = HugeIconData(0x3ca0);

  /// IconData for the 'strokeRoundedBriefcase01' icon.
  static const IconData briefcase01 = HugeIconData(0x3ca1);

  /// IconData for the 'strokeRoundedBriefcase02' icon.
  static const IconData briefcase02 = HugeIconData(0x3ca2);

  /// IconData for the 'strokeRoundedBriefcase03' icon.
  static const IconData briefcase03 = HugeIconData(0x3ca3);

  /// IconData for the 'strokeRoundedBriefcase04' icon.
  static const IconData briefcase04 = HugeIconData(0x3ca4);

  /// IconData for the 'strokeRoundedBriefcase05' icon.
  static const IconData briefcase05 = HugeIconData(0x3ca5);

  /// IconData for the 'strokeRoundedBriefcase06' icon.
  static const IconData briefcase06 = HugeIconData(0x3ca6);

  /// IconData for the 'strokeRoundedBriefcase07' icon.
  static const IconData briefcase07 = HugeIconData(0x3ca7);

  /// IconData for the 'strokeRoundedBriefcase08' icon.
  static const IconData briefcase08 = HugeIconData(0x3ca8);

  /// IconData for the 'strokeRoundedBriefcase09' icon.
  static const IconData briefcase09 = HugeIconData(0x3ca9);

  /// IconData for the 'strokeRoundedBriefcaseDollar' icon.
  static const IconData briefcaseDollar = HugeIconData(0x3caa);

  /// IconData for the 'strokeRoundedBroccoli' icon.
  static const IconData broccoli = HugeIconData(0x3cab);

  /// IconData for the 'strokeRoundedBrochure' icon.
  static const IconData brochure = HugeIconData(0x3cac);

  /// IconData for the 'strokeRoundedBrokenBone' icon.
  static const IconData brokenBone = HugeIconData(0x3cad);

  /// IconData for the 'strokeRoundedBrowser' icon.
  static const IconData browser = HugeIconData(0x3cae);

  /// IconData for the 'strokeRoundedBrush' icon.
  static const IconData brush = HugeIconData(0x3caf);

  /// IconData for the 'strokeRoundedBubbleChatAdd' icon.
  static const IconData bubbleChatAdd = HugeIconData(0x3cb0);

  /// IconData for the 'strokeRoundedBubbleChatBlocked' icon.
  static const IconData bubbleChatBlocked = HugeIconData(0x3cb1);

  /// IconData for the 'strokeRoundedBubbleChatCancel' icon.
  static const IconData bubbleChatCancel = HugeIconData(0x3cb2);

  /// IconData for the 'strokeRoundedBubbleChatDelay' icon.
  static const IconData bubbleChatDelay = HugeIconData(0x3cb3);

  /// IconData for the 'strokeRoundedBubbleChatDone' icon.
  static const IconData bubbleChatDone = HugeIconData(0x3cb4);

  /// IconData for the 'strokeRoundedBubbleChatDownload01' icon.
  static const IconData bubbleChatDownload01 = HugeIconData(0x3cb5);

  /// IconData for the 'strokeRoundedBubbleChatDownload02' icon.
  static const IconData bubbleChatDownload02 = HugeIconData(0x3cb6);

  /// IconData for the 'strokeRoundedBubbleChatEdit' icon.
  static const IconData bubbleChatEdit = HugeIconData(0x3cb7);

  /// IconData for the 'strokeRoundedBubbleChatFavourite' icon.
  static const IconData bubbleChatFavourite = HugeIconData(0x3cb8);

  /// IconData for the 'strokeRoundedBubbleChatIncome' icon.
  static const IconData bubbleChatIncome = HugeIconData(0x3cb9);

  /// IconData for the 'strokeRoundedBubbleChatLock' icon.
  static const IconData bubbleChatLock = HugeIconData(0x3cba);

  /// IconData for the 'strokeRoundedBubbleChatNotification' icon.
  static const IconData bubbleChatNotification = HugeIconData(0x3cbb);

  /// IconData for the 'strokeRoundedBubbleChatOutcome' icon.
  static const IconData bubbleChatOutcome = HugeIconData(0x3cbc);

  /// IconData for the 'strokeRoundedBubbleChatPreview' icon.
  static const IconData bubbleChatPreview = HugeIconData(0x3cbd);

  /// IconData for the 'strokeRoundedBubbleChatQuestion' icon.
  static const IconData bubbleChatQuestion = HugeIconData(0x3cbe);

  /// IconData for the 'strokeRoundedBubbleChatSearch' icon.
  static const IconData bubbleChatSearch = HugeIconData(0x3cbf);

  /// IconData for the 'strokeRoundedBubbleChatSecure' icon.
  static const IconData bubbleChatSecure = HugeIconData(0x3cc0);

  /// IconData for the 'strokeRoundedBubbleChatTranslate' icon.
  static const IconData bubbleChatTranslate = HugeIconData(0x3cc1);

  /// IconData for the 'strokeRoundedBubbleChatUnlock' icon.
  static const IconData bubbleChatUnlock = HugeIconData(0x3cc2);

  /// IconData for the 'strokeRoundedBubbleChatUpload' icon.
  static const IconData bubbleChatUpload = HugeIconData(0x3cc3);

  /// IconData for the 'strokeRoundedBubbleChatUser' icon.
  static const IconData bubbleChatUser = HugeIconData(0x3cc4);

  /// IconData for the 'strokeRoundedBubbleChat' icon.
  static const IconData bubbleChat = HugeIconData(0x3cc5);

  /// IconData for the 'strokeRoundedBubbleTea01' icon.
  static const IconData bubbleTea01 = HugeIconData(0x3cc6);

  /// IconData for the 'strokeRoundedBubbleTea02' icon.
  static const IconData bubbleTea02 = HugeIconData(0x3cc7);

  /// IconData for the 'strokeRoundedBug01' icon.
  static const IconData bug01 = HugeIconData(0x3cc8);

  /// IconData for the 'strokeRoundedBug02' icon.
  static const IconData bug02 = HugeIconData(0x3cc9);

  /// IconData for the 'strokeRoundedBuilding01' icon.
  static const IconData building01 = HugeIconData(0x3cca);

  /// IconData for the 'strokeRoundedBuilding02' icon.
  static const IconData building02 = HugeIconData(0x3ccb);

  /// IconData for the 'strokeRoundedBuilding03' icon.
  static const IconData building03 = HugeIconData(0x3ccc);

  /// IconData for the 'strokeRoundedBuilding04' icon.
  static const IconData building04 = HugeIconData(0x3ccd);

  /// IconData for the 'strokeRoundedBuilding05' icon.
  static const IconData building05 = HugeIconData(0x3cce);

  /// IconData for the 'strokeRoundedBuilding06' icon.
  static const IconData building06 = HugeIconData(0x3ccf);

  /// IconData for the 'strokeRoundedBulbCharging' icon.
  static const IconData bulbCharging = HugeIconData(0x3cd0);

  /// IconData for the 'strokeRoundedBulb' icon.
  static const IconData bulb = HugeIconData(0x3cd1);

  /// IconData for the 'strokeRoundedBulletproofVest' icon.
  static const IconData bulletproofVest = HugeIconData(0x3cd2);

  /// IconData for the 'strokeRoundedBurjAlArab' icon.
  static const IconData burjAlArab = HugeIconData(0x3cd3);

  /// IconData for the 'strokeRoundedBurningCd' icon.
  static const IconData burningCd = HugeIconData(0x3cd4);

  /// IconData for the 'strokeRoundedBus01' icon.
  static const IconData bus01 = HugeIconData(0x3cd5);

  /// IconData for the 'strokeRoundedBus02' icon.
  static const IconData bus02 = HugeIconData(0x3cd6);

  /// IconData for the 'strokeRoundedBus03' icon.
  static const IconData bus03 = HugeIconData(0x3cd7);

  /// IconData for the 'strokeRoundedCProgramming' icon.
  static const IconData cProgramming = HugeIconData(0x3cd8);

  /// IconData for the 'strokeRoundedCabinet01' icon.
  static const IconData cabinet01 = HugeIconData(0x3cd9);

  /// IconData for the 'strokeRoundedCabinet02' icon.
  static const IconData cabinet02 = HugeIconData(0x3cda);

  /// IconData for the 'strokeRoundedCabinet03' icon.
  static const IconData cabinet03 = HugeIconData(0x3cdb);

  /// IconData for the 'strokeRoundedCabinet04' icon.
  static const IconData cabinet04 = HugeIconData(0x3cdc);

  /// IconData for the 'strokeRoundedCableCar' icon.
  static const IconData cableCar = HugeIconData(0x3cdd);

  /// IconData for the 'strokeRoundedCactus' icon.
  static const IconData cactus = HugeIconData(0x3cde);

  /// IconData for the 'strokeRoundedCaduceus' icon.
  static const IconData caduceus = HugeIconData(0x3cdf);

  /// IconData for the 'strokeRoundedCafe' icon.
  static const IconData cafe = HugeIconData(0x3ce0);

  /// IconData for the 'strokeRoundedCalculate' icon.
  static const IconData calculate = HugeIconData(0x3ce1);

  /// IconData for the 'strokeRoundedCalculator01' icon.
  static const IconData calculator01 = HugeIconData(0x3ce2);

  /// IconData for the 'strokeRoundedCalculator' icon.
  static const IconData calculator = HugeIconData(0x3ce3);

  /// IconData for the 'strokeRoundedCalendar01' icon.
  static const IconData calendar01 = HugeIconData(0x3ce4);

  /// IconData for the 'strokeRoundedCalendar02' icon.
  static const IconData calendar02 = HugeIconData(0x3ce5);

  /// IconData for the 'strokeRoundedCalendar03' icon.
  static const IconData calendar03 = HugeIconData(0x3ce6);

  /// IconData for the 'strokeRoundedCalendar04' icon.
  static const IconData calendar04 = HugeIconData(0x3ce7);

  /// IconData for the 'strokeRoundedCalendarAdd01' icon.
  static const IconData calendarAdd01 = HugeIconData(0x3ce8);

  /// IconData for the 'strokeRoundedCalendarAdd02' icon.
  static const IconData calendarAdd02 = HugeIconData(0x3ce9);

  /// IconData for the 'strokeRoundedCalendarBlock01' icon.
  static const IconData calendarBlock01 = HugeIconData(0x3cea);

  /// IconData for the 'strokeRoundedCalendarBlock02' icon.
  static const IconData calendarBlock02 = HugeIconData(0x3ceb);

  /// IconData for the 'strokeRoundedCalendarCheckIn01' icon.
  static const IconData calendarCheckIn01 = HugeIconData(0x3cec);

  /// IconData for the 'strokeRoundedCalendarCheckIn02' icon.
  static const IconData calendarCheckIn02 = HugeIconData(0x3ced);

  /// IconData for the 'strokeRoundedCalendarCheckOut01' icon.
  static const IconData calendarCheckOut01 = HugeIconData(0x3cee);

  /// IconData for the 'strokeRoundedCalendarCheckOut02' icon.
  static const IconData calendarCheckOut02 = HugeIconData(0x3cef);

  /// IconData for the 'strokeRoundedCalendarDownload01' icon.
  static const IconData calendarDownload01 = HugeIconData(0x3cf0);

  /// IconData for the 'strokeRoundedCalendarDownload02' icon.
  static const IconData calendarDownload02 = HugeIconData(0x3cf1);

  /// IconData for the 'strokeRoundedCalendarFavorite01' icon.
  static const IconData calendarFavorite01 = HugeIconData(0x3cf2);

  /// IconData for the 'strokeRoundedCalendarFavorite02' icon.
  static const IconData calendarFavorite02 = HugeIconData(0x3cf3);

  /// IconData for the 'strokeRoundedCalendarLock01' icon.
  static const IconData calendarLock01 = HugeIconData(0x3cf4);

  /// IconData for the 'strokeRoundedCalendarLock02' icon.
  static const IconData calendarLock02 = HugeIconData(0x3cf5);

  /// IconData for the 'strokeRoundedCalendarLove01' icon.
  static const IconData calendarLove01 = HugeIconData(0x3cf6);

  /// IconData for the 'strokeRoundedCalendarLove02' icon.
  static const IconData calendarLove02 = HugeIconData(0x3cf7);

  /// IconData for the 'strokeRoundedCalendarMinus01' icon.
  static const IconData calendarMinus01 = HugeIconData(0x3cf8);

  /// IconData for the 'strokeRoundedCalendarMinus02' icon.
  static const IconData calendarMinus02 = HugeIconData(0x3cf9);

  /// IconData for the 'strokeRoundedCalendarRemove01' icon.
  static const IconData calendarRemove01 = HugeIconData(0x3cfa);

  /// IconData for the 'strokeRoundedCalendarRemove02' icon.
  static const IconData calendarRemove02 = HugeIconData(0x3cfb);

  /// IconData for the 'strokeRoundedCalendarSetting01' icon.
  static const IconData calendarSetting01 = HugeIconData(0x3cfc);

  /// IconData for the 'strokeRoundedCalendarSetting02' icon.
  static const IconData calendarSetting02 = HugeIconData(0x3cfd);

  /// IconData for the 'strokeRoundedCalendarUpload01' icon.
  static const IconData calendarUpload01 = HugeIconData(0x3cfe);

  /// IconData for the 'strokeRoundedCalendarUpload02' icon.
  static const IconData calendarUpload02 = HugeIconData(0x3cff);

  /// IconData for the 'strokeRoundedCall02' icon.
  static const IconData call02 = HugeIconData(0x3d00);

  /// IconData for the 'strokeRoundedCallAdd02' icon.
  static const IconData callAdd02 = HugeIconData(0x3d01);

  /// IconData for the 'strokeRoundedCallAdd' icon.
  static const IconData callAdd = HugeIconData(0x3d02);

  /// IconData for the 'strokeRoundedCallBlocked02' icon.
  static const IconData callBlocked02 = HugeIconData(0x3d03);

  /// IconData for the 'strokeRoundedCallBlocked' icon.
  static const IconData callBlocked = HugeIconData(0x3d04);

  /// IconData for the 'strokeRoundedCallDisabled02' icon.
  static const IconData callDisabled02 = HugeIconData(0x3d05);

  /// IconData for the 'strokeRoundedCallDisabled' icon.
  static const IconData callDisabled = HugeIconData(0x3d06);

  /// IconData for the 'strokeRoundedCallDone02' icon.
  static const IconData callDone02 = HugeIconData(0x3d07);

  /// IconData for the 'strokeRoundedCallDone' icon.
  static const IconData callDone = HugeIconData(0x3d08);

  /// IconData for the 'strokeRoundedCallEnd01' icon.
  static const IconData callEnd01 = HugeIconData(0x3d09);

  /// IconData for the 'strokeRoundedCallEnd02' icon.
  static const IconData callEnd02 = HugeIconData(0x3d0a);

  /// IconData for the 'strokeRoundedCallEnd03' icon.
  static const IconData callEnd03 = HugeIconData(0x3d0b);

  /// IconData for the 'strokeRoundedCallEnd04' icon.
  static const IconData callEnd04 = HugeIconData(0x3d0c);

  /// IconData for the 'strokeRoundedCallIncoming01' icon.
  static const IconData callIncoming01 = HugeIconData(0x3d0d);

  /// IconData for the 'strokeRoundedCallIncoming02' icon.
  static const IconData callIncoming02 = HugeIconData(0x3d0e);

  /// IconData for the 'strokeRoundedCallIncoming03' icon.
  static const IconData callIncoming03 = HugeIconData(0x3d0f);

  /// IconData for the 'strokeRoundedCallIncoming04' icon.
  static const IconData callIncoming04 = HugeIconData(0x3d10);

  /// IconData for the 'strokeRoundedCallInternal02' icon.
  static const IconData callInternal02 = HugeIconData(0x3d11);

  /// IconData for the 'strokeRoundedCallInternal' icon.
  static const IconData callInternal = HugeIconData(0x3d12);

  /// IconData for the 'strokeRoundedCallLocked02' icon.
  static const IconData callLocked02 = HugeIconData(0x3d13);

  /// IconData for the 'strokeRoundedCallLocked' icon.
  static const IconData callLocked = HugeIconData(0x3d14);

  /// IconData for the 'strokeRoundedCallMinus02' icon.
  static const IconData callMinus02 = HugeIconData(0x3d15);

  /// IconData for the 'strokeRoundedCallMinus' icon.
  static const IconData callMinus = HugeIconData(0x3d16);

  /// IconData for the 'strokeRoundedCallMissed01' icon.
  static const IconData callMissed01 = HugeIconData(0x3d17);

  /// IconData for the 'strokeRoundedCallMissed02' icon.
  static const IconData callMissed02 = HugeIconData(0x3d18);

  /// IconData for the 'strokeRoundedCallMissed03' icon.
  static const IconData callMissed03 = HugeIconData(0x3d19);

  /// IconData for the 'strokeRoundedCallMissed04' icon.
  static const IconData callMissed04 = HugeIconData(0x3d1a);

  /// IconData for the 'strokeRoundedCallOutgoing01' icon.
  static const IconData callOutgoing01 = HugeIconData(0x3d1b);

  /// IconData for the 'strokeRoundedCallOutgoing02' icon.
  static const IconData callOutgoing02 = HugeIconData(0x3d1c);

  /// IconData for the 'strokeRoundedCallOutgoing03' icon.
  static const IconData callOutgoing03 = HugeIconData(0x3d1d);

  /// IconData for the 'strokeRoundedCallOutgoing04' icon.
  static const IconData callOutgoing04 = HugeIconData(0x3d1e);

  /// IconData for the 'strokeRoundedCallPaused02' icon.
  static const IconData callPaused02 = HugeIconData(0x3d1f);

  /// IconData for the 'strokeRoundedCallPaused' icon.
  static const IconData callPaused = HugeIconData(0x3d20);

  /// IconData for the 'strokeRoundedCallReceived02' icon.
  static const IconData callReceived02 = HugeIconData(0x3d21);

  /// IconData for the 'strokeRoundedCallReceived' icon.
  static const IconData callReceived = HugeIconData(0x3d22);

  /// IconData for the 'strokeRoundedCallRinging01' icon.
  static const IconData callRinging01 = HugeIconData(0x3d23);

  /// IconData for the 'strokeRoundedCallRinging02' icon.
  static const IconData callRinging02 = HugeIconData(0x3d24);

  /// IconData for the 'strokeRoundedCallRinging03' icon.
  static const IconData callRinging03 = HugeIconData(0x3d25);

  /// IconData for the 'strokeRoundedCallRinging04' icon.
  static const IconData callRinging04 = HugeIconData(0x3d26);

  /// IconData for the 'strokeRoundedCallUnlocked02' icon.
  static const IconData callUnlocked02 = HugeIconData(0x3d27);

  /// IconData for the 'strokeRoundedCallUnlocked' icon.
  static const IconData callUnlocked = HugeIconData(0x3d28);

  /// IconData for the 'strokeRoundedCall' icon.
  static const IconData call = HugeIconData(0x3d29);

  /// IconData for the 'strokeRoundedCalling02' icon.
  static const IconData calling02 = HugeIconData(0x3d2a);

  /// IconData for the 'strokeRoundedCalling' icon.
  static const IconData calling = HugeIconData(0x3d2b);

  /// IconData for the 'strokeRoundedCamel' icon.
  static const IconData camel = HugeIconData(0x3d2c);

  /// IconData for the 'strokeRoundedCamera01' icon.
  static const IconData camera01 = HugeIconData(0x3d2d);

  /// IconData for the 'strokeRoundedCamera02' icon.
  static const IconData camera02 = HugeIconData(0x3d2e);

  /// IconData for the 'strokeRoundedCameraAdd01' icon.
  static const IconData cameraAdd01 = HugeIconData(0x3d2f);

  /// IconData for the 'strokeRoundedCameraAdd02' icon.
  static const IconData cameraAdd02 = HugeIconData(0x3d30);

  /// IconData for the 'strokeRoundedCameraAutomatically01' icon.
  static const IconData cameraAutomatically01 = HugeIconData(0x3d31);

  /// IconData for the 'strokeRoundedCameraAutomatically02' icon.
  static const IconData cameraAutomatically02 = HugeIconData(0x3d32);

  /// IconData for the 'strokeRoundedCameraLens' icon.
  static const IconData cameraLens = HugeIconData(0x3d33);

  /// IconData for the 'strokeRoundedCameraMicrophone01' icon.
  static const IconData cameraMicrophone01 = HugeIconData(0x3d34);

  /// IconData for the 'strokeRoundedCameraMicrophone02' icon.
  static const IconData cameraMicrophone02 = HugeIconData(0x3d35);

  /// IconData for the 'strokeRoundedCameraNightMode01' icon.
  static const IconData cameraNightMode01 = HugeIconData(0x3d36);

  /// IconData for the 'strokeRoundedCameraNightMode02' icon.
  static const IconData cameraNightMode02 = HugeIconData(0x3d37);

  /// IconData for the 'strokeRoundedCameraOff01' icon.
  static const IconData cameraOff01 = HugeIconData(0x3d38);

  /// IconData for the 'strokeRoundedCameraOff02' icon.
  static const IconData cameraOff02 = HugeIconData(0x3d39);

  /// IconData for the 'strokeRoundedCameraRotated01' icon.
  static const IconData cameraRotated01 = HugeIconData(0x3d3a);

  /// IconData for the 'strokeRoundedCameraRotated02' icon.
  static const IconData cameraRotated02 = HugeIconData(0x3d3b);

  /// IconData for the 'strokeRoundedCameraSmile01' icon.
  static const IconData cameraSmile01 = HugeIconData(0x3d3c);

  /// IconData for the 'strokeRoundedCameraSmile02' icon.
  static const IconData cameraSmile02 = HugeIconData(0x3d3d);

  /// IconData for the 'strokeRoundedCameraTripod' icon.
  static const IconData cameraTripod = HugeIconData(0x3d3e);

  /// IconData for the 'strokeRoundedCameraVideo' icon.
  static const IconData cameraVideo = HugeIconData(0x3d3f);

  /// IconData for the 'strokeRoundedCamper' icon.
  static const IconData camper = HugeIconData(0x3d40);

  /// IconData for the 'strokeRoundedCampfire' icon.
  static const IconData campfire = HugeIconData(0x3d41);

  /// IconData for the 'strokeRoundedCancel01' icon.
  static const IconData cancel01 = HugeIconData(0x3d42);

  /// IconData for the 'strokeRoundedCancel02' icon.
  static const IconData cancel02 = HugeIconData(0x3d43);

  /// IconData for the 'strokeRoundedCancelCircleHalfDot' icon.
  static const IconData cancelCircleHalfDot = HugeIconData(0x3d44);

  /// IconData for the 'strokeRoundedCancelCircle' icon.
  static const IconData cancelCircle = HugeIconData(0x3d45);

  /// IconData for the 'strokeRoundedCancelSquare' icon.
  static const IconData cancelSquare = HugeIconData(0x3d46);

  /// IconData for the 'strokeRoundedCandelier01' icon.
  static const IconData candelier01 = HugeIconData(0x3d47);

  /// IconData for the 'strokeRoundedCandelier02' icon.
  static const IconData candelier02 = HugeIconData(0x3d48);

  /// IconData for the 'strokeRoundedCanvas' icon.
  static const IconData canvas = HugeIconData(0x3d49);

  /// IconData for the 'strokeRoundedCapProjecting' icon.
  static const IconData capProjecting = HugeIconData(0x3d4a);

  /// IconData for the 'strokeRoundedCapRound' icon.
  static const IconData capRound = HugeIconData(0x3d4b);

  /// IconData for the 'strokeRoundedCapStraight' icon.
  static const IconData capStraight = HugeIconData(0x3d4c);

  /// IconData for the 'strokeRoundedCap' icon.
  static const IconData cap = HugeIconData(0x3d4d);

  /// IconData for the 'strokeRoundedCapcutRectangle' icon.
  static const IconData capcutRectangle = HugeIconData(0x3d4e);

  /// IconData for the 'strokeRoundedCapcut' icon.
  static const IconData capcut = HugeIconData(0x3d4f);

  /// IconData for the 'strokeRoundedCar01' icon.
  static const IconData car01 = HugeIconData(0x3d50);

  /// IconData for the 'strokeRoundedCar02' icon.
  static const IconData car02 = HugeIconData(0x3d51);

  /// IconData for the 'strokeRoundedCar03' icon.
  static const IconData car03 = HugeIconData(0x3d52);

  /// IconData for the 'strokeRoundedCar04' icon.
  static const IconData car04 = HugeIconData(0x3d53);

  /// IconData for the 'strokeRoundedCarParking01' icon.
  static const IconData carParking01 = HugeIconData(0x3d54);

  /// IconData for the 'strokeRoundedCarParking02' icon.
  static const IconData carParking02 = HugeIconData(0x3d55);

  /// IconData for the 'strokeRoundedCaravan' icon.
  static const IconData caravan = HugeIconData(0x3d56);

  /// IconData for the 'strokeRoundedCardExchange01' icon.
  static const IconData cardExchange01 = HugeIconData(0x3d57);

  /// IconData for the 'strokeRoundedCardExchange02' icon.
  static const IconData cardExchange02 = HugeIconData(0x3d58);

  /// IconData for the 'strokeRoundedCardigan' icon.
  static const IconData cardigan = HugeIconData(0x3d59);

  /// IconData for the 'strokeRoundedCardiogram01' icon.
  static const IconData cardiogram01 = HugeIconData(0x3d5a);

  /// IconData for the 'strokeRoundedCardiogram02' icon.
  static const IconData cardiogram02 = HugeIconData(0x3d5b);

  /// IconData for the 'strokeRoundedCards01' icon.
  static const IconData cards01 = HugeIconData(0x3d5c);

  /// IconData for the 'strokeRoundedCards02' icon.
  static const IconData cards02 = HugeIconData(0x3d5d);

  /// IconData for the 'strokeRoundedCargoShip' icon.
  static const IconData cargoShip = HugeIconData(0x3d5e);

  /// IconData for the 'strokeRoundedCarouselHorizontal02' icon.
  static const IconData carouselHorizontal02 = HugeIconData(0x3d5f);

  /// IconData for the 'strokeRoundedCarouselHorizontal' icon.
  static const IconData carouselHorizontal = HugeIconData(0x3d60);

  /// IconData for the 'strokeRoundedCarouselVertical' icon.
  static const IconData carouselVertical = HugeIconData(0x3d61);

  /// IconData for the 'strokeRoundedCarrot' icon.
  static const IconData carrot = HugeIconData(0x3d62);

  /// IconData for the 'strokeRoundedCash01' icon.
  static const IconData cash01 = HugeIconData(0x3d63);

  /// IconData for the 'strokeRoundedCash02' icon.
  static const IconData cash02 = HugeIconData(0x3d64);

  /// IconData for the 'strokeRoundedCashback' icon.
  static const IconData cashback = HugeIconData(0x3d65);

  /// IconData for the 'strokeRoundedCashier02' icon.
  static const IconData cashier02 = HugeIconData(0x3d66);

  /// IconData for the 'strokeRoundedCashier' icon.
  static const IconData cashier = HugeIconData(0x3d67);

  /// IconData for the 'strokeRoundedCastle01' icon.
  static const IconData castle01 = HugeIconData(0x3d68);

  /// IconData for the 'strokeRoundedCastle02' icon.
  static const IconData castle02 = HugeIconData(0x3d69);

  /// IconData for the 'strokeRoundedCastle' icon.
  static const IconData castle = HugeIconData(0x3d6a);

  /// IconData for the 'strokeRoundedCatalogue' icon.
  static const IconData catalogue = HugeIconData(0x3d6b);

  /// IconData for the 'strokeRoundedCayanTower' icon.
  static const IconData cayanTower = HugeIconData(0x3d6c);

  /// IconData for the 'strokeRoundedCctvCamera' icon.
  static const IconData cctvCamera = HugeIconData(0x3d6d);

  /// IconData for the 'strokeRoundedCd' icon.
  static const IconData cd = HugeIconData(0x3d6e);

  /// IconData for the 'strokeRoundedCells' icon.
  static const IconData cells = HugeIconData(0x3d6f);

  /// IconData for the 'strokeRoundedCellularNetworkOffline' icon.
  static const IconData cellularNetworkOffline = HugeIconData(0x3d70);

  /// IconData for the 'strokeRoundedCellularNetwork' icon.
  static const IconData cellularNetwork = HugeIconData(0x3d71);

  /// IconData for the 'strokeRoundedCelsius' icon.
  static const IconData celsius = HugeIconData(0x3d72);

  /// IconData for the 'strokeRoundedCenterFocus' icon.
  static const IconData centerFocus = HugeIconData(0x3d73);

  /// IconData for the 'strokeRoundedCentralShaheedMinar' icon.
  static const IconData centralShaheedMinar = HugeIconData(0x3d74);

  /// IconData for the 'strokeRoundedCentralized' icon.
  static const IconData centralized = HugeIconData(0x3d75);

  /// IconData for the 'strokeRoundedCertificate01' icon.
  static const IconData certificate01 = HugeIconData(0x3d76);

  /// IconData for the 'strokeRoundedCertificate02' icon.
  static const IconData certificate02 = HugeIconData(0x3d77);

  /// IconData for the 'strokeRoundedChair01' icon.
  static const IconData chair01 = HugeIconData(0x3d78);

  /// IconData for the 'strokeRoundedChair02' icon.
  static const IconData chair02 = HugeIconData(0x3d79);

  /// IconData for the 'strokeRoundedChair03' icon.
  static const IconData chair03 = HugeIconData(0x3d7a);

  /// IconData for the 'strokeRoundedChair04' icon.
  static const IconData chair04 = HugeIconData(0x3d7b);

  /// IconData for the 'strokeRoundedChair05' icon.
  static const IconData chair05 = HugeIconData(0x3d7c);

  /// IconData for the 'strokeRoundedChairBarber' icon.
  static const IconData chairBarber = HugeIconData(0x3d7d);

  /// IconData for the 'strokeRoundedChampion' icon.
  static const IconData champion = HugeIconData(0x3d7e);

  /// IconData for the 'strokeRoundedChangeScreenMode' icon.
  static const IconData changeScreenMode = HugeIconData(0x3d7f);

  /// IconData for the 'strokeRoundedCharacterPhonetic' icon.
  static const IconData characterPhonetic = HugeIconData(0x3d80);

  /// IconData for the 'strokeRoundedCharity' icon.
  static const IconData charity = HugeIconData(0x3d81);

  /// IconData for the 'strokeRoundedChartAverage' icon.
  static const IconData chartAverage = HugeIconData(0x3d82);

  /// IconData for the 'strokeRoundedChartBarLine' icon.
  static const IconData chartBarLine = HugeIconData(0x3d83);

  /// IconData for the 'strokeRoundedChartBreakoutCircle' icon.
  static const IconData chartBreakoutCircle = HugeIconData(0x3d84);

  /// IconData for the 'strokeRoundedChartBreakoutSquare' icon.
  static const IconData chartBreakoutSquare = HugeIconData(0x3d85);

  /// IconData for the 'strokeRoundedChartBubble01' icon.
  static const IconData chartBubble01 = HugeIconData(0x3d86);

  /// IconData for the 'strokeRoundedChartBubble02' icon.
  static const IconData chartBubble02 = HugeIconData(0x3d87);

  /// IconData for the 'strokeRoundedChartColumn' icon.
  static const IconData chartColumn = HugeIconData(0x3d88);

  /// IconData for the 'strokeRoundedChartDecrease' icon.
  static const IconData chartDecrease = HugeIconData(0x3d89);

  /// IconData for the 'strokeRoundedChartEvaluation' icon.
  static const IconData chartEvaluation = HugeIconData(0x3d8a);

  /// IconData for the 'strokeRoundedChartHighLow' icon.
  static const IconData chartHighLow = HugeIconData(0x3d8b);

  /// IconData for the 'strokeRoundedChartHistogram' icon.
  static const IconData chartHistogram = HugeIconData(0x3d8c);

  /// IconData for the 'strokeRoundedChartIncrease' icon.
  static const IconData chartIncrease = HugeIconData(0x3d8d);

  /// IconData for the 'strokeRoundedChartLineData01' icon.
  static const IconData chartLineData01 = HugeIconData(0x3d8e);

  /// IconData for the 'strokeRoundedChartLineData02' icon.
  static const IconData chartLineData02 = HugeIconData(0x3d8f);

  /// IconData for the 'strokeRoundedChartLineData03' icon.
  static const IconData chartLineData03 = HugeIconData(0x3d90);

  /// IconData for the 'strokeRoundedChartMaximum' icon.
  static const IconData chartMaximum = HugeIconData(0x3d91);

  /// IconData for the 'strokeRoundedChartMedium' icon.
  static const IconData chartMedium = HugeIconData(0x3d92);

  /// IconData for the 'strokeRoundedChartMinimum' icon.
  static const IconData chartMinimum = HugeIconData(0x3d93);

  /// IconData for the 'strokeRoundedChartRadar' icon.
  static const IconData chartRadar = HugeIconData(0x3d94);

  /// IconData for the 'strokeRoundedChartRelationship' icon.
  static const IconData chartRelationship = HugeIconData(0x3d95);

  /// IconData for the 'strokeRoundedChartRing' icon.
  static const IconData chartRing = HugeIconData(0x3d96);

  /// IconData for the 'strokeRoundedChartRose' icon.
  static const IconData chartRose = HugeIconData(0x3d97);

  /// IconData for the 'strokeRoundedChartScatter' icon.
  static const IconData chartScatter = HugeIconData(0x3d98);

  /// IconData for the 'strokeRoundedChart' icon.
  static const IconData chart = HugeIconData(0x3d99);

  /// IconData for the 'strokeRoundedChatBot' icon.
  static const IconData chatBot = HugeIconData(0x3d9a);

  /// IconData for the 'strokeRoundedChatGpt' icon.
  static const IconData chatGpt = HugeIconData(0x3d9b);

  /// IconData for the 'strokeRoundedChatting01' icon.
  static const IconData chatting01 = HugeIconData(0x3d9c);

  /// IconData for the 'strokeRoundedCheckList' icon.
  static const IconData checkList = HugeIconData(0x3d9d);

  /// IconData for the 'strokeRoundedCheckUnread01' icon.
  static const IconData checkUnread01 = HugeIconData(0x3d9e);

  /// IconData for the 'strokeRoundedCheckUnread02' icon.
  static const IconData checkUnread02 = HugeIconData(0x3d9f);

  /// IconData for the 'strokeRoundedCheckUnread03' icon.
  static const IconData checkUnread03 = HugeIconData(0x3da0);

  /// IconData for the 'strokeRoundedCheckUnread04' icon.
  static const IconData checkUnread04 = HugeIconData(0x3da1);

  /// IconData for the 'strokeRoundedCheckmarkBadge01' icon.
  static const IconData checkmarkBadge01 = HugeIconData(0x3da2);

  /// IconData for the 'strokeRoundedCheckmarkBadge02' icon.
  static const IconData checkmarkBadge02 = HugeIconData(0x3da3);

  /// IconData for the 'strokeRoundedCheckmarkBadge03' icon.
  static const IconData checkmarkBadge03 = HugeIconData(0x3da4);

  /// IconData for the 'strokeRoundedCheckmarkBadge04' icon.
  static const IconData checkmarkBadge04 = HugeIconData(0x3da5);

  /// IconData for the 'strokeRoundedCheckmarkCircle01' icon.
  static const IconData checkmarkCircle01 = HugeIconData(0x3da6);

  /// IconData for the 'strokeRoundedCheckmarkCircle02' icon.
  static const IconData checkmarkCircle02 = HugeIconData(0x3da7);

  /// IconData for the 'strokeRoundedCheckmarkCircle03' icon.
  static const IconData checkmarkCircle03 = HugeIconData(0x3da8);

  /// IconData for the 'strokeRoundedCheckmarkCircle04' icon.
  static const IconData checkmarkCircle04 = HugeIconData(0x3da9);

  /// IconData for the 'strokeRoundedCheckmarkSquare01' icon.
  static const IconData checkmarkSquare01 = HugeIconData(0x3daa);

  /// IconData for the 'strokeRoundedCheckmarkSquare02' icon.
  static const IconData checkmarkSquare02 = HugeIconData(0x3dab);

  /// IconData for the 'strokeRoundedCheckmarkSquare03' icon.
  static const IconData checkmarkSquare03 = HugeIconData(0x3dac);

  /// IconData for the 'strokeRoundedCheckmarkSquare04' icon.
  static const IconData checkmarkSquare04 = HugeIconData(0x3dad);

  /// IconData for the 'strokeRoundedCheeseCake01' icon.
  static const IconData cheeseCake01 = HugeIconData(0x3dae);

  /// IconData for the 'strokeRoundedCheeseCake02' icon.
  static const IconData cheeseCake02 = HugeIconData(0x3daf);

  /// IconData for the 'strokeRoundedCheese' icon.
  static const IconData cheese = HugeIconData(0x3db0);

  /// IconData for the 'strokeRoundedChefHat' icon.
  static const IconData chefHat = HugeIconData(0x3db1);

  /// IconData for the 'strokeRoundedChef' icon.
  static const IconData chef = HugeIconData(0x3db2);

  /// IconData for the 'strokeRoundedChemistry01' icon.
  static const IconData chemistry01 = HugeIconData(0x3db3);

  /// IconData for the 'strokeRoundedChemistry02' icon.
  static const IconData chemistry02 = HugeIconData(0x3db4);

  /// IconData for the 'strokeRoundedChemistry03' icon.
  static const IconData chemistry03 = HugeIconData(0x3db5);

  /// IconData for the 'strokeRoundedCherry' icon.
  static const IconData cherry = HugeIconData(0x3db6);

  /// IconData for the 'strokeRoundedChess01' icon.
  static const IconData chess01 = HugeIconData(0x3db7);

  /// IconData for the 'strokeRoundedChess02' icon.
  static const IconData chess02 = HugeIconData(0x3db8);

  /// IconData for the 'strokeRoundedChessPawn' icon.
  static const IconData chessPawn = HugeIconData(0x3db9);

  /// IconData for the 'strokeRoundedChickenThighs' icon.
  static const IconData chickenThighs = HugeIconData(0x3dba);

  /// IconData for the 'strokeRoundedChimney' icon.
  static const IconData chimney = HugeIconData(0x3dbb);

  /// IconData for the 'strokeRoundedChinaTemple' icon.
  static const IconData chinaTemple = HugeIconData(0x3dbc);

  /// IconData for the 'strokeRoundedChip02' icon.
  static const IconData chip02 = HugeIconData(0x3dbd);

  /// IconData for the 'strokeRoundedChip' icon.
  static const IconData chip = HugeIconData(0x3dbe);

  /// IconData for the 'strokeRoundedChocolate' icon.
  static const IconData chocolate = HugeIconData(0x3dbf);

  /// IconData for the 'strokeRoundedChrome' icon.
  static const IconData chrome = HugeIconData(0x3dc0);

  /// IconData for the 'strokeRoundedChrysler' icon.
  static const IconData chrysler = HugeIconData(0x3dc1);

  /// IconData for the 'strokeRoundedChurch' icon.
  static const IconData church = HugeIconData(0x3dc2);

  /// IconData for the 'strokeRoundedCinnamonRoll' icon.
  static const IconData cinnamonRoll = HugeIconData(0x3dc3);

  /// IconData for the 'strokeRoundedCircleArrowDataTransferDiagonal' icon.
  static const IconData circleArrowDataTransferDiagonal = HugeIconData(0x3dc4);

  /// IconData for the 'strokeRoundedCircleArrowDataTransferHorizontal' icon.
  static const IconData circleArrowDataTransferHorizontal =
      HugeIconData(0x3dc5);

  /// IconData for the 'strokeRoundedCircleArrowDataTransferVertical' icon.
  static const IconData circleArrowDataTransferVertical = HugeIconData(0x3dc6);

  /// IconData for the 'strokeRoundedCircleArrowDiagonal01' icon.
  static const IconData circleArrowDiagonal01 = HugeIconData(0x3dc7);

  /// IconData for the 'strokeRoundedCircleArrowDiagonal02' icon.
  static const IconData circleArrowDiagonal02 = HugeIconData(0x3dc8);

  /// IconData for the 'strokeRoundedCircleArrowDown01' icon.
  static const IconData circleArrowDown01 = HugeIconData(0x3dc9);

  /// IconData for the 'strokeRoundedCircleArrowDown02' icon.
  static const IconData circleArrowDown02 = HugeIconData(0x3dca);

  /// IconData for the 'strokeRoundedCircleArrowDown03' icon.
  static const IconData circleArrowDown03 = HugeIconData(0x3dcb);

  /// IconData for the 'strokeRoundedCircleArrowDownDouble' icon.
  static const IconData circleArrowDownDouble = HugeIconData(0x3dcc);

  /// IconData for the 'strokeRoundedCircleArrowDownLeft' icon.
  static const IconData circleArrowDownLeft = HugeIconData(0x3dcd);

  /// IconData for the 'strokeRoundedCircleArrowDownRight' icon.
  static const IconData circleArrowDownRight = HugeIconData(0x3dce);

  /// IconData for the 'strokeRoundedCircleArrowExpand01' icon.
  static const IconData circleArrowExpand01 = HugeIconData(0x3dcf);

  /// IconData for the 'strokeRoundedCircleArrowExpand02' icon.
  static const IconData circleArrowExpand02 = HugeIconData(0x3dd0);

  /// IconData for the 'strokeRoundedCircleArrowHorizontal' icon.
  static const IconData circleArrowHorizontal = HugeIconData(0x3dd1);

  /// IconData for the 'strokeRoundedCircleArrowLeft01' icon.
  static const IconData circleArrowLeft01 = HugeIconData(0x3dd2);

  /// IconData for the 'strokeRoundedCircleArrowLeft02' icon.
  static const IconData circleArrowLeft02 = HugeIconData(0x3dd3);

  /// IconData for the 'strokeRoundedCircleArrowLeft03' icon.
  static const IconData circleArrowLeft03 = HugeIconData(0x3dd4);

  /// IconData for the 'strokeRoundedCircleArrowLeftDouble' icon.
  static const IconData circleArrowLeftDouble = HugeIconData(0x3dd5);

  /// IconData for the 'strokeRoundedCircleArrowLeftRight' icon.
  static const IconData circleArrowLeftRight = HugeIconData(0x3dd6);

  /// IconData for the 'strokeRoundedCircleArrowMoveDownLeft' icon.
  static const IconData circleArrowMoveDownLeft = HugeIconData(0x3dd7);

  /// IconData for the 'strokeRoundedCircleArrowMoveDownRight' icon.
  static const IconData circleArrowMoveDownRight = HugeIconData(0x3dd8);

  /// IconData for the 'strokeRoundedCircleArrowMoveLeftDown' icon.
  static const IconData circleArrowMoveLeftDown = HugeIconData(0x3dd9);

  /// IconData for the 'strokeRoundedCircleArrowMoveRightDown' icon.
  static const IconData circleArrowMoveRightDown = HugeIconData(0x3dda);

  /// IconData for the 'strokeRoundedCircleArrowMoveUpLeft' icon.
  static const IconData circleArrowMoveUpLeft = HugeIconData(0x3ddb);

  /// IconData for the 'strokeRoundedCircleArrowMoveUpRight' icon.
  static const IconData circleArrowMoveUpRight = HugeIconData(0x3ddc);

  /// IconData for the 'strokeRoundedCircleArrowReload01' icon.
  static const IconData circleArrowReload01 = HugeIconData(0x3ddd);

  /// IconData for the 'strokeRoundedCircleArrowReload02' icon.
  static const IconData circleArrowReload02 = HugeIconData(0x3dde);

  /// IconData for the 'strokeRoundedCircleArrowRight01' icon.
  static const IconData circleArrowRight01 = HugeIconData(0x3ddf);

  /// IconData for the 'strokeRoundedCircleArrowRight02' icon.
  static const IconData circleArrowRight02 = HugeIconData(0x3de0);

  /// IconData for the 'strokeRoundedCircleArrowRight03' icon.
  static const IconData circleArrowRight03 = HugeIconData(0x3de1);

  /// IconData for the 'strokeRoundedCircleArrowRightDouble' icon.
  static const IconData circleArrowRightDouble = HugeIconData(0x3de2);

  /// IconData for the 'strokeRoundedCircleArrowShrink01' icon.
  static const IconData circleArrowShrink01 = HugeIconData(0x3de3);

  /// IconData for the 'strokeRoundedCircleArrowShrink02' icon.
  static const IconData circleArrowShrink02 = HugeIconData(0x3de4);

  /// IconData for the 'strokeRoundedCircleArrowUp01' icon.
  static const IconData circleArrowUp01 = HugeIconData(0x3de5);

  /// IconData for the 'strokeRoundedCircleArrowUp02' icon.
  static const IconData circleArrowUp02 = HugeIconData(0x3de6);

  /// IconData for the 'strokeRoundedCircleArrowUp03' icon.
  static const IconData circleArrowUp03 = HugeIconData(0x3de7);

  /// IconData for the 'strokeRoundedCircleArrowUpDouble' icon.
  static const IconData circleArrowUpDouble = HugeIconData(0x3de8);

  /// IconData for the 'strokeRoundedCircleArrowUpDown' icon.
  static const IconData circleArrowUpDown = HugeIconData(0x3de9);

  /// IconData for the 'strokeRoundedCircleArrowUpLeft' icon.
  static const IconData circleArrowUpLeft = HugeIconData(0x3dea);

  /// IconData for the 'strokeRoundedCircleArrowUpRight' icon.
  static const IconData circleArrowUpRight = HugeIconData(0x3deb);

  /// IconData for the 'strokeRoundedCircleArrowVertical' icon.
  static const IconData circleArrowVertical = HugeIconData(0x3dec);

  /// IconData for the 'strokeRoundedCircleLock01' icon.
  static const IconData circleLock01 = HugeIconData(0x3ded);

  /// IconData for the 'strokeRoundedCircleLock02' icon.
  static const IconData circleLock02 = HugeIconData(0x3dee);

  /// IconData for the 'strokeRoundedCircleLockAdd01' icon.
  static const IconData circleLockAdd01 = HugeIconData(0x3def);

  /// IconData for the 'strokeRoundedCircleLockAdd02' icon.
  static const IconData circleLockAdd02 = HugeIconData(0x3df0);

  /// IconData for the 'strokeRoundedCircleLockCheck01' icon.
  static const IconData circleLockCheck01 = HugeIconData(0x3df1);

  /// IconData for the 'strokeRoundedCircleLockCheck02' icon.
  static const IconData circleLockCheck02 = HugeIconData(0x3df2);

  /// IconData for the 'strokeRoundedCircleLockMinus01' icon.
  static const IconData circleLockMinus01 = HugeIconData(0x3df3);

  /// IconData for the 'strokeRoundedCircleLockMinus02' icon.
  static const IconData circleLockMinus02 = HugeIconData(0x3df4);

  /// IconData for the 'strokeRoundedCircleLockRemove01' icon.
  static const IconData circleLockRemove01 = HugeIconData(0x3df5);

  /// IconData for the 'strokeRoundedCircleLockRemove02' icon.
  static const IconData circleLockRemove02 = HugeIconData(0x3df6);

  /// IconData for the 'strokeRoundedCirclePassword' icon.
  static const IconData circlePassword = HugeIconData(0x3df7);

  /// IconData for the 'strokeRoundedCircleUnlock01' icon.
  static const IconData circleUnlock01 = HugeIconData(0x3df8);

  /// IconData for the 'strokeRoundedCircleUnlock02' icon.
  static const IconData circleUnlock02 = HugeIconData(0x3df9);

  /// IconData for the 'strokeRoundedCircle' icon.
  static const IconData circle = HugeIconData(0x3dfa);

  /// IconData for the 'strokeRoundedCity01' icon.
  static const IconData city01 = HugeIconData(0x3dfb);

  /// IconData for the 'strokeRoundedCity02' icon.
  static const IconData city02 = HugeIconData(0x3dfc);

  /// IconData for the 'strokeRoundedCity03' icon.
  static const IconData city03 = HugeIconData(0x3dfd);

  /// IconData for the 'strokeRoundedClapping01' icon.
  static const IconData clapping01 = HugeIconData(0x3dfe);

  /// IconData for the 'strokeRoundedClapping02' icon.
  static const IconData clapping02 = HugeIconData(0x3dff);

  /// IconData for the 'strokeRoundedClean' icon.
  static const IconData clean = HugeIconData(0x3e00);

  /// IconData for the 'strokeRoundedCleaningBucket' icon.
  static const IconData cleaningBucket = HugeIconData(0x3e01);

  /// IconData for the 'strokeRoundedClinic' icon.
  static const IconData clinic = HugeIconData(0x3e02);

  /// IconData for the 'strokeRoundedClip' icon.
  static const IconData clip = HugeIconData(0x3e03);

  /// IconData for the 'strokeRoundedClipboard' icon.
  static const IconData clipboard = HugeIconData(0x3e04);

  /// IconData for the 'strokeRoundedClock01' icon.
  static const IconData clock01 = HugeIconData(0x3e05);

  /// IconData for the 'strokeRoundedClock02' icon.
  static const IconData clock02 = HugeIconData(0x3e06);

  /// IconData for the 'strokeRoundedClock03' icon.
  static const IconData clock03 = HugeIconData(0x3e07);

  /// IconData for the 'strokeRoundedClock04' icon.
  static const IconData clock04 = HugeIconData(0x3e08);

  /// IconData for the 'strokeRoundedClock05' icon.
  static const IconData clock05 = HugeIconData(0x3e09);

  /// IconData for the 'strokeRoundedClosedCaptionAlt' icon.
  static const IconData closedCaptionAlt = HugeIconData(0x3e0a);

  /// IconData for the 'strokeRoundedClosedCaption' icon.
  static const IconData closedCaption = HugeIconData(0x3e0b);

  /// IconData for the 'strokeRoundedClothes' icon.
  static const IconData clothes = HugeIconData(0x3e0c);

  /// IconData for the 'strokeRoundedCloudAngledRainZap' icon.
  static const IconData cloudAngledRainZap = HugeIconData(0x3e0d);

  /// IconData for the 'strokeRoundedCloudAngledRain' icon.
  static const IconData cloudAngledRain = HugeIconData(0x3e0e);

  /// IconData for the 'strokeRoundedCloudAngledZap' icon.
  static const IconData cloudAngledZap = HugeIconData(0x3e0f);

  /// IconData for the 'strokeRoundedCloudBigRain' icon.
  static const IconData cloudBigRain = HugeIconData(0x3e10);

  /// IconData for the 'strokeRoundedCloudDownload' icon.
  static const IconData cloudDownload = HugeIconData(0x3e11);

  /// IconData for the 'strokeRoundedCloudFastWind' icon.
  static const IconData cloudFastWind = HugeIconData(0x3e12);

  /// IconData for the 'strokeRoundedCloudHailstone' icon.
  static const IconData cloudHailstone = HugeIconData(0x3e13);

  /// IconData for the 'strokeRoundedCloudLittleRain' icon.
  static const IconData cloudLittleRain = HugeIconData(0x3e14);

  /// IconData for the 'strokeRoundedCloudLittleSnow' icon.
  static const IconData cloudLittleSnow = HugeIconData(0x3e15);

  /// IconData for the 'strokeRoundedCloudLoading' icon.
  static const IconData cloudLoading = HugeIconData(0x3e16);

  /// IconData for the 'strokeRoundedCloudMidRain' icon.
  static const IconData cloudMidRain = HugeIconData(0x3e17);

  /// IconData for the 'strokeRoundedCloudMidSnow' icon.
  static const IconData cloudMidSnow = HugeIconData(0x3e18);

  /// IconData for the 'strokeRoundedCloudSavingDone01' icon.
  static const IconData cloudSavingDone01 = HugeIconData(0x3e19);

  /// IconData for the 'strokeRoundedCloudSavingDone02' icon.
  static const IconData cloudSavingDone02 = HugeIconData(0x3e1a);

  /// IconData for the 'strokeRoundedCloudServer' icon.
  static const IconData cloudServer = HugeIconData(0x3e1b);

  /// IconData for the 'strokeRoundedCloudSlowWind' icon.
  static const IconData cloudSlowWind = HugeIconData(0x3e1c);

  /// IconData for the 'strokeRoundedCloudSnow' icon.
  static const IconData cloudSnow = HugeIconData(0x3e1d);

  /// IconData for the 'strokeRoundedCloudUpload' icon.
  static const IconData cloudUpload = HugeIconData(0x3e1e);

  /// IconData for the 'strokeRoundedCloud' icon.
  static const IconData cloud = HugeIconData(0x3e1f);

  /// IconData for the 'strokeRoundedClubs01' icon.
  static const IconData clubs01 = HugeIconData(0x3e20);

  /// IconData for the 'strokeRoundedClubs02' icon.
  static const IconData clubs02 = HugeIconData(0x3e21);

  /// IconData for the 'strokeRoundedCoPresent' icon.
  static const IconData coPresent = HugeIconData(0x3e22);

  /// IconData for the 'strokeRoundedCodeCircle' icon.
  static const IconData codeCircle = HugeIconData(0x3e23);

  /// IconData for the 'strokeRoundedCodeFolder' icon.
  static const IconData codeFolder = HugeIconData(0x3e24);

  /// IconData for the 'strokeRoundedCodeSquare' icon.
  static const IconData codeSquare = HugeIconData(0x3e25);

  /// IconData for the 'strokeRoundedCode' icon.
  static const IconData code = HugeIconData(0x3e26);

  /// IconData for the 'strokeRoundedCodesandbox' icon.
  static const IconData codesandbox = HugeIconData(0x3e27);

  /// IconData for the 'strokeRoundedCoffee01' icon.
  static const IconData coffee01 = HugeIconData(0x3e28);

  /// IconData for the 'strokeRoundedCoffee02' icon.
  static const IconData coffee02 = HugeIconData(0x3e29);

  /// IconData for the 'strokeRoundedCoffeeBeans' icon.
  static const IconData coffeeBeans = HugeIconData(0x3e2a);

  /// IconData for the 'strokeRoundedCoins01' icon.
  static const IconData coins01 = HugeIconData(0x3e2b);

  /// IconData for the 'strokeRoundedCoins02' icon.
  static const IconData coins02 = HugeIconData(0x3e2c);

  /// IconData for the 'strokeRoundedCoinsBitcoin' icon.
  static const IconData coinsBitcoin = HugeIconData(0x3e2d);

  /// IconData for the 'strokeRoundedCoinsDollar' icon.
  static const IconData coinsDollar = HugeIconData(0x3e2e);

  /// IconData for the 'strokeRoundedCoinsEuro' icon.
  static const IconData coinsEuro = HugeIconData(0x3e2f);

  /// IconData for the 'strokeRoundedCoinsPound' icon.
  static const IconData coinsPound = HugeIconData(0x3e30);

  /// IconData for the 'strokeRoundedCoinsSwap' icon.
  static const IconData coinsSwap = HugeIconData(0x3e31);

  /// IconData for the 'strokeRoundedCoinsYen' icon.
  static const IconData coinsYen = HugeIconData(0x3e32);

  /// IconData for the 'strokeRoundedCollectionsBookmark' icon.
  static const IconData collectionsBookmark = HugeIconData(0x3e33);

  /// IconData for the 'strokeRoundedColorPicker' icon.
  static const IconData colorPicker = HugeIconData(0x3e34);

  /// IconData for the 'strokeRoundedColors' icon.
  static const IconData colors = HugeIconData(0x3e35);

  /// IconData for the 'strokeRoundedColosseum' icon.
  static const IconData colosseum = HugeIconData(0x3e36);

  /// IconData for the 'strokeRoundedColumnDelete' icon.
  static const IconData columnDelete = HugeIconData(0x3e37);

  /// IconData for the 'strokeRoundedColumnInsert' icon.
  static const IconData columnInsert = HugeIconData(0x3e38);

  /// IconData for the 'strokeRoundedComet01' icon.
  static const IconData comet01 = HugeIconData(0x3e39);

  /// IconData for the 'strokeRoundedComet02' icon.
  static const IconData comet02 = HugeIconData(0x3e3a);

  /// IconData for the 'strokeRoundedComingSoon01' icon.
  static const IconData comingSoon01 = HugeIconData(0x3e3b);

  /// IconData for the 'strokeRoundedComingSoon02' icon.
  static const IconData comingSoon02 = HugeIconData(0x3e3c);

  /// IconData for the 'strokeRoundedCommandLine' icon.
  static const IconData commandLine = HugeIconData(0x3e3d);

  /// IconData for the 'strokeRoundedCommand' icon.
  static const IconData command = HugeIconData(0x3e3e);

  /// IconData for the 'strokeRoundedComment01' icon.
  static const IconData comment01 = HugeIconData(0x3e3f);

  /// IconData for the 'strokeRoundedComment02' icon.
  static const IconData comment02 = HugeIconData(0x3e40);

  /// IconData for the 'strokeRoundedCommentAdd01' icon.
  static const IconData commentAdd01 = HugeIconData(0x3e41);

  /// IconData for the 'strokeRoundedCommentAdd02' icon.
  static const IconData commentAdd02 = HugeIconData(0x3e42);

  /// IconData for the 'strokeRoundedCommentBlock01' icon.
  static const IconData commentBlock01 = HugeIconData(0x3e43);

  /// IconData for the 'strokeRoundedCommentBlock02' icon.
  static const IconData commentBlock02 = HugeIconData(0x3e44);

  /// IconData for the 'strokeRoundedCommentRemove01' icon.
  static const IconData commentRemove01 = HugeIconData(0x3e45);

  /// IconData for the 'strokeRoundedCommentRemove02' icon.
  static const IconData commentRemove02 = HugeIconData(0x3e46);

  /// IconData for the 'strokeRoundedCompass01' icon.
  static const IconData compass01 = HugeIconData(0x3e47);

  /// IconData for the 'strokeRoundedCompass' icon.
  static const IconData compass = HugeIconData(0x3e48);

  /// IconData for the 'strokeRoundedComplaint' icon.
  static const IconData complaint = HugeIconData(0x3e49);

  /// IconData for the 'strokeRoundedComputerAdd' icon.
  static const IconData computerAdd = HugeIconData(0x3e4a);

  /// IconData for the 'strokeRoundedComputerCheck' icon.
  static const IconData computerCheck = HugeIconData(0x3e4b);

  /// IconData for the 'strokeRoundedComputerCloud' icon.
  static const IconData computerCloud = HugeIconData(0x3e4c);

  /// IconData for the 'strokeRoundedComputerDesk01' icon.
  static const IconData computerDesk01 = HugeIconData(0x3e4d);

  /// IconData for the 'strokeRoundedComputerDesk02' icon.
  static const IconData computerDesk02 = HugeIconData(0x3e4e);

  /// IconData for the 'strokeRoundedComputerDesk03' icon.
  static const IconData computerDesk03 = HugeIconData(0x3e4f);

  /// IconData for the 'strokeRoundedComputerDollar' icon.
  static const IconData computerDollar = HugeIconData(0x3e50);

  /// IconData for the 'strokeRoundedComputerPhoneSync' icon.
  static const IconData computerPhoneSync = HugeIconData(0x3e51);

  /// IconData for the 'strokeRoundedComputerProgramming01' icon.
  static const IconData computerProgramming01 = HugeIconData(0x3e52);

  /// IconData for the 'strokeRoundedComputerProgramming02' icon.
  static const IconData computerProgramming02 = HugeIconData(0x3e53);

  /// IconData for the 'strokeRoundedComputerProtection' icon.
  static const IconData computerProtection = HugeIconData(0x3e54);

  /// IconData for the 'strokeRoundedComputerRemove' icon.
  static const IconData computerRemove = HugeIconData(0x3e55);

  /// IconData for the 'strokeRoundedComputerSettings' icon.
  static const IconData computerSettings = HugeIconData(0x3e56);

  /// IconData for the 'strokeRoundedComputerVideoCall' icon.
  static const IconData computerVideoCall = HugeIconData(0x3e57);

  /// IconData for the 'strokeRoundedComputerVideo' icon.
  static const IconData computerVideo = HugeIconData(0x3e58);

  /// IconData for the 'strokeRoundedComputer' icon.
  static const IconData computer = HugeIconData(0x3e59);

  /// IconData for the 'strokeRoundedCone01' icon.
  static const IconData cone01 = HugeIconData(0x3e5a);

  /// IconData for the 'strokeRoundedCone02' icon.
  static const IconData cone02 = HugeIconData(0x3e5b);

  /// IconData for the 'strokeRoundedConference' icon.
  static const IconData conference = HugeIconData(0x3e5c);

  /// IconData for the 'strokeRoundedConfiguration01' icon.
  static const IconData configuration01 = HugeIconData(0x3e5d);

  /// IconData for the 'strokeRoundedConfiguration02' icon.
  static const IconData configuration02 = HugeIconData(0x3e5e);

  /// IconData for the 'strokeRoundedConfused' icon.
  static const IconData confused = HugeIconData(0x3e5f);

  /// IconData for the 'strokeRoundedCongruentToCircle' icon.
  static const IconData congruentToCircle = HugeIconData(0x3e60);

  /// IconData for the 'strokeRoundedCongruentToSquare' icon.
  static const IconData congruentToSquare = HugeIconData(0x3e61);

  /// IconData for the 'strokeRoundedCongruentTo' icon.
  static const IconData congruentTo = HugeIconData(0x3e62);

  /// IconData for the 'strokeRoundedConnect' icon.
  static const IconData connect = HugeIconData(0x3e63);

  /// IconData for the 'strokeRoundedConsole' icon.
  static const IconData console = HugeIconData(0x3e64);

  /// IconData for the 'strokeRoundedConstellation' icon.
  static const IconData constellation = HugeIconData(0x3e65);

  /// IconData for the 'strokeRoundedContact01' icon.
  static const IconData contact01 = HugeIconData(0x3e66);

  /// IconData for the 'strokeRoundedContact02' icon.
  static const IconData contact02 = HugeIconData(0x3e67);

  /// IconData for the 'strokeRoundedContactBook' icon.
  static const IconData contactBook = HugeIconData(0x3e68);

  /// IconData for the 'strokeRoundedContact' icon.
  static const IconData contact = HugeIconData(0x3e69);

  /// IconData for the 'strokeRoundedContainerTruck01' icon.
  static const IconData containerTruck01 = HugeIconData(0x3e6a);

  /// IconData for the 'strokeRoundedContainerTruck02' icon.
  static const IconData containerTruck02 = HugeIconData(0x3e6b);

  /// IconData for the 'strokeRoundedContainerTruck' icon.
  static const IconData containerTruck = HugeIconData(0x3e6c);

  /// IconData for the 'strokeRoundedContracts' icon.
  static const IconData contracts = HugeIconData(0x3e6d);

  /// IconData for the 'strokeRoundedConversation' icon.
  static const IconData conversation = HugeIconData(0x3e6e);

  /// IconData for the 'strokeRoundedCookBook' icon.
  static const IconData cookBook = HugeIconData(0x3e6f);

  /// IconData for the 'strokeRoundedCookie' icon.
  static const IconData cookie = HugeIconData(0x3e70);

  /// IconData for the 'strokeRoundedCoordinate01' icon.
  static const IconData coordinate01 = HugeIconData(0x3e71);

  /// IconData for the 'strokeRoundedCoordinate02' icon.
  static const IconData coordinate02 = HugeIconData(0x3e72);

  /// IconData for the 'strokeRoundedCopilot' icon.
  static const IconData copilot = HugeIconData(0x3e73);

  /// IconData for the 'strokeRoundedCopy01' icon.
  static const IconData copy01 = HugeIconData(0x3e74);

  /// IconData for the 'strokeRoundedCopy02' icon.
  static const IconData copy02 = HugeIconData(0x3e75);

  /// IconData for the 'strokeRoundedCopyLink' icon.
  static const IconData copyLink = HugeIconData(0x3e76);

  /// IconData for the 'strokeRoundedCopyright' icon.
  static const IconData copyright = HugeIconData(0x3e77);

  /// IconData for the 'strokeRoundedCorn' icon.
  static const IconData corn = HugeIconData(0x3e78);

  /// IconData for the 'strokeRoundedCorporate' icon.
  static const IconData corporate = HugeIconData(0x3e79);

  /// IconData for the 'strokeRoundedCos' icon.
  static const IconData cos = HugeIconData(0x3e7a);

  /// IconData for the 'strokeRoundedCosine01' icon.
  static const IconData cosine01 = HugeIconData(0x3e7b);

  /// IconData for the 'strokeRoundedCosine02' icon.
  static const IconData cosine02 = HugeIconData(0x3e7c);

  /// IconData for the 'strokeRoundedCottage' icon.
  static const IconData cottage = HugeIconData(0x3e7d);

  /// IconData for the 'strokeRoundedCottonCandy' icon.
  static const IconData cottonCandy = HugeIconData(0x3e7e);

  /// IconData for the 'strokeRoundedCoupon01' icon.
  static const IconData coupon01 = HugeIconData(0x3e7f);

  /// IconData for the 'strokeRoundedCoupon02' icon.
  static const IconData coupon02 = HugeIconData(0x3e80);

  /// IconData for the 'strokeRoundedCoupon03' icon.
  static const IconData coupon03 = HugeIconData(0x3e81);

  /// IconData for the 'strokeRoundedCouponPercent' icon.
  static const IconData couponPercent = HugeIconData(0x3e82);

  /// IconData for the 'strokeRoundedCourse' icon.
  static const IconData course = HugeIconData(0x3e83);

  /// IconData for the 'strokeRoundedCourtHouse' icon.
  static const IconData courtHouse = HugeIconData(0x3e84);

  /// IconData for the 'strokeRoundedCourtLaw' icon.
  static const IconData courtLaw = HugeIconData(0x3e85);

  /// IconData for the 'strokeRoundedCovariate' icon.
  static const IconData covariate = HugeIconData(0x3e86);

  /// IconData for the 'strokeRoundedCovidInfo' icon.
  static const IconData covidInfo = HugeIconData(0x3e87);

  /// IconData for the 'strokeRoundedCowboyHat' icon.
  static const IconData cowboyHat = HugeIconData(0x3e88);

  /// IconData for the 'strokeRoundedCplusplus' icon.
  static const IconData cplusplus = HugeIconData(0x3e89);

  /// IconData for the 'strokeRoundedCpuCharge' icon.
  static const IconData cpuCharge = HugeIconData(0x3e8a);

  /// IconData for the 'strokeRoundedCpuSettings' icon.
  static const IconData cpuSettings = HugeIconData(0x3e8b);

  /// IconData for the 'strokeRoundedCpu' icon.
  static const IconData cpu = HugeIconData(0x3e8c);

  /// IconData for the 'strokeRoundedCrab' icon.
  static const IconData crab = HugeIconData(0x3e8d);

  /// IconData for the 'strokeRoundedCrane' icon.
  static const IconData crane = HugeIconData(0x3e8e);

  /// IconData for the 'strokeRoundedCrazy' icon.
  static const IconData crazy = HugeIconData(0x3e8f);

  /// IconData for the 'strokeRoundedCreativeMarket' icon.
  static const IconData creativeMarket = HugeIconData(0x3e90);

  /// IconData for the 'strokeRoundedCreditCardAccept' icon.
  static const IconData creditCardAccept = HugeIconData(0x3e91);

  /// IconData for the 'strokeRoundedCreditCardAdd' icon.
  static const IconData creditCardAdd = HugeIconData(0x3e92);

  /// IconData for the 'strokeRoundedCreditCardChange' icon.
  static const IconData creditCardChange = HugeIconData(0x3e93);

  /// IconData for the 'strokeRoundedCreditCardDefrost' icon.
  static const IconData creditCardDefrost = HugeIconData(0x3e94);

  /// IconData for the 'strokeRoundedCreditCardFreeze' icon.
  static const IconData creditCardFreeze = HugeIconData(0x3e95);

  /// IconData for the 'strokeRoundedCreditCardNotAccept' icon.
  static const IconData creditCardNotAccept = HugeIconData(0x3e96);

  /// IconData for the 'strokeRoundedCreditCardNotFound' icon.
  static const IconData creditCardNotFound = HugeIconData(0x3e97);

  /// IconData for the 'strokeRoundedCreditCardPos' icon.
  static const IconData creditCardPos = HugeIconData(0x3e98);

  /// IconData for the 'strokeRoundedCreditCardValidation' icon.
  static const IconData creditCardValidation = HugeIconData(0x3e99);

  /// IconData for the 'strokeRoundedCreditCard' icon.
  static const IconData creditCard = HugeIconData(0x3e9a);

  /// IconData for the 'strokeRoundedCricketBat' icon.
  static const IconData cricketBat = HugeIconData(0x3e9b);

  /// IconData for the 'strokeRoundedCricketHelmet' icon.
  static const IconData cricketHelmet = HugeIconData(0x3e9c);

  /// IconData for the 'strokeRoundedCroissant' icon.
  static const IconData croissant = HugeIconData(0x3e9d);

  /// IconData for the 'strokeRoundedCrop' icon.
  static const IconData crop = HugeIconData(0x3e9e);

  /// IconData for the 'strokeRoundedCrowdfunding' icon.
  static const IconData crowdfunding = HugeIconData(0x3e9f);

  /// IconData for the 'strokeRoundedCrown' icon.
  static const IconData crown = HugeIconData(0x3ea0);

  /// IconData for the 'strokeRoundedCrying' icon.
  static const IconData crying = HugeIconData(0x3ea1);

  /// IconData for the 'strokeRoundedCsv01' icon.
  static const IconData csv01 = HugeIconData(0x3ea2);

  /// IconData for the 'strokeRoundedCsv02' icon.
  static const IconData csv02 = HugeIconData(0x3ea3);

  /// IconData for the 'strokeRoundedCube' icon.
  static const IconData cube = HugeIconData(0x3ea4);

  /// IconData for the 'strokeRoundedCupcake01' icon.
  static const IconData cupcake01 = HugeIconData(0x3ea5);

  /// IconData for the 'strokeRoundedCupcake02' icon.
  static const IconData cupcake02 = HugeIconData(0x3ea6);

  /// IconData for the 'strokeRoundedCupcake03' icon.
  static const IconData cupcake03 = HugeIconData(0x3ea7);

  /// IconData for the 'strokeRoundedCurling' icon.
  static const IconData curling = HugeIconData(0x3ea8);

  /// IconData for the 'strokeRoundedCursor01' icon.
  static const IconData cursor01 = HugeIconData(0x3ea9);

  /// IconData for the 'strokeRoundedCursor02' icon.
  static const IconData cursor02 = HugeIconData(0x3eaa);

  /// IconData for the 'strokeRoundedCursorAddSelection01' icon.
  static const IconData cursorAddSelection01 = HugeIconData(0x3eab);

  /// IconData for the 'strokeRoundedCursorAddSelection02' icon.
  static const IconData cursorAddSelection02 = HugeIconData(0x3eac);

  /// IconData for the 'strokeRoundedCursorCircleSelection01' icon.
  static const IconData cursorCircleSelection01 = HugeIconData(0x3ead);

  /// IconData for the 'strokeRoundedCursorCircleSelection02' icon.
  static const IconData cursorCircleSelection02 = HugeIconData(0x3eae);

  /// IconData for the 'strokeRoundedCursorDisabled01' icon.
  static const IconData cursorDisabled01 = HugeIconData(0x3eaf);

  /// IconData for the 'strokeRoundedCursorDisabled02' icon.
  static const IconData cursorDisabled02 = HugeIconData(0x3eb0);

  /// IconData for the 'strokeRoundedCursorEdit01' icon.
  static const IconData cursorEdit01 = HugeIconData(0x3eb1);

  /// IconData for the 'strokeRoundedCursorEdit02' icon.
  static const IconData cursorEdit02 = HugeIconData(0x3eb2);

  /// IconData for the 'strokeRoundedCursorHold01' icon.
  static const IconData cursorHold01 = HugeIconData(0x3eb3);

  /// IconData for the 'strokeRoundedCursorHold02' icon.
  static const IconData cursorHold02 = HugeIconData(0x3eb4);

  /// IconData for the 'strokeRoundedCursorInWindow' icon.
  static const IconData cursorInWindow = HugeIconData(0x3eb5);

  /// IconData for the 'strokeRoundedCursorInfo01' icon.
  static const IconData cursorInfo01 = HugeIconData(0x3eb6);

  /// IconData for the 'strokeRoundedCursorInfo02' icon.
  static const IconData cursorInfo02 = HugeIconData(0x3eb7);

  /// IconData for the 'strokeRoundedCursorLoading01' icon.
  static const IconData cursorLoading01 = HugeIconData(0x3eb8);

  /// IconData for the 'strokeRoundedCursorLoading02' icon.
  static const IconData cursorLoading02 = HugeIconData(0x3eb9);

  /// IconData for the 'strokeRoundedCursorMagicSelection01' icon.
  static const IconData cursorMagicSelection01 = HugeIconData(0x3eba);

  /// IconData for the 'strokeRoundedCursorMagicSelection02' icon.
  static const IconData cursorMagicSelection02 = HugeIconData(0x3ebb);

  /// IconData for the 'strokeRoundedCursorMove01' icon.
  static const IconData cursorMove01 = HugeIconData(0x3ebc);

  /// IconData for the 'strokeRoundedCursorMove02' icon.
  static const IconData cursorMove02 = HugeIconData(0x3ebd);

  /// IconData for the 'strokeRoundedCursorPointer01' icon.
  static const IconData cursorPointer01 = HugeIconData(0x3ebe);

  /// IconData for the 'strokeRoundedCursorPointer02' icon.
  static const IconData cursorPointer02 = HugeIconData(0x3ebf);

  /// IconData for the 'strokeRoundedCursorProgress01' icon.
  static const IconData cursorProgress01 = HugeIconData(0x3ec0);

  /// IconData for the 'strokeRoundedCursorProgress02' icon.
  static const IconData cursorProgress02 = HugeIconData(0x3ec1);

  /// IconData for the 'strokeRoundedCursorProgress03' icon.
  static const IconData cursorProgress03 = HugeIconData(0x3ec2);

  /// IconData for the 'strokeRoundedCursorProgress04' icon.
  static const IconData cursorProgress04 = HugeIconData(0x3ec3);

  /// IconData for the 'strokeRoundedCursorRectangleSelection01' icon.
  static const IconData cursorRectangleSelection01 = HugeIconData(0x3ec4);

  /// IconData for the 'strokeRoundedCursorRectangleSelection02' icon.
  static const IconData cursorRectangleSelection02 = HugeIconData(0x3ec5);

  /// IconData for the 'strokeRoundedCursorRemoveSelection01' icon.
  static const IconData cursorRemoveSelection01 = HugeIconData(0x3ec6);

  /// IconData for the 'strokeRoundedCursorRemoveSelection02' icon.
  static const IconData cursorRemoveSelection02 = HugeIconData(0x3ec7);

  /// IconData for the 'strokeRoundedCursorText' icon.
  static const IconData cursorText = HugeIconData(0x3ec8);

  /// IconData for the 'strokeRoundedCurtains' icon.
  static const IconData curtains = HugeIconData(0x3ec9);

  /// IconData for the 'strokeRoundedCurvyLeftDirection' icon.
  static const IconData curvyLeftDirection = HugeIconData(0x3eca);

  /// IconData for the 'strokeRoundedCurvyLeftRightDirection' icon.
  static const IconData curvyLeftRightDirection = HugeIconData(0x3ecb);

  /// IconData for the 'strokeRoundedCurvyRightDirection' icon.
  static const IconData curvyRightDirection = HugeIconData(0x3ecc);

  /// IconData for the 'strokeRoundedCurvyUpDownDirection' icon.
  static const IconData curvyUpDownDirection = HugeIconData(0x3ecd);

  /// IconData for the 'strokeRoundedCustomerService01' icon.
  static const IconData customerService01 = HugeIconData(0x3ece);

  /// IconData for the 'strokeRoundedCustomerService02' icon.
  static const IconData customerService02 = HugeIconData(0x3ecf);

  /// IconData for the 'strokeRoundedCustomerService' icon.
  static const IconData customerService = HugeIconData(0x3ed0);

  /// IconData for the 'strokeRoundedCustomerSupport' icon.
  static const IconData customerSupport = HugeIconData(0x3ed1);

  /// IconData for the 'strokeRoundedCustomize' icon.
  static const IconData customize = HugeIconData(0x3ed2);

  /// IconData for the 'strokeRoundedCylinder01' icon.
  static const IconData cylinder01 = HugeIconData(0x3ed3);

  /// IconData for the 'strokeRoundedCylinder02' icon.
  static const IconData cylinder02 = HugeIconData(0x3ed4);

  /// IconData for the 'strokeRoundedCylinder03' icon.
  static const IconData cylinder03 = HugeIconData(0x3ed5);

  /// IconData for the 'strokeRoundedCylinder04' icon.
  static const IconData cylinder04 = HugeIconData(0x3ed6);

  /// IconData for the 'strokeRoundedDanger' icon.
  static const IconData danger = HugeIconData(0x3ed7);

  /// IconData for the 'strokeRoundedDarkMode' icon.
  static const IconData darkMode = HugeIconData(0x3ed8);

  /// IconData for the 'strokeRoundedDart' icon.
  static const IconData dart = HugeIconData(0x3ed9);

  /// IconData for the 'strokeRoundedDashboardBrowsing' icon.
  static const IconData dashboardBrowsing = HugeIconData(0x3eda);

  /// IconData for the 'strokeRoundedDashboardCircleAdd' icon.
  static const IconData dashboardCircleAdd = HugeIconData(0x3edb);

  /// IconData for the 'strokeRoundedDashboardCircleEdit' icon.
  static const IconData dashboardCircleEdit = HugeIconData(0x3edc);

  /// IconData for the 'strokeRoundedDashboardCircleRemove' icon.
  static const IconData dashboardCircleRemove = HugeIconData(0x3edd);

  /// IconData for the 'strokeRoundedDashboardCircleSettings' icon.
  static const IconData dashboardCircleSettings = HugeIconData(0x3ede);

  /// IconData for the 'strokeRoundedDashboardCircle' icon.
  static const IconData dashboardCircle = HugeIconData(0x3edf);

  /// IconData for the 'strokeRoundedDashboardSpeed01' icon.
  static const IconData dashboardSpeed01 = HugeIconData(0x3ee0);

  /// IconData for the 'strokeRoundedDashboardSpeed02' icon.
  static const IconData dashboardSpeed02 = HugeIconData(0x3ee1);

  /// IconData for the 'strokeRoundedDashboardSquare01' icon.
  static const IconData dashboardSquare01 = HugeIconData(0x3ee2);

  /// IconData for the 'strokeRoundedDashboardSquare02' icon.
  static const IconData dashboardSquare02 = HugeIconData(0x3ee3);

  /// IconData for the 'strokeRoundedDashboardSquare03' icon.
  static const IconData dashboardSquare03 = HugeIconData(0x3ee4);

  /// IconData for the 'strokeRoundedDashboardSquareAdd' icon.
  static const IconData dashboardSquareAdd = HugeIconData(0x3ee5);

  /// IconData for the 'strokeRoundedDashboardSquareEdit' icon.
  static const IconData dashboardSquareEdit = HugeIconData(0x3ee6);

  /// IconData for the 'strokeRoundedDashboardSquareRemove' icon.
  static const IconData dashboardSquareRemove = HugeIconData(0x3ee7);

  /// IconData for the 'strokeRoundedDashboardSquareSetting' icon.
  static const IconData dashboardSquareSetting = HugeIconData(0x3ee8);

  /// IconData for the 'strokeRoundedDashedLine01' icon.
  static const IconData dashedLine01 = HugeIconData(0x3ee9);

  /// IconData for the 'strokeRoundedDashedLine02' icon.
  static const IconData dashedLine02 = HugeIconData(0x3eea);

  /// IconData for the 'strokeRoundedDataRecovery' icon.
  static const IconData dataRecovery = HugeIconData(0x3eeb);

  /// IconData for the 'strokeRoundedDatabase01' icon.
  static const IconData database01 = HugeIconData(0x3eec);

  /// IconData for the 'strokeRoundedDatabase02' icon.
  static const IconData database02 = HugeIconData(0x3eed);

  /// IconData for the 'strokeRoundedDatabaseAdd' icon.
  static const IconData databaseAdd = HugeIconData(0x3eee);

  /// IconData for the 'strokeRoundedDatabaseExport' icon.
  static const IconData databaseExport = HugeIconData(0x3eef);

  /// IconData for the 'strokeRoundedDatabaseImport' icon.
  static const IconData databaseImport = HugeIconData(0x3ef0);

  /// IconData for the 'strokeRoundedDatabaseLocked' icon.
  static const IconData databaseLocked = HugeIconData(0x3ef1);

  /// IconData for the 'strokeRoundedDatabaseRestore' icon.
  static const IconData databaseRestore = HugeIconData(0x3ef2);

  /// IconData for the 'strokeRoundedDatabaseSetting' icon.
  static const IconData databaseSetting = HugeIconData(0x3ef3);

  /// IconData for the 'strokeRoundedDatabaseSync01' icon.
  static const IconData databaseSync01 = HugeIconData(0x3ef4);

  /// IconData for the 'strokeRoundedDatabaseSync' icon.
  static const IconData databaseSync = HugeIconData(0x3ef5);

  /// IconData for the 'strokeRoundedDatabase' icon.
  static const IconData database = HugeIconData(0x3ef6);

  /// IconData for the 'strokeRoundedDates' icon.
  static const IconData dates = HugeIconData(0x3ef7);

  /// IconData for the 'strokeRoundedDead' icon.
  static const IconData dead = HugeIconData(0x3ef8);

  /// IconData for the 'strokeRoundedDelete01' icon.
  static const IconData delete01 = HugeIconData(0x3ef9);

  /// IconData for the 'strokeRoundedDelete02' icon.
  static const IconData delete02 = HugeIconData(0x3efa);

  /// IconData for the 'strokeRoundedDelete03' icon.
  static const IconData delete03 = HugeIconData(0x3efb);

  /// IconData for the 'strokeRoundedDelete04' icon.
  static const IconData delete04 = HugeIconData(0x3efc);

  /// IconData for the 'strokeRoundedDeleteColumn' icon.
  static const IconData deleteColumn = HugeIconData(0x3efd);

  /// IconData for the 'strokeRoundedDeletePutBack' icon.
  static const IconData deletePutBack = HugeIconData(0x3efe);

  /// IconData for the 'strokeRoundedDeleteRow' icon.
  static const IconData deleteRow = HugeIconData(0x3eff);

  /// IconData for the 'strokeRoundedDeleteThrow' icon.
  static const IconData deleteThrow = HugeIconData(0x3f00);

  /// IconData for the 'strokeRoundedDeliveredSent' icon.
  static const IconData deliveredSent = HugeIconData(0x3f01);

  /// IconData for the 'strokeRoundedDeliveryBox01' icon.
  static const IconData deliveryBox01 = HugeIconData(0x3f02);

  /// IconData for the 'strokeRoundedDeliveryBox02' icon.
  static const IconData deliveryBox02 = HugeIconData(0x3f03);

  /// IconData for the 'strokeRoundedDeliveryDelay01' icon.
  static const IconData deliveryDelay01 = HugeIconData(0x3f04);

  /// IconData for the 'strokeRoundedDeliveryDelay02' icon.
  static const IconData deliveryDelay02 = HugeIconData(0x3f05);

  /// IconData for the 'strokeRoundedDeliveryReturn01' icon.
  static const IconData deliveryReturn01 = HugeIconData(0x3f06);

  /// IconData for the 'strokeRoundedDeliveryReturn02' icon.
  static const IconData deliveryReturn02 = HugeIconData(0x3f07);

  /// IconData for the 'strokeRoundedDeliverySecure01' icon.
  static const IconData deliverySecure01 = HugeIconData(0x3f08);

  /// IconData for the 'strokeRoundedDeliverySecure02' icon.
  static const IconData deliverySecure02 = HugeIconData(0x3f09);

  /// IconData for the 'strokeRoundedDeliverySent01' icon.
  static const IconData deliverySent01 = HugeIconData(0x3f0a);

  /// IconData for the 'strokeRoundedDeliverySent02' icon.
  static const IconData deliverySent02 = HugeIconData(0x3f0b);

  /// IconData for the 'strokeRoundedDeliveryTracking01' icon.
  static const IconData deliveryTracking01 = HugeIconData(0x3f0c);

  /// IconData for the 'strokeRoundedDeliveryTracking02' icon.
  static const IconData deliveryTracking02 = HugeIconData(0x3f0d);

  /// IconData for the 'strokeRoundedDeliveryTruck01' icon.
  static const IconData deliveryTruck01 = HugeIconData(0x3f0e);

  /// IconData for the 'strokeRoundedDeliveryTruck02' icon.
  static const IconData deliveryTruck02 = HugeIconData(0x3f0f);

  /// IconData for the 'strokeRoundedDeliveryView01' icon.
  static const IconData deliveryView01 = HugeIconData(0x3f10);

  /// IconData for the 'strokeRoundedDeliveryView02' icon.
  static const IconData deliveryView02 = HugeIconData(0x3f11);

  /// IconData for the 'strokeRoundedDentalBraces' icon.
  static const IconData dentalBraces = HugeIconData(0x3f12);

  /// IconData for the 'strokeRoundedDentalBrokenTooth' icon.
  static const IconData dentalBrokenTooth = HugeIconData(0x3f13);

  /// IconData for the 'strokeRoundedDentalCare' icon.
  static const IconData dentalCare = HugeIconData(0x3f14);

  /// IconData for the 'strokeRoundedDentalTooth' icon.
  static const IconData dentalTooth = HugeIconData(0x3f15);

  /// IconData for the 'strokeRoundedDepartement' icon.
  static const IconData departement = HugeIconData(0x3f16);

  /// IconData for the 'strokeRoundedDesert' icon.
  static const IconData desert = HugeIconData(0x3f17);

  /// IconData for the 'strokeRoundedDesk01' icon.
  static const IconData desk01 = HugeIconData(0x3f18);

  /// IconData for the 'strokeRoundedDesk02' icon.
  static const IconData desk02 = HugeIconData(0x3f19);

  /// IconData for the 'strokeRoundedDesk' icon.
  static const IconData desk = HugeIconData(0x3f1a);

  /// IconData for the 'strokeRoundedDeveloper' icon.
  static const IconData developer = HugeIconData(0x3f1b);

  /// IconData for the 'strokeRoundedDeviantart' icon.
  static const IconData deviantart = HugeIconData(0x3f1c);

  /// IconData for the 'strokeRoundedDeviceAccess' icon.
  static const IconData deviceAccess = HugeIconData(0x3f1d);

  /// IconData for the 'strokeRoundedDiagonalScrollPoint01' icon.
  static const IconData diagonalScrollPoint01 = HugeIconData(0x3f1e);

  /// IconData for the 'strokeRoundedDiagonalScrollPoint02' icon.
  static const IconData diagonalScrollPoint02 = HugeIconData(0x3f1f);

  /// IconData for the 'strokeRoundedDialpadCircle01' icon.
  static const IconData dialpadCircle01 = HugeIconData(0x3f20);

  /// IconData for the 'strokeRoundedDialpadCircle02' icon.
  static const IconData dialpadCircle02 = HugeIconData(0x3f21);

  /// IconData for the 'strokeRoundedDialpadSquare01' icon.
  static const IconData dialpadSquare01 = HugeIconData(0x3f22);

  /// IconData for the 'strokeRoundedDialpadSquare02' icon.
  static const IconData dialpadSquare02 = HugeIconData(0x3f23);

  /// IconData for the 'strokeRoundedDiameter' icon.
  static const IconData diameter = HugeIconData(0x3f24);

  /// IconData for the 'strokeRoundedDiamond01' icon.
  static const IconData diamond01 = HugeIconData(0x3f25);

  /// IconData for the 'strokeRoundedDiamond02' icon.
  static const IconData diamond02 = HugeIconData(0x3f26);

  /// IconData for the 'strokeRoundedDiamond' icon.
  static const IconData diamond = HugeIconData(0x3f27);

  /// IconData for the 'strokeRoundedDiaper' icon.
  static const IconData diaper = HugeIconData(0x3f28);

  /// IconData for the 'strokeRoundedDiceFaces01' icon.
  static const IconData diceFaces01 = HugeIconData(0x3f29);

  /// IconData for the 'strokeRoundedDiceFaces02' icon.
  static const IconData diceFaces02 = HugeIconData(0x3f2a);

  /// IconData for the 'strokeRoundedDiceFaces03' icon.
  static const IconData diceFaces03 = HugeIconData(0x3f2b);

  /// IconData for the 'strokeRoundedDiceFaces04' icon.
  static const IconData diceFaces04 = HugeIconData(0x3f2c);

  /// IconData for the 'strokeRoundedDiceFaces05' icon.
  static const IconData diceFaces05 = HugeIconData(0x3f2d);

  /// IconData for the 'strokeRoundedDiceFaces06' icon.
  static const IconData diceFaces06 = HugeIconData(0x3f2e);

  /// IconData for the 'strokeRoundedDice' icon.
  static const IconData dice = HugeIconData(0x3f2f);

  /// IconData for the 'strokeRoundedDigestion' icon.
  static const IconData digestion = HugeIconData(0x3f30);

  /// IconData for the 'strokeRoundedDigg' icon.
  static const IconData digg = HugeIconData(0x3f31);

  /// IconData for the 'strokeRoundedDigitalClock' icon.
  static const IconData digitalClock = HugeIconData(0x3f32);

  /// IconData for the 'strokeRoundedDimSum01' icon.
  static const IconData dimSum01 = HugeIconData(0x3f33);

  /// IconData for the 'strokeRoundedDimSum02' icon.
  static const IconData dimSum02 = HugeIconData(0x3f34);

  /// IconData for the 'strokeRoundedDiningTable' icon.
  static const IconData diningTable = HugeIconData(0x3f35);

  /// IconData for the 'strokeRoundedDiploma' icon.
  static const IconData diploma = HugeIconData(0x3f36);

  /// IconData for the 'strokeRoundedDirectionLeft01' icon.
  static const IconData directionLeft01 = HugeIconData(0x3f37);

  /// IconData for the 'strokeRoundedDirectionLeft02' icon.
  static const IconData directionLeft02 = HugeIconData(0x3f38);

  /// IconData for the 'strokeRoundedDirectionRight01' icon.
  static const IconData directionRight01 = HugeIconData(0x3f39);

  /// IconData for the 'strokeRoundedDirectionRight02' icon.
  static const IconData directionRight02 = HugeIconData(0x3f3a);

  /// IconData for the 'strokeRoundedDirections01' icon.
  static const IconData directions01 = HugeIconData(0x3f3b);

  /// IconData for the 'strokeRoundedDirections02' icon.
  static const IconData directions02 = HugeIconData(0x3f3c);

  /// IconData for the 'strokeRoundedDirham' icon.
  static const IconData dirham = HugeIconData(0x3f3d);

  /// IconData for the 'strokeRoundedDisability01' icon.
  static const IconData disability01 = HugeIconData(0x3f3e);

  /// IconData for the 'strokeRoundedDisability02' icon.
  static const IconData disability02 = HugeIconData(0x3f3f);

  /// IconData for the 'strokeRoundedDiscord' icon.
  static const IconData discord = HugeIconData(0x3f40);

  /// IconData for the 'strokeRoundedDiscount01' icon.
  static const IconData discount01 = HugeIconData(0x3f41);

  /// IconData for the 'strokeRoundedDiscountTag01' icon.
  static const IconData discountTag01 = HugeIconData(0x3f42);

  /// IconData for the 'strokeRoundedDiscountTag02' icon.
  static const IconData discountTag02 = HugeIconData(0x3f43);

  /// IconData for the 'strokeRoundedDiscount' icon.
  static const IconData discount = HugeIconData(0x3f44);

  /// IconData for the 'strokeRoundedDiscoverCircle' icon.
  static const IconData discoverCircle = HugeIconData(0x3f45);

  /// IconData for the 'strokeRoundedDiscoverSquare' icon.
  static const IconData discoverSquare = HugeIconData(0x3f46);

  /// IconData for the 'strokeRoundedDish01' icon.
  static const IconData dish01 = HugeIconData(0x3f47);

  /// IconData for the 'strokeRoundedDish02' icon.
  static const IconData dish02 = HugeIconData(0x3f48);

  /// IconData for the 'strokeRoundedDishWasher' icon.
  static const IconData dishWasher = HugeIconData(0x3f49);

  /// IconData for the 'strokeRoundedDispleased' icon.
  static const IconData displeased = HugeIconData(0x3f4a);

  /// IconData for the 'strokeRoundedDistributeHorizontalCenter' icon.
  static const IconData distributeHorizontalCenter = HugeIconData(0x3f4b);

  /// IconData for the 'strokeRoundedDistributeHorizontalLeft' icon.
  static const IconData distributeHorizontalLeft = HugeIconData(0x3f4c);

  /// IconData for the 'strokeRoundedDistributeHorizontalRight' icon.
  static const IconData distributeHorizontalRight = HugeIconData(0x3f4d);

  /// IconData for the 'strokeRoundedDistributeVerticalBottom' icon.
  static const IconData distributeVerticalBottom = HugeIconData(0x3f4e);

  /// IconData for the 'strokeRoundedDistributeVerticalCenter' icon.
  static const IconData distributeVerticalCenter = HugeIconData(0x3f4f);

  /// IconData for the 'strokeRoundedDistributeVerticalTop' icon.
  static const IconData distributeVerticalTop = HugeIconData(0x3f50);

  /// IconData for the 'strokeRoundedDistribution' icon.
  static const IconData distribution = HugeIconData(0x3f51);

  /// IconData for the 'strokeRoundedDivideSignCircle' icon.
  static const IconData divideSignCircle = HugeIconData(0x3f52);

  /// IconData for the 'strokeRoundedDivideSignSquare' icon.
  static const IconData divideSignSquare = HugeIconData(0x3f53);

  /// IconData for the 'strokeRoundedDivideSign' icon.
  static const IconData divideSign = HugeIconData(0x3f54);

  /// IconData for the 'strokeRoundedDna01' icon.
  static const IconData dna01 = HugeIconData(0x3f55);

  /// IconData for the 'strokeRoundedDna' icon.
  static const IconData dna = HugeIconData(0x3f56);

  /// IconData for the 'strokeRoundedDoNotTouch01' icon.
  static const IconData doNotTouch01 = HugeIconData(0x3f57);

  /// IconData for the 'strokeRoundedDoNotTouch02' icon.
  static const IconData doNotTouch02 = HugeIconData(0x3f58);

  /// IconData for the 'strokeRoundedDoc01' icon.
  static const IconData doc01 = HugeIconData(0x3f59);

  /// IconData for the 'strokeRoundedDoc02' icon.
  static const IconData doc02 = HugeIconData(0x3f5a);

  /// IconData for the 'strokeRoundedDoctor01' icon.
  static const IconData doctor01 = HugeIconData(0x3f5b);

  /// IconData for the 'strokeRoundedDoctor02' icon.
  static const IconData doctor02 = HugeIconData(0x3f5c);

  /// IconData for the 'strokeRoundedDoctor03' icon.
  static const IconData doctor03 = HugeIconData(0x3f5d);

  /// IconData for the 'strokeRoundedDocumentAttachment' icon.
  static const IconData documentAttachment = HugeIconData(0x3f5e);

  /// IconData for the 'strokeRoundedDocumentCode' icon.
  static const IconData documentCode = HugeIconData(0x3f5f);

  /// IconData for the 'strokeRoundedDocumentValidation' icon.
  static const IconData documentValidation = HugeIconData(0x3f60);

  /// IconData for the 'strokeRoundedDollar01' icon.
  static const IconData dollar01 = HugeIconData(0x3f61);

  /// IconData for the 'strokeRoundedDollar02' icon.
  static const IconData dollar02 = HugeIconData(0x3f62);

  /// IconData for the 'strokeRoundedDollarCircle' icon.
  static const IconData dollarCircle = HugeIconData(0x3f63);

  /// IconData for the 'strokeRoundedDollarReceive01' icon.
  static const IconData dollarReceive01 = HugeIconData(0x3f64);

  /// IconData for the 'strokeRoundedDollarReceive02' icon.
  static const IconData dollarReceive02 = HugeIconData(0x3f65);

  /// IconData for the 'strokeRoundedDollarSend01' icon.
  static const IconData dollarSend01 = HugeIconData(0x3f66);

  /// IconData for the 'strokeRoundedDollarSend02' icon.
  static const IconData dollarSend02 = HugeIconData(0x3f67);

  /// IconData for the 'strokeRoundedDollarSquare' icon.
  static const IconData dollarSquare = HugeIconData(0x3f68);

  /// IconData for the 'strokeRoundedDome' icon.
  static const IconData dome = HugeIconData(0x3f69);

  /// IconData for the 'strokeRoundedDomino' icon.
  static const IconData domino = HugeIconData(0x3f6a);

  /// IconData for the 'strokeRoundedDoor01' icon.
  static const IconData door01 = HugeIconData(0x3f6b);

  /// IconData for the 'strokeRoundedDoor02' icon.
  static const IconData door02 = HugeIconData(0x3f6c);

  /// IconData for the 'strokeRoundedDoorLock' icon.
  static const IconData doorLock = HugeIconData(0x3f6d);

  /// IconData for the 'strokeRoundedDoor' icon.
  static const IconData door = HugeIconData(0x3f6e);

  /// IconData for the 'strokeRoundedDoughnut' icon.
  static const IconData doughnut = HugeIconData(0x3f6f);

  /// IconData for the 'strokeRoundedDownload01' icon.
  static const IconData download01 = HugeIconData(0x3f70);

  /// IconData for the 'strokeRoundedDownload02' icon.
  static const IconData download02 = HugeIconData(0x3f71);

  /// IconData for the 'strokeRoundedDownload03' icon.
  static const IconData download03 = HugeIconData(0x3f72);

  /// IconData for the 'strokeRoundedDownload04' icon.
  static const IconData download04 = HugeIconData(0x3f73);

  /// IconData for the 'strokeRoundedDownload05' icon.
  static const IconData download05 = HugeIconData(0x3f74);

  /// IconData for the 'strokeRoundedDownloadCircle01' icon.
  static const IconData downloadCircle01 = HugeIconData(0x3f75);

  /// IconData for the 'strokeRoundedDownloadCircle02' icon.
  static const IconData downloadCircle02 = HugeIconData(0x3f76);

  /// IconData for the 'strokeRoundedDownloadSquare01' icon.
  static const IconData downloadSquare01 = HugeIconData(0x3f77);

  /// IconData for the 'strokeRoundedDownloadSquare02' icon.
  static const IconData downloadSquare02 = HugeIconData(0x3f78);

  /// IconData for the 'strokeRoundedDrag01' icon.
  static const IconData drag01 = HugeIconData(0x3f79);

  /// IconData for the 'strokeRoundedDrag02' icon.
  static const IconData drag02 = HugeIconData(0x3f7a);

  /// IconData for the 'strokeRoundedDrag03' icon.
  static const IconData drag03 = HugeIconData(0x3f7b);

  /// IconData for the 'strokeRoundedDrag04' icon.
  static const IconData drag04 = HugeIconData(0x3f7c);

  /// IconData for the 'strokeRoundedDragDropHorizontal' icon.
  static const IconData dragDropHorizontal = HugeIconData(0x3f7d);

  /// IconData for the 'strokeRoundedDragDropVertical' icon.
  static const IconData dragDropVertical = HugeIconData(0x3f7e);

  /// IconData for the 'strokeRoundedDragDrop' icon.
  static const IconData dragDrop = HugeIconData(0x3f7f);

  /// IconData for the 'strokeRoundedDragLeft01' icon.
  static const IconData dragLeft01 = HugeIconData(0x3f80);

  /// IconData for the 'strokeRoundedDragLeft02' icon.
  static const IconData dragLeft02 = HugeIconData(0x3f81);

  /// IconData for the 'strokeRoundedDragLeft03' icon.
  static const IconData dragLeft03 = HugeIconData(0x3f82);

  /// IconData for the 'strokeRoundedDragLeft04' icon.
  static const IconData dragLeft04 = HugeIconData(0x3f83);

  /// IconData for the 'strokeRoundedDragRight01' icon.
  static const IconData dragRight01 = HugeIconData(0x3f84);

  /// IconData for the 'strokeRoundedDragRight02' icon.
  static const IconData dragRight02 = HugeIconData(0x3f85);

  /// IconData for the 'strokeRoundedDragRight03' icon.
  static const IconData dragRight03 = HugeIconData(0x3f86);

  /// IconData for the 'strokeRoundedDragRight04' icon.
  static const IconData dragRight04 = HugeIconData(0x3f87);

  /// IconData for the 'strokeRoundedDrawingCompass' icon.
  static const IconData drawingCompass = HugeIconData(0x3f88);

  /// IconData for the 'strokeRoundedDrawingMode' icon.
  static const IconData drawingMode = HugeIconData(0x3f89);

  /// IconData for the 'strokeRoundedDress01' icon.
  static const IconData dress01 = HugeIconData(0x3f8a);

  /// IconData for the 'strokeRoundedDress02' icon.
  static const IconData dress02 = HugeIconData(0x3f8b);

  /// IconData for the 'strokeRoundedDress03' icon.
  static const IconData dress03 = HugeIconData(0x3f8c);

  /// IconData for the 'strokeRoundedDress04' icon.
  static const IconData dress04 = HugeIconData(0x3f8d);

  /// IconData for the 'strokeRoundedDress05' icon.
  static const IconData dress05 = HugeIconData(0x3f8e);

  /// IconData for the 'strokeRoundedDress06' icon.
  static const IconData dress06 = HugeIconData(0x3f8f);

  /// IconData for the 'strokeRoundedDress07' icon.
  static const IconData dress07 = HugeIconData(0x3f90);

  /// IconData for the 'strokeRoundedDressingTable01' icon.
  static const IconData dressingTable01 = HugeIconData(0x3f91);

  /// IconData for the 'strokeRoundedDressingTable02' icon.
  static const IconData dressingTable02 = HugeIconData(0x3f92);

  /// IconData for the 'strokeRoundedDressingTable03' icon.
  static const IconData dressingTable03 = HugeIconData(0x3f93);

  /// IconData for the 'strokeRoundedDribbble' icon.
  static const IconData dribbble = HugeIconData(0x3f94);

  /// IconData for the 'strokeRoundedDrink' icon.
  static const IconData drink = HugeIconData(0x3f95);

  /// IconData for the 'strokeRoundedDrone' icon.
  static const IconData drone = HugeIconData(0x3f96);

  /// IconData for the 'strokeRoundedDrooling' icon.
  static const IconData drooling = HugeIconData(0x3f97);

  /// IconData for the 'strokeRoundedDropbox' icon.
  static const IconData dropbox = HugeIconData(0x3f98);

  /// IconData for the 'strokeRoundedDroplet' icon.
  static const IconData droplet = HugeIconData(0x3f99);

  /// IconData for the 'strokeRoundedDropper' icon.
  static const IconData dropper = HugeIconData(0x3f9a);

  /// IconData for the 'strokeRoundedDs3Tool' icon.
  static const IconData ds3Tool = HugeIconData(0x3f9b);

  /// IconData for the 'strokeRoundedDua' icon.
  static const IconData dua = HugeIconData(0x3f9c);

  /// IconData for the 'strokeRoundedDumbbell01' icon.
  static const IconData dumbbell01 = HugeIconData(0x3f9d);

  /// IconData for the 'strokeRoundedDumbbell02' icon.
  static const IconData dumbbell02 = HugeIconData(0x3f9e);

  /// IconData for the 'strokeRoundedDumbbell03' icon.
  static const IconData dumbbell03 = HugeIconData(0x3f9f);

  /// IconData for the 'strokeRoundedEarRings01' icon.
  static const IconData earRings01 = HugeIconData(0x3fa0);

  /// IconData for the 'strokeRoundedEarRings02' icon.
  static const IconData earRings02 = HugeIconData(0x3fa1);

  /// IconData for the 'strokeRoundedEarRings03' icon.
  static const IconData earRings03 = HugeIconData(0x3fa2);

  /// IconData for the 'strokeRoundedEar' icon.
  static const IconData ear = HugeIconData(0x3fa3);

  /// IconData for the 'strokeRoundedEarth' icon.
  static const IconData earth = HugeIconData(0x3fa4);

  /// IconData for the 'strokeRoundedEaseCurveControlPoints' icon.
  static const IconData easeCurveControlPoints = HugeIconData(0x3fa5);

  /// IconData for the 'strokeRoundedEaseInControlPoint' icon.
  static const IconData easeInControlPoint = HugeIconData(0x3fa6);

  /// IconData for the 'strokeRoundedEaseInOut' icon.
  static const IconData easeInOut = HugeIconData(0x3fa7);

  /// IconData for the 'strokeRoundedEaseIn' icon.
  static const IconData easeIn = HugeIconData(0x3fa8);

  /// IconData for the 'strokeRoundedEaseOutControlPoint' icon.
  static const IconData easeOutControlPoint = HugeIconData(0x3fa9);

  /// IconData for the 'strokeRoundedEaseOut' icon.
  static const IconData easeOut = HugeIconData(0x3faa);

  /// IconData for the 'strokeRoundedEcoEnergy' icon.
  static const IconData ecoEnergy = HugeIconData(0x3fab);

  /// IconData for the 'strokeRoundedEcoLab01' icon.
  static const IconData ecoLab01 = HugeIconData(0x3fac);

  /// IconData for the 'strokeRoundedEcoLab02' icon.
  static const IconData ecoLab02 = HugeIconData(0x3fad);

  /// IconData for the 'strokeRoundedEcoLab' icon.
  static const IconData ecoLab = HugeIconData(0x3fae);

  /// IconData for the 'strokeRoundedEcoPower' icon.
  static const IconData ecoPower = HugeIconData(0x3faf);

  /// IconData for the 'strokeRoundedEdgeStyle' icon.
  static const IconData edgeStyle = HugeIconData(0x3fb0);

  /// IconData for the 'strokeRoundedEdit01' icon.
  static const IconData edit01 = HugeIconData(0x3fb1);

  /// IconData for the 'strokeRoundedEdit02' icon.
  static const IconData edit02 = HugeIconData(0x3fb2);

  /// IconData for the 'strokeRoundedEditOff' icon.
  static const IconData editOff = HugeIconData(0x3fb3);

  /// IconData for the 'strokeRoundedEditRoad' icon.
  static const IconData editRoad = HugeIconData(0x3fb4);

  /// IconData for the 'strokeRoundedEditTable' icon.
  static const IconData editTable = HugeIconData(0x3fb5);

  /// IconData for the 'strokeRoundedEditUser02' icon.
  static const IconData editUser02 = HugeIconData(0x3fb6);

  /// IconData for the 'strokeRoundedEggs' icon.
  static const IconData eggs = HugeIconData(0x3fb7);

  /// IconData for the 'strokeRoundedEidMubarak' icon.
  static const IconData eidMubarak = HugeIconData(0x3fb8);

  /// IconData for the 'strokeRoundedEiffelTower' icon.
  static const IconData eiffelTower = HugeIconData(0x3fb9);

  /// IconData for the 'strokeRoundedElearningExchange' icon.
  static const IconData elearningExchange = HugeIconData(0x3fba);

  /// IconData for the 'strokeRoundedElectricHome01' icon.
  static const IconData electricHome01 = HugeIconData(0x3fbb);

  /// IconData for the 'strokeRoundedElectricHome02' icon.
  static const IconData electricHome02 = HugeIconData(0x3fbc);

  /// IconData for the 'strokeRoundedElectricPlugs' icon.
  static const IconData electricPlugs = HugeIconData(0x3fbd);

  /// IconData for the 'strokeRoundedElectricTower01' icon.
  static const IconData electricTower01 = HugeIconData(0x3fbe);

  /// IconData for the 'strokeRoundedElectricTower02' icon.
  static const IconData electricTower02 = HugeIconData(0x3fbf);

  /// IconData for the 'strokeRoundedElectricWire' icon.
  static const IconData electricWire = HugeIconData(0x3fc0);

  /// IconData for the 'strokeRoundedEllipseSelection' icon.
  static const IconData ellipseSelection = HugeIconData(0x3fc1);

  /// IconData for the 'strokeRoundedEncrypt' icon.
  static const IconData encrypt = HugeIconData(0x3fc2);

  /// IconData for the 'strokeRoundedEnergyEllipse' icon.
  static const IconData energyEllipse = HugeIconData(0x3fc3);

  /// IconData for the 'strokeRoundedEnergyRectangle' icon.
  static const IconData energyRectangle = HugeIconData(0x3fc4);

  /// IconData for the 'strokeRoundedEnergy' icon.
  static const IconData energy = HugeIconData(0x3fc5);

  /// IconData for the 'strokeRoundedEnteringGeoFence' icon.
  static const IconData enteringGeoFence = HugeIconData(0x3fc6);

  /// IconData for the 'strokeRoundedEnvato' icon.
  static const IconData envato = HugeIconData(0x3fc7);

  /// IconData for the 'strokeRoundedEqualSignCircle' icon.
  static const IconData equalSignCircle = HugeIconData(0x3fc8);

  /// IconData for the 'strokeRoundedEqualSignSquare' icon.
  static const IconData equalSignSquare = HugeIconData(0x3fc9);

  /// IconData for the 'strokeRoundedEqualSign' icon.
  static const IconData equalSign = HugeIconData(0x3fca);

  /// IconData for the 'strokeRoundedEquipmentBenchPress' icon.
  static const IconData equipmentBenchPress = HugeIconData(0x3fcb);

  /// IconData for the 'strokeRoundedEquipmentChestPress' icon.
  static const IconData equipmentChestPress = HugeIconData(0x3fcc);

  /// IconData for the 'strokeRoundedEquipmentGym01' icon.
  static const IconData equipmentGym01 = HugeIconData(0x3fcd);

  /// IconData for the 'strokeRoundedEquipmentGym02' icon.
  static const IconData equipmentGym02 = HugeIconData(0x3fce);

  /// IconData for the 'strokeRoundedEquipmentGym03' icon.
  static const IconData equipmentGym03 = HugeIconData(0x3fcf);

  /// IconData for the 'strokeRoundedEquipmentWeightlifting' icon.
  static const IconData equipmentWeightlifting = HugeIconData(0x3fd0);

  /// IconData for the 'strokeRoundedEraser01' icon.
  static const IconData eraser01 = HugeIconData(0x3fd1);

  /// IconData for the 'strokeRoundedEraserAdd' icon.
  static const IconData eraserAdd = HugeIconData(0x3fd2);

  /// IconData for the 'strokeRoundedEraserAuto' icon.
  static const IconData eraserAuto = HugeIconData(0x3fd3);

  /// IconData for the 'strokeRoundedEraser' icon.
  static const IconData eraser = HugeIconData(0x3fd4);

  /// IconData for the 'strokeRoundedEstimate01' icon.
  static const IconData estimate01 = HugeIconData(0x3fd5);

  /// IconData for the 'strokeRoundedEstimate02' icon.
  static const IconData estimate02 = HugeIconData(0x3fd6);

  /// IconData for the 'strokeRoundedEthereumEllipse' icon.
  static const IconData ethereumEllipse = HugeIconData(0x3fd7);

  /// IconData for the 'strokeRoundedEthereumRectangle' icon.
  static const IconData ethereumRectangle = HugeIconData(0x3fd8);

  /// IconData for the 'strokeRoundedEthereum' icon.
  static const IconData ethereum = HugeIconData(0x3fd9);

  /// IconData for the 'strokeRoundedEuroCircle' icon.
  static const IconData euroCircle = HugeIconData(0x3fda);

  /// IconData for the 'strokeRoundedEuroReceive' icon.
  static const IconData euroReceive = HugeIconData(0x3fdb);

  /// IconData for the 'strokeRoundedEuroSend' icon.
  static const IconData euroSend = HugeIconData(0x3fdc);

  /// IconData for the 'strokeRoundedEuroSquare' icon.
  static const IconData euroSquare = HugeIconData(0x3fdd);

  /// IconData for the 'strokeRoundedEuro' icon.
  static const IconData euro = HugeIconData(0x3fde);

  /// IconData for the 'strokeRoundedEvCharging' icon.
  static const IconData evCharging = HugeIconData(0x3fdf);

  /// IconData for the 'strokeRoundedEvil' icon.
  static const IconData evil = HugeIconData(0x3fe0);

  /// IconData for the 'strokeRoundedExchange01' icon.
  static const IconData exchange01 = HugeIconData(0x3fe1);

  /// IconData for the 'strokeRoundedExchange02' icon.
  static const IconData exchange02 = HugeIconData(0x3fe2);

  /// IconData for the 'strokeRoundedExchange03' icon.
  static const IconData exchange03 = HugeIconData(0x3fe3);

  /// IconData for the 'strokeRoundedExpander' icon.
  static const IconData expander = HugeIconData(0x3fe4);

  /// IconData for the 'strokeRoundedExternalDrive' icon.
  static const IconData externalDrive = HugeIconData(0x3fe5);

  /// IconData for the 'strokeRoundedEye' icon.
  static const IconData eye = HugeIconData(0x3fe6);

  /// IconData for the 'strokeRoundedFaceId' icon.
  static const IconData faceId = HugeIconData(0x3fe7);

  /// IconData for the 'strokeRoundedFacebook01' icon.
  static const IconData facebook01 = HugeIconData(0x3fe8);

  /// IconData for the 'strokeRoundedFacebook02' icon.
  static const IconData facebook02 = HugeIconData(0x3fe9);

  /// IconData for the 'strokeRoundedFactory01' icon.
  static const IconData factory01 = HugeIconData(0x3fea);

  /// IconData for the 'strokeRoundedFactory02' icon.
  static const IconData factory02 = HugeIconData(0x3feb);

  /// IconData for the 'strokeRoundedFactory' icon.
  static const IconData factory = HugeIconData(0x3fec);

  /// IconData for the 'strokeRoundedFahrenheit' icon.
  static const IconData fahrenheit = HugeIconData(0x3fed);

  /// IconData for the 'strokeRoundedFallingStar' icon.
  static const IconData fallingStar = HugeIconData(0x3fee);

  /// IconData for the 'strokeRoundedFastWind' icon.
  static const IconData fastWind = HugeIconData(0x3fef);

  /// IconData for the 'strokeRoundedFavouriteCircle' icon.
  static const IconData favouriteCircle = HugeIconData(0x3ff0);

  /// IconData for the 'strokeRoundedFavouriteSquare' icon.
  static const IconData favouriteSquare = HugeIconData(0x3ff1);

  /// IconData for the 'strokeRoundedFavourite' icon.
  static const IconData favourite = HugeIconData(0x3ff2);

  /// IconData for the 'strokeRoundedFeather' icon.
  static const IconData feather = HugeIconData(0x3ff3);

  /// IconData for the 'strokeRoundedFencingMask' icon.
  static const IconData fencingMask = HugeIconData(0x3ff4);

  /// IconData for the 'strokeRoundedFencing' icon.
  static const IconData fencing = HugeIconData(0x3ff5);

  /// IconData for the 'strokeRoundedFerrisWheel' icon.
  static const IconData ferrisWheel = HugeIconData(0x3ff6);

  /// IconData for the 'strokeRoundedFerryBoat' icon.
  static const IconData ferryBoat = HugeIconData(0x3ff7);

  /// IconData for the 'strokeRoundedFigma' icon.
  static const IconData figma = HugeIconData(0x3ff8);

  /// IconData for the 'strokeRoundedFile01' icon.
  static const IconData file01 = HugeIconData(0x3ff9);

  /// IconData for the 'strokeRoundedFile02' icon.
  static const IconData file02 = HugeIconData(0x3ffa);

  /// IconData for the 'strokeRoundedFileAdd' icon.
  static const IconData fileAdd = HugeIconData(0x3ffb);

  /// IconData for the 'strokeRoundedFileAttachment' icon.
  static const IconData fileAttachment = HugeIconData(0x3ffc);

  /// IconData for the 'strokeRoundedFileAudio' icon.
  static const IconData fileAudio = HugeIconData(0x3ffd);

  /// IconData for the 'strokeRoundedFileBitcoin' icon.
  static const IconData fileBitcoin = HugeIconData(0x3ffe);

  /// IconData for the 'strokeRoundedFileBlock' icon.
  static const IconData fileBlock = HugeIconData(0x3fff);

  /// IconData for the 'strokeRoundedFileBookmark' icon.
  static const IconData fileBookmark = HugeIconData(0x4000);

  /// IconData for the 'strokeRoundedFileCloud' icon.
  static const IconData fileCloud = HugeIconData(0x4001);

  /// IconData for the 'strokeRoundedFileCorrupt' icon.
  static const IconData fileCorrupt = HugeIconData(0x4002);

  /// IconData for the 'strokeRoundedFileDollar' icon.
  static const IconData fileDollar = HugeIconData(0x4003);

  /// IconData for the 'strokeRoundedFileDownload' icon.
  static const IconData fileDownload = HugeIconData(0x4004);

  /// IconData for the 'strokeRoundedFileEdit' icon.
  static const IconData fileEdit = HugeIconData(0x4005);

  /// IconData for the 'strokeRoundedFileEuro' icon.
  static const IconData fileEuro = HugeIconData(0x4006);

  /// IconData for the 'strokeRoundedFileExport' icon.
  static const IconData fileExport = HugeIconData(0x4007);

  /// IconData for the 'strokeRoundedFileFavourite' icon.
  static const IconData fileFavourite = HugeIconData(0x4008);

  /// IconData for the 'strokeRoundedFileImport' icon.
  static const IconData fileImport = HugeIconData(0x4009);

  /// IconData for the 'strokeRoundedFileLink' icon.
  static const IconData fileLink = HugeIconData(0x400a);

  /// IconData for the 'strokeRoundedFileLocked' icon.
  static const IconData fileLocked = HugeIconData(0x400b);

  /// IconData for the 'strokeRoundedFileManagement' icon.
  static const IconData fileManagement = HugeIconData(0x400c);

  /// IconData for the 'strokeRoundedFileMinus' icon.
  static const IconData fileMinus = HugeIconData(0x400d);

  /// IconData for the 'strokeRoundedFileMusic' icon.
  static const IconData fileMusic = HugeIconData(0x400e);

  /// IconData for the 'strokeRoundedFileNotFound' icon.
  static const IconData fileNotFound = HugeIconData(0x400f);

  /// IconData for the 'strokeRoundedFilePaste' icon.
  static const IconData filePaste = HugeIconData(0x4010);

  /// IconData for the 'strokeRoundedFilePin' icon.
  static const IconData filePin = HugeIconData(0x4011);

  /// IconData for the 'strokeRoundedFilePound' icon.
  static const IconData filePound = HugeIconData(0x4012);

  /// IconData for the 'strokeRoundedFileRemove' icon.
  static const IconData fileRemove = HugeIconData(0x4013);

  /// IconData for the 'strokeRoundedFileScript' icon.
  static const IconData fileScript = HugeIconData(0x4014);

  /// IconData for the 'strokeRoundedFileSearch' icon.
  static const IconData fileSearch = HugeIconData(0x4015);

  /// IconData for the 'strokeRoundedFileSecurity' icon.
  static const IconData fileSecurity = HugeIconData(0x4016);

  /// IconData for the 'strokeRoundedFileShredder' icon.
  static const IconData fileShredder = HugeIconData(0x4017);

  /// IconData for the 'strokeRoundedFileStar' icon.
  static const IconData fileStar = HugeIconData(0x4018);

  /// IconData for the 'strokeRoundedFileSync' icon.
  static const IconData fileSync = HugeIconData(0x4019);

  /// IconData for the 'strokeRoundedFileUnknown' icon.
  static const IconData fileUnknown = HugeIconData(0x401a);

  /// IconData for the 'strokeRoundedFileUnlocked' icon.
  static const IconData fileUnlocked = HugeIconData(0x401b);

  /// IconData for the 'strokeRoundedFileUpload' icon.
  static const IconData fileUpload = HugeIconData(0x401c);

  /// IconData for the 'strokeRoundedFileValidation' icon.
  static const IconData fileValidation = HugeIconData(0x401d);

  /// IconData for the 'strokeRoundedFileVerified' icon.
  static const IconData fileVerified = HugeIconData(0x401e);

  /// IconData for the 'strokeRoundedFileVideo' icon.
  static const IconData fileVideo = HugeIconData(0x401f);

  /// IconData for the 'strokeRoundedFileView' icon.
  static const IconData fileView = HugeIconData(0x4020);

  /// IconData for the 'strokeRoundedFileYen' icon.
  static const IconData fileYen = HugeIconData(0x4021);

  /// IconData for the 'strokeRoundedFileZip' icon.
  static const IconData fileZip = HugeIconData(0x4022);

  /// IconData for the 'strokeRoundedFiles01' icon.
  static const IconData files01 = HugeIconData(0x4023);

  /// IconData for the 'strokeRoundedFiles02' icon.
  static const IconData files02 = HugeIconData(0x4024);

  /// IconData for the 'strokeRoundedFilm01' icon.
  static const IconData film01 = HugeIconData(0x4025);

  /// IconData for the 'strokeRoundedFilm02' icon.
  static const IconData film02 = HugeIconData(0x4026);

  /// IconData for the 'strokeRoundedFilmRoll01' icon.
  static const IconData filmRoll01 = HugeIconData(0x4027);

  /// IconData for the 'strokeRoundedFilmRoll02' icon.
  static const IconData filmRoll02 = HugeIconData(0x4028);

  /// IconData for the 'strokeRoundedFilterAdd' icon.
  static const IconData filterAdd = HugeIconData(0x4029);

  /// IconData for the 'strokeRoundedFilterEdit' icon.
  static const IconData filterEdit = HugeIconData(0x402a);

  /// IconData for the 'strokeRoundedFilterHorizontal' icon.
  static const IconData filterHorizontal = HugeIconData(0x402b);

  /// IconData for the 'strokeRoundedFilterMailCircle' icon.
  static const IconData filterMailCircle = HugeIconData(0x402c);

  /// IconData for the 'strokeRoundedFilterMailSquare' icon.
  static const IconData filterMailSquare = HugeIconData(0x402d);

  /// IconData for the 'strokeRoundedFilterRemove' icon.
  static const IconData filterRemove = HugeIconData(0x402e);

  /// IconData for the 'strokeRoundedFilterReset' icon.
  static const IconData filterReset = HugeIconData(0x402f);

  /// IconData for the 'strokeRoundedFilterVertical' icon.
  static const IconData filterVertical = HugeIconData(0x4030);

  /// IconData for the 'strokeRoundedFilter' icon.
  static const IconData filter = HugeIconData(0x4031);

  /// IconData for the 'strokeRoundedFingerAccess' icon.
  static const IconData fingerAccess = HugeIconData(0x4032);

  /// IconData for the 'strokeRoundedFingerPrintAdd' icon.
  static const IconData fingerPrintAdd = HugeIconData(0x4033);

  /// IconData for the 'strokeRoundedFingerPrintCheck' icon.
  static const IconData fingerPrintCheck = HugeIconData(0x4034);

  /// IconData for the 'strokeRoundedFingerPrintMinus' icon.
  static const IconData fingerPrintMinus = HugeIconData(0x4035);

  /// IconData for the 'strokeRoundedFingerPrintRemove' icon.
  static const IconData fingerPrintRemove = HugeIconData(0x4036);

  /// IconData for the 'strokeRoundedFingerPrintScan' icon.
  static const IconData fingerPrintScan = HugeIconData(0x4037);

  /// IconData for the 'strokeRoundedFingerPrint' icon.
  static const IconData fingerPrint = HugeIconData(0x4038);

  /// IconData for the 'strokeRoundedFingerprintScan' icon.
  static const IconData fingerprintScan = HugeIconData(0x4039);

  /// IconData for the 'strokeRoundedFins' icon.
  static const IconData fins = HugeIconData(0x403a);

  /// IconData for the 'strokeRoundedFirePit' icon.
  static const IconData firePit = HugeIconData(0x403b);

  /// IconData for the 'strokeRoundedFireSecurity' icon.
  static const IconData fireSecurity = HugeIconData(0x403c);

  /// IconData for the 'strokeRoundedFire' icon.
  static const IconData fire = HugeIconData(0x403d);

  /// IconData for the 'strokeRoundedFirewall' icon.
  static const IconData firewall = HugeIconData(0x403e);

  /// IconData for the 'strokeRoundedFirstAidKit' icon.
  static const IconData firstAidKit = HugeIconData(0x403f);

  /// IconData for the 'strokeRoundedFirstBracketCircle' icon.
  static const IconData firstBracketCircle = HugeIconData(0x4040);

  /// IconData for the 'strokeRoundedFirstBracketSquare' icon.
  static const IconData firstBracketSquare = HugeIconData(0x4041);

  /// IconData for the 'strokeRoundedFirstBracket' icon.
  static const IconData firstBracket = HugeIconData(0x4042);

  /// IconData for the 'strokeRoundedFishFood' icon.
  static const IconData fishFood = HugeIconData(0x4043);

  /// IconData for the 'strokeRoundedFiverr' icon.
  static const IconData fiverr = HugeIconData(0x4044);

  /// IconData for the 'strokeRoundedFlag01' icon.
  static const IconData flag01 = HugeIconData(0x4045);

  /// IconData for the 'strokeRoundedFlag02' icon.
  static const IconData flag02 = HugeIconData(0x4046);

  /// IconData for the 'strokeRoundedFlag03' icon.
  static const IconData flag03 = HugeIconData(0x4047);

  /// IconData for the 'strokeRoundedFlashOff' icon.
  static const IconData flashOff = HugeIconData(0x4048);

  /// IconData for the 'strokeRoundedFlash' icon.
  static const IconData flash = HugeIconData(0x4049);

  /// IconData for the 'strokeRoundedFlaticon' icon.
  static const IconData flaticon = HugeIconData(0x404a);

  /// IconData for the 'strokeRoundedFlickr' icon.
  static const IconData flickr = HugeIconData(0x404b);

  /// IconData for the 'strokeRoundedFlimSlate' icon.
  static const IconData flimSlate = HugeIconData(0x404c);

  /// IconData for the 'strokeRoundedFlipBottom' icon.
  static const IconData flipBottom = HugeIconData(0x404d);

  /// IconData for the 'strokeRoundedFlipHorizontal' icon.
  static const IconData flipHorizontal = HugeIconData(0x404e);

  /// IconData for the 'strokeRoundedFlipLeft' icon.
  static const IconData flipLeft = HugeIconData(0x404f);

  /// IconData for the 'strokeRoundedFlipPhone' icon.
  static const IconData flipPhone = HugeIconData(0x4050);

  /// IconData for the 'strokeRoundedFlipRight' icon.
  static const IconData flipRight = HugeIconData(0x4051);

  /// IconData for the 'strokeRoundedFlipTop' icon.
  static const IconData flipTop = HugeIconData(0x4052);

  /// IconData for the 'strokeRoundedFlipVertical' icon.
  static const IconData flipVertical = HugeIconData(0x4053);

  /// IconData for the 'strokeRoundedFloorPlan' icon.
  static const IconData floorPlan = HugeIconData(0x4054);

  /// IconData for the 'strokeRoundedFloppyDisk' icon.
  static const IconData floppyDisk = HugeIconData(0x4055);

  /// IconData for the 'strokeRoundedFlowCircle' icon.
  static const IconData flowCircle = HugeIconData(0x4056);

  /// IconData for the 'strokeRoundedFlowConnection' icon.
  static const IconData flowConnection = HugeIconData(0x4057);

  /// IconData for the 'strokeRoundedFlowSquare' icon.
  static const IconData flowSquare = HugeIconData(0x4058);

  /// IconData for the 'strokeRoundedFlow' icon.
  static const IconData flow = HugeIconData(0x4059);

  /// IconData for the 'strokeRoundedFlowchart01' icon.
  static const IconData flowchart01 = HugeIconData(0x405a);

  /// IconData for the 'strokeRoundedFlowchart02' icon.
  static const IconData flowchart02 = HugeIconData(0x405b);

  /// IconData for the 'strokeRoundedFlowerPot' icon.
  static const IconData flowerPot = HugeIconData(0x405c);

  /// IconData for the 'strokeRoundedFlower' icon.
  static const IconData flower = HugeIconData(0x405d);

  /// IconData for the 'strokeRoundedFlushed' icon.
  static const IconData flushed = HugeIconData(0x405e);

  /// IconData for the 'strokeRoundedFlyingHuman' icon.
  static const IconData flyingHuman = HugeIconData(0x405f);

  /// IconData for the 'strokeRoundedFocusPoint' icon.
  static const IconData focusPoint = HugeIconData(0x4060);

  /// IconData for the 'strokeRoundedFolder01' icon.
  static const IconData folder01 = HugeIconData(0x4061);

  /// IconData for the 'strokeRoundedFolder02' icon.
  static const IconData folder02 = HugeIconData(0x4062);

  /// IconData for the 'strokeRoundedFolder03' icon.
  static const IconData folder03 = HugeIconData(0x4063);

  /// IconData for the 'strokeRoundedFolderAdd' icon.
  static const IconData folderAdd = HugeIconData(0x4064);

  /// IconData for the 'strokeRoundedFolderAttachment' icon.
  static const IconData folderAttachment = HugeIconData(0x4065);

  /// IconData for the 'strokeRoundedFolderAudio' icon.
  static const IconData folderAudio = HugeIconData(0x4066);

  /// IconData for the 'strokeRoundedFolderBlock' icon.
  static const IconData folderBlock = HugeIconData(0x4067);

  /// IconData for the 'strokeRoundedFolderCheck' icon.
  static const IconData folderCheck = HugeIconData(0x4068);

  /// IconData for the 'strokeRoundedFolderCloud' icon.
  static const IconData folderCloud = HugeIconData(0x4069);

  /// IconData for the 'strokeRoundedFolderDetailsReference' icon.
  static const IconData folderDetailsReference = HugeIconData(0x406a);

  /// IconData for the 'strokeRoundedFolderDetails' icon.
  static const IconData folderDetails = HugeIconData(0x406b);

  /// IconData for the 'strokeRoundedFolderDownload' icon.
  static const IconData folderDownload = HugeIconData(0x406c);

  /// IconData for the 'strokeRoundedFolderEdit' icon.
  static const IconData folderEdit = HugeIconData(0x406d);

  /// IconData for the 'strokeRoundedFolderExport' icon.
  static const IconData folderExport = HugeIconData(0x406e);

  /// IconData for the 'strokeRoundedFolderFavourite' icon.
  static const IconData folderFavourite = HugeIconData(0x406f);

  /// IconData for the 'strokeRoundedFolderFileStorage' icon.
  static const IconData folderFileStorage = HugeIconData(0x4070);

  /// IconData for the 'strokeRoundedFolderImport' icon.
  static const IconData folderImport = HugeIconData(0x4071);

  /// IconData for the 'strokeRoundedFolderLibrary' icon.
  static const IconData folderLibrary = HugeIconData(0x4072);

  /// IconData for the 'strokeRoundedFolderLinks' icon.
  static const IconData folderLinks = HugeIconData(0x4073);

  /// IconData for the 'strokeRoundedFolderLocked' icon.
  static const IconData folderLocked = HugeIconData(0x4074);

  /// IconData for the 'strokeRoundedFolderManagement' icon.
  static const IconData folderManagement = HugeIconData(0x4075);

  /// IconData for the 'strokeRoundedFolderMinus' icon.
  static const IconData folderMinus = HugeIconData(0x4076);

  /// IconData for the 'strokeRoundedFolderMusic' icon.
  static const IconData folderMusic = HugeIconData(0x4077);

  /// IconData for the 'strokeRoundedFolderOff' icon.
  static const IconData folderOff = HugeIconData(0x4078);

  /// IconData for the 'strokeRoundedFolderOpen' icon.
  static const IconData folderOpen = HugeIconData(0x4079);

  /// IconData for the 'strokeRoundedFolderPin' icon.
  static const IconData folderPin = HugeIconData(0x407a);

  /// IconData for the 'strokeRoundedFolderRemove' icon.
  static const IconData folderRemove = HugeIconData(0x407b);

  /// IconData for the 'strokeRoundedFolderSearch' icon.
  static const IconData folderSearch = HugeIconData(0x407c);

  /// IconData for the 'strokeRoundedFolderSecurity' icon.
  static const IconData folderSecurity = HugeIconData(0x407d);

  /// IconData for the 'strokeRoundedFolderShared01' icon.
  static const IconData folderShared01 = HugeIconData(0x407e);

  /// IconData for the 'strokeRoundedFolderShared02' icon.
  static const IconData folderShared02 = HugeIconData(0x407f);

  /// IconData for the 'strokeRoundedFolderShared03' icon.
  static const IconData folderShared03 = HugeIconData(0x4080);

  /// IconData for the 'strokeRoundedFolderSync' icon.
  static const IconData folderSync = HugeIconData(0x4081);

  /// IconData for the 'strokeRoundedFolderTransfer' icon.
  static const IconData folderTransfer = HugeIconData(0x4082);

  /// IconData for the 'strokeRoundedFolderUnknown' icon.
  static const IconData folderUnknown = HugeIconData(0x4083);

  /// IconData for the 'strokeRoundedFolderUnlocked' icon.
  static const IconData folderUnlocked = HugeIconData(0x4084);

  /// IconData for the 'strokeRoundedFolderUpload' icon.
  static const IconData folderUpload = HugeIconData(0x4085);

  /// IconData for the 'strokeRoundedFolderVideo' icon.
  static const IconData folderVideo = HugeIconData(0x4086);

  /// IconData for the 'strokeRoundedFolderView' icon.
  static const IconData folderView = HugeIconData(0x4087);

  /// IconData for the 'strokeRoundedFolderZip' icon.
  static const IconData folderZip = HugeIconData(0x4088);

  /// IconData for the 'strokeRoundedFolders' icon.
  static const IconData folders = HugeIconData(0x4089);

  /// IconData for the 'strokeRoundedFootballPitch' icon.
  static const IconData footballPitch = HugeIconData(0x408a);

  /// IconData for the 'strokeRoundedFootball' icon.
  static const IconData football = HugeIconData(0x408b);

  /// IconData for the 'strokeRoundedForgotPassword' icon.
  static const IconData forgotPassword = HugeIconData(0x408c);

  /// IconData for the 'strokeRoundedFork' icon.
  static const IconData fork = HugeIconData(0x408d);

  /// IconData for the 'strokeRoundedForrst' icon.
  static const IconData forrst = HugeIconData(0x408e);

  /// IconData for the 'strokeRoundedFortress' icon.
  static const IconData fortress = HugeIconData(0x408f);

  /// IconData for the 'strokeRoundedForward01' icon.
  static const IconData forward01 = HugeIconData(0x4090);

  /// IconData for the 'strokeRoundedForward02' icon.
  static const IconData forward02 = HugeIconData(0x4091);

  /// IconData for the 'strokeRoundedFourFinger02' icon.
  static const IconData fourFinger02 = HugeIconData(0x4092);

  /// IconData for the 'strokeRoundedFourFinger03' icon.
  static const IconData fourFinger03 = HugeIconData(0x4093);

  /// IconData for the 'strokeRoundedFourK' icon.
  static const IconData fourK = HugeIconData(0x4094);

  /// IconData for the 'strokeRoundedFoursquare' icon.
  static const IconData foursquare = HugeIconData(0x4095);

  /// IconData for the 'strokeRoundedFramer' icon.
  static const IconData framer = HugeIconData(0x4096);

  /// IconData for the 'strokeRoundedFrameworks' icon.
  static const IconData frameworks = HugeIconData(0x4097);

  /// IconData for the 'strokeRoundedFrenchFries01' icon.
  static const IconData frenchFries01 = HugeIconData(0x4098);

  /// IconData for the 'strokeRoundedFrenchFries02' icon.
  static const IconData frenchFries02 = HugeIconData(0x4099);

  /// IconData for the 'strokeRoundedFridge' icon.
  static const IconData fridge = HugeIconData(0x409a);

  /// IconData for the 'strokeRoundedFry' icon.
  static const IconData fry = HugeIconData(0x409b);

  /// IconData for the 'strokeRoundedFuel01' icon.
  static const IconData fuel01 = HugeIconData(0x409c);

  /// IconData for the 'strokeRoundedFuel02' icon.
  static const IconData fuel02 = HugeIconData(0x409d);

  /// IconData for the 'strokeRoundedFuelStation' icon.
  static const IconData fuelStation = HugeIconData(0x409e);

  /// IconData for the 'strokeRoundedFunctionCircle' icon.
  static const IconData functionCircle = HugeIconData(0x409f);

  /// IconData for the 'strokeRoundedFunctionOfX' icon.
  static const IconData functionOfX = HugeIconData(0x40a0);

  /// IconData for the 'strokeRoundedFunctionSquare' icon.
  static const IconData functionSquare = HugeIconData(0x40a1);

  /// IconData for the 'strokeRoundedFunction' icon.
  static const IconData function = HugeIconData(0x40a2);

  /// IconData for the 'strokeRoundedGalaxy' icon.
  static const IconData galaxy = HugeIconData(0x40a3);

  /// IconData for the 'strokeRoundedGameController01' icon.
  static const IconData gameController01 = HugeIconData(0x40a4);

  /// IconData for the 'strokeRoundedGameController02' icon.
  static const IconData gameController02 = HugeIconData(0x40a5);

  /// IconData for the 'strokeRoundedGameController03' icon.
  static const IconData gameController03 = HugeIconData(0x40a6);

  /// IconData for the 'strokeRoundedGame' icon.
  static const IconData game = HugeIconData(0x40a7);

  /// IconData for the 'strokeRoundedGameboy' icon.
  static const IconData gameboy = HugeIconData(0x40a8);

  /// IconData for the 'strokeRoundedGarage' icon.
  static const IconData garage = HugeIconData(0x40a9);

  /// IconData for the 'strokeRoundedGarbageTruck' icon.
  static const IconData garbageTruck = HugeIconData(0x40aa);

  /// IconData for the 'strokeRoundedGasPipe' icon.
  static const IconData gasPipe = HugeIconData(0x40ab);

  /// IconData for the 'strokeRoundedGasStove' icon.
  static const IconData gasStove = HugeIconData(0x40ac);

  /// IconData for the 'strokeRoundedGem' icon.
  static const IconData gem = HugeIconData(0x40ad);

  /// IconData for the 'strokeRoundedGeologyCrust' icon.
  static const IconData geologyCrust = HugeIconData(0x40ae);

  /// IconData for the 'strokeRoundedGeometricShapes01' icon.
  static const IconData geometricShapes01 = HugeIconData(0x40af);

  /// IconData for the 'strokeRoundedGeometricShapes02' icon.
  static const IconData geometricShapes02 = HugeIconData(0x40b0);

  /// IconData for the 'strokeRoundedGibbousMoon' icon.
  static const IconData gibbousMoon = HugeIconData(0x40b1);

  /// IconData for the 'strokeRoundedGif01' icon.
  static const IconData gif01 = HugeIconData(0x40b2);

  /// IconData for the 'strokeRoundedGif02' icon.
  static const IconData gif02 = HugeIconData(0x40b3);

  /// IconData for the 'strokeRoundedGiftCard' icon.
  static const IconData giftCard = HugeIconData(0x40b4);

  /// IconData for the 'strokeRoundedGift' icon.
  static const IconData gift = HugeIconData(0x40b5);

  /// IconData for the 'strokeRoundedGitBranch' icon.
  static const IconData gitBranch = HugeIconData(0x40b6);

  /// IconData for the 'strokeRoundedGitCommit' icon.
  static const IconData gitCommit = HugeIconData(0x40b7);

  /// IconData for the 'strokeRoundedGitCompare' icon.
  static const IconData gitCompare = HugeIconData(0x40b8);

  /// IconData for the 'strokeRoundedGitFork' icon.
  static const IconData gitFork = HugeIconData(0x40b9);

  /// IconData for the 'strokeRoundedGitMerge' icon.
  static const IconData gitMerge = HugeIconData(0x40ba);

  /// IconData for the 'strokeRoundedGitPullRequestClosed' icon.
  static const IconData gitPullRequestClosed = HugeIconData(0x40bb);

  /// IconData for the 'strokeRoundedGitPullRequestDraft' icon.
  static const IconData gitPullRequestDraft = HugeIconData(0x40bc);

  /// IconData for the 'strokeRoundedGitPullRequest' icon.
  static const IconData gitPullRequest = HugeIconData(0x40bd);

  /// IconData for the 'strokeRoundedGitbook' icon.
  static const IconData gitbook = HugeIconData(0x40be);

  /// IconData for the 'strokeRoundedGithub01' icon.
  static const IconData github01 = HugeIconData(0x40bf);

  /// IconData for the 'strokeRoundedGithub' icon.
  static const IconData github = HugeIconData(0x40c0);

  /// IconData for the 'strokeRoundedGitlab' icon.
  static const IconData gitlab = HugeIconData(0x40c1);

  /// IconData for the 'strokeRoundedGiveBlood' icon.
  static const IconData giveBlood = HugeIconData(0x40c2);

  /// IconData for the 'strokeRoundedGivePill' icon.
  static const IconData givePill = HugeIconData(0x40c3);

  /// IconData for the 'strokeRoundedGlasses' icon.
  static const IconData glasses = HugeIconData(0x40c4);

  /// IconData for the 'strokeRoundedGlobalEditing' icon.
  static const IconData globalEditing = HugeIconData(0x40c5);

  /// IconData for the 'strokeRoundedGlobalEducation' icon.
  static const IconData globalEducation = HugeIconData(0x40c6);

  /// IconData for the 'strokeRoundedGlobalRefresh' icon.
  static const IconData globalRefresh = HugeIconData(0x40c7);

  /// IconData for the 'strokeRoundedGlobalSearch' icon.
  static const IconData globalSearch = HugeIconData(0x40c8);

  /// IconData for the 'strokeRoundedGlobal' icon.
  static const IconData global = HugeIconData(0x40c9);

  /// IconData for the 'strokeRoundedGlobe02' icon.
  static const IconData globe02 = HugeIconData(0x40ca);

  /// IconData for the 'strokeRoundedGlobe' icon.
  static const IconData globe = HugeIconData(0x40cb);

  /// IconData for the 'strokeRoundedGlove' icon.
  static const IconData glove = HugeIconData(0x40cc);

  /// IconData for the 'strokeRoundedGoBackward10Sec' icon.
  static const IconData goBackward10Sec = HugeIconData(0x40cd);

  /// IconData for the 'strokeRoundedGoBackward15Sec' icon.
  static const IconData goBackward15Sec = HugeIconData(0x40ce);

  /// IconData for the 'strokeRoundedGoBackward30Sec' icon.
  static const IconData goBackward30Sec = HugeIconData(0x40cf);

  /// IconData for the 'strokeRoundedGoBackward5Sec' icon.
  static const IconData goBackward5Sec = HugeIconData(0x40d0);

  /// IconData for the 'strokeRoundedGoBackward60Sec' icon.
  static const IconData goBackward60Sec = HugeIconData(0x40d1);

  /// IconData for the 'strokeRoundedGoForward10Sec' icon.
  static const IconData goForward10Sec = HugeIconData(0x40d2);

  /// IconData for the 'strokeRoundedGoForward15Sec' icon.
  static const IconData goForward15Sec = HugeIconData(0x40d3);

  /// IconData for the 'strokeRoundedGoForward30Sec' icon.
  static const IconData goForward30Sec = HugeIconData(0x40d4);

  /// IconData for the 'strokeRoundedGoForward5Sec' icon.
  static const IconData goForward5Sec = HugeIconData(0x40d5);

  /// IconData for the 'strokeRoundedGoForward60Sec' icon.
  static const IconData goForward60Sec = HugeIconData(0x40d6);

  /// IconData for the 'strokeRoundedGoldIngots' icon.
  static const IconData goldIngots = HugeIconData(0x40d7);

  /// IconData for the 'strokeRoundedGold' icon.
  static const IconData gold = HugeIconData(0x40d8);

  /// IconData for the 'strokeRoundedGolfBall' icon.
  static const IconData golfBall = HugeIconData(0x40d9);

  /// IconData for the 'strokeRoundedGolfBat' icon.
  static const IconData golfBat = HugeIconData(0x40da);

  /// IconData for the 'strokeRoundedGolfCart' icon.
  static const IconData golfCart = HugeIconData(0x40db);

  /// IconData for the 'strokeRoundedGolfHole' icon.
  static const IconData golfHole = HugeIconData(0x40dc);

  /// IconData for the 'strokeRoundedGoogleDoc' icon.
  static const IconData googleDoc = HugeIconData(0x40dd);

  /// IconData for the 'strokeRoundedGoogleDrive' icon.
  static const IconData googleDrive = HugeIconData(0x40de);

  /// IconData for the 'strokeRoundedGoogleGemini' icon.
  static const IconData googleGemini = HugeIconData(0x40df);

  /// IconData for the 'strokeRoundedGoogleHome' icon.
  static const IconData googleHome = HugeIconData(0x40e0);

  /// IconData for the 'strokeRoundedGoogleLens' icon.
  static const IconData googleLens = HugeIconData(0x40e1);

  /// IconData for the 'strokeRoundedGoogleMaps' icon.
  static const IconData googleMaps = HugeIconData(0x40e2);

  /// IconData for the 'strokeRoundedGooglePhotos' icon.
  static const IconData googlePhotos = HugeIconData(0x40e3);

  /// IconData for the 'strokeRoundedGoogleSheet' icon.
  static const IconData googleSheet = HugeIconData(0x40e4);

  /// IconData for the 'strokeRoundedGoogle' icon.
  static const IconData google = HugeIconData(0x40e5);

  /// IconData for the 'strokeRoundedGps01' icon.
  static const IconData gps01 = HugeIconData(0x40e6);

  /// IconData for the 'strokeRoundedGps02' icon.
  static const IconData gps02 = HugeIconData(0x40e7);

  /// IconData for the 'strokeRoundedGpsDisconnected' icon.
  static const IconData gpsDisconnected = HugeIconData(0x40e8);

  /// IconData for the 'strokeRoundedGpsOff01' icon.
  static const IconData gpsOff01 = HugeIconData(0x40e9);

  /// IconData for the 'strokeRoundedGpsOff02' icon.
  static const IconData gpsOff02 = HugeIconData(0x40ea);

  /// IconData for the 'strokeRoundedGpsSignal01' icon.
  static const IconData gpsSignal01 = HugeIconData(0x40eb);

  /// IconData for the 'strokeRoundedGpsSignal02' icon.
  static const IconData gpsSignal02 = HugeIconData(0x40ec);

  /// IconData for the 'strokeRoundedGpu' icon.
  static const IconData gpu = HugeIconData(0x40ed);

  /// IconData for the 'strokeRoundedGraduateFemale' icon.
  static const IconData graduateFemale = HugeIconData(0x40ee);

  /// IconData for the 'strokeRoundedGraduateMale' icon.
  static const IconData graduateMale = HugeIconData(0x40ef);

  /// IconData for the 'strokeRoundedGraduationScroll' icon.
  static const IconData graduationScroll = HugeIconData(0x40f0);

  /// IconData for the 'strokeRoundedGrapes' icon.
  static const IconData grapes = HugeIconData(0x40f1);

  /// IconData for the 'strokeRoundedGravity' icon.
  static const IconData gravity = HugeIconData(0x40f2);

  /// IconData for the 'strokeRoundedGreaterThanCircle' icon.
  static const IconData greaterThanCircle = HugeIconData(0x40f3);

  /// IconData for the 'strokeRoundedGreaterThanSquare' icon.
  static const IconData greaterThanSquare = HugeIconData(0x40f4);

  /// IconData for the 'strokeRoundedGreaterThan' icon.
  static const IconData greaterThan = HugeIconData(0x40f5);

  /// IconData for the 'strokeRoundedGreekHelmet' icon.
  static const IconData greekHelmet = HugeIconData(0x40f6);

  /// IconData for the 'strokeRoundedGreenHouse' icon.
  static const IconData greenHouse = HugeIconData(0x40f7);

  /// IconData for the 'strokeRoundedGridOff' icon.
  static const IconData gridOff = HugeIconData(0x40f8);

  /// IconData for the 'strokeRoundedGridTable' icon.
  static const IconData gridTable = HugeIconData(0x40f9);

  /// IconData for the 'strokeRoundedGridView' icon.
  static const IconData gridView = HugeIconData(0x40fa);

  /// IconData for the 'strokeRoundedGrid' icon.
  static const IconData grid = HugeIconData(0x40fb);

  /// IconData for the 'strokeRoundedGrimacing' icon.
  static const IconData grimacing = HugeIconData(0x40fc);

  /// IconData for the 'strokeRoundedGrinning' icon.
  static const IconData grinning = HugeIconData(0x40fd);

  /// IconData for the 'strokeRoundedGrok' icon.
  static const IconData grok = HugeIconData(0x40fe);

  /// IconData for the 'strokeRoundedGroupItems' icon.
  static const IconData groupItems = HugeIconData(0x40ff);

  /// IconData for the 'strokeRoundedGroupLayers' icon.
  static const IconData groupLayers = HugeIconData(0x4100);

  /// IconData for the 'strokeRoundedGuestHouse' icon.
  static const IconData guestHouse = HugeIconData(0x4101);

  /// IconData for the 'strokeRoundedGun' icon.
  static const IconData gun = HugeIconData(0x4102);

  /// IconData for the 'strokeRoundedGymnasticRings' icon.
  static const IconData gymnasticRings = HugeIconData(0x4103);

  /// IconData for the 'strokeRoundedGymnastic' icon.
  static const IconData gymnastic = HugeIconData(0x4104);

  /// IconData for the 'strokeRoundedHackerrank' icon.
  static const IconData hackerrank = HugeIconData(0x4105);

  /// IconData for the 'strokeRoundedHairClips' icon.
  static const IconData hairClips = HugeIconData(0x4106);

  /// IconData for the 'strokeRoundedHairDryer' icon.
  static const IconData hairDryer = HugeIconData(0x4107);

  /// IconData for the 'strokeRoundedHaji' icon.
  static const IconData haji = HugeIconData(0x4108);

  /// IconData for the 'strokeRoundedHalal' icon.
  static const IconData halal = HugeIconData(0x4109);

  /// IconData for the 'strokeRoundedHamburger01' icon.
  static const IconData hamburger01 = HugeIconData(0x410a);

  /// IconData for the 'strokeRoundedHamburger02' icon.
  static const IconData hamburger02 = HugeIconData(0x410b);

  /// IconData for the 'strokeRoundedHandBag01' icon.
  static const IconData handBag01 = HugeIconData(0x410c);

  /// IconData for the 'strokeRoundedHandBag02' icon.
  static const IconData handBag02 = HugeIconData(0x410d);

  /// IconData for the 'strokeRoundedHandBeater' icon.
  static const IconData handBeater = HugeIconData(0x410e);

  /// IconData for the 'strokeRoundedHandGrip' icon.
  static const IconData handGrip = HugeIconData(0x410f);

  /// IconData for the 'strokeRoundedHandPointingDown01' icon.
  static const IconData handPointingDown01 = HugeIconData(0x4110);

  /// IconData for the 'strokeRoundedHandPointingDown02' icon.
  static const IconData handPointingDown02 = HugeIconData(0x4111);

  /// IconData for the 'strokeRoundedHandPointingDown03' icon.
  static const IconData handPointingDown03 = HugeIconData(0x4112);

  /// IconData for the 'strokeRoundedHandPointingDown04' icon.
  static const IconData handPointingDown04 = HugeIconData(0x4113);

  /// IconData for the 'strokeRoundedHandPointingLeft01' icon.
  static const IconData handPointingLeft01 = HugeIconData(0x4114);

  /// IconData for the 'strokeRoundedHandPointingLeft02' icon.
  static const IconData handPointingLeft02 = HugeIconData(0x4115);

  /// IconData for the 'strokeRoundedHandPointingLeft03' icon.
  static const IconData handPointingLeft03 = HugeIconData(0x4116);

  /// IconData for the 'strokeRoundedHandPointingLeft04' icon.
  static const IconData handPointingLeft04 = HugeIconData(0x4117);

  /// IconData for the 'strokeRoundedHandPointingRight01' icon.
  static const IconData handPointingRight01 = HugeIconData(0x4118);

  /// IconData for the 'strokeRoundedHandPointingRight02' icon.
  static const IconData handPointingRight02 = HugeIconData(0x4119);

  /// IconData for the 'strokeRoundedHandPointingRight03' icon.
  static const IconData handPointingRight03 = HugeIconData(0x411a);

  /// IconData for the 'strokeRoundedHandPointingRight04' icon.
  static const IconData handPointingRight04 = HugeIconData(0x411b);

  /// IconData for the 'strokeRoundedHandPrayer' icon.
  static const IconData handPrayer = HugeIconData(0x411c);

  /// IconData for the 'strokeRoundedHandSanitizer' icon.
  static const IconData handSanitizer = HugeIconData(0x411d);

  /// IconData for the 'strokeRoundedHandcuffs' icon.
  static const IconData handcuffs = HugeIconData(0x411e);

  /// IconData for the 'strokeRoundedHanger' icon.
  static const IconData hanger = HugeIconData(0x411f);

  /// IconData for the 'strokeRoundedHangingClock' icon.
  static const IconData hangingClock = HugeIconData(0x4120);

  /// IconData for the 'strokeRoundedHangout' icon.
  static const IconData hangout = HugeIconData(0x4121);

  /// IconData for the 'strokeRoundedHappy' icon.
  static const IconData happy = HugeIconData(0x4122);

  /// IconData for the 'strokeRoundedHardDrive' icon.
  static const IconData hardDrive = HugeIconData(0x4123);

  /// IconData for the 'strokeRoundedHdd' icon.
  static const IconData hdd = HugeIconData(0x4124);

  /// IconData for the 'strokeRoundedHdr01' icon.
  static const IconData hdr01 = HugeIconData(0x4125);

  /// IconData for the 'strokeRoundedHdr02' icon.
  static const IconData hdr02 = HugeIconData(0x4126);

  /// IconData for the 'strokeRoundedHeading01' icon.
  static const IconData heading01 = HugeIconData(0x4127);

  /// IconData for the 'strokeRoundedHeading02' icon.
  static const IconData heading02 = HugeIconData(0x4128);

  /// IconData for the 'strokeRoundedHeading03' icon.
  static const IconData heading03 = HugeIconData(0x4129);

  /// IconData for the 'strokeRoundedHeading04' icon.
  static const IconData heading04 = HugeIconData(0x412a);

  /// IconData for the 'strokeRoundedHeading05' icon.
  static const IconData heading05 = HugeIconData(0x412b);

  /// IconData for the 'strokeRoundedHeading06' icon.
  static const IconData heading06 = HugeIconData(0x412c);

  /// IconData for the 'strokeRoundedHeading' icon.
  static const IconData heading = HugeIconData(0x412d);

  /// IconData for the 'strokeRoundedHeadphoneMute' icon.
  static const IconData headphoneMute = HugeIconData(0x412e);

  /// IconData for the 'strokeRoundedHeadphones' icon.
  static const IconData headphones = HugeIconData(0x412f);

  /// IconData for the 'strokeRoundedHeadsetConnected' icon.
  static const IconData headsetConnected = HugeIconData(0x4130);

  /// IconData for the 'strokeRoundedHeadsetOff' icon.
  static const IconData headsetOff = HugeIconData(0x4131);

  /// IconData for the 'strokeRoundedHeadset' icon.
  static const IconData headset = HugeIconData(0x4132);

  /// IconData for the 'strokeRoundedHealtcare' icon.
  static const IconData healtcare = HugeIconData(0x4133);

  /// IconData for the 'strokeRoundedHealth' icon.
  static const IconData health = HugeIconData(0x4134);

  /// IconData for the 'strokeRoundedHeartAdd' icon.
  static const IconData heartAdd = HugeIconData(0x4135);

  /// IconData for the 'strokeRoundedHeartCheck' icon.
  static const IconData heartCheck = HugeIconData(0x4136);

  /// IconData for the 'strokeRoundedHeartRemove' icon.
  static const IconData heartRemove = HugeIconData(0x4137);

  /// IconData for the 'strokeRoundedHeartbreak' icon.
  static const IconData heartbreak = HugeIconData(0x4138);

  /// IconData for the 'strokeRoundedHelicopter' icon.
  static const IconData helicopter = HugeIconData(0x4139);

  /// IconData for the 'strokeRoundedHelpCircle' icon.
  static const IconData helpCircle = HugeIconData(0x413a);

  /// IconData for the 'strokeRoundedHelpSquare' icon.
  static const IconData helpSquare = HugeIconData(0x413b);

  /// IconData for the 'strokeRoundedHexagon01' icon.
  static const IconData hexagon01 = HugeIconData(0x413c);

  /// IconData for the 'strokeRoundedHexagon' icon.
  static const IconData hexagon = HugeIconData(0x413d);

  /// IconData for the 'strokeRoundedHierarchyCircle01' icon.
  static const IconData hierarchyCircle01 = HugeIconData(0x413e);

  /// IconData for the 'strokeRoundedHierarchyCircle02' icon.
  static const IconData hierarchyCircle02 = HugeIconData(0x413f);

  /// IconData for the 'strokeRoundedHierarchyCircle03' icon.
  static const IconData hierarchyCircle03 = HugeIconData(0x4140);

  /// IconData for the 'strokeRoundedHierarchyFiles' icon.
  static const IconData hierarchyFiles = HugeIconData(0x4141);

  /// IconData for the 'strokeRoundedHierarchySquare01' icon.
  static const IconData hierarchySquare01 = HugeIconData(0x4142);

  /// IconData for the 'strokeRoundedHierarchySquare02' icon.
  static const IconData hierarchySquare02 = HugeIconData(0x4143);

  /// IconData for the 'strokeRoundedHierarchySquare03' icon.
  static const IconData hierarchySquare03 = HugeIconData(0x4144);

  /// IconData for the 'strokeRoundedHierarchySquare04' icon.
  static const IconData hierarchySquare04 = HugeIconData(0x4145);

  /// IconData for the 'strokeRoundedHierarchySquare05' icon.
  static const IconData hierarchySquare05 = HugeIconData(0x4146);

  /// IconData for the 'strokeRoundedHierarchySquare06' icon.
  static const IconData hierarchySquare06 = HugeIconData(0x4147);

  /// IconData for the 'strokeRoundedHierarchySquare07' icon.
  static const IconData hierarchySquare07 = HugeIconData(0x4148);

  /// IconData for the 'strokeRoundedHierarchySquare08' icon.
  static const IconData hierarchySquare08 = HugeIconData(0x4149);

  /// IconData for the 'strokeRoundedHierarchySquare10' icon.
  static const IconData hierarchySquare10 = HugeIconData(0x414a);

  /// IconData for the 'strokeRoundedHierarchy' icon.
  static const IconData hierarchy = HugeIconData(0x414b);

  /// IconData for the 'strokeRoundedHighHeels01' icon.
  static const IconData highHeels01 = HugeIconData(0x414c);

  /// IconData for the 'strokeRoundedHighHeels02' icon.
  static const IconData highHeels02 = HugeIconData(0x414d);

  /// IconData for the 'strokeRoundedHijab' icon.
  static const IconData hijab = HugeIconData(0x414e);

  /// IconData for the 'strokeRoundedHockey' icon.
  static const IconData hockey = HugeIconData(0x414f);

  /// IconData for the 'strokeRoundedHold01' icon.
  static const IconData hold01 = HugeIconData(0x4150);

  /// IconData for the 'strokeRoundedHold02' icon.
  static const IconData hold02 = HugeIconData(0x4151);

  /// IconData for the 'strokeRoundedHold03' icon.
  static const IconData hold03 = HugeIconData(0x4152);

  /// IconData for the 'strokeRoundedHold04' icon.
  static const IconData hold04 = HugeIconData(0x4153);

  /// IconData for the 'strokeRoundedHold05' icon.
  static const IconData hold05 = HugeIconData(0x4154);

  /// IconData for the 'strokeRoundedHoldLocked01' icon.
  static const IconData holdLocked01 = HugeIconData(0x4155);

  /// IconData for the 'strokeRoundedHoldLocked02' icon.
  static const IconData holdLocked02 = HugeIconData(0x4156);

  /// IconData for the 'strokeRoundedHoldPhone' icon.
  static const IconData holdPhone = HugeIconData(0x4157);

  /// IconData for the 'strokeRoundedHologram' icon.
  static const IconData hologram = HugeIconData(0x4158);

  /// IconData for the 'strokeRoundedHome01' icon.
  static const IconData home01 = HugeIconData(0x4159);

  /// IconData for the 'strokeRoundedHome02' icon.
  static const IconData home02 = HugeIconData(0x415a);

  /// IconData for the 'strokeRoundedHome03' icon.
  static const IconData home03 = HugeIconData(0x415b);

  /// IconData for the 'strokeRoundedHome04' icon.
  static const IconData home04 = HugeIconData(0x415c);

  /// IconData for the 'strokeRoundedHome05' icon.
  static const IconData home05 = HugeIconData(0x415d);

  /// IconData for the 'strokeRoundedHome06' icon.
  static const IconData home06 = HugeIconData(0x415e);

  /// IconData for the 'strokeRoundedHome07' icon.
  static const IconData home07 = HugeIconData(0x415f);

  /// IconData for the 'strokeRoundedHome08' icon.
  static const IconData home08 = HugeIconData(0x4160);

  /// IconData for the 'strokeRoundedHome09' icon.
  static const IconData home09 = HugeIconData(0x4161);

  /// IconData for the 'strokeRoundedHome10' icon.
  static const IconData home10 = HugeIconData(0x4162);

  /// IconData for the 'strokeRoundedHome11' icon.
  static const IconData home11 = HugeIconData(0x4163);

  /// IconData for the 'strokeRoundedHome12' icon.
  static const IconData home12 = HugeIconData(0x4164);

  /// IconData for the 'strokeRoundedHome13' icon.
  static const IconData home13 = HugeIconData(0x4165);

  /// IconData for the 'strokeRoundedHomeWifi' icon.
  static const IconData homeWifi = HugeIconData(0x4166);

  /// IconData for the 'strokeRoundedHoney01' icon.
  static const IconData honey01 = HugeIconData(0x4167);

  /// IconData for the 'strokeRoundedHoney02' icon.
  static const IconData honey02 = HugeIconData(0x4168);

  /// IconData for the 'strokeRoundedHonor' icon.
  static const IconData honor = HugeIconData(0x4169);

  /// IconData for the 'strokeRoundedHonourStar' icon.
  static const IconData honourStar = HugeIconData(0x416a);

  /// IconData for the 'strokeRoundedHoodie' icon.
  static const IconData hoodie = HugeIconData(0x416b);

  /// IconData for the 'strokeRoundedHorizonalScrollPoint' icon.
  static const IconData horizonalScrollPoint = HugeIconData(0x416c);

  /// IconData for the 'strokeRoundedHorizontalResize' icon.
  static const IconData horizontalResize = HugeIconData(0x416d);

  /// IconData for the 'strokeRoundedHospital01' icon.
  static const IconData hospital01 = HugeIconData(0x416e);

  /// IconData for the 'strokeRoundedHospital02' icon.
  static const IconData hospital02 = HugeIconData(0x416f);

  /// IconData for the 'strokeRoundedHospitalBed01' icon.
  static const IconData hospitalBed01 = HugeIconData(0x4170);

  /// IconData for the 'strokeRoundedHospitalBed02' icon.
  static const IconData hospitalBed02 = HugeIconData(0x4171);

  /// IconData for the 'strokeRoundedHospitalLocation' icon.
  static const IconData hospitalLocation = HugeIconData(0x4172);

  /// IconData for the 'strokeRoundedHotAirBalloon' icon.
  static const IconData hotAirBalloon = HugeIconData(0x4173);

  /// IconData for the 'strokeRoundedHotPrice' icon.
  static const IconData hotPrice = HugeIconData(0x4174);

  /// IconData for the 'strokeRoundedHotTube' icon.
  static const IconData hotTube = HugeIconData(0x4175);

  /// IconData for the 'strokeRoundedHotdog' icon.
  static const IconData hotdog = HugeIconData(0x4176);

  /// IconData for the 'strokeRoundedHotel01' icon.
  static const IconData hotel01 = HugeIconData(0x4177);

  /// IconData for the 'strokeRoundedHotel02' icon.
  static const IconData hotel02 = HugeIconData(0x4178);

  /// IconData for the 'strokeRoundedHotspotOffline' icon.
  static const IconData hotspotOffline = HugeIconData(0x4179);

  /// IconData for the 'strokeRoundedHotspot' icon.
  static const IconData hotspot = HugeIconData(0x417a);

  /// IconData for the 'strokeRoundedHourglassOff' icon.
  static const IconData hourglassOff = HugeIconData(0x417b);

  /// IconData for the 'strokeRoundedHourglass' icon.
  static const IconData hourglass = HugeIconData(0x417c);

  /// IconData for the 'strokeRoundedHouse01' icon.
  static const IconData house01 = HugeIconData(0x417d);

  /// IconData for the 'strokeRoundedHouse02' icon.
  static const IconData house02 = HugeIconData(0x417e);

  /// IconData for the 'strokeRoundedHouse03' icon.
  static const IconData house03 = HugeIconData(0x417f);

  /// IconData for the 'strokeRoundedHouse04' icon.
  static const IconData house04 = HugeIconData(0x4180);

  /// IconData for the 'strokeRoundedHouse05' icon.
  static const IconData house05 = HugeIconData(0x4181);

  /// IconData for the 'strokeRoundedHouseSolarPanel' icon.
  static const IconData houseSolarPanel = HugeIconData(0x4182);

  /// IconData for the 'strokeRoundedHtml5' icon.
  static const IconData html5 = HugeIconData(0x4183);

  /// IconData for the 'strokeRoundedHumidity' icon.
  static const IconData humidity = HugeIconData(0x4184);

  /// IconData for the 'strokeRoundedHut' icon.
  static const IconData hut = HugeIconData(0x4185);

  /// IconData for the 'strokeRoundedHydroPower' icon.
  static const IconData hydroPower = HugeIconData(0x4186);

  /// IconData for the 'strokeRoundedHyperbole' icon.
  static const IconData hyperbole = HugeIconData(0x4187);

  /// IconData for the 'strokeRoundedIceCream01' icon.
  static const IconData iceCream01 = HugeIconData(0x4188);

  /// IconData for the 'strokeRoundedIceCream02' icon.
  static const IconData iceCream02 = HugeIconData(0x4189);

  /// IconData for the 'strokeRoundedIceCream03' icon.
  static const IconData iceCream03 = HugeIconData(0x418a);

  /// IconData for the 'strokeRoundedIceCream04' icon.
  static const IconData iceCream04 = HugeIconData(0x418b);

  /// IconData for the 'strokeRoundedIceHockey' icon.
  static const IconData iceHockey = HugeIconData(0x418c);

  /// IconData for the 'strokeRoundedIceSkating' icon.
  static const IconData iceSkating = HugeIconData(0x418d);

  /// IconData for the 'strokeRoundedIco' icon.
  static const IconData ico = HugeIconData(0x418e);

  /// IconData for the 'strokeRoundedIconjar' icon.
  static const IconData iconjar = HugeIconData(0x418f);

  /// IconData for the 'strokeRoundedIdNotVerified' icon.
  static const IconData idNotVerified = HugeIconData(0x4190);

  /// IconData for the 'strokeRoundedIdVerified' icon.
  static const IconData idVerified = HugeIconData(0x4191);

  /// IconData for the 'strokeRoundedId' icon.
  static const IconData id = HugeIconData(0x4192);

  /// IconData for the 'strokeRoundedIdea01' icon.
  static const IconData idea01 = HugeIconData(0x4193);

  /// IconData for the 'strokeRoundedIdea' icon.
  static const IconData idea = HugeIconData(0x4194);

  /// IconData for the 'strokeRoundedIdentification' icon.
  static const IconData identification = HugeIconData(0x4195);

  /// IconData for the 'strokeRoundedIdentityCard' icon.
  static const IconData identityCard = HugeIconData(0x4196);

  /// IconData for the 'strokeRoundedImage01' icon.
  static const IconData image01 = HugeIconData(0x4197);

  /// IconData for the 'strokeRoundedImage02' icon.
  static const IconData image02 = HugeIconData(0x4198);

  /// IconData for the 'strokeRoundedImageAdd01' icon.
  static const IconData imageAdd01 = HugeIconData(0x4199);

  /// IconData for the 'strokeRoundedImageAdd02' icon.
  static const IconData imageAdd02 = HugeIconData(0x419a);

  /// IconData for the 'strokeRoundedImageCompositionOval' icon.
  static const IconData imageCompositionOval = HugeIconData(0x419b);

  /// IconData for the 'strokeRoundedImageComposition' icon.
  static const IconData imageComposition = HugeIconData(0x419c);

  /// IconData for the 'strokeRoundedImageCrop' icon.
  static const IconData imageCrop = HugeIconData(0x419d);

  /// IconData for the 'strokeRoundedImageDelete01' icon.
  static const IconData imageDelete01 = HugeIconData(0x419e);

  /// IconData for the 'strokeRoundedImageDelete02' icon.
  static const IconData imageDelete02 = HugeIconData(0x419f);

  /// IconData for the 'strokeRoundedImageDone01' icon.
  static const IconData imageDone01 = HugeIconData(0x41a0);

  /// IconData for the 'strokeRoundedImageDone02' icon.
  static const IconData imageDone02 = HugeIconData(0x41a1);

  /// IconData for the 'strokeRoundedImageDownload02' icon.
  static const IconData imageDownload02 = HugeIconData(0x41a2);

  /// IconData for the 'strokeRoundedImageDownload' icon.
  static const IconData imageDownload = HugeIconData(0x41a3);

  /// IconData for the 'strokeRoundedImageNotFound01' icon.
  static const IconData imageNotFound01 = HugeIconData(0x41a4);

  /// IconData for the 'strokeRoundedImageNotFound02' icon.
  static const IconData imageNotFound02 = HugeIconData(0x41a5);

  /// IconData for the 'strokeRoundedImageRemove01' icon.
  static const IconData imageRemove01 = HugeIconData(0x41a6);

  /// IconData for the 'strokeRoundedImageRemove02' icon.
  static const IconData imageRemove02 = HugeIconData(0x41a7);

  /// IconData for the 'strokeRoundedImageUpload01' icon.
  static const IconData imageUpload01 = HugeIconData(0x41a8);

  /// IconData for the 'strokeRoundedImageUpload' icon.
  static const IconData imageUpload = HugeIconData(0x41a9);

  /// IconData for the 'strokeRoundedImo' icon.
  static const IconData imo = HugeIconData(0x41aa);

  /// IconData for the 'strokeRoundedImportantBook' icon.
  static const IconData importantBook = HugeIconData(0x41ab);

  /// IconData for the 'strokeRoundedInLove' icon.
  static const IconData inLove = HugeIconData(0x41ac);

  /// IconData for the 'strokeRoundedInboxCheck' icon.
  static const IconData inboxCheck = HugeIconData(0x41ad);

  /// IconData for the 'strokeRoundedInboxDownload' icon.
  static const IconData inboxDownload = HugeIconData(0x41ae);

  /// IconData for the 'strokeRoundedInboxUnread' icon.
  static const IconData inboxUnread = HugeIconData(0x41af);

  /// IconData for the 'strokeRoundedInboxUpload' icon.
  static const IconData inboxUpload = HugeIconData(0x41b0);

  /// IconData for the 'strokeRoundedInbox' icon.
  static const IconData inbox = HugeIconData(0x41b1);

  /// IconData for the 'strokeRoundedIncognito' icon.
  static const IconData incognito = HugeIconData(0x41b2);

  /// IconData for the 'strokeRoundedIndiaGate' icon.
  static const IconData indiaGate = HugeIconData(0x41b3);

  /// IconData for the 'strokeRoundedInequality01' icon.
  static const IconData inequality01 = HugeIconData(0x41b4);

  /// IconData for the 'strokeRoundedInequality02' icon.
  static const IconData inequality02 = HugeIconData(0x41b5);

  /// IconData for the 'strokeRoundedInequalityCircle01' icon.
  static const IconData inequalityCircle01 = HugeIconData(0x41b6);

  /// IconData for the 'strokeRoundedInequalityCircle02' icon.
  static const IconData inequalityCircle02 = HugeIconData(0x41b7);

  /// IconData for the 'strokeRoundedInequalitySquare01' icon.
  static const IconData inequalitySquare01 = HugeIconData(0x41b8);

  /// IconData for the 'strokeRoundedInequalitySquare02' icon.
  static const IconData inequalitySquare02 = HugeIconData(0x41b9);

  /// IconData for the 'strokeRoundedInfinity01' icon.
  static const IconData infinity01 = HugeIconData(0x41ba);

  /// IconData for the 'strokeRoundedInfinity02' icon.
  static const IconData infinity02 = HugeIconData(0x41bb);

  /// IconData for the 'strokeRoundedInfinityCircle' icon.
  static const IconData infinityCircle = HugeIconData(0x41bc);

  /// IconData for the 'strokeRoundedInfinitySquare' icon.
  static const IconData infinitySquare = HugeIconData(0x41bd);

  /// IconData for the 'strokeRoundedInformationCircle' icon.
  static const IconData informationCircle = HugeIconData(0x41be);

  /// IconData for the 'strokeRoundedInformationDiamond' icon.
  static const IconData informationDiamond = HugeIconData(0x41bf);

  /// IconData for the 'strokeRoundedInformationSquare' icon.
  static const IconData informationSquare = HugeIconData(0x41c0);

  /// IconData for the 'strokeRoundedInjection' icon.
  static const IconData injection = HugeIconData(0x41c1);

  /// IconData for the 'strokeRoundedInsertBottomImage' icon.
  static const IconData insertBottomImage = HugeIconData(0x41c2);

  /// IconData for the 'strokeRoundedInsertCenterImage' icon.
  static const IconData insertCenterImage = HugeIconData(0x41c3);

  /// IconData for the 'strokeRoundedInsertColumnLeft' icon.
  static const IconData insertColumnLeft = HugeIconData(0x41c4);

  /// IconData for the 'strokeRoundedInsertColumn' icon.
  static const IconData insertColumn = HugeIconData(0x41c5);

  /// IconData for the 'strokeRoundedInsertPi' icon.
  static const IconData insertPi = HugeIconData(0x41c6);

  /// IconData for the 'strokeRoundedInsertRowDown' icon.
  static const IconData insertRowDown = HugeIconData(0x41c7);

  /// IconData for the 'strokeRoundedInsertRowUp' icon.
  static const IconData insertRowUp = HugeIconData(0x41c8);

  /// IconData for the 'strokeRoundedInsertRow' icon.
  static const IconData insertRow = HugeIconData(0x41c9);

  /// IconData for the 'strokeRoundedInsertTopImage' icon.
  static const IconData insertTopImage = HugeIconData(0x41ca);

  /// IconData for the 'strokeRoundedInspectCode' icon.
  static const IconData inspectCode = HugeIconData(0x41cb);

  /// IconData for the 'strokeRoundedInstagram' icon.
  static const IconData instagram = HugeIconData(0x41cc);

  /// IconData for the 'strokeRoundedInstallingUpdates01' icon.
  static const IconData installingUpdates01 = HugeIconData(0x41cd);

  /// IconData for the 'strokeRoundedInstallingUpdates02' icon.
  static const IconData installingUpdates02 = HugeIconData(0x41ce);

  /// IconData for the 'strokeRoundedInternetAntenna01' icon.
  static const IconData internetAntenna01 = HugeIconData(0x41cf);

  /// IconData for the 'strokeRoundedInternetAntenna02' icon.
  static const IconData internetAntenna02 = HugeIconData(0x41d0);

  /// IconData for the 'strokeRoundedInternetAntenna03' icon.
  static const IconData internetAntenna03 = HugeIconData(0x41d1);

  /// IconData for the 'strokeRoundedInternetAntenna04' icon.
  static const IconData internetAntenna04 = HugeIconData(0x41d2);

  /// IconData for the 'strokeRoundedInternet' icon.
  static const IconData internet = HugeIconData(0x41d3);

  /// IconData for the 'strokeRoundedInvestigation' icon.
  static const IconData investigation = HugeIconData(0x41d4);

  /// IconData for the 'strokeRoundedInvoice01' icon.
  static const IconData invoice01 = HugeIconData(0x41d5);

  /// IconData for the 'strokeRoundedInvoice02' icon.
  static const IconData invoice02 = HugeIconData(0x41d6);

  /// IconData for the 'strokeRoundedInvoice03' icon.
  static const IconData invoice03 = HugeIconData(0x41d7);

  /// IconData for the 'strokeRoundedInvoice04' icon.
  static const IconData invoice04 = HugeIconData(0x41d8);

  /// IconData for the 'strokeRoundedInvoice' icon.
  static const IconData invoice = HugeIconData(0x41d9);

  /// IconData for the 'strokeRoundedIpod' icon.
  static const IconData ipod = HugeIconData(0x41da);

  /// IconData for the 'strokeRoundedIrisScan' icon.
  static const IconData irisScan = HugeIconData(0x41db);

  /// IconData for the 'strokeRoundedIsland' icon.
  static const IconData island = HugeIconData(0x41dc);

  /// IconData for the 'strokeRoundedJar' icon.
  static const IconData jar = HugeIconData(0x41dd);

  /// IconData for the 'strokeRoundedJavaScript' icon.
  static const IconData javaScript = HugeIconData(0x41de);

  /// IconData for the 'strokeRoundedJava' icon.
  static const IconData java = HugeIconData(0x41df);

  /// IconData for the 'strokeRoundedJobLink' icon.
  static const IconData jobLink = HugeIconData(0x41e0);

  /// IconData for the 'strokeRoundedJobSearch' icon.
  static const IconData jobSearch = HugeIconData(0x41e1);

  /// IconData for the 'strokeRoundedJobShare' icon.
  static const IconData jobShare = HugeIconData(0x41e2);

  /// IconData for the 'strokeRoundedJoggerPants' icon.
  static const IconData joggerPants = HugeIconData(0x41e3);

  /// IconData for the 'strokeRoundedJoinBevel' icon.
  static const IconData joinBevel = HugeIconData(0x41e4);

  /// IconData for the 'strokeRoundedJoinRound' icon.
  static const IconData joinRound = HugeIconData(0x41e5);

  /// IconData for the 'strokeRoundedJoinStraight' icon.
  static const IconData joinStraight = HugeIconData(0x41e6);

  /// IconData for the 'strokeRoundedJoker' icon.
  static const IconData joker = HugeIconData(0x41e7);

  /// IconData for the 'strokeRoundedJoystick01' icon.
  static const IconData joystick01 = HugeIconData(0x41e8);

  /// IconData for the 'strokeRoundedJoystick02' icon.
  static const IconData joystick02 = HugeIconData(0x41e9);

  /// IconData for the 'strokeRoundedJoystick03' icon.
  static const IconData joystick03 = HugeIconData(0x41ea);

  /// IconData for the 'strokeRoundedJoystick04' icon.
  static const IconData joystick04 = HugeIconData(0x41eb);

  /// IconData for the 'strokeRoundedJoystick05' icon.
  static const IconData joystick05 = HugeIconData(0x41ec);

  /// IconData for the 'strokeRoundedJpg01' icon.
  static const IconData jpg01 = HugeIconData(0x41ed);

  /// IconData for the 'strokeRoundedJpg02' icon.
  static const IconData jpg02 = HugeIconData(0x41ee);

  /// IconData for the 'strokeRoundedJsx01' icon.
  static const IconData jsx01 = HugeIconData(0x41ef);

  /// IconData for the 'strokeRoundedJsx02' icon.
  static const IconData jsx02 = HugeIconData(0x41f0);

  /// IconData for the 'strokeRoundedJsx03' icon.
  static const IconData jsx03 = HugeIconData(0x41f1);

  /// IconData for the 'strokeRoundedJudge' icon.
  static const IconData judge = HugeIconData(0x41f2);

  /// IconData for the 'strokeRoundedJupiter' icon.
  static const IconData jupiter = HugeIconData(0x41f3);

  /// IconData for the 'strokeRoundedJusticeScale01' icon.
  static const IconData justiceScale01 = HugeIconData(0x41f4);

  /// IconData for the 'strokeRoundedJusticeScale02' icon.
  static const IconData justiceScale02 = HugeIconData(0x41f5);

  /// IconData for the 'strokeRoundedKaaba01' icon.
  static const IconData kaaba01 = HugeIconData(0x41f6);

  /// IconData for the 'strokeRoundedKaaba02' icon.
  static const IconData kaaba02 = HugeIconData(0x41f7);

  /// IconData for the 'strokeRoundedKayak' icon.
  static const IconData kayak = HugeIconData(0x41f8);

  /// IconData for the 'strokeRoundedKeffiyeh' icon.
  static const IconData keffiyeh = HugeIconData(0x41f9);

  /// IconData for the 'strokeRoundedKettle01' icon.
  static const IconData kettle01 = HugeIconData(0x41fa);

  /// IconData for the 'strokeRoundedKettle' icon.
  static const IconData kettle = HugeIconData(0x41fb);

  /// IconData for the 'strokeRoundedKettlebell' icon.
  static const IconData kettlebell = HugeIconData(0x41fc);

  /// IconData for the 'strokeRoundedKetupat' icon.
  static const IconData ketupat = HugeIconData(0x41fd);

  /// IconData for the 'strokeRoundedKey01' icon.
  static const IconData key01 = HugeIconData(0x41fe);

  /// IconData for the 'strokeRoundedKey02' icon.
  static const IconData key02 = HugeIconData(0x41ff);

  /// IconData for the 'strokeRoundedKeyGeneratorFob' icon.
  static const IconData keyGeneratorFob = HugeIconData(0x4200);

  /// IconData for the 'strokeRoundedKeyboard' icon.
  static const IconData keyboard = HugeIconData(0x4201);

  /// IconData for the 'strokeRoundedKeyframeAdd' icon.
  static const IconData keyframeAdd = HugeIconData(0x4202);

  /// IconData for the 'strokeRoundedKeyframeAlignCenter' icon.
  static const IconData keyframeAlignCenter = HugeIconData(0x4203);

  /// IconData for the 'strokeRoundedKeyframeAlignHorizontal' icon.
  static const IconData keyframeAlignHorizontal = HugeIconData(0x4204);

  /// IconData for the 'strokeRoundedKeyframeAlignVertical' icon.
  static const IconData keyframeAlignVertical = HugeIconData(0x4205);

  /// IconData for the 'strokeRoundedKeyframeBottom' icon.
  static const IconData keyframeBottom = HugeIconData(0x4206);

  /// IconData for the 'strokeRoundedKeyframeLeft' icon.
  static const IconData keyframeLeft = HugeIconData(0x4207);

  /// IconData for the 'strokeRoundedKeyframeRemove' icon.
  static const IconData keyframeRemove = HugeIconData(0x4208);

  /// IconData for the 'strokeRoundedKeyframeRight' icon.
  static const IconData keyframeRight = HugeIconData(0x4209);

  /// IconData for the 'strokeRoundedKeyframeTop' icon.
  static const IconData keyframeTop = HugeIconData(0x420a);

  /// IconData for the 'strokeRoundedKeyframe' icon.
  static const IconData keyframe = HugeIconData(0x420b);

  /// IconData for the 'strokeRoundedKeyframesDoubleAdd' icon.
  static const IconData keyframesDoubleAdd = HugeIconData(0x420c);

  /// IconData for the 'strokeRoundedKeyframesDoubleRemove' icon.
  static const IconData keyframesDoubleRemove = HugeIconData(0x420d);

  /// IconData for the 'strokeRoundedKeyframesDouble' icon.
  static const IconData keyframesDouble = HugeIconData(0x420e);

  /// IconData for the 'strokeRoundedKeyframesMultipleAdd' icon.
  static const IconData keyframesMultipleAdd = HugeIconData(0x420f);

  /// IconData for the 'strokeRoundedKeyframesMultipleRemove' icon.
  static const IconData keyframesMultipleRemove = HugeIconData(0x4210);

  /// IconData for the 'strokeRoundedKeyframesMultiple' icon.
  static const IconData keyframesMultiple = HugeIconData(0x4211);

  /// IconData for the 'strokeRoundedKickstarter01' icon.
  static const IconData kickstarter01 = HugeIconData(0x4212);

  /// IconData for the 'strokeRoundedKickstarter02' icon.
  static const IconData kickstarter02 = HugeIconData(0x4213);

  /// IconData for the 'strokeRoundedKid' icon.
  static const IconData kid = HugeIconData(0x4214);

  /// IconData for the 'strokeRoundedKidneys' icon.
  static const IconData kidneys = HugeIconData(0x4215);

  /// IconData for the 'strokeRoundedKissing' icon.
  static const IconData kissing = HugeIconData(0x4216);

  /// IconData for the 'strokeRoundedKitchenUtensils' icon.
  static const IconData kitchenUtensils = HugeIconData(0x4217);

  /// IconData for the 'strokeRoundedKite' icon.
  static const IconData kite = HugeIconData(0x4218);

  /// IconData for the 'strokeRoundedKnife01' icon.
  static const IconData knife01 = HugeIconData(0x4219);

  /// IconData for the 'strokeRoundedKnife02' icon.
  static const IconData knife02 = HugeIconData(0x421a);

  /// IconData for the 'strokeRoundedKnifeBread' icon.
  static const IconData knifeBread = HugeIconData(0x421b);

  /// IconData for the 'strokeRoundedKnightShield' icon.
  static const IconData knightShield = HugeIconData(0x421c);

  /// IconData for the 'strokeRoundedKnives' icon.
  static const IconData knives = HugeIconData(0x421d);

  /// IconData for the 'strokeRoundedKnowledge01' icon.
  static const IconData knowledge01 = HugeIconData(0x421e);

  /// IconData for the 'strokeRoundedKnowledge02' icon.
  static const IconData knowledge02 = HugeIconData(0x421f);

  /// IconData for the 'strokeRoundedKurta01' icon.
  static const IconData kurta01 = HugeIconData(0x4220);

  /// IconData for the 'strokeRoundedKurta' icon.
  static const IconData kurta = HugeIconData(0x4221);

  /// IconData for the 'strokeRoundedLabelImportant' icon.
  static const IconData labelImportant = HugeIconData(0x4222);

  /// IconData for the 'strokeRoundedLabel' icon.
  static const IconData label = HugeIconData(0x4223);

  /// IconData for the 'strokeRoundedLabor' icon.
  static const IconData labor = HugeIconData(0x4224);

  /// IconData for the 'strokeRoundedLabs' icon.
  static const IconData labs = HugeIconData(0x4225);

  /// IconData for the 'strokeRoundedLake' icon.
  static const IconData lake = HugeIconData(0x4226);

  /// IconData for the 'strokeRoundedLamp01' icon.
  static const IconData lamp01 = HugeIconData(0x4227);

  /// IconData for the 'strokeRoundedLamp02' icon.
  static const IconData lamp02 = HugeIconData(0x4228);

  /// IconData for the 'strokeRoundedLamp03' icon.
  static const IconData lamp03 = HugeIconData(0x4229);

  /// IconData for the 'strokeRoundedLamp04' icon.
  static const IconData lamp04 = HugeIconData(0x422a);

  /// IconData for the 'strokeRoundedLamp05' icon.
  static const IconData lamp05 = HugeIconData(0x422b);

  /// IconData for the 'strokeRoundedLamp' icon.
  static const IconData lamp = HugeIconData(0x422c);

  /// IconData for the 'strokeRoundedLanguageCircle' icon.
  static const IconData languageCircle = HugeIconData(0x422d);

  /// IconData for the 'strokeRoundedLanguageSkill' icon.
  static const IconData languageSkill = HugeIconData(0x422e);

  /// IconData for the 'strokeRoundedLanguageSquare' icon.
  static const IconData languageSquare = HugeIconData(0x422f);

  /// IconData for the 'strokeRoundedLantern' icon.
  static const IconData lantern = HugeIconData(0x4230);

  /// IconData for the 'strokeRoundedLaptopAdd' icon.
  static const IconData laptopAdd = HugeIconData(0x4231);

  /// IconData for the 'strokeRoundedLaptopCharging' icon.
  static const IconData laptopCharging = HugeIconData(0x4232);

  /// IconData for the 'strokeRoundedLaptopCheck' icon.
  static const IconData laptopCheck = HugeIconData(0x4233);

  /// IconData for the 'strokeRoundedLaptopCloud' icon.
  static const IconData laptopCloud = HugeIconData(0x4234);

  /// IconData for the 'strokeRoundedLaptopIssue' icon.
  static const IconData laptopIssue = HugeIconData(0x4235);

  /// IconData for the 'strokeRoundedLaptopPerformance' icon.
  static const IconData laptopPerformance = HugeIconData(0x4236);

  /// IconData for the 'strokeRoundedLaptopPhoneSync' icon.
  static const IconData laptopPhoneSync = HugeIconData(0x4237);

  /// IconData for the 'strokeRoundedLaptopProgramming' icon.
  static const IconData laptopProgramming = HugeIconData(0x4238);

  /// IconData for the 'strokeRoundedLaptopRemove' icon.
  static const IconData laptopRemove = HugeIconData(0x4239);

  /// IconData for the 'strokeRoundedLaptopSettings' icon.
  static const IconData laptopSettings = HugeIconData(0x423a);

  /// IconData for the 'strokeRoundedLaptopVideo' icon.
  static const IconData laptopVideo = HugeIconData(0x423b);

  /// IconData for the 'strokeRoundedLaptop' icon.
  static const IconData laptop = HugeIconData(0x423c);

  /// IconData for the 'strokeRoundedLassoTool01' icon.
  static const IconData lassoTool01 = HugeIconData(0x423d);

  /// IconData for the 'strokeRoundedLassoTool02' icon.
  static const IconData lassoTool02 = HugeIconData(0x423e);

  /// IconData for the 'strokeRoundedLastFm' icon.
  static const IconData lastFm = HugeIconData(0x423f);

  /// IconData for the 'strokeRoundedLatitude' icon.
  static const IconData latitude = HugeIconData(0x4240);

  /// IconData for the 'strokeRoundedLaughing' icon.
  static const IconData laughing = HugeIconData(0x4241);

  /// IconData for the 'strokeRoundedLaurelWreath01' icon.
  static const IconData laurelWreath01 = HugeIconData(0x4242);

  /// IconData for the 'strokeRoundedLaurelWreath02' icon.
  static const IconData laurelWreath02 = HugeIconData(0x4243);

  /// IconData for the 'strokeRoundedLaurelWreathFirst01' icon.
  static const IconData laurelWreathFirst01 = HugeIconData(0x4244);

  /// IconData for the 'strokeRoundedLaurelWreathFirst02' icon.
  static const IconData laurelWreathFirst02 = HugeIconData(0x4245);

  /// IconData for the 'strokeRoundedLaurelWreathLeft01' icon.
  static const IconData laurelWreathLeft01 = HugeIconData(0x4246);

  /// IconData for the 'strokeRoundedLaurelWreathLeft02' icon.
  static const IconData laurelWreathLeft02 = HugeIconData(0x4247);

  /// IconData for the 'strokeRoundedLaurelWreathLeft03' icon.
  static const IconData laurelWreathLeft03 = HugeIconData(0x4248);

  /// IconData for the 'strokeRoundedLaurelWreathRight01' icon.
  static const IconData laurelWreathRight01 = HugeIconData(0x4249);

  /// IconData for the 'strokeRoundedLaurelWreathRight02' icon.
  static const IconData laurelWreathRight02 = HugeIconData(0x424a);

  /// IconData for the 'strokeRoundedLaurelWreathRight03' icon.
  static const IconData laurelWreathRight03 = HugeIconData(0x424b);

  /// IconData for the 'strokeRoundedLayerAdd' icon.
  static const IconData layerAdd = HugeIconData(0x424c);

  /// IconData for the 'strokeRoundedLayerMask01' icon.
  static const IconData layerMask01 = HugeIconData(0x424d);

  /// IconData for the 'strokeRoundedLayerMask02' icon.
  static const IconData layerMask02 = HugeIconData(0x424e);

  /// IconData for the 'strokeRoundedLayers01' icon.
  static const IconData layers01 = HugeIconData(0x424f);

  /// IconData for the 'strokeRoundedLayers02' icon.
  static const IconData layers02 = HugeIconData(0x4250);

  /// IconData for the 'strokeRoundedLayersLogo' icon.
  static const IconData layersLogo = HugeIconData(0x4251);

  /// IconData for the 'strokeRoundedLayout01' icon.
  static const IconData layout01 = HugeIconData(0x4252);

  /// IconData for the 'strokeRoundedLayout02' icon.
  static const IconData layout02 = HugeIconData(0x4253);

  /// IconData for the 'strokeRoundedLayout03' icon.
  static const IconData layout03 = HugeIconData(0x4254);

  /// IconData for the 'strokeRoundedLayout04' icon.
  static const IconData layout04 = HugeIconData(0x4255);

  /// IconData for the 'strokeRoundedLayout05' icon.
  static const IconData layout05 = HugeIconData(0x4256);

  /// IconData for the 'strokeRoundedLayout06' icon.
  static const IconData layout06 = HugeIconData(0x4257);

  /// IconData for the 'strokeRoundedLayout07' icon.
  static const IconData layout07 = HugeIconData(0x4258);

  /// IconData for the 'strokeRoundedLayout2Column' icon.
  static const IconData layout2Column = HugeIconData(0x4259);

  /// IconData for the 'strokeRoundedLayout2Row' icon.
  static const IconData layout2Row = HugeIconData(0x425a);

  /// IconData for the 'strokeRoundedLayout3Column' icon.
  static const IconData layout3Column = HugeIconData(0x425b);

  /// IconData for the 'strokeRoundedLayout3Row' icon.
  static const IconData layout3Row = HugeIconData(0x425c);

  /// IconData for the 'strokeRoundedLayoutBottom' icon.
  static const IconData layoutBottom = HugeIconData(0x425d);

  /// IconData for the 'strokeRoundedLayoutGrid' icon.
  static const IconData layoutGrid = HugeIconData(0x425e);

  /// IconData for the 'strokeRoundedLayoutLeft' icon.
  static const IconData layoutLeft = HugeIconData(0x425f);

  /// IconData for the 'strokeRoundedLayoutRight' icon.
  static const IconData layoutRight = HugeIconData(0x4260);

  /// IconData for the 'strokeRoundedLayoutTable01' icon.
  static const IconData layoutTable01 = HugeIconData(0x4261);

  /// IconData for the 'strokeRoundedLayoutTable02' icon.
  static const IconData layoutTable02 = HugeIconData(0x4262);

  /// IconData for the 'strokeRoundedLayoutTop' icon.
  static const IconData layoutTop = HugeIconData(0x4263);

  /// IconData for the 'strokeRoundedLeaf01' icon.
  static const IconData leaf01 = HugeIconData(0x4264);

  /// IconData for the 'strokeRoundedLeaf02' icon.
  static const IconData leaf02 = HugeIconData(0x4265);

  /// IconData for the 'strokeRoundedLeaf03' icon.
  static const IconData leaf03 = HugeIconData(0x4266);

  /// IconData for the 'strokeRoundedLeaf04' icon.
  static const IconData leaf04 = HugeIconData(0x4267);

  /// IconData for the 'strokeRoundedLeavingGeoFence' icon.
  static const IconData leavingGeoFence = HugeIconData(0x4268);

  /// IconData for the 'strokeRoundedLeetcode' icon.
  static const IconData leetcode = HugeIconData(0x4269);

  /// IconData for the 'strokeRoundedLeftAngle' icon.
  static const IconData leftAngle = HugeIconData(0x426a);

  /// IconData for the 'strokeRoundedLeftToRightBlockQuote' icon.
  static const IconData leftToRightBlockQuote = HugeIconData(0x426b);

  /// IconData for the 'strokeRoundedLeftToRightListBullet' icon.
  static const IconData leftToRightListBullet = HugeIconData(0x426c);

  /// IconData for the 'strokeRoundedLeftToRightListDash' icon.
  static const IconData leftToRightListDash = HugeIconData(0x426d);

  /// IconData for the 'strokeRoundedLeftToRightListNumber' icon.
  static const IconData leftToRightListNumber = HugeIconData(0x426e);

  /// IconData for the 'strokeRoundedLeftToRightListStar01' icon.
  static const IconData leftToRightListStar01 = HugeIconData(0x426f);

  /// IconData for the 'strokeRoundedLeftToRightListStar' icon.
  static const IconData leftToRightListStar = HugeIconData(0x4270);

  /// IconData for the 'strokeRoundedLeftToRightListTriangle' icon.
  static const IconData leftToRightListTriangle = HugeIconData(0x4271);

  /// IconData for the 'strokeRoundedLeftTriangle' icon.
  static const IconData leftTriangle = HugeIconData(0x4272);

  /// IconData for the 'strokeRoundedLegal01' icon.
  static const IconData legal01 = HugeIconData(0x4273);

  /// IconData for the 'strokeRoundedLegal02' icon.
  static const IconData legal02 = HugeIconData(0x4274);

  /// IconData for the 'strokeRoundedLegalDocument01' icon.
  static const IconData legalDocument01 = HugeIconData(0x4275);

  /// IconData for the 'strokeRoundedLegalDocument02' icon.
  static const IconData legalDocument02 = HugeIconData(0x4276);

  /// IconData for the 'strokeRoundedLegalHammer' icon.
  static const IconData legalHammer = HugeIconData(0x4277);

  /// IconData for the 'strokeRoundedLessThanCircle' icon.
  static const IconData lessThanCircle = HugeIconData(0x4278);

  /// IconData for the 'strokeRoundedLessThanSquare' icon.
  static const IconData lessThanSquare = HugeIconData(0x4279);

  /// IconData for the 'strokeRoundedLessThan' icon.
  static const IconData lessThan = HugeIconData(0x427a);

  /// IconData for the 'strokeRoundedLetterSpacing' icon.
  static const IconData letterSpacing = HugeIconData(0x427b);

  /// IconData for the 'strokeRoundedLibraries' icon.
  static const IconData libraries = HugeIconData(0x427c);

  /// IconData for the 'strokeRoundedLibrary' icon.
  static const IconData library = HugeIconData(0x427d);

  /// IconData for the 'strokeRoundedLicenseDraft' icon.
  static const IconData licenseDraft = HugeIconData(0x427e);

  /// IconData for the 'strokeRoundedLicenseMaintenance' icon.
  static const IconData licenseMaintenance = HugeIconData(0x427f);

  /// IconData for the 'strokeRoundedLicenseNo' icon.
  static const IconData licenseNo = HugeIconData(0x4280);

  /// IconData for the 'strokeRoundedLicensePin' icon.
  static const IconData licensePin = HugeIconData(0x4281);

  /// IconData for the 'strokeRoundedLicenseThirdParty' icon.
  static const IconData licenseThirdParty = HugeIconData(0x4282);

  /// IconData for the 'strokeRoundedLicense' icon.
  static const IconData license = HugeIconData(0x4283);

  /// IconData for the 'strokeRoundedLiftTruck' icon.
  static const IconData liftTruck = HugeIconData(0x4284);

  /// IconData for the 'strokeRoundedLighthouse' icon.
  static const IconData lighthouse = HugeIconData(0x4285);

  /// IconData for the 'strokeRoundedLimitation' icon.
  static const IconData limitation = HugeIconData(0x4286);

  /// IconData for the 'strokeRoundedLine' icon.
  static const IconData line = HugeIconData(0x4287);

  /// IconData for the 'strokeRoundedLiner' icon.
  static const IconData liner = HugeIconData(0x4288);

  /// IconData for the 'strokeRoundedLink01' icon.
  static const IconData link01 = HugeIconData(0x4289);

  /// IconData for the 'strokeRoundedLink02' icon.
  static const IconData link02 = HugeIconData(0x428a);

  /// IconData for the 'strokeRoundedLink03' icon.
  static const IconData link03 = HugeIconData(0x428b);

  /// IconData for the 'strokeRoundedLink04' icon.
  static const IconData link04 = HugeIconData(0x428c);

  /// IconData for the 'strokeRoundedLink05' icon.
  static const IconData link05 = HugeIconData(0x428d);

  /// IconData for the 'strokeRoundedLink06' icon.
  static const IconData link06 = HugeIconData(0x428e);

  /// IconData for the 'strokeRoundedLinkBackward' icon.
  static const IconData linkBackward = HugeIconData(0x428f);

  /// IconData for the 'strokeRoundedLinkCircle02' icon.
  static const IconData linkCircle02 = HugeIconData(0x4290);

  /// IconData for the 'strokeRoundedLinkCircle' icon.
  static const IconData linkCircle = HugeIconData(0x4291);

  /// IconData for the 'strokeRoundedLinkForward' icon.
  static const IconData linkForward = HugeIconData(0x4292);

  /// IconData for the 'strokeRoundedLinkSquare01' icon.
  static const IconData linkSquare01 = HugeIconData(0x4293);

  /// IconData for the 'strokeRoundedLinkSquare02' icon.
  static const IconData linkSquare02 = HugeIconData(0x4294);

  /// IconData for the 'strokeRoundedLinkedin01' icon.
  static const IconData linkedin01 = HugeIconData(0x4295);

  /// IconData for the 'strokeRoundedLinkedin02' icon.
  static const IconData linkedin02 = HugeIconData(0x4296);

  /// IconData for the 'strokeRoundedListSetting' icon.
  static const IconData listSetting = HugeIconData(0x4297);

  /// IconData for the 'strokeRoundedListView' icon.
  static const IconData listView = HugeIconData(0x4298);

  /// IconData for the 'strokeRoundedLitecoin' icon.
  static const IconData litecoin = HugeIconData(0x4299);

  /// IconData for the 'strokeRoundedLiver' icon.
  static const IconData liver = HugeIconData(0x429a);

  /// IconData for the 'strokeRoundedLoading01' icon.
  static const IconData loading01 = HugeIconData(0x429b);

  /// IconData for the 'strokeRoundedLoading02' icon.
  static const IconData loading02 = HugeIconData(0x429c);

  /// IconData for the 'strokeRoundedLoading03' icon.
  static const IconData loading03 = HugeIconData(0x429d);

  /// IconData for the 'strokeRoundedLoading04' icon.
  static const IconData loading04 = HugeIconData(0x429e);

  /// IconData for the 'strokeRoundedLocation01' icon.
  static const IconData location01 = HugeIconData(0x429f);

  /// IconData for the 'strokeRoundedLocation02' icon.
  static const IconData location02 = HugeIconData(0x42a0);

  /// IconData for the 'strokeRoundedLocation03' icon.
  static const IconData location03 = HugeIconData(0x42a1);

  /// IconData for the 'strokeRoundedLocation04' icon.
  static const IconData location04 = HugeIconData(0x42a2);

  /// IconData for the 'strokeRoundedLocation05' icon.
  static const IconData location05 = HugeIconData(0x42a3);

  /// IconData for the 'strokeRoundedLocation06' icon.
  static const IconData location06 = HugeIconData(0x42a4);

  /// IconData for the 'strokeRoundedLocation07' icon.
  static const IconData location07 = HugeIconData(0x42a5);

  /// IconData for the 'strokeRoundedLocation08' icon.
  static const IconData location08 = HugeIconData(0x42a6);

  /// IconData for the 'strokeRoundedLocation09' icon.
  static const IconData location09 = HugeIconData(0x42a7);

  /// IconData for the 'strokeRoundedLocation10' icon.
  static const IconData location10 = HugeIconData(0x42a8);

  /// IconData for the 'strokeRoundedLocationAdd01' icon.
  static const IconData locationAdd01 = HugeIconData(0x42a9);

  /// IconData for the 'strokeRoundedLocationAdd02' icon.
  static const IconData locationAdd02 = HugeIconData(0x42aa);

  /// IconData for the 'strokeRoundedLocationCheck01' icon.
  static const IconData locationCheck01 = HugeIconData(0x42ab);

  /// IconData for the 'strokeRoundedLocationCheck02' icon.
  static const IconData locationCheck02 = HugeIconData(0x42ac);

  /// IconData for the 'strokeRoundedLocationFavourite01' icon.
  static const IconData locationFavourite01 = HugeIconData(0x42ad);

  /// IconData for the 'strokeRoundedLocationFavourite02' icon.
  static const IconData locationFavourite02 = HugeIconData(0x42ae);

  /// IconData for the 'strokeRoundedLocationOffline01' icon.
  static const IconData locationOffline01 = HugeIconData(0x42af);

  /// IconData for the 'strokeRoundedLocationOffline02' icon.
  static const IconData locationOffline02 = HugeIconData(0x42b0);

  /// IconData for the 'strokeRoundedLocationOffline03' icon.
  static const IconData locationOffline03 = HugeIconData(0x42b1);

  /// IconData for the 'strokeRoundedLocationOffline04' icon.
  static const IconData locationOffline04 = HugeIconData(0x42b2);

  /// IconData for the 'strokeRoundedLocationRemove01' icon.
  static const IconData locationRemove01 = HugeIconData(0x42b3);

  /// IconData for the 'strokeRoundedLocationRemove02' icon.
  static const IconData locationRemove02 = HugeIconData(0x42b4);

  /// IconData for the 'strokeRoundedLocationShare01' icon.
  static const IconData locationShare01 = HugeIconData(0x42b5);

  /// IconData for the 'strokeRoundedLocationShare02' icon.
  static const IconData locationShare02 = HugeIconData(0x42b6);

  /// IconData for the 'strokeRoundedLocationStar01' icon.
  static const IconData locationStar01 = HugeIconData(0x42b7);

  /// IconData for the 'strokeRoundedLocationStar02' icon.
  static const IconData locationStar02 = HugeIconData(0x42b8);

  /// IconData for the 'strokeRoundedLocationUpdate01' icon.
  static const IconData locationUpdate01 = HugeIconData(0x42b9);

  /// IconData for the 'strokeRoundedLocationUpdate02' icon.
  static const IconData locationUpdate02 = HugeIconData(0x42ba);

  /// IconData for the 'strokeRoundedLocationUser01' icon.
  static const IconData locationUser01 = HugeIconData(0x42bb);

  /// IconData for the 'strokeRoundedLocationUser02' icon.
  static const IconData locationUser02 = HugeIconData(0x42bc);

  /// IconData for the 'strokeRoundedLocationUser03' icon.
  static const IconData locationUser03 = HugeIconData(0x42bd);

  /// IconData for the 'strokeRoundedLocationUser04' icon.
  static const IconData locationUser04 = HugeIconData(0x42be);

  /// IconData for the 'strokeRoundedLockComputer' icon.
  static const IconData lockComputer = HugeIconData(0x42bf);

  /// IconData for the 'strokeRoundedLockKey' icon.
  static const IconData lockKey = HugeIconData(0x42c0);

  /// IconData for the 'strokeRoundedLockPassword' icon.
  static const IconData lockPassword = HugeIconData(0x42c1);

  /// IconData for the 'strokeRoundedLockSync01' icon.
  static const IconData lockSync01 = HugeIconData(0x42c2);

  /// IconData for the 'strokeRoundedLockSync02' icon.
  static const IconData lockSync02 = HugeIconData(0x42c3);

  /// IconData for the 'strokeRoundedLock' icon.
  static const IconData lock = HugeIconData(0x42c4);

  /// IconData for the 'strokeRoundedLocked' icon.
  static const IconData locked = HugeIconData(0x42c5);

  /// IconData for the 'strokeRoundedLocker01' icon.
  static const IconData locker01 = HugeIconData(0x42c6);

  /// IconData for the 'strokeRoundedLocker' icon.
  static const IconData locker = HugeIconData(0x42c7);

  /// IconData for the 'strokeRoundedLogin01' icon.
  static const IconData login01 = HugeIconData(0x42c8);

  /// IconData for the 'strokeRoundedLogin02' icon.
  static const IconData login02 = HugeIconData(0x42c9);

  /// IconData for the 'strokeRoundedLogin03' icon.
  static const IconData login03 = HugeIconData(0x42ca);

  /// IconData for the 'strokeRoundedLoginCircle01' icon.
  static const IconData loginCircle01 = HugeIconData(0x42cb);

  /// IconData for the 'strokeRoundedLoginCircle02' icon.
  static const IconData loginCircle02 = HugeIconData(0x42cc);

  /// IconData for the 'strokeRoundedLoginMethod' icon.
  static const IconData loginMethod = HugeIconData(0x42cd);

  /// IconData for the 'strokeRoundedLoginSquare01' icon.
  static const IconData loginSquare01 = HugeIconData(0x42ce);

  /// IconData for the 'strokeRoundedLoginSquare02' icon.
  static const IconData loginSquare02 = HugeIconData(0x42cf);

  /// IconData for the 'strokeRoundedLogout01' icon.
  static const IconData logout01 = HugeIconData(0x42d0);

  /// IconData for the 'strokeRoundedLogout02' icon.
  static const IconData logout02 = HugeIconData(0x42d1);

  /// IconData for the 'strokeRoundedLogout03' icon.
  static const IconData logout03 = HugeIconData(0x42d2);

  /// IconData for the 'strokeRoundedLogout04' icon.
  static const IconData logout04 = HugeIconData(0x42d3);

  /// IconData for the 'strokeRoundedLogout05' icon.
  static const IconData logout05 = HugeIconData(0x42d4);

  /// IconData for the 'strokeRoundedLogoutCircle01' icon.
  static const IconData logoutCircle01 = HugeIconData(0x42d5);

  /// IconData for the 'strokeRoundedLogoutCircle02' icon.
  static const IconData logoutCircle02 = HugeIconData(0x42d6);

  /// IconData for the 'strokeRoundedLogoutSquare01' icon.
  static const IconData logoutSquare01 = HugeIconData(0x42d7);

  /// IconData for the 'strokeRoundedLogoutSquare02' icon.
  static const IconData logoutSquare02 = HugeIconData(0x42d8);

  /// IconData for the 'strokeRoundedLollipop' icon.
  static const IconData lollipop = HugeIconData(0x42d9);

  /// IconData for the 'strokeRoundedLongSleeveShirt' icon.
  static const IconData longSleeveShirt = HugeIconData(0x42da);

  /// IconData for the 'strokeRoundedLongitude' icon.
  static const IconData longitude = HugeIconData(0x42db);

  /// IconData for the 'strokeRoundedLookBottom' icon.
  static const IconData lookBottom = HugeIconData(0x42dc);

  /// IconData for the 'strokeRoundedLookLeft' icon.
  static const IconData lookLeft = HugeIconData(0x42dd);

  /// IconData for the 'strokeRoundedLookRight' icon.
  static const IconData lookRight = HugeIconData(0x42de);

  /// IconData for the 'strokeRoundedLookTop' icon.
  static const IconData lookTop = HugeIconData(0x42df);

  /// IconData for the 'strokeRoundedLoom' icon.
  static const IconData loom = HugeIconData(0x42e0);

  /// IconData for the 'strokeRoundedLottiefiles' icon.
  static const IconData lottiefiles = HugeIconData(0x42e1);

  /// IconData for the 'strokeRoundedLoveKoreanFinger' icon.
  static const IconData loveKoreanFinger = HugeIconData(0x42e2);

  /// IconData for the 'strokeRoundedLoyaltyCard' icon.
  static const IconData loyaltyCard = HugeIconData(0x42e3);

  /// IconData for the 'strokeRoundedLuggage01' icon.
  static const IconData luggage01 = HugeIconData(0x42e4);

  /// IconData for the 'strokeRoundedLuggage02' icon.
  static const IconData luggage02 = HugeIconData(0x42e5);

  /// IconData for the 'strokeRoundedLungs' icon.
  static const IconData lungs = HugeIconData(0x42e6);

  /// IconData for the 'strokeRoundedMachineRobot' icon.
  static const IconData machineRobot = HugeIconData(0x42e7);

  /// IconData for the 'strokeRoundedMagicWand01' icon.
  static const IconData magicWand01 = HugeIconData(0x42e8);

  /// IconData for the 'strokeRoundedMagicWand02' icon.
  static const IconData magicWand02 = HugeIconData(0x42e9);

  /// IconData for the 'strokeRoundedMagicWand03' icon.
  static const IconData magicWand03 = HugeIconData(0x42ea);

  /// IconData for the 'strokeRoundedMagnet01' icon.
  static const IconData magnet01 = HugeIconData(0x42eb);

  /// IconData for the 'strokeRoundedMagnet02' icon.
  static const IconData magnet02 = HugeIconData(0x42ec);

  /// IconData for the 'strokeRoundedMagnet' icon.
  static const IconData magnet = HugeIconData(0x42ed);

  /// IconData for the 'strokeRoundedMail01' icon.
  static const IconData mail01 = HugeIconData(0x42ee);

  /// IconData for the 'strokeRoundedMail02' icon.
  static const IconData mail02 = HugeIconData(0x42ef);

  /// IconData for the 'strokeRoundedMailAccount01' icon.
  static const IconData mailAccount01 = HugeIconData(0x42f0);

  /// IconData for the 'strokeRoundedMailAccount02' icon.
  static const IconData mailAccount02 = HugeIconData(0x42f1);

  /// IconData for the 'strokeRoundedMailAdd01' icon.
  static const IconData mailAdd01 = HugeIconData(0x42f2);

  /// IconData for the 'strokeRoundedMailAdd02' icon.
  static const IconData mailAdd02 = HugeIconData(0x42f3);

  /// IconData for the 'strokeRoundedMailAtSign01' icon.
  static const IconData mailAtSign01 = HugeIconData(0x42f4);

  /// IconData for the 'strokeRoundedMailAtSign02' icon.
  static const IconData mailAtSign02 = HugeIconData(0x42f5);

  /// IconData for the 'strokeRoundedMailBlock01' icon.
  static const IconData mailBlock01 = HugeIconData(0x42f6);

  /// IconData for the 'strokeRoundedMailBlock02' icon.
  static const IconData mailBlock02 = HugeIconData(0x42f7);

  /// IconData for the 'strokeRoundedMailDownload01' icon.
  static const IconData mailDownload01 = HugeIconData(0x42f8);

  /// IconData for the 'strokeRoundedMailDownload02' icon.
  static const IconData mailDownload02 = HugeIconData(0x42f9);

  /// IconData for the 'strokeRoundedMailEdit01' icon.
  static const IconData mailEdit01 = HugeIconData(0x42fa);

  /// IconData for the 'strokeRoundedMailEdit02' icon.
  static const IconData mailEdit02 = HugeIconData(0x42fb);

  /// IconData for the 'strokeRoundedMailLock01' icon.
  static const IconData mailLock01 = HugeIconData(0x42fc);

  /// IconData for the 'strokeRoundedMailLock02' icon.
  static const IconData mailLock02 = HugeIconData(0x42fd);

  /// IconData for the 'strokeRoundedMailLove01' icon.
  static const IconData mailLove01 = HugeIconData(0x42fe);

  /// IconData for the 'strokeRoundedMailLove02' icon.
  static const IconData mailLove02 = HugeIconData(0x42ff);

  /// IconData for the 'strokeRoundedMailMinus01' icon.
  static const IconData mailMinus01 = HugeIconData(0x4300);

  /// IconData for the 'strokeRoundedMailMinus02' icon.
  static const IconData mailMinus02 = HugeIconData(0x4301);

  /// IconData for the 'strokeRoundedMailOpen01' icon.
  static const IconData mailOpen01 = HugeIconData(0x4302);

  /// IconData for the 'strokeRoundedMailOpen02' icon.
  static const IconData mailOpen02 = HugeIconData(0x4303);

  /// IconData for the 'strokeRoundedMailOpenLove' icon.
  static const IconData mailOpenLove = HugeIconData(0x4304);

  /// IconData for the 'strokeRoundedMailOpen' icon.
  static const IconData mailOpen = HugeIconData(0x4305);

  /// IconData for the 'strokeRoundedMailReceive01' icon.
  static const IconData mailReceive01 = HugeIconData(0x4306);

  /// IconData for the 'strokeRoundedMailReceive02' icon.
  static const IconData mailReceive02 = HugeIconData(0x4307);

  /// IconData for the 'strokeRoundedMailRemove01' icon.
  static const IconData mailRemove01 = HugeIconData(0x4308);

  /// IconData for the 'strokeRoundedMailRemove02' icon.
  static const IconData mailRemove02 = HugeIconData(0x4309);

  /// IconData for the 'strokeRoundedMailReply01' icon.
  static const IconData mailReply01 = HugeIconData(0x430a);

  /// IconData for the 'strokeRoundedMailReply02' icon.
  static const IconData mailReply02 = HugeIconData(0x430b);

  /// IconData for the 'strokeRoundedMailReplyAll01' icon.
  static const IconData mailReplyAll01 = HugeIconData(0x430c);

  /// IconData for the 'strokeRoundedMailReplyAll02' icon.
  static const IconData mailReplyAll02 = HugeIconData(0x430d);

  /// IconData for the 'strokeRoundedMailSearch01' icon.
  static const IconData mailSearch01 = HugeIconData(0x430e);

  /// IconData for the 'strokeRoundedMailSearch02' icon.
  static const IconData mailSearch02 = HugeIconData(0x430f);

  /// IconData for the 'strokeRoundedMailSecure01' icon.
  static const IconData mailSecure01 = HugeIconData(0x4310);

  /// IconData for the 'strokeRoundedMailSecure02' icon.
  static const IconData mailSecure02 = HugeIconData(0x4311);

  /// IconData for the 'strokeRoundedMailSend01' icon.
  static const IconData mailSend01 = HugeIconData(0x4312);

  /// IconData for the 'strokeRoundedMailSend02' icon.
  static const IconData mailSend02 = HugeIconData(0x4313);

  /// IconData for the 'strokeRoundedMailSetting01' icon.
  static const IconData mailSetting01 = HugeIconData(0x4314);

  /// IconData for the 'strokeRoundedMailSetting02' icon.
  static const IconData mailSetting02 = HugeIconData(0x4315);

  /// IconData for the 'strokeRoundedMailUnlock01' icon.
  static const IconData mailUnlock01 = HugeIconData(0x4316);

  /// IconData for the 'strokeRoundedMailUnlock02' icon.
  static const IconData mailUnlock02 = HugeIconData(0x4317);

  /// IconData for the 'strokeRoundedMailUpload01' icon.
  static const IconData mailUpload01 = HugeIconData(0x4318);

  /// IconData for the 'strokeRoundedMailUpload02' icon.
  static const IconData mailUpload02 = HugeIconData(0x4319);

  /// IconData for the 'strokeRoundedMailValidation01' icon.
  static const IconData mailValidation01 = HugeIconData(0x431a);

  /// IconData for the 'strokeRoundedMailValidation02' icon.
  static const IconData mailValidation02 = HugeIconData(0x431b);

  /// IconData for the 'strokeRoundedMailVoice01' icon.
  static const IconData mailVoice01 = HugeIconData(0x431c);

  /// IconData for the 'strokeRoundedMailVoice02' icon.
  static const IconData mailVoice02 = HugeIconData(0x431d);

  /// IconData for the 'strokeRoundedMailbox01' icon.
  static const IconData mailbox01 = HugeIconData(0x431e);

  /// IconData for the 'strokeRoundedMailbox' icon.
  static const IconData mailbox = HugeIconData(0x431f);

  /// IconData for the 'strokeRoundedManager' icon.
  static const IconData manager = HugeIconData(0x4320);

  /// IconData for the 'strokeRoundedMapPin' icon.
  static const IconData mapPin = HugeIconData(0x4321);

  /// IconData for the 'strokeRoundedMapPinpoint01' icon.
  static const IconData mapPinpoint01 = HugeIconData(0x4322);

  /// IconData for the 'strokeRoundedMapPinpoint02' icon.
  static const IconData mapPinpoint02 = HugeIconData(0x4323);

  /// IconData for the 'strokeRoundedMaping' icon.
  static const IconData maping = HugeIconData(0x4324);

  /// IconData for the 'strokeRoundedMapsCircle01' icon.
  static const IconData mapsCircle01 = HugeIconData(0x4325);

  /// IconData for the 'strokeRoundedMapsCircle02' icon.
  static const IconData mapsCircle02 = HugeIconData(0x4326);

  /// IconData for the 'strokeRoundedMapsEditing' icon.
  static const IconData mapsEditing = HugeIconData(0x4327);

  /// IconData for the 'strokeRoundedMapsGlobal01' icon.
  static const IconData mapsGlobal01 = HugeIconData(0x4328);

  /// IconData for the 'strokeRoundedMapsGlobal02' icon.
  static const IconData mapsGlobal02 = HugeIconData(0x4329);

  /// IconData for the 'strokeRoundedMapsLocation01' icon.
  static const IconData mapsLocation01 = HugeIconData(0x432a);

  /// IconData for the 'strokeRoundedMapsLocation02' icon.
  static const IconData mapsLocation02 = HugeIconData(0x432b);

  /// IconData for the 'strokeRoundedMapsOff' icon.
  static const IconData mapsOff = HugeIconData(0x432c);

  /// IconData for the 'strokeRoundedMapsRefresh' icon.
  static const IconData mapsRefresh = HugeIconData(0x432d);

  /// IconData for the 'strokeRoundedMapsSearch' icon.
  static const IconData mapsSearch = HugeIconData(0x432e);

  /// IconData for the 'strokeRoundedMapsSquare01' icon.
  static const IconData mapsSquare01 = HugeIconData(0x432f);

  /// IconData for the 'strokeRoundedMapsSquare02' icon.
  static const IconData mapsSquare02 = HugeIconData(0x4330);

  /// IconData for the 'strokeRoundedMaps' icon.
  static const IconData maps = HugeIconData(0x4331);

  /// IconData for the 'strokeRoundedMarketAnalysis' icon.
  static const IconData marketAnalysis = HugeIconData(0x4332);

  /// IconData for the 'strokeRoundedMarketing' icon.
  static const IconData marketing = HugeIconData(0x4333);

  /// IconData for the 'strokeRoundedMaskLove' icon.
  static const IconData maskLove = HugeIconData(0x4334);

  /// IconData for the 'strokeRoundedMask' icon.
  static const IconData mask = HugeIconData(0x4335);

  /// IconData for the 'strokeRoundedMasterCard' icon.
  static const IconData masterCard = HugeIconData(0x4336);

  /// IconData for the 'strokeRoundedMatches' icon.
  static const IconData matches = HugeIconData(0x4337);

  /// IconData for the 'strokeRoundedMath' icon.
  static const IconData math = HugeIconData(0x4338);

  /// IconData for the 'strokeRoundedMatrix' icon.
  static const IconData matrix = HugeIconData(0x4339);

  /// IconData for the 'strokeRoundedMaximize01' icon.
  static const IconData maximize01 = HugeIconData(0x433a);

  /// IconData for the 'strokeRoundedMaximize02' icon.
  static const IconData maximize02 = HugeIconData(0x433b);

  /// IconData for the 'strokeRoundedMaximize03' icon.
  static const IconData maximize03 = HugeIconData(0x433c);

  /// IconData for the 'strokeRoundedMaximize04' icon.
  static const IconData maximize04 = HugeIconData(0x433d);

  /// IconData for the 'strokeRoundedMaximizeScreen' icon.
  static const IconData maximizeScreen = HugeIconData(0x433e);

  /// IconData for the 'strokeRoundedMayanPyramid' icon.
  static const IconData mayanPyramid = HugeIconData(0x433f);

  /// IconData for the 'strokeRoundedMaze' icon.
  static const IconData maze = HugeIconData(0x4340);

  /// IconData for the 'strokeRoundedMedal01' icon.
  static const IconData medal01 = HugeIconData(0x4341);

  /// IconData for the 'strokeRoundedMedal02' icon.
  static const IconData medal02 = HugeIconData(0x4342);

  /// IconData for the 'strokeRoundedMedal03' icon.
  static const IconData medal03 = HugeIconData(0x4343);

  /// IconData for the 'strokeRoundedMedal04' icon.
  static const IconData medal04 = HugeIconData(0x4344);

  /// IconData for the 'strokeRoundedMedal05' icon.
  static const IconData medal05 = HugeIconData(0x4345);

  /// IconData for the 'strokeRoundedMedal06' icon.
  static const IconData medal06 = HugeIconData(0x4346);

  /// IconData for the 'strokeRoundedMedal07' icon.
  static const IconData medal07 = HugeIconData(0x4347);

  /// IconData for the 'strokeRoundedMedalFirstPlace' icon.
  static const IconData medalFirstPlace = HugeIconData(0x4348);

  /// IconData for the 'strokeRoundedMedalSecondPlace' icon.
  static const IconData medalSecondPlace = HugeIconData(0x4349);

  /// IconData for the 'strokeRoundedMedalThirdPlace' icon.
  static const IconData medalThirdPlace = HugeIconData(0x434a);

  /// IconData for the 'strokeRoundedMedicalFile' icon.
  static const IconData medicalFile = HugeIconData(0x434b);

  /// IconData for the 'strokeRoundedMedicalMask' icon.
  static const IconData medicalMask = HugeIconData(0x434c);

  /// IconData for the 'strokeRoundedMedicine01' icon.
  static const IconData medicine01 = HugeIconData(0x434d);

  /// IconData for the 'strokeRoundedMedicine02' icon.
  static const IconData medicine02 = HugeIconData(0x434e);

  /// IconData for the 'strokeRoundedMedicineBottle01' icon.
  static const IconData medicineBottle01 = HugeIconData(0x434f);

  /// IconData for the 'strokeRoundedMedicineBottle02' icon.
  static const IconData medicineBottle02 = HugeIconData(0x4350);

  /// IconData for the 'strokeRoundedMedicineSyrup' icon.
  static const IconData medicineSyrup = HugeIconData(0x4351);

  /// IconData for the 'strokeRoundedMediumSquare' icon.
  static const IconData mediumSquare = HugeIconData(0x4352);

  /// IconData for the 'strokeRoundedMedium' icon.
  static const IconData medium = HugeIconData(0x4353);

  /// IconData for the 'strokeRoundedMeetingRoom' icon.
  static const IconData meetingRoom = HugeIconData(0x4354);

  /// IconData for the 'strokeRoundedMegaphone01' icon.
  static const IconData megaphone01 = HugeIconData(0x4355);

  /// IconData for the 'strokeRoundedMegaphone02' icon.
  static const IconData megaphone02 = HugeIconData(0x4356);

  /// IconData for the 'strokeRoundedMeh' icon.
  static const IconData meh = HugeIconData(0x4357);

  /// IconData for the 'strokeRoundedMentor' icon.
  static const IconData mentor = HugeIconData(0x4358);

  /// IconData for the 'strokeRoundedMentoring' icon.
  static const IconData mentoring = HugeIconData(0x4359);

  /// IconData for the 'strokeRoundedMenu01' icon.
  static const IconData menu01 = HugeIconData(0x435a);

  /// IconData for the 'strokeRoundedMenu02' icon.
  static const IconData menu02 = HugeIconData(0x435b);

  /// IconData for the 'strokeRoundedMenu03' icon.
  static const IconData menu03 = HugeIconData(0x435c);

  /// IconData for the 'strokeRoundedMenu04' icon.
  static const IconData menu04 = HugeIconData(0x435d);

  /// IconData for the 'strokeRoundedMenu05' icon.
  static const IconData menu05 = HugeIconData(0x435e);

  /// IconData for the 'strokeRoundedMenu06' icon.
  static const IconData menu06 = HugeIconData(0x435f);

  /// IconData for the 'strokeRoundedMenu07' icon.
  static const IconData menu07 = HugeIconData(0x4360);

  /// IconData for the 'strokeRoundedMenu08' icon.
  static const IconData menu08 = HugeIconData(0x4361);

  /// IconData for the 'strokeRoundedMenu09' icon.
  static const IconData menu09 = HugeIconData(0x4362);

  /// IconData for the 'strokeRoundedMenu10' icon.
  static const IconData menu10 = HugeIconData(0x4363);

  /// IconData for the 'strokeRoundedMenu11' icon.
  static const IconData menu11 = HugeIconData(0x4364);

  /// IconData for the 'strokeRoundedMenuCircle' icon.
  static const IconData menuCircle = HugeIconData(0x4365);

  /// IconData for the 'strokeRoundedMenuRestaurant' icon.
  static const IconData menuRestaurant = HugeIconData(0x4366);

  /// IconData for the 'strokeRoundedMenuSquare' icon.
  static const IconData menuSquare = HugeIconData(0x4367);

  /// IconData for the 'strokeRoundedMessage01' icon.
  static const IconData message01 = HugeIconData(0x4368);

  /// IconData for the 'strokeRoundedMessage02' icon.
  static const IconData message02 = HugeIconData(0x4369);

  /// IconData for the 'strokeRoundedMessageAdd01' icon.
  static const IconData messageAdd01 = HugeIconData(0x436a);

  /// IconData for the 'strokeRoundedMessageAdd02' icon.
  static const IconData messageAdd02 = HugeIconData(0x436b);

  /// IconData for the 'strokeRoundedMessageBlocked' icon.
  static const IconData messageBlocked = HugeIconData(0x436c);

  /// IconData for the 'strokeRoundedMessageCancel01' icon.
  static const IconData messageCancel01 = HugeIconData(0x436d);

  /// IconData for the 'strokeRoundedMessageCancel02' icon.
  static const IconData messageCancel02 = HugeIconData(0x436e);

  /// IconData for the 'strokeRoundedMessageDelay01' icon.
  static const IconData messageDelay01 = HugeIconData(0x436f);

  /// IconData for the 'strokeRoundedMessageDelay02' icon.
  static const IconData messageDelay02 = HugeIconData(0x4370);

  /// IconData for the 'strokeRoundedMessageDone01' icon.
  static const IconData messageDone01 = HugeIconData(0x4371);

  /// IconData for the 'strokeRoundedMessageDone02' icon.
  static const IconData messageDone02 = HugeIconData(0x4372);

  /// IconData for the 'strokeRoundedMessageDownload01' icon.
  static const IconData messageDownload01 = HugeIconData(0x4373);

  /// IconData for the 'strokeRoundedMessageDownload02' icon.
  static const IconData messageDownload02 = HugeIconData(0x4374);

  /// IconData for the 'strokeRoundedMessageEdit01' icon.
  static const IconData messageEdit01 = HugeIconData(0x4375);

  /// IconData for the 'strokeRoundedMessageEdit02' icon.
  static const IconData messageEdit02 = HugeIconData(0x4376);

  /// IconData for the 'strokeRoundedMessageFavourite01' icon.
  static const IconData messageFavourite01 = HugeIconData(0x4377);

  /// IconData for the 'strokeRoundedMessageFavourite02' icon.
  static const IconData messageFavourite02 = HugeIconData(0x4378);

  /// IconData for the 'strokeRoundedMessageIncoming01' icon.
  static const IconData messageIncoming01 = HugeIconData(0x4379);

  /// IconData for the 'strokeRoundedMessageIncoming02' icon.
  static const IconData messageIncoming02 = HugeIconData(0x437a);

  /// IconData for the 'strokeRoundedMessageLock01' icon.
  static const IconData messageLock01 = HugeIconData(0x437b);

  /// IconData for the 'strokeRoundedMessageLock02' icon.
  static const IconData messageLock02 = HugeIconData(0x437c);

  /// IconData for the 'strokeRoundedMessageMultiple01' icon.
  static const IconData messageMultiple01 = HugeIconData(0x437d);

  /// IconData for the 'strokeRoundedMessageMultiple02' icon.
  static const IconData messageMultiple02 = HugeIconData(0x437e);

  /// IconData for the 'strokeRoundedMessageNotification01' icon.
  static const IconData messageNotification01 = HugeIconData(0x437f);

  /// IconData for the 'strokeRoundedMessageNotification02' icon.
  static const IconData messageNotification02 = HugeIconData(0x4380);

  /// IconData for the 'strokeRoundedMessageOutgoing01' icon.
  static const IconData messageOutgoing01 = HugeIconData(0x4381);

  /// IconData for the 'strokeRoundedMessageOutgoing02' icon.
  static const IconData messageOutgoing02 = HugeIconData(0x4382);

  /// IconData for the 'strokeRoundedMessagePreview01' icon.
  static const IconData messagePreview01 = HugeIconData(0x4383);

  /// IconData for the 'strokeRoundedMessagePreview02' icon.
  static const IconData messagePreview02 = HugeIconData(0x4384);

  /// IconData for the 'strokeRoundedMessageProgramming' icon.
  static const IconData messageProgramming = HugeIconData(0x4385);

  /// IconData for the 'strokeRoundedMessageQuestion' icon.
  static const IconData messageQuestion = HugeIconData(0x4386);

  /// IconData for the 'strokeRoundedMessageSearch01' icon.
  static const IconData messageSearch01 = HugeIconData(0x4387);

  /// IconData for the 'strokeRoundedMessageSearch02' icon.
  static const IconData messageSearch02 = HugeIconData(0x4388);

  /// IconData for the 'strokeRoundedMessageSecure01' icon.
  static const IconData messageSecure01 = HugeIconData(0x4389);

  /// IconData for the 'strokeRoundedMessageSecure02' icon.
  static const IconData messageSecure02 = HugeIconData(0x438a);

  /// IconData for the 'strokeRoundedMessageTranslate' icon.
  static const IconData messageTranslate = HugeIconData(0x438b);

  /// IconData for the 'strokeRoundedMessageUnlock01' icon.
  static const IconData messageUnlock01 = HugeIconData(0x438c);

  /// IconData for the 'strokeRoundedMessageUnlock02' icon.
  static const IconData messageUnlock02 = HugeIconData(0x438d);

  /// IconData for the 'strokeRoundedMessageUpload01' icon.
  static const IconData messageUpload01 = HugeIconData(0x438e);

  /// IconData for the 'strokeRoundedMessageUpload02' icon.
  static const IconData messageUpload02 = HugeIconData(0x438f);

  /// IconData for the 'strokeRoundedMessageUser01' icon.
  static const IconData messageUser01 = HugeIconData(0x4390);

  /// IconData for the 'strokeRoundedMessageUser02' icon.
  static const IconData messageUser02 = HugeIconData(0x4391);

  /// IconData for the 'strokeRoundedMessenger' icon.
  static const IconData messenger = HugeIconData(0x4392);

  /// IconData for the 'strokeRoundedMeta' icon.
  static const IconData meta = HugeIconData(0x4393);

  /// IconData for the 'strokeRoundedMetro' icon.
  static const IconData metro = HugeIconData(0x4394);

  /// IconData for the 'strokeRoundedMic01' icon.
  static const IconData mic01 = HugeIconData(0x4395);

  /// IconData for the 'strokeRoundedMic02' icon.
  static const IconData mic02 = HugeIconData(0x4396);

  /// IconData for the 'strokeRoundedMicOff01' icon.
  static const IconData micOff01 = HugeIconData(0x4397);

  /// IconData for the 'strokeRoundedMicOff02' icon.
  static const IconData micOff02 = HugeIconData(0x4398);

  /// IconData for the 'strokeRoundedMicrosoftAdmin' icon.
  static const IconData microsoftAdmin = HugeIconData(0x4399);

  /// IconData for the 'strokeRoundedMicrosoft' icon.
  static const IconData microsoft = HugeIconData(0x439a);

  /// IconData for the 'strokeRoundedMicrowave' icon.
  static const IconData microwave = HugeIconData(0x439b);

  /// IconData for the 'strokeRoundedMilkBottle' icon.
  static const IconData milkBottle = HugeIconData(0x439c);

  /// IconData for the 'strokeRoundedMilkCarton' icon.
  static const IconData milkCarton = HugeIconData(0x439d);

  /// IconData for the 'strokeRoundedMilkCoconut' icon.
  static const IconData milkCoconut = HugeIconData(0x439e);

  /// IconData for the 'strokeRoundedMilkOat' icon.
  static const IconData milkOat = HugeIconData(0x439f);

  /// IconData for the 'strokeRoundedMinimize01' icon.
  static const IconData minimize01 = HugeIconData(0x43a0);

  /// IconData for the 'strokeRoundedMinimize02' icon.
  static const IconData minimize02 = HugeIconData(0x43a1);

  /// IconData for the 'strokeRoundedMinimize03' icon.
  static const IconData minimize03 = HugeIconData(0x43a2);

  /// IconData for the 'strokeRoundedMinimize04' icon.
  static const IconData minimize04 = HugeIconData(0x43a3);

  /// IconData for the 'strokeRoundedMinimizeScreen' icon.
  static const IconData minimizeScreen = HugeIconData(0x43a4);

  /// IconData for the 'strokeRoundedMining01' icon.
  static const IconData mining01 = HugeIconData(0x43a5);

  /// IconData for the 'strokeRoundedMining02' icon.
  static const IconData mining02 = HugeIconData(0x43a6);

  /// IconData for the 'strokeRoundedMining03' icon.
  static const IconData mining03 = HugeIconData(0x43a7);

  /// IconData for the 'strokeRoundedMinusPlus01' icon.
  static const IconData minusPlus01 = HugeIconData(0x43a8);

  /// IconData for the 'strokeRoundedMinusPlus02' icon.
  static const IconData minusPlus02 = HugeIconData(0x43a9);

  /// IconData for the 'strokeRoundedMinusPlusCircle01' icon.
  static const IconData minusPlusCircle01 = HugeIconData(0x43aa);

  /// IconData for the 'strokeRoundedMinusPlusCircle02' icon.
  static const IconData minusPlusCircle02 = HugeIconData(0x43ab);

  /// IconData for the 'strokeRoundedMinusPlusSquare01' icon.
  static const IconData minusPlusSquare01 = HugeIconData(0x43ac);

  /// IconData for the 'strokeRoundedMinusPlusSquare02' icon.
  static const IconData minusPlusSquare02 = HugeIconData(0x43ad);

  /// IconData for the 'strokeRoundedMinusSignCircle' icon.
  static const IconData minusSignCircle = HugeIconData(0x43ae);

  /// IconData for the 'strokeRoundedMinusSignSquare' icon.
  static const IconData minusSignSquare = HugeIconData(0x43af);

  /// IconData for the 'strokeRoundedMinusSign' icon.
  static const IconData minusSign = HugeIconData(0x43b0);

  /// IconData for the 'strokeRoundedMirror' icon.
  static const IconData mirror = HugeIconData(0x43b1);

  /// IconData for the 'strokeRoundedMirroringScreen' icon.
  static const IconData mirroringScreen = HugeIconData(0x43b2);

  /// IconData for the 'strokeRoundedMixer' icon.
  static const IconData mixer = HugeIconData(0x43b3);

  /// IconData for the 'strokeRoundedMobileNavigator01' icon.
  static const IconData mobileNavigator01 = HugeIconData(0x43b4);

  /// IconData for the 'strokeRoundedMobileNavigator02' icon.
  static const IconData mobileNavigator02 = HugeIconData(0x43b5);

  /// IconData for the 'strokeRoundedMobileProgramming01' icon.
  static const IconData mobileProgramming01 = HugeIconData(0x43b6);

  /// IconData for the 'strokeRoundedMobileProgramming02' icon.
  static const IconData mobileProgramming02 = HugeIconData(0x43b7);

  /// IconData for the 'strokeRoundedMobileProtection' icon.
  static const IconData mobileProtection = HugeIconData(0x43b8);

  /// IconData for the 'strokeRoundedMobileSecurity' icon.
  static const IconData mobileSecurity = HugeIconData(0x43b9);

  /// IconData for the 'strokeRoundedMochi' icon.
  static const IconData mochi = HugeIconData(0x43ba);

  /// IconData for the 'strokeRoundedModernTvFourK' icon.
  static const IconData modernTvFourK = HugeIconData(0x43bb);

  /// IconData for the 'strokeRoundedModernTvIssue' icon.
  static const IconData modernTvIssue = HugeIconData(0x43bc);

  /// IconData for the 'strokeRoundedModernTv' icon.
  static const IconData modernTv = HugeIconData(0x43bd);

  /// IconData for the 'strokeRoundedMolecules' icon.
  static const IconData molecules = HugeIconData(0x43be);

  /// IconData for the 'strokeRoundedMonas' icon.
  static const IconData monas = HugeIconData(0x43bf);

  /// IconData for the 'strokeRoundedMoney01' icon.
  static const IconData money01 = HugeIconData(0x43c0);

  /// IconData for the 'strokeRoundedMoney02' icon.
  static const IconData money02 = HugeIconData(0x43c1);

  /// IconData for the 'strokeRoundedMoney03' icon.
  static const IconData money03 = HugeIconData(0x43c2);

  /// IconData for the 'strokeRoundedMoney04' icon.
  static const IconData money04 = HugeIconData(0x43c3);

  /// IconData for the 'strokeRoundedMoneyAdd01' icon.
  static const IconData moneyAdd01 = HugeIconData(0x43c4);

  /// IconData for the 'strokeRoundedMoneyAdd02' icon.
  static const IconData moneyAdd02 = HugeIconData(0x43c5);

  /// IconData for the 'strokeRoundedMoneyBag01' icon.
  static const IconData moneyBag01 = HugeIconData(0x43c6);

  /// IconData for the 'strokeRoundedMoneyBag02' icon.
  static const IconData moneyBag02 = HugeIconData(0x43c7);

  /// IconData for the 'strokeRoundedMoneyExchange01' icon.
  static const IconData moneyExchange01 = HugeIconData(0x43c8);

  /// IconData for the 'strokeRoundedMoneyExchange02' icon.
  static const IconData moneyExchange02 = HugeIconData(0x43c9);

  /// IconData for the 'strokeRoundedMoneyExchange03' icon.
  static const IconData moneyExchange03 = HugeIconData(0x43ca);

  /// IconData for the 'strokeRoundedMoneyNotFound01' icon.
  static const IconData moneyNotFound01 = HugeIconData(0x43cb);

  /// IconData for the 'strokeRoundedMoneyNotFound02' icon.
  static const IconData moneyNotFound02 = HugeIconData(0x43cc);

  /// IconData for the 'strokeRoundedMoneyNotFound03' icon.
  static const IconData moneyNotFound03 = HugeIconData(0x43cd);

  /// IconData for the 'strokeRoundedMoneyNotFound04' icon.
  static const IconData moneyNotFound04 = HugeIconData(0x43ce);

  /// IconData for the 'strokeRoundedMoneyReceive01' icon.
  static const IconData moneyReceive01 = HugeIconData(0x43cf);

  /// IconData for the 'strokeRoundedMoneyReceive02' icon.
  static const IconData moneyReceive02 = HugeIconData(0x43d0);

  /// IconData for the 'strokeRoundedMoneyReceiveCircle' icon.
  static const IconData moneyReceiveCircle = HugeIconData(0x43d1);

  /// IconData for the 'strokeRoundedMoneyReceiveFlow01' icon.
  static const IconData moneyReceiveFlow01 = HugeIconData(0x43d2);

  /// IconData for the 'strokeRoundedMoneyReceiveFlow02' icon.
  static const IconData moneyReceiveFlow02 = HugeIconData(0x43d3);

  /// IconData for the 'strokeRoundedMoneyReceiveSquare' icon.
  static const IconData moneyReceiveSquare = HugeIconData(0x43d4);

  /// IconData for the 'strokeRoundedMoneyRemove01' icon.
  static const IconData moneyRemove01 = HugeIconData(0x43d5);

  /// IconData for the 'strokeRoundedMoneyRemove02' icon.
  static const IconData moneyRemove02 = HugeIconData(0x43d6);

  /// IconData for the 'strokeRoundedMoneySafe' icon.
  static const IconData moneySafe = HugeIconData(0x43d7);

  /// IconData for the 'strokeRoundedMoneySavingJar' icon.
  static const IconData moneySavingJar = HugeIconData(0x43d8);

  /// IconData for the 'strokeRoundedMoneySecurity' icon.
  static const IconData moneySecurity = HugeIconData(0x43d9);

  /// IconData for the 'strokeRoundedMoneySend01' icon.
  static const IconData moneySend01 = HugeIconData(0x43da);

  /// IconData for the 'strokeRoundedMoneySend02' icon.
  static const IconData moneySend02 = HugeIconData(0x43db);

  /// IconData for the 'strokeRoundedMoneySendCircle' icon.
  static const IconData moneySendCircle = HugeIconData(0x43dc);

  /// IconData for the 'strokeRoundedMoneySendFlow01' icon.
  static const IconData moneySendFlow01 = HugeIconData(0x43dd);

  /// IconData for the 'strokeRoundedMoneySendFlow02' icon.
  static const IconData moneySendFlow02 = HugeIconData(0x43de);

  /// IconData for the 'strokeRoundedMoneySendSquare' icon.
  static const IconData moneySendSquare = HugeIconData(0x43df);

  /// IconData for the 'strokeRoundedMonocle01' icon.
  static const IconData monocle01 = HugeIconData(0x43e0);

  /// IconData for the 'strokeRoundedMonocle' icon.
  static const IconData monocle = HugeIconData(0x43e1);

  /// IconData for the 'strokeRoundedMonster' icon.
  static const IconData monster = HugeIconData(0x43e2);

  /// IconData for the 'strokeRoundedMoon01' icon.
  static const IconData moon01 = HugeIconData(0x43e3);

  /// IconData for the 'strokeRoundedMoon02' icon.
  static const IconData moon02 = HugeIconData(0x43e4);

  /// IconData for the 'strokeRoundedMoonAngledRainZap' icon.
  static const IconData moonAngledRainZap = HugeIconData(0x43e5);

  /// IconData for the 'strokeRoundedMoonCloudAngledRain' icon.
  static const IconData moonCloudAngledRain = HugeIconData(0x43e6);

  /// IconData for the 'strokeRoundedMoonCloudAngledZap' icon.
  static const IconData moonCloudAngledZap = HugeIconData(0x43e7);

  /// IconData for the 'strokeRoundedMoonCloudBigRain' icon.
  static const IconData moonCloudBigRain = HugeIconData(0x43e8);

  /// IconData for the 'strokeRoundedMoonCloudFastWind' icon.
  static const IconData moonCloudFastWind = HugeIconData(0x43e9);

  /// IconData for the 'strokeRoundedMoonCloudHailstone' icon.
  static const IconData moonCloudHailstone = HugeIconData(0x43ea);

  /// IconData for the 'strokeRoundedMoonCloudLittleRain' icon.
  static const IconData moonCloudLittleRain = HugeIconData(0x43eb);

  /// IconData for the 'strokeRoundedMoonCloudLittleSnow' icon.
  static const IconData moonCloudLittleSnow = HugeIconData(0x43ec);

  /// IconData for the 'strokeRoundedMoonCloudMidRain' icon.
  static const IconData moonCloudMidRain = HugeIconData(0x43ed);

  /// IconData for the 'strokeRoundedMoonCloudMidSnow' icon.
  static const IconData moonCloudMidSnow = HugeIconData(0x43ee);

  /// IconData for the 'strokeRoundedMoonCloudSlowWind' icon.
  static const IconData moonCloudSlowWind = HugeIconData(0x43ef);

  /// IconData for the 'strokeRoundedMoonCloudSnow' icon.
  static const IconData moonCloudSnow = HugeIconData(0x43f0);

  /// IconData for the 'strokeRoundedMoonCloud' icon.
  static const IconData moonCloud = HugeIconData(0x43f1);

  /// IconData for the 'strokeRoundedMoonEclipse' icon.
  static const IconData moonEclipse = HugeIconData(0x43f2);

  /// IconData for the 'strokeRoundedMoonFastWind' icon.
  static const IconData moonFastWind = HugeIconData(0x43f3);

  /// IconData for the 'strokeRoundedMoonLanding' icon.
  static const IconData moonLanding = HugeIconData(0x43f4);

  /// IconData for the 'strokeRoundedMoonSlowWind' icon.
  static const IconData moonSlowWind = HugeIconData(0x43f5);

  /// IconData for the 'strokeRoundedMoon' icon.
  static const IconData moon = HugeIconData(0x43f6);

  /// IconData for the 'strokeRoundedMoonset' icon.
  static const IconData moonset = HugeIconData(0x43f7);

  /// IconData for the 'strokeRoundedMore01' icon.
  static const IconData more01 = HugeIconData(0x43f8);

  /// IconData for the 'strokeRoundedMore02' icon.
  static const IconData more02 = HugeIconData(0x43f9);

  /// IconData for the 'strokeRoundedMore03' icon.
  static const IconData more03 = HugeIconData(0x43fa);

  /// IconData for the 'strokeRoundedMoreHorizontalCircle01' icon.
  static const IconData moreHorizontalCircle01 = HugeIconData(0x43fb);

  /// IconData for the 'strokeRoundedMoreHorizontalCircle02' icon.
  static const IconData moreHorizontalCircle02 = HugeIconData(0x43fc);

  /// IconData for the 'strokeRoundedMoreHorizontalSquare01' icon.
  static const IconData moreHorizontalSquare01 = HugeIconData(0x43fd);

  /// IconData for the 'strokeRoundedMoreHorizontalSquare02' icon.
  static const IconData moreHorizontalSquare02 = HugeIconData(0x43fe);

  /// IconData for the 'strokeRoundedMoreHorizontal' icon.
  static const IconData moreHorizontal = HugeIconData(0x43ff);

  /// IconData for the 'strokeRoundedMoreOrLessCircle' icon.
  static const IconData moreOrLessCircle = HugeIconData(0x4400);

  /// IconData for the 'strokeRoundedMoreOrLessSquare' icon.
  static const IconData moreOrLessSquare = HugeIconData(0x4401);

  /// IconData for the 'strokeRoundedMoreOrLess' icon.
  static const IconData moreOrLess = HugeIconData(0x4402);

  /// IconData for the 'strokeRoundedMoreVerticalCircle01' icon.
  static const IconData moreVerticalCircle01 = HugeIconData(0x4403);

  /// IconData for the 'strokeRoundedMoreVerticalCircle02' icon.
  static const IconData moreVerticalCircle02 = HugeIconData(0x4404);

  /// IconData for the 'strokeRoundedMoreVerticalSquare01' icon.
  static const IconData moreVerticalSquare01 = HugeIconData(0x4405);

  /// IconData for the 'strokeRoundedMoreVerticalSquare02' icon.
  static const IconData moreVerticalSquare02 = HugeIconData(0x4406);

  /// IconData for the 'strokeRoundedMoreVertical' icon.
  static const IconData moreVertical = HugeIconData(0x4407);

  /// IconData for the 'strokeRoundedMore' icon.
  static const IconData more = HugeIconData(0x4408);

  /// IconData for the 'strokeRoundedMortar' icon.
  static const IconData mortar = HugeIconData(0x4409);

  /// IconData for the 'strokeRoundedMortarboard01' icon.
  static const IconData mortarboard01 = HugeIconData(0x440a);

  /// IconData for the 'strokeRoundedMortarboard02' icon.
  static const IconData mortarboard02 = HugeIconData(0x440b);

  /// IconData for the 'strokeRoundedMosque01' icon.
  static const IconData mosque01 = HugeIconData(0x440c);

  /// IconData for the 'strokeRoundedMosque02' icon.
  static const IconData mosque02 = HugeIconData(0x440d);

  /// IconData for the 'strokeRoundedMosque03' icon.
  static const IconData mosque03 = HugeIconData(0x440e);

  /// IconData for the 'strokeRoundedMosque04' icon.
  static const IconData mosque04 = HugeIconData(0x440f);

  /// IconData for the 'strokeRoundedMosque05' icon.
  static const IconData mosque05 = HugeIconData(0x4410);

  /// IconData for the 'strokeRoundedMosqueLocation' icon.
  static const IconData mosqueLocation = HugeIconData(0x4411);

  /// IconData for the 'strokeRoundedMotion01' icon.
  static const IconData motion01 = HugeIconData(0x4412);

  /// IconData for the 'strokeRoundedMotion02' icon.
  static const IconData motion02 = HugeIconData(0x4413);

  /// IconData for the 'strokeRoundedMotorbike01' icon.
  static const IconData motorbike01 = HugeIconData(0x4414);

  /// IconData for the 'strokeRoundedMotorbike02' icon.
  static const IconData motorbike02 = HugeIconData(0x4415);

  /// IconData for the 'strokeRoundedMountain' icon.
  static const IconData mountain = HugeIconData(0x4416);

  /// IconData for the 'strokeRoundedMouse01' icon.
  static const IconData mouse01 = HugeIconData(0x4417);

  /// IconData for the 'strokeRoundedMouse02' icon.
  static const IconData mouse02 = HugeIconData(0x4418);

  /// IconData for the 'strokeRoundedMouse03' icon.
  static const IconData mouse03 = HugeIconData(0x4419);

  /// IconData for the 'strokeRoundedMouse04' icon.
  static const IconData mouse04 = HugeIconData(0x441a);

  /// IconData for the 'strokeRoundedMouse05' icon.
  static const IconData mouse05 = HugeIconData(0x441b);

  /// IconData for the 'strokeRoundedMouse06' icon.
  static const IconData mouse06 = HugeIconData(0x441c);

  /// IconData for the 'strokeRoundedMouse07' icon.
  static const IconData mouse07 = HugeIconData(0x441d);

  /// IconData for the 'strokeRoundedMouse08' icon.
  static const IconData mouse08 = HugeIconData(0x441e);

  /// IconData for the 'strokeRoundedMouse09' icon.
  static const IconData mouse09 = HugeIconData(0x441f);

  /// IconData for the 'strokeRoundedMouse10' icon.
  static const IconData mouse10 = HugeIconData(0x4420);

  /// IconData for the 'strokeRoundedMouse11' icon.
  static const IconData mouse11 = HugeIconData(0x4421);

  /// IconData for the 'strokeRoundedMouse12' icon.
  static const IconData mouse12 = HugeIconData(0x4422);

  /// IconData for the 'strokeRoundedMouse13' icon.
  static const IconData mouse13 = HugeIconData(0x4423);

  /// IconData for the 'strokeRoundedMouse14' icon.
  static const IconData mouse14 = HugeIconData(0x4424);

  /// IconData for the 'strokeRoundedMouse15' icon.
  static const IconData mouse15 = HugeIconData(0x4425);

  /// IconData for the 'strokeRoundedMouse16' icon.
  static const IconData mouse16 = HugeIconData(0x4426);

  /// IconData for the 'strokeRoundedMouse17' icon.
  static const IconData mouse17 = HugeIconData(0x4427);

  /// IconData for the 'strokeRoundedMouse18' icon.
  static const IconData mouse18 = HugeIconData(0x4428);

  /// IconData for the 'strokeRoundedMouse19' icon.
  static const IconData mouse19 = HugeIconData(0x4429);

  /// IconData for the 'strokeRoundedMouse20' icon.
  static const IconData mouse20 = HugeIconData(0x442a);

  /// IconData for the 'strokeRoundedMouse21' icon.
  static const IconData mouse21 = HugeIconData(0x442b);

  /// IconData for the 'strokeRoundedMouse22' icon.
  static const IconData mouse22 = HugeIconData(0x442c);

  /// IconData for the 'strokeRoundedMouse23' icon.
  static const IconData mouse23 = HugeIconData(0x442d);

  /// IconData for the 'strokeRoundedMouseLeftClick01' icon.
  static const IconData mouseLeftClick01 = HugeIconData(0x442e);

  /// IconData for the 'strokeRoundedMouseLeftClick02' icon.
  static const IconData mouseLeftClick02 = HugeIconData(0x442f);

  /// IconData for the 'strokeRoundedMouseLeftClick03' icon.
  static const IconData mouseLeftClick03 = HugeIconData(0x4430);

  /// IconData for the 'strokeRoundedMouseLeftClick04' icon.
  static const IconData mouseLeftClick04 = HugeIconData(0x4431);

  /// IconData for the 'strokeRoundedMouseLeftClick05' icon.
  static const IconData mouseLeftClick05 = HugeIconData(0x4432);

  /// IconData for the 'strokeRoundedMouseLeftClick06' icon.
  static const IconData mouseLeftClick06 = HugeIconData(0x4433);

  /// IconData for the 'strokeRoundedMouseRightClick01' icon.
  static const IconData mouseRightClick01 = HugeIconData(0x4434);

  /// IconData for the 'strokeRoundedMouseRightClick02' icon.
  static const IconData mouseRightClick02 = HugeIconData(0x4435);

  /// IconData for the 'strokeRoundedMouseRightClick03' icon.
  static const IconData mouseRightClick03 = HugeIconData(0x4436);

  /// IconData for the 'strokeRoundedMouseRightClick04' icon.
  static const IconData mouseRightClick04 = HugeIconData(0x4437);

  /// IconData for the 'strokeRoundedMouseRightClick05' icon.
  static const IconData mouseRightClick05 = HugeIconData(0x4438);

  /// IconData for the 'strokeRoundedMouseRightClick06' icon.
  static const IconData mouseRightClick06 = HugeIconData(0x4439);

  /// IconData for the 'strokeRoundedMouseScroll01' icon.
  static const IconData mouseScroll01 = HugeIconData(0x443a);

  /// IconData for the 'strokeRoundedMouseScroll02' icon.
  static const IconData mouseScroll02 = HugeIconData(0x443b);

  /// IconData for the 'strokeRoundedMove01' icon.
  static const IconData move01 = HugeIconData(0x443c);

  /// IconData for the 'strokeRoundedMove02' icon.
  static const IconData move02 = HugeIconData(0x443d);

  /// IconData for the 'strokeRoundedMoveBottom' icon.
  static const IconData moveBottom = HugeIconData(0x443e);

  /// IconData for the 'strokeRoundedMoveLeft' icon.
  static const IconData moveLeft = HugeIconData(0x443f);

  /// IconData for the 'strokeRoundedMoveRight' icon.
  static const IconData moveRight = HugeIconData(0x4440);

  /// IconData for the 'strokeRoundedMoveTo' icon.
  static const IconData moveTo = HugeIconData(0x4441);

  /// IconData for the 'strokeRoundedMoveTop' icon.
  static const IconData moveTop = HugeIconData(0x4442);

  /// IconData for the 'strokeRoundedMove' icon.
  static const IconData move = HugeIconData(0x4443);

  /// IconData for the 'strokeRoundedMp301' icon.
  static const IconData mp301 = HugeIconData(0x4444);

  /// IconData for the 'strokeRoundedMp302' icon.
  static const IconData mp302 = HugeIconData(0x4445);

  /// IconData for the 'strokeRoundedMp401' icon.
  static const IconData mp401 = HugeIconData(0x4446);

  /// IconData for the 'strokeRoundedMp402' icon.
  static const IconData mp402 = HugeIconData(0x4447);

  /// IconData for the 'strokeRoundedMuhammad' icon.
  static const IconData muhammad = HugeIconData(0x4448);

  /// IconData for the 'strokeRoundedMultiplicationSignCircle' icon.
  static const IconData multiplicationSignCircle = HugeIconData(0x4449);

  /// IconData for the 'strokeRoundedMultiplicationSignSquare' icon.
  static const IconData multiplicationSignSquare = HugeIconData(0x444a);

  /// IconData for the 'strokeRoundedMultiplicationSign' icon.
  static const IconData multiplicationSign = HugeIconData(0x444b);

  /// IconData for the 'strokeRoundedMushroom01' icon.
  static const IconData mushroom01 = HugeIconData(0x444c);

  /// IconData for the 'strokeRoundedMushroom' icon.
  static const IconData mushroom = HugeIconData(0x444d);

  /// IconData for the 'strokeRoundedMusicNote01' icon.
  static const IconData musicNote01 = HugeIconData(0x444e);

  /// IconData for the 'strokeRoundedMusicNote02' icon.
  static const IconData musicNote02 = HugeIconData(0x444f);

  /// IconData for the 'strokeRoundedMusicNote03' icon.
  static const IconData musicNote03 = HugeIconData(0x4450);

  /// IconData for the 'strokeRoundedMusicNote04' icon.
  static const IconData musicNote04 = HugeIconData(0x4451);

  /// IconData for the 'strokeRoundedMusicNoteSquare01' icon.
  static const IconData musicNoteSquare01 = HugeIconData(0x4452);

  /// IconData for the 'strokeRoundedMusicNoteSquare02' icon.
  static const IconData musicNoteSquare02 = HugeIconData(0x4453);

  /// IconData for the 'strokeRoundedMuslim' icon.
  static const IconData muslim = HugeIconData(0x4454);

  /// IconData for the 'strokeRoundedMute' icon.
  static const IconData mute = HugeIconData(0x4455);

  /// IconData for the 'strokeRoundedMymind' icon.
  static const IconData mymind = HugeIconData(0x4456);

  /// IconData for the 'strokeRoundedNThRootCircle' icon.
  static const IconData nThRootCircle = HugeIconData(0x4457);

  /// IconData for the 'strokeRoundedNThRootSquare' icon.
  static const IconData nThRootSquare = HugeIconData(0x4458);

  /// IconData for the 'strokeRoundedNThRoot' icon.
  static const IconData nThRoot = HugeIconData(0x4459);

  /// IconData for the 'strokeRoundedNanoTechnology' icon.
  static const IconData nanoTechnology = HugeIconData(0x445a);

  /// IconData for the 'strokeRoundedNaturalFood' icon.
  static const IconData naturalFood = HugeIconData(0x445b);

  /// IconData for the 'strokeRoundedNavigation01' icon.
  static const IconData navigation01 = HugeIconData(0x445c);

  /// IconData for the 'strokeRoundedNavigation02' icon.
  static const IconData navigation02 = HugeIconData(0x445d);

  /// IconData for the 'strokeRoundedNavigation03' icon.
  static const IconData navigation03 = HugeIconData(0x445e);

  /// IconData for the 'strokeRoundedNavigation04' icon.
  static const IconData navigation04 = HugeIconData(0x445f);

  /// IconData for the 'strokeRoundedNavigator01' icon.
  static const IconData navigator01 = HugeIconData(0x4460);

  /// IconData for the 'strokeRoundedNavigator02' icon.
  static const IconData navigator02 = HugeIconData(0x4461);

  /// IconData for the 'strokeRoundedNecklace' icon.
  static const IconData necklace = HugeIconData(0x4462);

  /// IconData for the 'strokeRoundedNerd' icon.
  static const IconData nerd = HugeIconData(0x4463);

  /// IconData for the 'strokeRoundedNeuralNetwork' icon.
  static const IconData neuralNetwork = HugeIconData(0x4464);

  /// IconData for the 'strokeRoundedNeutral' icon.
  static const IconData neutral = HugeIconData(0x4465);

  /// IconData for the 'strokeRoundedNewJob' icon.
  static const IconData newJob = HugeIconData(0x4466);

  /// IconData for the 'strokeRoundedNewOffice' icon.
  static const IconData newOffice = HugeIconData(0x4467);

  /// IconData for the 'strokeRoundedNewReleases' icon.
  static const IconData newReleases = HugeIconData(0x4468);

  /// IconData for the 'strokeRoundedNewTwitterEllipse' icon.
  static const IconData newTwitterEllipse = HugeIconData(0x4469);

  /// IconData for the 'strokeRoundedNewTwitterRectangle' icon.
  static const IconData newTwitterRectangle = HugeIconData(0x446a);

  /// IconData for the 'strokeRoundedNewTwitter' icon.
  static const IconData newTwitter = HugeIconData(0x446b);

  /// IconData for the 'strokeRoundedNews01' icon.
  static const IconData news01 = HugeIconData(0x446c);

  /// IconData for the 'strokeRoundedNews' icon.
  static const IconData news = HugeIconData(0x446d);

  /// IconData for the 'strokeRoundedNext' icon.
  static const IconData next = HugeIconData(0x446e);

  /// IconData for the 'strokeRoundedNike' icon.
  static const IconData nike = HugeIconData(0x446f);

  /// IconData for the 'strokeRoundedNintendoSwitch' icon.
  static const IconData nintendoSwitch = HugeIconData(0x4470);

  /// IconData for the 'strokeRoundedNintendo' icon.
  static const IconData nintendo = HugeIconData(0x4471);

  /// IconData for the 'strokeRoundedNiqab' icon.
  static const IconData niqab = HugeIconData(0x4472);

  /// IconData for the 'strokeRoundedNoInternet' icon.
  static const IconData noInternet = HugeIconData(0x4473);

  /// IconData for the 'strokeRoundedNoMeetingRoom' icon.
  static const IconData noMeetingRoom = HugeIconData(0x4474);

  /// IconData for the 'strokeRoundedNodeAdd' icon.
  static const IconData nodeAdd = HugeIconData(0x4475);

  /// IconData for the 'strokeRoundedNodeEdit' icon.
  static const IconData nodeEdit = HugeIconData(0x4476);

  /// IconData for the 'strokeRoundedNodeMoveDown' icon.
  static const IconData nodeMoveDown = HugeIconData(0x4477);

  /// IconData for the 'strokeRoundedNodeMoveUp' icon.
  static const IconData nodeMoveUp = HugeIconData(0x4478);

  /// IconData for the 'strokeRoundedNodeRemove' icon.
  static const IconData nodeRemove = HugeIconData(0x4479);

  /// IconData for the 'strokeRoundedNoodles' icon.
  static const IconData noodles = HugeIconData(0x447a);

  /// IconData for the 'strokeRoundedNose' icon.
  static const IconData nose = HugeIconData(0x447b);

  /// IconData for the 'strokeRoundedNotEqualSignCircle' icon.
  static const IconData notEqualSignCircle = HugeIconData(0x447c);

  /// IconData for the 'strokeRoundedNotEqualSignSquare' icon.
  static const IconData notEqualSignSquare = HugeIconData(0x447d);

  /// IconData for the 'strokeRoundedNotEqualSign' icon.
  static const IconData notEqualSign = HugeIconData(0x447e);

  /// IconData for the 'strokeRoundedNote01' icon.
  static const IconData note01 = HugeIconData(0x447f);

  /// IconData for the 'strokeRoundedNote02' icon.
  static const IconData note02 = HugeIconData(0x4480);

  /// IconData for the 'strokeRoundedNote03' icon.
  static const IconData note03 = HugeIconData(0x4481);

  /// IconData for the 'strokeRoundedNote04' icon.
  static const IconData note04 = HugeIconData(0x4482);

  /// IconData for the 'strokeRoundedNote05' icon.
  static const IconData note05 = HugeIconData(0x4483);

  /// IconData for the 'strokeRoundedNoteAdd' icon.
  static const IconData noteAdd = HugeIconData(0x4484);

  /// IconData for the 'strokeRoundedNoteDone' icon.
  static const IconData noteDone = HugeIconData(0x4485);

  /// IconData for the 'strokeRoundedNoteEdit' icon.
  static const IconData noteEdit = HugeIconData(0x4486);

  /// IconData for the 'strokeRoundedNoteRemove' icon.
  static const IconData noteRemove = HugeIconData(0x4487);

  /// IconData for the 'strokeRoundedNote' icon.
  static const IconData note = HugeIconData(0x4488);

  /// IconData for the 'strokeRoundedNotebook01' icon.
  static const IconData notebook01 = HugeIconData(0x4489);

  /// IconData for the 'strokeRoundedNotebook02' icon.
  static const IconData notebook02 = HugeIconData(0x448a);

  /// IconData for the 'strokeRoundedNotebook' icon.
  static const IconData notebook = HugeIconData(0x448b);

  /// IconData for the 'strokeRoundedNotification01' icon.
  static const IconData notification01 = HugeIconData(0x448c);

  /// IconData for the 'strokeRoundedNotification02' icon.
  static const IconData notification02 = HugeIconData(0x448d);

  /// IconData for the 'strokeRoundedNotification03' icon.
  static const IconData notification03 = HugeIconData(0x448e);

  /// IconData for the 'strokeRoundedNotificationBlock01' icon.
  static const IconData notificationBlock01 = HugeIconData(0x448f);

  /// IconData for the 'strokeRoundedNotificationBlock02' icon.
  static const IconData notificationBlock02 = HugeIconData(0x4490);

  /// IconData for the 'strokeRoundedNotificationBlock03' icon.
  static const IconData notificationBlock03 = HugeIconData(0x4491);

  /// IconData for the 'strokeRoundedNotificationBubble' icon.
  static const IconData notificationBubble = HugeIconData(0x4492);

  /// IconData for the 'strokeRoundedNotificationCircle' icon.
  static const IconData notificationCircle = HugeIconData(0x4493);

  /// IconData for the 'strokeRoundedNotificationOff01' icon.
  static const IconData notificationOff01 = HugeIconData(0x4494);

  /// IconData for the 'strokeRoundedNotificationOff02' icon.
  static const IconData notificationOff02 = HugeIconData(0x4495);

  /// IconData for the 'strokeRoundedNotificationOff03' icon.
  static const IconData notificationOff03 = HugeIconData(0x4496);

  /// IconData for the 'strokeRoundedNotificationSnooze01' icon.
  static const IconData notificationSnooze01 = HugeIconData(0x4497);

  /// IconData for the 'strokeRoundedNotificationSnooze02' icon.
  static const IconData notificationSnooze02 = HugeIconData(0x4498);

  /// IconData for the 'strokeRoundedNotificationSnooze03' icon.
  static const IconData notificationSnooze03 = HugeIconData(0x4499);

  /// IconData for the 'strokeRoundedNotificationSquare' icon.
  static const IconData notificationSquare = HugeIconData(0x449a);

  /// IconData for the 'strokeRoundedNotion01' icon.
  static const IconData notion01 = HugeIconData(0x449b);

  /// IconData for the 'strokeRoundedNotion02' icon.
  static const IconData notion02 = HugeIconData(0x449c);

  /// IconData for the 'strokeRoundedNpm' icon.
  static const IconData npm = HugeIconData(0x449d);

  /// IconData for the 'strokeRoundedNuclearPower' icon.
  static const IconData nuclearPower = HugeIconData(0x449e);

  /// IconData for the 'strokeRoundedNut' icon.
  static const IconData nut = HugeIconData(0x449f);

  /// IconData for the 'strokeRoundedObtuse' icon.
  static const IconData obtuse = HugeIconData(0x44a0);

  /// IconData for the 'strokeRoundedOctagon' icon.
  static const IconData octagon = HugeIconData(0x44a1);

  /// IconData for the 'strokeRoundedOctopus' icon.
  static const IconData octopus = HugeIconData(0x44a2);

  /// IconData for the 'strokeRoundedOffice365' icon.
  static const IconData office365 = HugeIconData(0x44a3);

  /// IconData for the 'strokeRoundedOfficeChair' icon.
  static const IconData officeChair = HugeIconData(0x44a4);

  /// IconData for the 'strokeRoundedOffice' icon.
  static const IconData office = HugeIconData(0x44a5);

  /// IconData for the 'strokeRoundedOilBarrel' icon.
  static const IconData oilBarrel = HugeIconData(0x44a6);

  /// IconData for the 'strokeRoundedOkFinger' icon.
  static const IconData okFinger = HugeIconData(0x44a7);

  /// IconData for the 'strokeRoundedOlympicTorch' icon.
  static const IconData olympicTorch = HugeIconData(0x44a8);

  /// IconData for the 'strokeRoundedOnlineLearning01' icon.
  static const IconData onlineLearning01 = HugeIconData(0x44a9);

  /// IconData for the 'strokeRoundedOnlineLearning02' icon.
  static const IconData onlineLearning02 = HugeIconData(0x44aa);

  /// IconData for the 'strokeRoundedOnlineLearning03' icon.
  static const IconData onlineLearning03 = HugeIconData(0x44ab);

  /// IconData for the 'strokeRoundedOnlineLearning04' icon.
  static const IconData onlineLearning04 = HugeIconData(0x44ac);

  /// IconData for the 'strokeRoundedOpenCaption' icon.
  static const IconData openCaption = HugeIconData(0x44ad);

  /// IconData for the 'strokeRoundedOption' icon.
  static const IconData option = HugeIconData(0x44ae);

  /// IconData for the 'strokeRoundedOrange' icon.
  static const IconData orange = HugeIconData(0x44af);

  /// IconData for the 'strokeRoundedOrbit01' icon.
  static const IconData orbit01 = HugeIconData(0x44b0);

  /// IconData for the 'strokeRoundedOrbit02' icon.
  static const IconData orbit02 = HugeIconData(0x44b1);

  /// IconData for the 'strokeRoundedOrganicFood' icon.
  static const IconData organicFood = HugeIconData(0x44b2);

  /// IconData for the 'strokeRoundedOrthogonalEdge' icon.
  static const IconData orthogonalEdge = HugeIconData(0x44b3);

  /// IconData for the 'strokeRoundedOval' icon.
  static const IconData oval = HugeIconData(0x44b4);

  /// IconData for the 'strokeRoundedOven' icon.
  static const IconData oven = HugeIconData(0x44b5);

  /// IconData for the 'strokeRoundedPackageAdd' icon.
  static const IconData packageAdd = HugeIconData(0x44b6);

  /// IconData for the 'strokeRoundedPackageDelivered' icon.
  static const IconData packageDelivered = HugeIconData(0x44b7);

  /// IconData for the 'strokeRoundedPackageMoving' icon.
  static const IconData packageMoving = HugeIconData(0x44b8);

  /// IconData for the 'strokeRoundedPackageOpen' icon.
  static const IconData packageOpen = HugeIconData(0x44b9);

  /// IconData for the 'strokeRoundedPackageOutOfStock' icon.
  static const IconData packageOutOfStock = HugeIconData(0x44ba);

  /// IconData for the 'strokeRoundedPackageProcess' icon.
  static const IconData packageProcess = HugeIconData(0x44bb);

  /// IconData for the 'strokeRoundedPackageReceive' icon.
  static const IconData packageReceive = HugeIconData(0x44bc);

  /// IconData for the 'strokeRoundedPackageRemove' icon.
  static const IconData packageRemove = HugeIconData(0x44bd);

  /// IconData for the 'strokeRoundedPackageSearch' icon.
  static const IconData packageSearch = HugeIconData(0x44be);

  /// IconData for the 'strokeRoundedPackageSent' icon.
  static const IconData packageSent = HugeIconData(0x44bf);

  /// IconData for the 'strokeRoundedPackage' icon.
  static const IconData package = HugeIconData(0x44c0);

  /// IconData for the 'strokeRoundedPacman01' icon.
  static const IconData pacman01 = HugeIconData(0x44c1);

  /// IconData for the 'strokeRoundedPacman02' icon.
  static const IconData pacman02 = HugeIconData(0x44c2);

  /// IconData for the 'strokeRoundedPaintBoard' icon.
  static const IconData paintBoard = HugeIconData(0x44c3);

  /// IconData for the 'strokeRoundedPaintBrush01' icon.
  static const IconData paintBrush01 = HugeIconData(0x44c4);

  /// IconData for the 'strokeRoundedPaintBrush02' icon.
  static const IconData paintBrush02 = HugeIconData(0x44c5);

  /// IconData for the 'strokeRoundedPaintBrush03' icon.
  static const IconData paintBrush03 = HugeIconData(0x44c6);

  /// IconData for the 'strokeRoundedPaintBrush04' icon.
  static const IconData paintBrush04 = HugeIconData(0x44c7);

  /// IconData for the 'strokeRoundedPaintBucket' icon.
  static const IconData paintBucket = HugeIconData(0x44c8);

  /// IconData for the 'strokeRoundedPan01' icon.
  static const IconData pan01 = HugeIconData(0x44c9);

  /// IconData for the 'strokeRoundedPan02' icon.
  static const IconData pan02 = HugeIconData(0x44ca);

  /// IconData for the 'strokeRoundedPan03' icon.
  static const IconData pan03 = HugeIconData(0x44cb);

  /// IconData for the 'strokeRoundedParabola01' icon.
  static const IconData parabola01 = HugeIconData(0x44cc);

  /// IconData for the 'strokeRoundedParabola02' icon.
  static const IconData parabola02 = HugeIconData(0x44cd);

  /// IconData for the 'strokeRoundedParabola03' icon.
  static const IconData parabola03 = HugeIconData(0x44ce);

  /// IconData for the 'strokeRoundedParagliding' icon.
  static const IconData paragliding = HugeIconData(0x44cf);

  /// IconData for the 'strokeRoundedParagraphBulletsPoint01' icon.
  static const IconData paragraphBulletsPoint01 = HugeIconData(0x44d0);

  /// IconData for the 'strokeRoundedParagraphBulletsPoint02' icon.
  static const IconData paragraphBulletsPoint02 = HugeIconData(0x44d1);

  /// IconData for the 'strokeRoundedParagraphSpacing' icon.
  static const IconData paragraphSpacing = HugeIconData(0x44d2);

  /// IconData for the 'strokeRoundedParagraph' icon.
  static const IconData paragraph = HugeIconData(0x44d3);

  /// IconData for the 'strokeRoundedParallelogram' icon.
  static const IconData parallelogram = HugeIconData(0x44d4);

  /// IconData for the 'strokeRoundedParkingAreaCircle' icon.
  static const IconData parkingAreaCircle = HugeIconData(0x44d5);

  /// IconData for the 'strokeRoundedParkingAreaSquare' icon.
  static const IconData parkingAreaSquare = HugeIconData(0x44d6);

  /// IconData for the 'strokeRoundedPassport01' icon.
  static const IconData passport01 = HugeIconData(0x44d7);

  /// IconData for the 'strokeRoundedPassportExpired' icon.
  static const IconData passportExpired = HugeIconData(0x44d8);

  /// IconData for the 'strokeRoundedPassportValid' icon.
  static const IconData passportValid = HugeIconData(0x44d9);

  /// IconData for the 'strokeRoundedPassport' icon.
  static const IconData passport = HugeIconData(0x44da);

  /// IconData for the 'strokeRoundedPasswordValidation' icon.
  static const IconData passwordValidation = HugeIconData(0x44db);

  /// IconData for the 'strokeRoundedPath' icon.
  static const IconData path = HugeIconData(0x44dc);

  /// IconData for the 'strokeRoundedPathfinderCrop' icon.
  static const IconData pathfinderCrop = HugeIconData(0x44dd);

  /// IconData for the 'strokeRoundedPathfinderDivide' icon.
  static const IconData pathfinderDivide = HugeIconData(0x44de);

  /// IconData for the 'strokeRoundedPathfinderExclude' icon.
  static const IconData pathfinderExclude = HugeIconData(0x44df);

  /// IconData for the 'strokeRoundedPathfinderIntersect' icon.
  static const IconData pathfinderIntersect = HugeIconData(0x44e0);

  /// IconData for the 'strokeRoundedPathfinderMerge' icon.
  static const IconData pathfinderMerge = HugeIconData(0x44e1);

  /// IconData for the 'strokeRoundedPathfinderMinusBack' icon.
  static const IconData pathfinderMinusBack = HugeIconData(0x44e2);

  /// IconData for the 'strokeRoundedPathfinderMinusFront' icon.
  static const IconData pathfinderMinusFront = HugeIconData(0x44e3);

  /// IconData for the 'strokeRoundedPathfinderOutline' icon.
  static const IconData pathfinderOutline = HugeIconData(0x44e4);

  /// IconData for the 'strokeRoundedPathfinderTrim' icon.
  static const IconData pathfinderTrim = HugeIconData(0x44e5);

  /// IconData for the 'strokeRoundedPathfinderUnite' icon.
  static const IconData pathfinderUnite = HugeIconData(0x44e6);

  /// IconData for the 'strokeRoundedPatient' icon.
  static const IconData patient = HugeIconData(0x44e7);

  /// IconData for the 'strokeRoundedPatio' icon.
  static const IconData patio = HugeIconData(0x44e8);

  /// IconData for the 'strokeRoundedPause' icon.
  static const IconData pause = HugeIconData(0x44e9);

  /// IconData for the 'strokeRoundedPavilon' icon.
  static const IconData pavilon = HugeIconData(0x44ea);

  /// IconData for the 'strokeRoundedPayByCheck' icon.
  static const IconData payByCheck = HugeIconData(0x44eb);

  /// IconData for the 'strokeRoundedPayment01' icon.
  static const IconData payment01 = HugeIconData(0x44ec);

  /// IconData for the 'strokeRoundedPayment02' icon.
  static const IconData payment02 = HugeIconData(0x44ed);

  /// IconData for the 'strokeRoundedPaymentSuccess01' icon.
  static const IconData paymentSuccess01 = HugeIconData(0x44ee);

  /// IconData for the 'strokeRoundedPaymentSuccess02' icon.
  static const IconData paymentSuccess02 = HugeIconData(0x44ef);

  /// IconData for the 'strokeRoundedPayoneer' icon.
  static const IconData payoneer = HugeIconData(0x44f0);

  /// IconData for the 'strokeRoundedPaypal' icon.
  static const IconData paypal = HugeIconData(0x44f1);

  /// IconData for the 'strokeRoundedPdf01' icon.
  static const IconData pdf01 = HugeIconData(0x44f2);

  /// IconData for the 'strokeRoundedPdf02' icon.
  static const IconData pdf02 = HugeIconData(0x44f3);

  /// IconData for the 'strokeRoundedPeerToPeer01' icon.
  static const IconData peerToPeer01 = HugeIconData(0x44f4);

  /// IconData for the 'strokeRoundedPeerToPeer02' icon.
  static const IconData peerToPeer02 = HugeIconData(0x44f5);

  /// IconData for the 'strokeRoundedPeerToPeer03' icon.
  static const IconData peerToPeer03 = HugeIconData(0x44f6);

  /// IconData for the 'strokeRoundedPenConnectBluetooth' icon.
  static const IconData penConnectBluetooth = HugeIconData(0x44f7);

  /// IconData for the 'strokeRoundedPenConnectUsb' icon.
  static const IconData penConnectUsb = HugeIconData(0x44f8);

  /// IconData for the 'strokeRoundedPenConnectWifi' icon.
  static const IconData penConnectWifi = HugeIconData(0x44f9);

  /// IconData for the 'strokeRoundedPenTool01' icon.
  static const IconData penTool01 = HugeIconData(0x44fa);

  /// IconData for the 'strokeRoundedPenTool02' icon.
  static const IconData penTool02 = HugeIconData(0x44fb);

  /// IconData for the 'strokeRoundedPenTool03' icon.
  static const IconData penTool03 = HugeIconData(0x44fc);

  /// IconData for the 'strokeRoundedPenToolAdd' icon.
  static const IconData penToolAdd = HugeIconData(0x44fd);

  /// IconData for the 'strokeRoundedPenToolMinus' icon.
  static const IconData penToolMinus = HugeIconData(0x44fe);

  /// IconData for the 'strokeRoundedPencilEdit01' icon.
  static const IconData pencilEdit01 = HugeIconData(0x44ff);

  /// IconData for the 'strokeRoundedPencilEdit02' icon.
  static const IconData pencilEdit02 = HugeIconData(0x4500);

  /// IconData for the 'strokeRoundedPencil' icon.
  static const IconData pencil = HugeIconData(0x4501);

  /// IconData for the 'strokeRoundedPendulum' icon.
  static const IconData pendulum = HugeIconData(0x4502);

  /// IconData for the 'strokeRoundedPensive' icon.
  static const IconData pensive = HugeIconData(0x4503);

  /// IconData for the 'strokeRoundedPentagon01' icon.
  static const IconData pentagon01 = HugeIconData(0x4504);

  /// IconData for the 'strokeRoundedPentagon' icon.
  static const IconData pentagon = HugeIconData(0x4505);

  /// IconData for the 'strokeRoundedPercentCircle' icon.
  static const IconData percentCircle = HugeIconData(0x4506);

  /// IconData for the 'strokeRoundedPercentSquare' icon.
  static const IconData percentSquare = HugeIconData(0x4507);

  /// IconData for the 'strokeRoundedPercent' icon.
  static const IconData percent = HugeIconData(0x4508);

  /// IconData for the 'strokeRoundedPerfume' icon.
  static const IconData perfume = HugeIconData(0x4509);

  /// IconData for the 'strokeRoundedPeriscope' icon.
  static const IconData periscope = HugeIconData(0x450a);

  /// IconData for the 'strokeRoundedPermanentJob' icon.
  static const IconData permanentJob = HugeIconData(0x450b);

  /// IconData for the 'strokeRoundedPerspective' icon.
  static const IconData perspective = HugeIconData(0x450c);

  /// IconData for the 'strokeRoundedPexels' icon.
  static const IconData pexels = HugeIconData(0x450d);

  /// IconData for the 'strokeRoundedPhoneOff01' icon.
  static const IconData phoneOff01 = HugeIconData(0x450e);

  /// IconData for the 'strokeRoundedPhoneOff02' icon.
  static const IconData phoneOff02 = HugeIconData(0x450f);

  /// IconData for the 'strokeRoundedPhp' icon.
  static const IconData php = HugeIconData(0x4510);

  /// IconData for the 'strokeRoundedPhysics' icon.
  static const IconData physics = HugeIconData(0x4511);

  /// IconData for the 'strokeRoundedPiCircle' icon.
  static const IconData piCircle = HugeIconData(0x4512);

  /// IconData for the 'strokeRoundedPiSquare' icon.
  static const IconData piSquare = HugeIconData(0x4513);

  /// IconData for the 'strokeRoundedPi' icon.
  static const IconData pi = HugeIconData(0x4514);

  /// IconData for the 'strokeRoundedPicasa' icon.
  static const IconData picasa = HugeIconData(0x4515);

  /// IconData for the 'strokeRoundedPickup01' icon.
  static const IconData pickup01 = HugeIconData(0x4516);

  /// IconData for the 'strokeRoundedPickup02' icon.
  static const IconData pickup02 = HugeIconData(0x4517);

  /// IconData for the 'strokeRoundedPictureInPictureExit' icon.
  static const IconData pictureInPictureExit = HugeIconData(0x4518);

  /// IconData for the 'strokeRoundedPictureInPictureOn' icon.
  static const IconData pictureInPictureOn = HugeIconData(0x4519);

  /// IconData for the 'strokeRoundedPieChartSquare' icon.
  static const IconData pieChartSquare = HugeIconData(0x451a);

  /// IconData for the 'strokeRoundedPieChart' icon.
  static const IconData pieChart = HugeIconData(0x451b);

  /// IconData for the 'strokeRoundedPie' icon.
  static const IconData pie = HugeIconData(0x451c);

  /// IconData for the 'strokeRoundedPiggyBank' icon.
  static const IconData piggyBank = HugeIconData(0x451d);

  /// IconData for the 'strokeRoundedPinCode' icon.
  static const IconData pinCode = HugeIconData(0x451e);

  /// IconData for the 'strokeRoundedPinLocation01' icon.
  static const IconData pinLocation01 = HugeIconData(0x451f);

  /// IconData for the 'strokeRoundedPinLocation02' icon.
  static const IconData pinLocation02 = HugeIconData(0x4520);

  /// IconData for the 'strokeRoundedPinLocation03' icon.
  static const IconData pinLocation03 = HugeIconData(0x4521);

  /// IconData for the 'strokeRoundedPinOff' icon.
  static const IconData pinOff = HugeIconData(0x4522);

  /// IconData for the 'strokeRoundedPin' icon.
  static const IconData pin = HugeIconData(0x4523);

  /// IconData for the 'strokeRoundedPinterest' icon.
  static const IconData pinterest = HugeIconData(0x4524);

  /// IconData for the 'strokeRoundedPipeline' icon.
  static const IconData pipeline = HugeIconData(0x4525);

  /// IconData for the 'strokeRoundedPisaTower' icon.
  static const IconData pisaTower = HugeIconData(0x4526);

  /// IconData for the 'strokeRoundedPizza01' icon.
  static const IconData pizza01 = HugeIconData(0x4527);

  /// IconData for the 'strokeRoundedPizza02' icon.
  static const IconData pizza02 = HugeIconData(0x4528);

  /// IconData for the 'strokeRoundedPizzaCutter' icon.
  static const IconData pizzaCutter = HugeIconData(0x4529);

  /// IconData for the 'strokeRoundedPlane' icon.
  static const IconData plane = HugeIconData(0x452a);

  /// IconData for the 'strokeRoundedPlant01' icon.
  static const IconData plant01 = HugeIconData(0x452b);

  /// IconData for the 'strokeRoundedPlant02' icon.
  static const IconData plant02 = HugeIconData(0x452c);

  /// IconData for the 'strokeRoundedPlant03' icon.
  static const IconData plant03 = HugeIconData(0x452d);

  /// IconData for the 'strokeRoundedPlant04' icon.
  static const IconData plant04 = HugeIconData(0x452e);

  /// IconData for the 'strokeRoundedPlate' icon.
  static const IconData plate = HugeIconData(0x452f);

  /// IconData for the 'strokeRoundedPlaxo' icon.
  static const IconData plaxo = HugeIconData(0x4530);

  /// IconData for the 'strokeRoundedPlayCircle02' icon.
  static const IconData playCircle02 = HugeIconData(0x4531);

  /// IconData for the 'strokeRoundedPlayCircle' icon.
  static const IconData playCircle = HugeIconData(0x4532);

  /// IconData for the 'strokeRoundedPlayListAdd' icon.
  static const IconData playListAdd = HugeIconData(0x4533);

  /// IconData for the 'strokeRoundedPlayListFavourite01' icon.
  static const IconData playListFavourite01 = HugeIconData(0x4534);

  /// IconData for the 'strokeRoundedPlayListFavourite02' icon.
  static const IconData playListFavourite02 = HugeIconData(0x4535);

  /// IconData for the 'strokeRoundedPlayListMinus' icon.
  static const IconData playListMinus = HugeIconData(0x4536);

  /// IconData for the 'strokeRoundedPlayListRemove' icon.
  static const IconData playListRemove = HugeIconData(0x4537);

  /// IconData for the 'strokeRoundedPlayList' icon.
  static const IconData playList = HugeIconData(0x4538);

  /// IconData for the 'strokeRoundedPlaySquare' icon.
  static const IconData playSquare = HugeIconData(0x4539);

  /// IconData for the 'strokeRoundedPlayStore' icon.
  static const IconData playStore = HugeIconData(0x453a);

  /// IconData for the 'strokeRoundedPlay' icon.
  static const IconData play = HugeIconData(0x453b);

  /// IconData for the 'strokeRoundedPlaylist01' icon.
  static const IconData playlist01 = HugeIconData(0x453c);

  /// IconData for the 'strokeRoundedPlaylist02' icon.
  static const IconData playlist02 = HugeIconData(0x453d);

  /// IconData for the 'strokeRoundedPlaylist03' icon.
  static const IconData playlist03 = HugeIconData(0x453e);

  /// IconData for the 'strokeRoundedPlaza' icon.
  static const IconData plaza = HugeIconData(0x453f);

  /// IconData for the 'strokeRoundedPlug01' icon.
  static const IconData plug01 = HugeIconData(0x4540);

  /// IconData for the 'strokeRoundedPlug02' icon.
  static const IconData plug02 = HugeIconData(0x4541);

  /// IconData for the 'strokeRoundedPlugSocket' icon.
  static const IconData plugSocket = HugeIconData(0x4542);

  /// IconData for the 'strokeRoundedPlusMinus01' icon.
  static const IconData plusMinus01 = HugeIconData(0x4543);

  /// IconData for the 'strokeRoundedPlusMinus02' icon.
  static const IconData plusMinus02 = HugeIconData(0x4544);

  /// IconData for the 'strokeRoundedPlusMinusCircle01' icon.
  static const IconData plusMinusCircle01 = HugeIconData(0x4545);

  /// IconData for the 'strokeRoundedPlusMinusCircle02' icon.
  static const IconData plusMinusCircle02 = HugeIconData(0x4546);

  /// IconData for the 'strokeRoundedPlusMinusSquare01' icon.
  static const IconData plusMinusSquare01 = HugeIconData(0x4547);

  /// IconData for the 'strokeRoundedPlusMinusSquare02' icon.
  static const IconData plusMinusSquare02 = HugeIconData(0x4548);

  /// IconData for the 'strokeRoundedPlusMinus' icon.
  static const IconData plusMinus = HugeIconData(0x4549);

  /// IconData for the 'strokeRoundedPlusSignCircle' icon.
  static const IconData plusSignCircle = HugeIconData(0x454a);

  /// IconData for the 'strokeRoundedPlusSignSquare' icon.
  static const IconData plusSignSquare = HugeIconData(0x454b);

  /// IconData for the 'strokeRoundedPlusSign' icon.
  static const IconData plusSign = HugeIconData(0x454c);

  /// IconData for the 'strokeRoundedPng01' icon.
  static const IconData png01 = HugeIconData(0x454d);

  /// IconData for the 'strokeRoundedPng02' icon.
  static const IconData png02 = HugeIconData(0x454e);

  /// IconData for the 'strokeRoundedPodium' icon.
  static const IconData podium = HugeIconData(0x454f);

  /// IconData for the 'strokeRoundedPointingLeft01' icon.
  static const IconData pointingLeft01 = HugeIconData(0x4550);

  /// IconData for the 'strokeRoundedPointingLeft02' icon.
  static const IconData pointingLeft02 = HugeIconData(0x4551);

  /// IconData for the 'strokeRoundedPointingLeft03' icon.
  static const IconData pointingLeft03 = HugeIconData(0x4552);

  /// IconData for the 'strokeRoundedPointingLeft04' icon.
  static const IconData pointingLeft04 = HugeIconData(0x4553);

  /// IconData for the 'strokeRoundedPointingLeft05' icon.
  static const IconData pointingLeft05 = HugeIconData(0x4554);

  /// IconData for the 'strokeRoundedPointingLeft06' icon.
  static const IconData pointingLeft06 = HugeIconData(0x4555);

  /// IconData for the 'strokeRoundedPointingLeft07' icon.
  static const IconData pointingLeft07 = HugeIconData(0x4556);

  /// IconData for the 'strokeRoundedPointingLeft08' icon.
  static const IconData pointingLeft08 = HugeIconData(0x4557);

  /// IconData for the 'strokeRoundedPointingRight01' icon.
  static const IconData pointingRight01 = HugeIconData(0x4558);

  /// IconData for the 'strokeRoundedPointingRight02' icon.
  static const IconData pointingRight02 = HugeIconData(0x4559);

  /// IconData for the 'strokeRoundedPointingRight03' icon.
  static const IconData pointingRight03 = HugeIconData(0x455a);

  /// IconData for the 'strokeRoundedPointingRight04' icon.
  static const IconData pointingRight04 = HugeIconData(0x455b);

  /// IconData for the 'strokeRoundedPointingRight05' icon.
  static const IconData pointingRight05 = HugeIconData(0x455c);

  /// IconData for the 'strokeRoundedPointingRight06' icon.
  static const IconData pointingRight06 = HugeIconData(0x455d);

  /// IconData for the 'strokeRoundedPointingRight07' icon.
  static const IconData pointingRight07 = HugeIconData(0x455e);

  /// IconData for the 'strokeRoundedPointingRight08' icon.
  static const IconData pointingRight08 = HugeIconData(0x455f);

  /// IconData for the 'strokeRoundedPokeball' icon.
  static const IconData pokeball = HugeIconData(0x4560);

  /// IconData for the 'strokeRoundedPokemon' icon.
  static const IconData pokemon = HugeIconData(0x4561);

  /// IconData for the 'strokeRoundedPoliceBadge' icon.
  static const IconData policeBadge = HugeIconData(0x4562);

  /// IconData for the 'strokeRoundedPoliceCap' icon.
  static const IconData policeCap = HugeIconData(0x4563);

  /// IconData for the 'strokeRoundedPoliceCar' icon.
  static const IconData policeCar = HugeIconData(0x4564);

  /// IconData for the 'strokeRoundedPoliceStation' icon.
  static const IconData policeStation = HugeIconData(0x4565);

  /// IconData for the 'strokeRoundedPolicy' icon.
  static const IconData policy = HugeIconData(0x4566);

  /// IconData for the 'strokeRoundedPolygon' icon.
  static const IconData polygon = HugeIconData(0x4567);

  /// IconData for the 'strokeRoundedPoolTable' icon.
  static const IconData poolTable = HugeIconData(0x4568);

  /// IconData for the 'strokeRoundedPool' icon.
  static const IconData pool = HugeIconData(0x4569);

  /// IconData for the 'strokeRoundedPoop' icon.
  static const IconData poop = HugeIconData(0x456a);

  /// IconData for the 'strokeRoundedPopcorn' icon.
  static const IconData popcorn = HugeIconData(0x456b);

  /// IconData for the 'strokeRoundedPot01' icon.
  static const IconData pot01 = HugeIconData(0x456c);

  /// IconData for the 'strokeRoundedPot02' icon.
  static const IconData pot02 = HugeIconData(0x456d);

  /// IconData for the 'strokeRoundedPotion' icon.
  static const IconData potion = HugeIconData(0x456e);

  /// IconData for the 'strokeRoundedPoundCircle' icon.
  static const IconData poundCircle = HugeIconData(0x456f);

  /// IconData for the 'strokeRoundedPoundReceive' icon.
  static const IconData poundReceive = HugeIconData(0x4570);

  /// IconData for the 'strokeRoundedPoundSend' icon.
  static const IconData poundSend = HugeIconData(0x4571);

  /// IconData for the 'strokeRoundedPoundSquare' icon.
  static const IconData poundSquare = HugeIconData(0x4572);

  /// IconData for the 'strokeRoundedPound' icon.
  static const IconData pound = HugeIconData(0x4573);

  /// IconData for the 'strokeRoundedPowerService' icon.
  static const IconData powerService = HugeIconData(0x4574);

  /// IconData for the 'strokeRoundedPowerSocket01' icon.
  static const IconData powerSocket01 = HugeIconData(0x4575);

  /// IconData for the 'strokeRoundedPowerSocket02' icon.
  static const IconData powerSocket02 = HugeIconData(0x4576);

  /// IconData for the 'strokeRoundedPpt01' icon.
  static const IconData ppt01 = HugeIconData(0x4577);

  /// IconData for the 'strokeRoundedPpt02' icon.
  static const IconData ppt02 = HugeIconData(0x4578);

  /// IconData for the 'strokeRoundedPrawn' icon.
  static const IconData prawn = HugeIconData(0x4579);

  /// IconData for the 'strokeRoundedPrayerRug01' icon.
  static const IconData prayerRug01 = HugeIconData(0x457a);

  /// IconData for the 'strokeRoundedPrayerRug02' icon.
  static const IconData prayerRug02 = HugeIconData(0x457b);

  /// IconData for the 'strokeRoundedPreferenceHorizontal' icon.
  static const IconData preferenceHorizontal = HugeIconData(0x457c);

  /// IconData for the 'strokeRoundedPreferenceVertical' icon.
  static const IconData preferenceVertical = HugeIconData(0x457d);

  /// IconData for the 'strokeRoundedPrescription' icon.
  static const IconData prescription = HugeIconData(0x457e);

  /// IconData for the 'strokeRoundedPresentation01' icon.
  static const IconData presentation01 = HugeIconData(0x457f);

  /// IconData for the 'strokeRoundedPresentation02' icon.
  static const IconData presentation02 = HugeIconData(0x4580);

  /// IconData for the 'strokeRoundedPresentation03' icon.
  static const IconData presentation03 = HugeIconData(0x4581);

  /// IconData for the 'strokeRoundedPresentation04' icon.
  static const IconData presentation04 = HugeIconData(0x4582);

  /// IconData for the 'strokeRoundedPresentation05' icon.
  static const IconData presentation05 = HugeIconData(0x4583);

  /// IconData for the 'strokeRoundedPresentation06' icon.
  static const IconData presentation06 = HugeIconData(0x4584);

  /// IconData for the 'strokeRoundedPresentation07' icon.
  static const IconData presentation07 = HugeIconData(0x4585);

  /// IconData for the 'strokeRoundedPresentationBarChart01' icon.
  static const IconData presentationBarChart01 = HugeIconData(0x4586);

  /// IconData for the 'strokeRoundedPresentationBarChart02' icon.
  static const IconData presentationBarChart02 = HugeIconData(0x4587);

  /// IconData for the 'strokeRoundedPresentationLineChart01' icon.
  static const IconData presentationLineChart01 = HugeIconData(0x4588);

  /// IconData for the 'strokeRoundedPresentationLineChart02' icon.
  static const IconData presentationLineChart02 = HugeIconData(0x4589);

  /// IconData for the 'strokeRoundedPresentationOnline' icon.
  static const IconData presentationOnline = HugeIconData(0x458a);

  /// IconData for the 'strokeRoundedPresentationPodium' icon.
  static const IconData presentationPodium = HugeIconData(0x458b);

  /// IconData for the 'strokeRoundedPrevious' icon.
  static const IconData previous = HugeIconData(0x458c);

  /// IconData for the 'strokeRoundedPrinterOff' icon.
  static const IconData printerOff = HugeIconData(0x458d);

  /// IconData for the 'strokeRoundedPrinter' icon.
  static const IconData printer = HugeIconData(0x458e);

  /// IconData for the 'strokeRoundedPrism01' icon.
  static const IconData prism01 = HugeIconData(0x458f);

  /// IconData for the 'strokeRoundedPrism' icon.
  static const IconData prism = HugeIconData(0x4590);

  /// IconData for the 'strokeRoundedPrisonGuard' icon.
  static const IconData prisonGuard = HugeIconData(0x4591);

  /// IconData for the 'strokeRoundedPrison' icon.
  static const IconData prison = HugeIconData(0x4592);

  /// IconData for the 'strokeRoundedPrisoner' icon.
  static const IconData prisoner = HugeIconData(0x4593);

  /// IconData for the 'strokeRoundedProductLoading' icon.
  static const IconData productLoading = HugeIconData(0x4594);

  /// IconData for the 'strokeRoundedProfile02' icon.
  static const IconData profile02 = HugeIconData(0x4595);

  /// IconData for the 'strokeRoundedProfile' icon.
  static const IconData profile = HugeIconData(0x4596);

  /// IconData for the 'strokeRoundedProfit' icon.
  static const IconData profit = HugeIconData(0x4597);

  /// IconData for the 'strokeRoundedProgrammingFlag' icon.
  static const IconData programmingFlag = HugeIconData(0x4598);

  /// IconData for the 'strokeRoundedProjector01' icon.
  static const IconData projector01 = HugeIconData(0x4599);

  /// IconData for the 'strokeRoundedProjector' icon.
  static const IconData projector = HugeIconData(0x459a);

  /// IconData for the 'strokeRoundedPromotion' icon.
  static const IconData promotion = HugeIconData(0x459b);

  /// IconData for the 'strokeRoundedPropertyAdd' icon.
  static const IconData propertyAdd = HugeIconData(0x459c);

  /// IconData for the 'strokeRoundedPropertyDelete' icon.
  static const IconData propertyDelete = HugeIconData(0x459d);

  /// IconData for the 'strokeRoundedPropertyEdit' icon.
  static const IconData propertyEdit = HugeIconData(0x459e);

  /// IconData for the 'strokeRoundedPropertyNew' icon.
  static const IconData propertyNew = HugeIconData(0x459f);

  /// IconData for the 'strokeRoundedPropertySearch' icon.
  static const IconData propertySearch = HugeIconData(0x45a0);

  /// IconData for the 'strokeRoundedPropertyView' icon.
  static const IconData propertyView = HugeIconData(0x45a1);

  /// IconData for the 'strokeRoundedProtectionMask' icon.
  static const IconData protectionMask = HugeIconData(0x45a2);

  /// IconData for the 'strokeRoundedPulley' icon.
  static const IconData pulley = HugeIconData(0x45a3);

  /// IconData for the 'strokeRoundedPulse01' icon.
  static const IconData pulse01 = HugeIconData(0x45a4);

  /// IconData for the 'strokeRoundedPulse02' icon.
  static const IconData pulse02 = HugeIconData(0x45a5);

  /// IconData for the 'strokeRoundedPulseRectangle01' icon.
  static const IconData pulseRectangle01 = HugeIconData(0x45a6);

  /// IconData for the 'strokeRoundedPulseRectangle02' icon.
  static const IconData pulseRectangle02 = HugeIconData(0x45a7);

  /// IconData for the 'strokeRoundedPumpkin' icon.
  static const IconData pumpkin = HugeIconData(0x45a8);

  /// IconData for the 'strokeRoundedPunch' icon.
  static const IconData punch = HugeIconData(0x45a9);

  /// IconData for the 'strokeRoundedPunchingBall01' icon.
  static const IconData punchingBall01 = HugeIconData(0x45aa);

  /// IconData for the 'strokeRoundedPunchingBall02' icon.
  static const IconData punchingBall02 = HugeIconData(0x45ab);

  /// IconData for the 'strokeRoundedPurse01' icon.
  static const IconData purse01 = HugeIconData(0x45ac);

  /// IconData for the 'strokeRoundedPurse' icon.
  static const IconData purse = HugeIconData(0x45ad);

  /// IconData for the 'strokeRoundedPushUpBar' icon.
  static const IconData pushUpBar = HugeIconData(0x45ae);

  /// IconData for the 'strokeRoundedPuzzle' icon.
  static const IconData puzzle = HugeIconData(0x45af);

  /// IconData for the 'strokeRoundedPyramidMaslowo' icon.
  static const IconData pyramidMaslowo = HugeIconData(0x45b0);

  /// IconData for the 'strokeRoundedPyramidStructure01' icon.
  static const IconData pyramidStructure01 = HugeIconData(0x45b1);

  /// IconData for the 'strokeRoundedPyramidStructure02' icon.
  static const IconData pyramidStructure02 = HugeIconData(0x45b2);

  /// IconData for the 'strokeRoundedPyramid' icon.
  static const IconData pyramid = HugeIconData(0x45b3);

  /// IconData for the 'strokeRoundedQqPlot' icon.
  static const IconData qqPlot = HugeIconData(0x45b4);

  /// IconData for the 'strokeRoundedQrCode01' icon.
  static const IconData qrCode01 = HugeIconData(0x45b5);

  /// IconData for the 'strokeRoundedQrCode' icon.
  static const IconData qrCode = HugeIconData(0x45b6);

  /// IconData for the 'strokeRoundedQuestion' icon.
  static const IconData question = HugeIconData(0x45b7);

  /// IconData for the 'strokeRoundedQueue01' icon.
  static const IconData queue01 = HugeIconData(0x45b8);

  /// IconData for the 'strokeRoundedQueue02' icon.
  static const IconData queue02 = HugeIconData(0x45b9);

  /// IconData for the 'strokeRoundedQuillWrite01' icon.
  static const IconData quillWrite01 = HugeIconData(0x45ba);

  /// IconData for the 'strokeRoundedQuillWrite02' icon.
  static const IconData quillWrite02 = HugeIconData(0x45bb);

  /// IconData for the 'strokeRoundedQuiz01' icon.
  static const IconData quiz01 = HugeIconData(0x45bc);

  /// IconData for the 'strokeRoundedQuiz02' icon.
  static const IconData quiz02 = HugeIconData(0x45bd);

  /// IconData for the 'strokeRoundedQuiz03' icon.
  static const IconData quiz03 = HugeIconData(0x45be);

  /// IconData for the 'strokeRoundedQuiz04' icon.
  static const IconData quiz04 = HugeIconData(0x45bf);

  /// IconData for the 'strokeRoundedQuiz05' icon.
  static const IconData quiz05 = HugeIconData(0x45c0);

  /// IconData for the 'strokeRoundedQuora' icon.
  static const IconData quora = HugeIconData(0x45c1);

  /// IconData for the 'strokeRoundedQuoteDownCircle' icon.
  static const IconData quoteDownCircle = HugeIconData(0x45c2);

  /// IconData for the 'strokeRoundedQuoteDownSquare' icon.
  static const IconData quoteDownSquare = HugeIconData(0x45c3);

  /// IconData for the 'strokeRoundedQuoteDown' icon.
  static const IconData quoteDown = HugeIconData(0x45c4);

  /// IconData for the 'strokeRoundedQuoteUpCircle' icon.
  static const IconData quoteUpCircle = HugeIconData(0x45c5);

  /// IconData for the 'strokeRoundedQuoteUpSquare' icon.
  static const IconData quoteUpSquare = HugeIconData(0x45c6);

  /// IconData for the 'strokeRoundedQuoteUp' icon.
  static const IconData quoteUp = HugeIconData(0x45c7);

  /// IconData for the 'strokeRoundedQuotes' icon.
  static const IconData quotes = HugeIconData(0x45c8);

  /// IconData for the 'strokeRoundedQuran01' icon.
  static const IconData quran01 = HugeIconData(0x45c9);

  /// IconData for the 'strokeRoundedQuran02' icon.
  static const IconData quran02 = HugeIconData(0x45ca);

  /// IconData for the 'strokeRoundedQuran03' icon.
  static const IconData quran03 = HugeIconData(0x45cb);

  /// IconData for the 'strokeRoundedRacingFlag' icon.
  static const IconData racingFlag = HugeIconData(0x45cc);

  /// IconData for the 'strokeRoundedRadar01' icon.
  static const IconData radar01 = HugeIconData(0x45cd);

  /// IconData for the 'strokeRoundedRadar02' icon.
  static const IconData radar02 = HugeIconData(0x45ce);

  /// IconData for the 'strokeRoundedRadial' icon.
  static const IconData radial = HugeIconData(0x45cf);

  /// IconData for the 'strokeRoundedRadio01' icon.
  static const IconData radio01 = HugeIconData(0x45d0);

  /// IconData for the 'strokeRoundedRadio02' icon.
  static const IconData radio02 = HugeIconData(0x45d1);

  /// IconData for the 'strokeRoundedRadio' icon.
  static const IconData radio = HugeIconData(0x45d2);

  /// IconData for the 'strokeRoundedRadioactiveAlert' icon.
  static const IconData radioactiveAlert = HugeIconData(0x45d3);

  /// IconData for the 'strokeRoundedRadius' icon.
  static const IconData radius = HugeIconData(0x45d4);

  /// IconData for the 'strokeRoundedRainDoubleDrop' icon.
  static const IconData rainDoubleDrop = HugeIconData(0x45d5);

  /// IconData for the 'strokeRoundedRainDrop' icon.
  static const IconData rainDrop = HugeIconData(0x45d6);

  /// IconData for the 'strokeRoundedRain' icon.
  static const IconData rain = HugeIconData(0x45d7);

  /// IconData for the 'strokeRoundedRainbow' icon.
  static const IconData rainbow = HugeIconData(0x45d8);

  /// IconData for the 'strokeRoundedRamadhan01' icon.
  static const IconData ramadhan01 = HugeIconData(0x45d9);

  /// IconData for the 'strokeRoundedRamadhan02' icon.
  static const IconData ramadhan02 = HugeIconData(0x45da);

  /// IconData for the 'strokeRoundedRamadhanMonth' icon.
  static const IconData ramadhanMonth = HugeIconData(0x45db);

  /// IconData for the 'strokeRoundedRanking' icon.
  static const IconData ranking = HugeIconData(0x45dc);

  /// IconData for the 'strokeRoundedRaw01' icon.
  static const IconData raw01 = HugeIconData(0x45dd);

  /// IconData for the 'strokeRoundedRaw02' icon.
  static const IconData raw02 = HugeIconData(0x45de);

  /// IconData for the 'strokeRoundedReact' icon.
  static const IconData react = HugeIconData(0x45e0);

  /// IconData for the 'strokeRoundedRealEstate01' icon.
  static const IconData realEstate01 = HugeIconData(0x45e1);

  /// IconData for the 'strokeRoundedRealEstate02' icon.
  static const IconData realEstate02 = HugeIconData(0x45e2);

  /// IconData for the 'strokeRoundedRecord' icon.
  static const IconData record = HugeIconData(0x45e3);

  /// IconData for the 'strokeRoundedRecoveryMail' icon.
  static const IconData recoveryMail = HugeIconData(0x45e4);

  /// IconData for the 'strokeRoundedRectangular01' icon.
  static const IconData rectangular01 = HugeIconData(0x45e5);

  /// IconData for the 'strokeRoundedRectangular' icon.
  static const IconData rectangular = HugeIconData(0x45e6);

  /// IconData for the 'strokeRoundedRecycle01' icon.
  static const IconData recycle01 = HugeIconData(0x45e7);

  /// IconData for the 'strokeRoundedRecycle02' icon.
  static const IconData recycle02 = HugeIconData(0x45e8);

  /// IconData for the 'strokeRoundedRecycle03' icon.
  static const IconData recycle03 = HugeIconData(0x45e9);

  /// IconData for the 'strokeRoundedReddit' icon.
  static const IconData reddit = HugeIconData(0x45ea);

  /// IconData for the 'strokeRoundedReflex' icon.
  static const IconData reflex = HugeIconData(0x45eb);

  /// IconData for the 'strokeRoundedRefresh' icon.
  static const IconData refresh = HugeIconData(0x45ec);

  /// IconData for the 'strokeRoundedRefrigerator' icon.
  static const IconData refrigerator = HugeIconData(0x45ed);

  /// IconData for the 'strokeRoundedRegister' icon.
  static const IconData register = HugeIconData(0x45ee);

  /// IconData for the 'strokeRoundedRegistered' icon.
  static const IconData registered = HugeIconData(0x45ef);

  /// IconData for the 'strokeRoundedRelieved01' icon.
  static const IconData relieved01 = HugeIconData(0x45f0);

  /// IconData for the 'strokeRoundedRelieved02' icon.
  static const IconData relieved02 = HugeIconData(0x45f1);

  /// IconData for the 'strokeRoundedReload' icon.
  static const IconData reload = HugeIconData(0x45f2);

  /// IconData for the 'strokeRoundedReminder' icon.
  static const IconData reminder = HugeIconData(0x45f3);

  /// IconData for the 'strokeRoundedRemoteControl' icon.
  static const IconData remoteControl = HugeIconData(0x45f4);

  /// IconData for the 'strokeRoundedRemove01' icon.
  static const IconData remove01 = HugeIconData(0x45f5);

  /// IconData for the 'strokeRoundedRemove02' icon.
  static const IconData remove02 = HugeIconData(0x45f6);

  /// IconData for the 'strokeRoundedRemoveCircleHalfDot' icon.
  static const IconData removeCircleHalfDot = HugeIconData(0x45f7);

  /// IconData for the 'strokeRoundedRemoveCircle' icon.
  static const IconData removeCircle = HugeIconData(0x45f8);

  /// IconData for the 'strokeRoundedRemovePi' icon.
  static const IconData removePi = HugeIconData(0x45f9);

  /// IconData for the 'strokeRoundedRemoveSquare' icon.
  static const IconData removeSquare = HugeIconData(0x45fa);

  /// IconData for the 'strokeRoundedRenewableEnergy01' icon.
  static const IconData renewableEnergy01 = HugeIconData(0x45fb);

  /// IconData for the 'strokeRoundedRenewableEnergy' icon.
  static const IconData renewableEnergy = HugeIconData(0x45fc);

  /// IconData for the 'strokeRoundedRepair' icon.
  static const IconData repair = HugeIconData(0x45fd);

  /// IconData for the 'strokeRoundedRepeatOff' icon.
  static const IconData repeatOff = HugeIconData(0x45fe);

  /// IconData for the 'strokeRoundedRepeatOne01' icon.
  static const IconData repeatOne01 = HugeIconData(0x45ff);

  /// IconData for the 'strokeRoundedRepeatOne02' icon.
  static const IconData repeatOne02 = HugeIconData(0x4600);

  /// IconData for the 'strokeRoundedRepeat' icon.
  static const IconData repeat = HugeIconData(0x4601);

  /// IconData for the 'strokeRoundedReplay' icon.
  static const IconData replay = HugeIconData(0x4602);

  /// IconData for the 'strokeRoundedRepository' icon.
  static const IconData repository = HugeIconData(0x4603);

  /// IconData for the 'strokeRoundedResetPassword' icon.
  static const IconData resetPassword = HugeIconData(0x4604);

  /// IconData for the 'strokeRoundedResize01' icon.
  static const IconData resize01 = HugeIconData(0x4605);

  /// IconData for the 'strokeRoundedResize02' icon.
  static const IconData resize02 = HugeIconData(0x4606);

  /// IconData for the 'strokeRoundedResourcesAdd' icon.
  static const IconData resourcesAdd = HugeIconData(0x4607);

  /// IconData for the 'strokeRoundedResourcesRemove' icon.
  static const IconData resourcesRemove = HugeIconData(0x4608);

  /// IconData for the 'strokeRoundedRestaurant01' icon.
  static const IconData restaurant01 = HugeIconData(0x4609);

  /// IconData for the 'strokeRoundedRestaurant02' icon.
  static const IconData restaurant02 = HugeIconData(0x460a);

  /// IconData for the 'strokeRoundedRestaurant03' icon.
  static const IconData restaurant03 = HugeIconData(0x460b);

  /// IconData for the 'strokeRoundedRestaurantTable' icon.
  static const IconData restaurantTable = HugeIconData(0x460c);

  /// IconData for the 'strokeRoundedRestoreBin' icon.
  static const IconData restoreBin = HugeIconData(0x460d);

  /// IconData for the 'strokeRoundedReturnRequest' icon.
  static const IconData returnRequest = HugeIconData(0x460e);

  /// IconData for the 'strokeRoundedReverseWithdrawal01' icon.
  static const IconData reverseWithdrawal01 = HugeIconData(0x460f);

  /// IconData for the 'strokeRoundedReverseWithdrawal02' icon.
  static const IconData reverseWithdrawal02 = HugeIconData(0x4610);

  /// IconData for the 'strokeRoundedRhombus01' icon.
  static const IconData rhombus01 = HugeIconData(0x4611);

  /// IconData for the 'strokeRoundedRhombus' icon.
  static const IconData rhombus = HugeIconData(0x4612);

  /// IconData for the 'strokeRoundedRiceBowl01' icon.
  static const IconData riceBowl01 = HugeIconData(0x4613);

  /// IconData for the 'strokeRoundedRiceBowl02' icon.
  static const IconData riceBowl02 = HugeIconData(0x4614);

  /// IconData for the 'strokeRoundedRightAngle' icon.
  static const IconData rightAngle = HugeIconData(0x4615);

  /// IconData for the 'strokeRoundedRightToLeftBlockQuote' icon.
  static const IconData rightToLeftBlockQuote = HugeIconData(0x4616);

  /// IconData for the 'strokeRoundedRightToLeftListBullet' icon.
  static const IconData rightToLeftListBullet = HugeIconData(0x4617);

  /// IconData for the 'strokeRoundedRightToLeftListDash' icon.
  static const IconData rightToLeftListDash = HugeIconData(0x4618);

  /// IconData for the 'strokeRoundedRightToLeftListNumber' icon.
  static const IconData rightToLeftListNumber = HugeIconData(0x4619);

  /// IconData for the 'strokeRoundedRightToLeftListTriangle' icon.
  static const IconData rightToLeftListTriangle = HugeIconData(0x461a);

  /// IconData for the 'strokeRoundedRightTriangle' icon.
  static const IconData rightTriangle = HugeIconData(0x461b);

  /// IconData for the 'strokeRoundedRipple' icon.
  static const IconData ripple = HugeIconData(0x461c);

  /// IconData for the 'strokeRoundedRiyalRectangle' icon.
  static const IconData riyalRectangle = HugeIconData(0x461d);

  /// IconData for the 'strokeRoundedRiyal' icon.
  static const IconData riyal = HugeIconData(0x461e);

  /// IconData for the 'strokeRoundedRoad01' icon.
  static const IconData road01 = HugeIconData(0x461f);

  /// IconData for the 'strokeRoundedRoad02' icon.
  static const IconData road02 = HugeIconData(0x4620);

  /// IconData for the 'strokeRoundedRoadLocation01' icon.
  static const IconData roadLocation01 = HugeIconData(0x4621);

  /// IconData for the 'strokeRoundedRoadLocation02' icon.
  static const IconData roadLocation02 = HugeIconData(0x4622);

  /// IconData for the 'strokeRoundedRoadWayside' icon.
  static const IconData roadWayside = HugeIconData(0x4623);

  /// IconData for the 'strokeRoundedRoad' icon.
  static const IconData road = HugeIconData(0x4624);

  /// IconData for the 'strokeRoundedRobotic' icon.
  static const IconData robotic = HugeIconData(0x4625);

  /// IconData for the 'strokeRoundedRocket01' icon.
  static const IconData rocket01 = HugeIconData(0x4626);

  /// IconData for the 'strokeRoundedRocket02' icon.
  static const IconData rocket02 = HugeIconData(0x4627);

  /// IconData for the 'strokeRoundedRocket' icon.
  static const IconData rocket = HugeIconData(0x4628);

  /// IconData for the 'strokeRoundedRockingChair' icon.
  static const IconData rockingChair = HugeIconData(0x4629);

  /// IconData for the 'strokeRoundedRollerSkate' icon.
  static const IconData rollerSkate = HugeIconData(0x462a);

  /// IconData for the 'strokeRoundedRollingPin' icon.
  static const IconData rollingPin = HugeIconData(0x462b);

  /// IconData for the 'strokeRoundedRoot01' icon.
  static const IconData root01 = HugeIconData(0x462c);

  /// IconData for the 'strokeRoundedRoot02' icon.
  static const IconData root02 = HugeIconData(0x462d);

  /// IconData for the 'strokeRoundedRootCircle' icon.
  static const IconData rootCircle = HugeIconData(0x462e);

  /// IconData for the 'strokeRoundedRootFirstBracket' icon.
  static const IconData rootFirstBracket = HugeIconData(0x462f);

  /// IconData for the 'strokeRoundedRootSecondBracket' icon.
  static const IconData rootSecondBracket = HugeIconData(0x4630);

  /// IconData for the 'strokeRoundedRootThirdBracket' icon.
  static const IconData rootThirdBracket = HugeIconData(0x4631);

  /// IconData for the 'strokeRoundedRotate01' icon.
  static const IconData rotate01 = HugeIconData(0x4632);

  /// IconData for the 'strokeRoundedRotate02' icon.
  static const IconData rotate02 = HugeIconData(0x4633);

  /// IconData for the 'strokeRoundedRotate360' icon.
  static const IconData rotate360 = HugeIconData(0x4634);

  /// IconData for the 'strokeRoundedRotateBottomLeft' icon.
  static const IconData rotateBottomLeft = HugeIconData(0x4635);

  /// IconData for the 'strokeRoundedRotateBottomRight' icon.
  static const IconData rotateBottomRight = HugeIconData(0x4636);

  /// IconData for the 'strokeRoundedRotateClockwise' icon.
  static const IconData rotateClockwise = HugeIconData(0x4637);

  /// IconData for the 'strokeRoundedRotateCrop' icon.
  static const IconData rotateCrop = HugeIconData(0x4638);

  /// IconData for the 'strokeRoundedRotateLeft01' icon.
  static const IconData rotateLeft01 = HugeIconData(0x4639);

  /// IconData for the 'strokeRoundedRotateLeft02' icon.
  static const IconData rotateLeft02 = HugeIconData(0x463a);

  /// IconData for the 'strokeRoundedRotateLeft03' icon.
  static const IconData rotateLeft03 = HugeIconData(0x463b);

  /// IconData for the 'strokeRoundedRotateLeft04' icon.
  static const IconData rotateLeft04 = HugeIconData(0x463c);

  /// IconData for the 'strokeRoundedRotateLeft05' icon.
  static const IconData rotateLeft05 = HugeIconData(0x463d);

  /// IconData for the 'strokeRoundedRotateLeft06' icon.
  static const IconData rotateLeft06 = HugeIconData(0x463e);

  /// IconData for the 'strokeRoundedRotateRight01' icon.
  static const IconData rotateRight01 = HugeIconData(0x463f);

  /// IconData for the 'strokeRoundedRotateRight02' icon.
  static const IconData rotateRight02 = HugeIconData(0x4640);

  /// IconData for the 'strokeRoundedRotateRight03' icon.
  static const IconData rotateRight03 = HugeIconData(0x4641);

  /// IconData for the 'strokeRoundedRotateRight04' icon.
  static const IconData rotateRight04 = HugeIconData(0x4642);

  /// IconData for the 'strokeRoundedRotateRight05' icon.
  static const IconData rotateRight05 = HugeIconData(0x4643);

  /// IconData for the 'strokeRoundedRotateRight06' icon.
  static const IconData rotateRight06 = HugeIconData(0x4644);

  /// IconData for the 'strokeRoundedRotateSquare' icon.
  static const IconData rotateSquare = HugeIconData(0x4645);

  /// IconData for the 'strokeRoundedRotateTopLeft' icon.
  static const IconData rotateTopLeft = HugeIconData(0x4646);

  /// IconData for the 'strokeRoundedRotateTopRight' icon.
  static const IconData rotateTopRight = HugeIconData(0x4647);

  /// IconData for the 'strokeRoundedRoute01' icon.
  static const IconData route01 = HugeIconData(0x4648);

  /// IconData for the 'strokeRoundedRoute02' icon.
  static const IconData route02 = HugeIconData(0x4649);

  /// IconData for the 'strokeRoundedRoute03' icon.
  static const IconData route03 = HugeIconData(0x464a);

  /// IconData for the 'strokeRoundedRouteBlock' icon.
  static const IconData routeBlock = HugeIconData(0x464b);

  /// IconData for the 'strokeRoundedRouter01' icon.
  static const IconData router01 = HugeIconData(0x464c);

  /// IconData for the 'strokeRoundedRouter02' icon.
  static const IconData router02 = HugeIconData(0x464d);

  /// IconData for the 'strokeRoundedRouter' icon.
  static const IconData router = HugeIconData(0x464e);

  /// IconData for the 'strokeRoundedRowDelete' icon.
  static const IconData rowDelete = HugeIconData(0x464f);

  /// IconData for the 'strokeRoundedRowInsert' icon.
  static const IconData rowInsert = HugeIconData(0x4650);

  /// IconData for the 'strokeRoundedRssConnected01' icon.
  static const IconData rssConnected01 = HugeIconData(0x4651);

  /// IconData for the 'strokeRoundedRssConnected02' icon.
  static const IconData rssConnected02 = HugeIconData(0x4652);

  /// IconData for the 'strokeRoundedRssError' icon.
  static const IconData rssError = HugeIconData(0x4653);

  /// IconData for the 'strokeRoundedRssLocked' icon.
  static const IconData rssLocked = HugeIconData(0x4654);

  /// IconData for the 'strokeRoundedRssUnlocked' icon.
  static const IconData rssUnlocked = HugeIconData(0x4655);

  /// IconData for the 'strokeRoundedRss' icon.
  static const IconData rss = HugeIconData(0x4656);

  /// IconData for the 'strokeRoundedRubElHizb' icon.
  static const IconData rubElHizb = HugeIconData(0x4657);

  /// IconData for the 'strokeRoundedRuku' icon.
  static const IconData ruku = HugeIconData(0x4658);

  /// IconData for the 'strokeRoundedRuler' icon.
  static const IconData ruler = HugeIconData(0x4659);

  /// IconData for the 'strokeRoundedRunningShoes' icon.
  static const IconData runningShoes = HugeIconData(0x465a);

  /// IconData for the 'strokeRoundedSad01' icon.
  static const IconData sad01 = HugeIconData(0x465b);

  /// IconData for the 'strokeRoundedSad02' icon.
  static const IconData sad02 = HugeIconData(0x465c);

  /// IconData for the 'strokeRoundedSadDizzy' icon.
  static const IconData sadDizzy = HugeIconData(0x465d);

  /// IconData for the 'strokeRoundedSafari' icon.
  static const IconData safari = HugeIconData(0x465e);

  /// IconData for the 'strokeRoundedSafeDelivery01' icon.
  static const IconData safeDelivery01 = HugeIconData(0x465f);

  /// IconData for the 'strokeRoundedSafeDelivery02' icon.
  static const IconData safeDelivery02 = HugeIconData(0x4660);

  /// IconData for the 'strokeRoundedSafe' icon.
  static const IconData safe = HugeIconData(0x4661);

  /// IconData for the 'strokeRoundedSafetyPin01' icon.
  static const IconData safetyPin01 = HugeIconData(0x4662);

  /// IconData for the 'strokeRoundedSafetyPin02' icon.
  static const IconData safetyPin02 = HugeIconData(0x4663);

  /// IconData for the 'strokeRoundedSailboatCoastal' icon.
  static const IconData sailboatCoastal = HugeIconData(0x4664);

  /// IconData for the 'strokeRoundedSailboatOffshore' icon.
  static const IconData sailboatOffshore = HugeIconData(0x4665);

  /// IconData for the 'strokeRoundedSakura' icon.
  static const IconData sakura = HugeIconData(0x4666);

  /// IconData for the 'strokeRoundedSalahTime' icon.
  static const IconData salahTime = HugeIconData(0x4667);

  /// IconData for the 'strokeRoundedSalah' icon.
  static const IconData salah = HugeIconData(0x4668);

  /// IconData for the 'strokeRoundedSaleTag01' icon.
  static const IconData saleTag01 = HugeIconData(0x4669);

  /// IconData for the 'strokeRoundedSaleTag02' icon.
  static const IconData saleTag02 = HugeIconData(0x466a);

  /// IconData for the 'strokeRoundedSandals' icon.
  static const IconData sandals = HugeIconData(0x466b);

  /// IconData for the 'strokeRoundedSatellite01' icon.
  static const IconData satellite01 = HugeIconData(0x466c);

  /// IconData for the 'strokeRoundedSatellite02' icon.
  static const IconData satellite02 = HugeIconData(0x466d);

  /// IconData for the 'strokeRoundedSatellite03' icon.
  static const IconData satellite03 = HugeIconData(0x466e);

  /// IconData for the 'strokeRoundedSatellite' icon.
  static const IconData satellite = HugeIconData(0x466f);

  /// IconData for the 'strokeRoundedSaturn01' icon.
  static const IconData saturn01 = HugeIconData(0x4670);

  /// IconData for the 'strokeRoundedSaturn02' icon.
  static const IconData saturn02 = HugeIconData(0x4671);

  /// IconData for the 'strokeRoundedSaturn' icon.
  static const IconData saturn = HugeIconData(0x4672);

  /// IconData for the 'strokeRoundedSausage' icon.
  static const IconData sausage = HugeIconData(0x4673);

  /// IconData for the 'strokeRoundedSaveEnergy01' icon.
  static const IconData saveEnergy01 = HugeIconData(0x4674);

  /// IconData for the 'strokeRoundedSaveEnergy02' icon.
  static const IconData saveEnergy02 = HugeIconData(0x4675);

  /// IconData for the 'strokeRoundedSaveMoneyDollar' icon.
  static const IconData saveMoneyDollar = HugeIconData(0x4676);

  /// IconData for the 'strokeRoundedSaveMoneyEuro' icon.
  static const IconData saveMoneyEuro = HugeIconData(0x4677);

  /// IconData for the 'strokeRoundedSaveMoneyPound' icon.
  static const IconData saveMoneyPound = HugeIconData(0x4678);

  /// IconData for the 'strokeRoundedSaveMoneyYen' icon.
  static const IconData saveMoneyYen = HugeIconData(0x4679);

  /// IconData for the 'strokeRoundedSavings' icon.
  static const IconData savings = HugeIconData(0x467a);

  /// IconData for the 'strokeRoundedScheme' icon.
  static const IconData scheme = HugeIconData(0x467b);

  /// IconData for the 'strokeRoundedSchool01' icon.
  static const IconData school01 = HugeIconData(0x467c);

  /// IconData for the 'strokeRoundedSchoolBell01' icon.
  static const IconData schoolBell01 = HugeIconData(0x467d);

  /// IconData for the 'strokeRoundedSchoolBell02' icon.
  static const IconData schoolBell02 = HugeIconData(0x467e);

  /// IconData for the 'strokeRoundedSchoolBus' icon.
  static const IconData schoolBus = HugeIconData(0x467f);

  /// IconData for the 'strokeRoundedSchoolReportCard' icon.
  static const IconData schoolReportCard = HugeIconData(0x4680);

  /// IconData for the 'strokeRoundedSchoolTie' icon.
  static const IconData schoolTie = HugeIconData(0x4681);

  /// IconData for the 'strokeRoundedSchool' icon.
  static const IconData school = HugeIconData(0x4682);

  /// IconData for the 'strokeRoundedScissor01' icon.
  static const IconData scissor01 = HugeIconData(0x4683);

  /// IconData for the 'strokeRoundedScissorRectangle' icon.
  static const IconData scissorRectangle = HugeIconData(0x4684);

  /// IconData for the 'strokeRoundedScissor' icon.
  static const IconData scissor = HugeIconData(0x4685);

  /// IconData for the 'strokeRoundedScooter01' icon.
  static const IconData scooter01 = HugeIconData(0x4686);

  /// IconData for the 'strokeRoundedScooter02' icon.
  static const IconData scooter02 = HugeIconData(0x4687);

  /// IconData for the 'strokeRoundedScooter03' icon.
  static const IconData scooter03 = HugeIconData(0x4688);

  /// IconData for the 'strokeRoundedScooter04' icon.
  static const IconData scooter04 = HugeIconData(0x4689);

  /// IconData for the 'strokeRoundedScooterElectric' icon.
  static const IconData scooterElectric = HugeIconData(0x468a);

  /// IconData for the 'strokeRoundedScratchCard' icon.
  static const IconData scratchCard = HugeIconData(0x468b);

  /// IconData for the 'strokeRoundedScreenAddToHome' icon.
  static const IconData screenAddToHome = HugeIconData(0x468c);

  /// IconData for the 'strokeRoundedScreenLockRotation' icon.
  static const IconData screenLockRotation = HugeIconData(0x468d);

  /// IconData for the 'strokeRoundedScreenRotation' icon.
  static const IconData screenRotation = HugeIconData(0x468e);

  /// IconData for the 'strokeRoundedScribd' icon.
  static const IconData scribd = HugeIconData(0x468f);

  /// IconData for the 'strokeRoundedScrollHorizontal' icon.
  static const IconData scrollHorizontal = HugeIconData(0x4690);

  /// IconData for the 'strokeRoundedScrollVertical' icon.
  static const IconData scrollVertical = HugeIconData(0x4691);

  /// IconData for the 'strokeRoundedScroll' icon.
  static const IconData scroll = HugeIconData(0x4692);

  /// IconData for the 'strokeRoundedSdCard' icon.
  static const IconData sdCard = HugeIconData(0x4693);

  /// IconData for the 'strokeRoundedSeal' icon.
  static const IconData seal = HugeIconData(0x4694);

  /// IconData for the 'strokeRoundedSearch01' icon.
  static const IconData search01 = HugeIconData(0x4695);

  /// IconData for the 'strokeRoundedSearch02' icon.
  static const IconData search02 = HugeIconData(0x4696);

  /// IconData for the 'strokeRoundedSearchAdd' icon.
  static const IconData searchAdd = HugeIconData(0x4697);

  /// IconData for the 'strokeRoundedSearchArea' icon.
  static const IconData searchArea = HugeIconData(0x4698);

  /// IconData for the 'strokeRoundedSearchCircle' icon.
  static const IconData searchCircle = HugeIconData(0x4699);

  /// IconData for the 'strokeRoundedSearchDollar' icon.
  static const IconData searchDollar = HugeIconData(0x469a);

  /// IconData for the 'strokeRoundedSearchFocus' icon.
  static const IconData searchFocus = HugeIconData(0x469b);

  /// IconData for the 'strokeRoundedSearchList01' icon.
  static const IconData searchList01 = HugeIconData(0x469c);

  /// IconData for the 'strokeRoundedSearchList02' icon.
  static const IconData searchList02 = HugeIconData(0x469d);

  /// IconData for the 'strokeRoundedSearchMinus' icon.
  static const IconData searchMinus = HugeIconData(0x469e);

  /// IconData for the 'strokeRoundedSearchRemove' icon.
  static const IconData searchRemove = HugeIconData(0x469f);

  /// IconData for the 'strokeRoundedSearchReplace' icon.
  static const IconData searchReplace = HugeIconData(0x46a0);

  /// IconData for the 'strokeRoundedSearchSquare' icon.
  static const IconData searchSquare = HugeIconData(0x46a1);

  /// IconData for the 'strokeRoundedSearchVisual' icon.
  static const IconData searchVisual = HugeIconData(0x46a2);

  /// IconData for the 'strokeRoundedSearching' icon.
  static const IconData searching = HugeIconData(0x46a3);

  /// IconData for the 'strokeRoundedSeatSelector' icon.
  static const IconData seatSelector = HugeIconData(0x46a4);

  /// IconData for the 'strokeRoundedSecondBracketCircle' icon.
  static const IconData secondBracketCircle = HugeIconData(0x46a5);

  /// IconData for the 'strokeRoundedSecondBracketSquare' icon.
  static const IconData secondBracketSquare = HugeIconData(0x46a6);

  /// IconData for the 'strokeRoundedSecondBracket' icon.
  static const IconData secondBracket = HugeIconData(0x46a7);

  /// IconData for the 'strokeRoundedSecuredNetwork' icon.
  static const IconData securedNetwork = HugeIconData(0x46a8);

  /// IconData for the 'strokeRoundedSecurityBlock' icon.
  static const IconData securityBlock = HugeIconData(0x46a9);

  /// IconData for the 'strokeRoundedSecurityCheck' icon.
  static const IconData securityCheck = HugeIconData(0x46aa);

  /// IconData for the 'strokeRoundedSecurityKeyUsb' icon.
  static const IconData securityKeyUsb = HugeIconData(0x46ab);

  /// IconData for the 'strokeRoundedSecurityLock' icon.
  static const IconData securityLock = HugeIconData(0x46ac);

  /// IconData for the 'strokeRoundedSecurityPassword' icon.
  static const IconData securityPassword = HugeIconData(0x46ad);

  /// IconData for the 'strokeRoundedSecurityValidation' icon.
  static const IconData securityValidation = HugeIconData(0x46ae);

  /// IconData for the 'strokeRoundedSecurityWifi' icon.
  static const IconData securityWifi = HugeIconData(0x46af);

  /// IconData for the 'strokeRoundedSecurity' icon.
  static const IconData security = HugeIconData(0x46b0);

  /// IconData for the 'strokeRoundedSegment' icon.
  static const IconData segment = HugeIconData(0x46b1);

  /// IconData for the 'strokeRoundedSelect01' icon.
  static const IconData select01 = HugeIconData(0x46b2);

  /// IconData for the 'strokeRoundedSelect02' icon.
  static const IconData select02 = HugeIconData(0x46b3);

  /// IconData for the 'strokeRoundedSendToMobile' icon.
  static const IconData sendToMobile = HugeIconData(0x46b4);

  /// IconData for the 'strokeRoundedSenseless' icon.
  static const IconData senseless = HugeIconData(0x46b5);

  /// IconData for the 'strokeRoundedSent' icon.
  static const IconData sent = HugeIconData(0x46b6);

  /// IconData for the 'strokeRoundedSeo' icon.
  static const IconData seo = HugeIconData(0x46b7);

  /// IconData for the 'strokeRoundedService' icon.
  static const IconData service = HugeIconData(0x46b8);

  /// IconData for the 'strokeRoundedSetting06' icon.
  static const IconData setting06 = HugeIconData(0x46b9);

  /// IconData for the 'strokeRoundedSetting07' icon.
  static const IconData setting07 = HugeIconData(0x46ba);

  /// IconData for the 'strokeRoundedSettingDone01' icon.
  static const IconData settingDone01 = HugeIconData(0x46bb);

  /// IconData for the 'strokeRoundedSettingDone02' icon.
  static const IconData settingDone02 = HugeIconData(0x46bc);

  /// IconData for the 'strokeRoundedSettingDone03' icon.
  static const IconData settingDone03 = HugeIconData(0x46bd);

  /// IconData for the 'strokeRoundedSettingDone04' icon.
  static const IconData settingDone04 = HugeIconData(0x46be);

  /// IconData for the 'strokeRoundedSettingError03' icon.
  static const IconData settingError03 = HugeIconData(0x46bf);

  /// IconData for the 'strokeRoundedSettingError04' icon.
  static const IconData settingError04 = HugeIconData(0x46c0);

  /// IconData for the 'strokeRoundedSettings01' icon.
  static const IconData settings01 = HugeIconData(0x46c1);

  /// IconData for the 'strokeRoundedSettings02' icon.
  static const IconData settings02 = HugeIconData(0x46c2);

  /// IconData for the 'strokeRoundedSettings03' icon.
  static const IconData settings03 = HugeIconData(0x46c3);

  /// IconData for the 'strokeRoundedSettings04' icon.
  static const IconData settings04 = HugeIconData(0x46c4);

  /// IconData for the 'strokeRoundedSettings05' icon.
  static const IconData settings05 = HugeIconData(0x46c5);

  /// IconData for the 'strokeRoundedSettingsError01' icon.
  static const IconData settingsError01 = HugeIconData(0x46c6);

  /// IconData for the 'strokeRoundedSettingsError02' icon.
  static const IconData settingsError02 = HugeIconData(0x46c7);

  /// IconData for the 'strokeRoundedSetup01' icon.
  static const IconData setup01 = HugeIconData(0x46c8);

  /// IconData for the 'strokeRoundedSetup02' icon.
  static const IconData setup02 = HugeIconData(0x46c9);

  /// IconData for the 'strokeRoundedShaka01' icon.
  static const IconData shaka01 = HugeIconData(0x46ca);

  /// IconData for the 'strokeRoundedShaka02' icon.
  static const IconData shaka02 = HugeIconData(0x46cb);

  /// IconData for the 'strokeRoundedShaka03' icon.
  static const IconData shaka03 = HugeIconData(0x46cc);

  /// IconData for the 'strokeRoundedShaka04' icon.
  static const IconData shaka04 = HugeIconData(0x46cd);

  /// IconData for the 'strokeRoundedShampoo' icon.
  static const IconData shampoo = HugeIconData(0x46ce);

  /// IconData for the 'strokeRoundedShapes' icon.
  static const IconData shapes = HugeIconData(0x46cf);

  /// IconData for the 'strokeRoundedShare01' icon.
  static const IconData share01 = HugeIconData(0x46d0);

  /// IconData for the 'strokeRoundedShare02' icon.
  static const IconData share02 = HugeIconData(0x46d1);

  /// IconData for the 'strokeRoundedShare03' icon.
  static const IconData share03 = HugeIconData(0x46d2);

  /// IconData for the 'strokeRoundedShare04' icon.
  static const IconData share04 = HugeIconData(0x46d3);

  /// IconData for the 'strokeRoundedShare05' icon.
  static const IconData share05 = HugeIconData(0x46d4);

  /// IconData for the 'strokeRoundedShare06' icon.
  static const IconData share06 = HugeIconData(0x46d5);

  /// IconData for the 'strokeRoundedShare07' icon.
  static const IconData share07 = HugeIconData(0x46d6);

  /// IconData for the 'strokeRoundedShare08' icon.
  static const IconData share08 = HugeIconData(0x46d7);

  /// IconData for the 'strokeRoundedShareKnowledge' icon.
  static const IconData shareKnowledge = HugeIconData(0x46d8);

  /// IconData for the 'strokeRoundedShareLocation01' icon.
  static const IconData shareLocation01 = HugeIconData(0x46d9);

  /// IconData for the 'strokeRoundedShareLocation02' icon.
  static const IconData shareLocation02 = HugeIconData(0x46da);

  /// IconData for the 'strokeRoundedSharedWifi' icon.
  static const IconData sharedWifi = HugeIconData(0x46db);

  /// IconData for the 'strokeRoundedSharing' icon.
  static const IconData sharing = HugeIconData(0x46dc);

  /// IconData for the 'strokeRoundedShellfish' icon.
  static const IconData shellfish = HugeIconData(0x46dd);

  /// IconData for the 'strokeRoundedSheriff01' icon.
  static const IconData sheriff01 = HugeIconData(0x46de);

  /// IconData for the 'strokeRoundedSheriff02' icon.
  static const IconData sheriff02 = HugeIconData(0x46df);

  /// IconData for the 'strokeRoundedShield01' icon.
  static const IconData shield01 = HugeIconData(0x46e0);

  /// IconData for the 'strokeRoundedShield02' icon.
  static const IconData shield02 = HugeIconData(0x46e1);

  /// IconData for the 'strokeRoundedShieldBlockchain' icon.
  static const IconData shieldBlockchain = HugeIconData(0x46e2);

  /// IconData for the 'strokeRoundedShieldEnergy' icon.
  static const IconData shieldEnergy = HugeIconData(0x46e3);

  /// IconData for the 'strokeRoundedShieldKey' icon.
  static const IconData shieldKey = HugeIconData(0x46e4);

  /// IconData for the 'strokeRoundedShieldUser' icon.
  static const IconData shieldUser = HugeIconData(0x46e5);

  /// IconData for the 'strokeRoundedShipmentTracking' icon.
  static const IconData shipmentTracking = HugeIconData(0x46e6);

  /// IconData for the 'strokeRoundedShippingCenter' icon.
  static const IconData shippingCenter = HugeIconData(0x46e7);

  /// IconData for the 'strokeRoundedShippingLoading' icon.
  static const IconData shippingLoading = HugeIconData(0x46e8);

  /// IconData for the 'strokeRoundedShippingTruck01' icon.
  static const IconData shippingTruck01 = HugeIconData(0x46e9);

  /// IconData for the 'strokeRoundedShippingTruck02' icon.
  static const IconData shippingTruck02 = HugeIconData(0x46ea);

  /// IconData for the 'strokeRoundedShirt01' icon.
  static const IconData shirt01 = HugeIconData(0x46eb);

  /// IconData for the 'strokeRoundedShocked' icon.
  static const IconData shocked = HugeIconData(0x46ec);

  /// IconData for the 'strokeRoundedShopSign' icon.
  static const IconData shopSign = HugeIconData(0x46ed);

  /// IconData for the 'strokeRoundedShoppingBag01' icon.
  static const IconData shoppingBag01 = HugeIconData(0x46ee);

  /// IconData for the 'strokeRoundedShoppingBag02' icon.
  static const IconData shoppingBag02 = HugeIconData(0x46ef);

  /// IconData for the 'strokeRoundedShoppingBag03' icon.
  static const IconData shoppingBag03 = HugeIconData(0x46f0);

  /// IconData for the 'strokeRoundedShoppingBagAdd' icon.
  static const IconData shoppingBagAdd = HugeIconData(0x46f1);

  /// IconData for the 'strokeRoundedShoppingBagCheck' icon.
  static const IconData shoppingBagCheck = HugeIconData(0x46f2);

  /// IconData for the 'strokeRoundedShoppingBagFavorite' icon.
  static const IconData shoppingBagFavorite = HugeIconData(0x46f3);

  /// IconData for the 'strokeRoundedShoppingBagRemove' icon.
  static const IconData shoppingBagRemove = HugeIconData(0x46f4);

  /// IconData for the 'strokeRoundedShoppingBasket01' icon.
  static const IconData shoppingBasket01 = HugeIconData(0x46f5);

  /// IconData for the 'strokeRoundedShoppingBasket02' icon.
  static const IconData shoppingBasket02 = HugeIconData(0x46f6);

  /// IconData for the 'strokeRoundedShoppingBasket03' icon.
  static const IconData shoppingBasket03 = HugeIconData(0x46f7);

  /// IconData for the 'strokeRoundedShoppingBasketAdd01' icon.
  static const IconData shoppingBasketAdd01 = HugeIconData(0x46f8);

  /// IconData for the 'strokeRoundedShoppingBasketAdd02' icon.
  static const IconData shoppingBasketAdd02 = HugeIconData(0x46f9);

  /// IconData for the 'strokeRoundedShoppingBasketAdd03' icon.
  static const IconData shoppingBasketAdd03 = HugeIconData(0x46fa);

  /// IconData for the 'strokeRoundedShoppingBasketCheckIn01' icon.
  static const IconData shoppingBasketCheckIn01 = HugeIconData(0x46fb);

  /// IconData for the 'strokeRoundedShoppingBasketCheckIn02' icon.
  static const IconData shoppingBasketCheckIn02 = HugeIconData(0x46fc);

  /// IconData for the 'strokeRoundedShoppingBasketCheckIn03' icon.
  static const IconData shoppingBasketCheckIn03 = HugeIconData(0x46fd);

  /// IconData for the 'strokeRoundedShoppingBasketCheckOut01' icon.
  static const IconData shoppingBasketCheckOut01 = HugeIconData(0x46fe);

  /// IconData for the 'strokeRoundedShoppingBasketCheckOut02' icon.
  static const IconData shoppingBasketCheckOut02 = HugeIconData(0x46ff);

  /// IconData for the 'strokeRoundedShoppingBasketCheckOut03' icon.
  static const IconData shoppingBasketCheckOut03 = HugeIconData(0x4700);

  /// IconData for the 'strokeRoundedShoppingBasketDone01' icon.
  static const IconData shoppingBasketDone01 = HugeIconData(0x4701);

  /// IconData for the 'strokeRoundedShoppingBasketDone02' icon.
  static const IconData shoppingBasketDone02 = HugeIconData(0x4702);

  /// IconData for the 'strokeRoundedShoppingBasketDone03' icon.
  static const IconData shoppingBasketDone03 = HugeIconData(0x4703);

  /// IconData for the 'strokeRoundedShoppingBasketFavorite01' icon.
  static const IconData shoppingBasketFavorite01 = HugeIconData(0x4704);

  /// IconData for the 'strokeRoundedShoppingBasketFavorite02' icon.
  static const IconData shoppingBasketFavorite02 = HugeIconData(0x4705);

  /// IconData for the 'strokeRoundedShoppingBasketFavorite03' icon.
  static const IconData shoppingBasketFavorite03 = HugeIconData(0x4706);

  /// IconData for the 'strokeRoundedShoppingBasketRemove01' icon.
  static const IconData shoppingBasketRemove01 = HugeIconData(0x4707);

  /// IconData for the 'strokeRoundedShoppingBasketRemove02' icon.
  static const IconData shoppingBasketRemove02 = HugeIconData(0x4708);

  /// IconData for the 'strokeRoundedShoppingBasketRemove03' icon.
  static const IconData shoppingBasketRemove03 = HugeIconData(0x4709);

  /// IconData for the 'strokeRoundedShoppingBasketSecure01' icon.
  static const IconData shoppingBasketSecure01 = HugeIconData(0x470a);

  /// IconData for the 'strokeRoundedShoppingBasketSecure02' icon.
  static const IconData shoppingBasketSecure02 = HugeIconData(0x470b);

  /// IconData for the 'strokeRoundedShoppingBasketSecure03' icon.
  static const IconData shoppingBasketSecure03 = HugeIconData(0x470c);

  /// IconData for the 'strokeRoundedShoppingCart01' icon.
  static const IconData shoppingCart01 = HugeIconData(0x470d);

  /// IconData for the 'strokeRoundedShoppingCart02' icon.
  static const IconData shoppingCart02 = HugeIconData(0x470e);

  /// IconData for the 'strokeRoundedShoppingCartAdd01' icon.
  static const IconData shoppingCartAdd01 = HugeIconData(0x470f);

  /// IconData for the 'strokeRoundedShoppingCartAdd02' icon.
  static const IconData shoppingCartAdd02 = HugeIconData(0x4710);

  /// IconData for the 'strokeRoundedShoppingCartCheck01' icon.
  static const IconData shoppingCartCheck01 = HugeIconData(0x4711);

  /// IconData for the 'strokeRoundedShoppingCartCheck02' icon.
  static const IconData shoppingCartCheck02 = HugeIconData(0x4712);

  /// IconData for the 'strokeRoundedShoppingCartCheckIn01' icon.
  static const IconData shoppingCartCheckIn01 = HugeIconData(0x4713);

  /// IconData for the 'strokeRoundedShoppingCartCheckIn02' icon.
  static const IconData shoppingCartCheckIn02 = HugeIconData(0x4714);

  /// IconData for the 'strokeRoundedShoppingCartCheckOut01' icon.
  static const IconData shoppingCartCheckOut01 = HugeIconData(0x4715);

  /// IconData for the 'strokeRoundedShoppingCartCheckOut02' icon.
  static const IconData shoppingCartCheckOut02 = HugeIconData(0x4716);

  /// IconData for the 'strokeRoundedShoppingCartFavorite01' icon.
  static const IconData shoppingCartFavorite01 = HugeIconData(0x4717);

  /// IconData for the 'strokeRoundedShoppingCartFavorite02' icon.
  static const IconData shoppingCartFavorite02 = HugeIconData(0x4718);

  /// IconData for the 'strokeRoundedShoppingCartRemove01' icon.
  static const IconData shoppingCartRemove01 = HugeIconData(0x4719);

  /// IconData for the 'strokeRoundedShoppingCartRemove02' icon.
  static const IconData shoppingCartRemove02 = HugeIconData(0x471a);

  /// IconData for the 'strokeRoundedShortsPants' icon.
  static const IconData shortsPants = HugeIconData(0x471b);

  /// IconData for the 'strokeRoundedShuffleSquare' icon.
  static const IconData shuffleSquare = HugeIconData(0x471c);

  /// IconData for the 'strokeRoundedShuffle' icon.
  static const IconData shuffle = HugeIconData(0x471d);

  /// IconData for the 'strokeRoundedShutterstock' icon.
  static const IconData shutterstock = HugeIconData(0x471e);

  /// IconData for the 'strokeRoundedSidebarBottom' icon.
  static const IconData sidebarBottom = HugeIconData(0x471f);

  /// IconData for the 'strokeRoundedSidebarLeft01' icon.
  static const IconData sidebarLeft01 = HugeIconData(0x4720);

  /// IconData for the 'strokeRoundedSidebarLeft' icon.
  static const IconData sidebarLeft = HugeIconData(0x4721);

  /// IconData for the 'strokeRoundedSidebarRight01' icon.
  static const IconData sidebarRight01 = HugeIconData(0x4722);

  /// IconData for the 'strokeRoundedSidebarRight' icon.
  static const IconData sidebarRight = HugeIconData(0x4723);

  /// IconData for the 'strokeRoundedSidebarTop' icon.
  static const IconData sidebarTop = HugeIconData(0x4724);

  /// IconData for the 'strokeRoundedSignLanguageC' icon.
  static const IconData signLanguageC = HugeIconData(0x4725);

  /// IconData for the 'strokeRoundedSignalFull01' icon.
  static const IconData signalFull01 = HugeIconData(0x4726);

  /// IconData for the 'strokeRoundedSignalFull02' icon.
  static const IconData signalFull02 = HugeIconData(0x4727);

  /// IconData for the 'strokeRoundedSignalLow01' icon.
  static const IconData signalLow01 = HugeIconData(0x4728);

  /// IconData for the 'strokeRoundedSignalLow02' icon.
  static const IconData signalLow02 = HugeIconData(0x4729);

  /// IconData for the 'strokeRoundedSignalLowMedium' icon.
  static const IconData signalLowMedium = HugeIconData(0x472a);

  /// IconData for the 'strokeRoundedSignalMedium01' icon.
  static const IconData signalMedium01 = HugeIconData(0x472b);

  /// IconData for the 'strokeRoundedSignalMedium02' icon.
  static const IconData signalMedium02 = HugeIconData(0x472c);

  /// IconData for the 'strokeRoundedSignalNo01' icon.
  static const IconData signalNo01 = HugeIconData(0x472d);

  /// IconData for the 'strokeRoundedSignalNo02' icon.
  static const IconData signalNo02 = HugeIconData(0x472e);

  /// IconData for the 'strokeRoundedSignal' icon.
  static const IconData signal = HugeIconData(0x472f);

  /// IconData for the 'strokeRoundedSignature' icon.
  static const IconData signature = HugeIconData(0x4730);

  /// IconData for the 'strokeRoundedSilence' icon.
  static const IconData silence = HugeIconData(0x4731);

  /// IconData for the 'strokeRoundedSimcard01' icon.
  static const IconData simcard01 = HugeIconData(0x4732);

  /// IconData for the 'strokeRoundedSimcard02' icon.
  static const IconData simcard02 = HugeIconData(0x4733);

  /// IconData for the 'strokeRoundedSimcardDual' icon.
  static const IconData simcardDual = HugeIconData(0x4734);

  /// IconData for the 'strokeRoundedSin' icon.
  static const IconData sin = HugeIconData(0x4735);

  /// IconData for the 'strokeRoundedSine01' icon.
  static const IconData sine01 = HugeIconData(0x4736);

  /// IconData for the 'strokeRoundedSine02' icon.
  static const IconData sine02 = HugeIconData(0x4737);

  /// IconData for the 'strokeRoundedSingLeft' icon.
  static const IconData singLeft = HugeIconData(0x4738);

  /// IconData for the 'strokeRoundedSingRight' icon.
  static const IconData singRight = HugeIconData(0x4739);

  /// IconData for the 'strokeRoundedSink01' icon.
  static const IconData sink01 = HugeIconData(0x473a);

  /// IconData for the 'strokeRoundedSink02' icon.
  static const IconData sink02 = HugeIconData(0x473b);

  /// IconData for the 'strokeRoundedSiri' icon.
  static const IconData siri = HugeIconData(0x473c);

  /// IconData for the 'strokeRoundedSketch' icon.
  static const IconData sketch = HugeIconData(0x473d);

  /// IconData for the 'strokeRoundedSkew' icon.
  static const IconData skew = HugeIconData(0x473e);

  /// IconData for the 'strokeRoundedSkiDiceFaces01' icon.
  static const IconData skiDiceFaces01 = HugeIconData(0x473f);

  /// IconData for the 'strokeRoundedSkippingRope' icon.
  static const IconData skippingRope = HugeIconData(0x4740);

  /// IconData for the 'strokeRoundedSkull' icon.
  static const IconData skull = HugeIconData(0x4741);

  /// IconData for the 'strokeRoundedSkype' icon.
  static const IconData skype = HugeIconData(0x4742);

  /// IconData for the 'strokeRoundedSlack' icon.
  static const IconData slack = HugeIconData(0x4743);

  /// IconData for the 'strokeRoundedSleeping' icon.
  static const IconData sleeping = HugeIconData(0x4744);

  /// IconData for the 'strokeRoundedSleeveless' icon.
  static const IconData sleeveless = HugeIconData(0x4745);

  /// IconData for the 'strokeRoundedSlidersHorizontal' icon.
  static const IconData slidersHorizontal = HugeIconData(0x4746);

  /// IconData for the 'strokeRoundedSlidersVertical' icon.
  static const IconData slidersVertical = HugeIconData(0x4747);

  /// IconData for the 'strokeRoundedSlideshare' icon.
  static const IconData slideshare = HugeIconData(0x4748);

  /// IconData for the 'strokeRoundedSlowWinds' icon.
  static const IconData slowWinds = HugeIconData(0x4749);

  /// IconData for the 'strokeRoundedSmartAc' icon.
  static const IconData smartAc = HugeIconData(0x474a);

  /// IconData for the 'strokeRoundedSmartPhone01' icon.
  static const IconData smartPhone01 = HugeIconData(0x474b);

  /// IconData for the 'strokeRoundedSmartPhone02' icon.
  static const IconData smartPhone02 = HugeIconData(0x474c);

  /// IconData for the 'strokeRoundedSmartPhone03' icon.
  static const IconData smartPhone03 = HugeIconData(0x474d);

  /// IconData for the 'strokeRoundedSmartPhone04' icon.
  static const IconData smartPhone04 = HugeIconData(0x474e);

  /// IconData for the 'strokeRoundedSmartPhoneLandscape' icon.
  static const IconData smartPhoneLandscape = HugeIconData(0x474f);

  /// IconData for the 'strokeRoundedSmartWatch01' icon.
  static const IconData smartWatch01 = HugeIconData(0x4750);

  /// IconData for the 'strokeRoundedSmartWatch02' icon.
  static const IconData smartWatch02 = HugeIconData(0x4751);

  /// IconData for the 'strokeRoundedSmartWatch03' icon.
  static const IconData smartWatch03 = HugeIconData(0x4752);

  /// IconData for the 'strokeRoundedSmartWatch04' icon.
  static const IconData smartWatch04 = HugeIconData(0x4753);

  /// IconData for the 'strokeRoundedSmart' icon.
  static const IconData smart = HugeIconData(0x4754);

  /// IconData for the 'strokeRoundedSmartphoneLostWifi' icon.
  static const IconData smartphoneLostWifi = HugeIconData(0x4755);

  /// IconData for the 'strokeRoundedSmartphoneWifi' icon.
  static const IconData smartphoneWifi = HugeIconData(0x4756);

  /// IconData for the 'strokeRoundedSmileDizzy' icon.
  static const IconData smileDizzy = HugeIconData(0x4757);

  /// IconData for the 'strokeRoundedSmile' icon.
  static const IconData smile = HugeIconData(0x4758);

  /// IconData for the 'strokeRoundedSmsCode' icon.
  static const IconData smsCode = HugeIconData(0x4759);

  /// IconData for the 'strokeRoundedSnail' icon.
  static const IconData snail = HugeIconData(0x475a);

  /// IconData for the 'strokeRoundedSnapchat' icon.
  static const IconData snapchat = HugeIconData(0x475b);

  /// IconData for the 'strokeRoundedSnow' icon.
  static const IconData snow = HugeIconData(0x475c);

  /// IconData for the 'strokeRoundedSodaCan' icon.
  static const IconData sodaCan = HugeIconData(0x475d);

  /// IconData for the 'strokeRoundedSofa01' icon.
  static const IconData sofa01 = HugeIconData(0x475e);

  /// IconData for the 'strokeRoundedSofa02' icon.
  static const IconData sofa02 = HugeIconData(0x475f);

  /// IconData for the 'strokeRoundedSofa03' icon.
  static const IconData sofa03 = HugeIconData(0x4760);

  /// IconData for the 'strokeRoundedSofaSingle' icon.
  static const IconData sofaSingle = HugeIconData(0x4761);

  /// IconData for the 'strokeRoundedSoftDrink01' icon.
  static const IconData softDrink01 = HugeIconData(0x4762);

  /// IconData for the 'strokeRoundedSoftDrink02' icon.
  static const IconData softDrink02 = HugeIconData(0x4763);

  /// IconData for the 'strokeRoundedSoftwareLicense' icon.
  static const IconData softwareLicense = HugeIconData(0x4764);

  /// IconData for the 'strokeRoundedSoftwareUninstall' icon.
  static const IconData softwareUninstall = HugeIconData(0x4765);

  /// IconData for the 'strokeRoundedSoftware' icon.
  static const IconData software = HugeIconData(0x4766);

  /// IconData for the 'strokeRoundedSoilMoistureField' icon.
  static const IconData soilMoistureField = HugeIconData(0x4767);

  /// IconData for the 'strokeRoundedSoilMoistureGlobal' icon.
  static const IconData soilMoistureGlobal = HugeIconData(0x4768);

  /// IconData for the 'strokeRoundedSoilTemperatureField' icon.
  static const IconData soilTemperatureField = HugeIconData(0x4769);

  /// IconData for the 'strokeRoundedSoilTemperatureGlobal' icon.
  static const IconData soilTemperatureGlobal = HugeIconData(0x476a);

  /// IconData for the 'strokeRoundedSolarEnergy' icon.
  static const IconData solarEnergy = HugeIconData(0x476b);

  /// IconData for the 'strokeRoundedSolarPanel01' icon.
  static const IconData solarPanel01 = HugeIconData(0x476c);

  /// IconData for the 'strokeRoundedSolarPanel02' icon.
  static const IconData solarPanel02 = HugeIconData(0x476d);

  /// IconData for the 'strokeRoundedSolarPanel03' icon.
  static const IconData solarPanel03 = HugeIconData(0x476e);

  /// IconData for the 'strokeRoundedSolarPanel04' icon.
  static const IconData solarPanel04 = HugeIconData(0x476f);

  /// IconData for the 'strokeRoundedSolarPanel05' icon.
  static const IconData solarPanel05 = HugeIconData(0x4770);

  /// IconData for the 'strokeRoundedSolarPower' icon.
  static const IconData solarPower = HugeIconData(0x4771);

  /// IconData for the 'strokeRoundedSolarSystem01' icon.
  static const IconData solarSystem01 = HugeIconData(0x4772);

  /// IconData for the 'strokeRoundedSolarSystem' icon.
  static const IconData solarSystem = HugeIconData(0x4773);

  /// IconData for the 'strokeRoundedSolidLine01' icon.
  static const IconData solidLine01 = HugeIconData(0x4774);

  /// IconData for the 'strokeRoundedSolidLine02' icon.
  static const IconData solidLine02 = HugeIconData(0x4775);

  /// IconData for the 'strokeRoundedSortByDown01' icon.
  static const IconData sortByDown01 = HugeIconData(0x4776);

  /// IconData for the 'strokeRoundedSortByDown02' icon.
  static const IconData sortByDown02 = HugeIconData(0x4777);

  /// IconData for the 'strokeRoundedSortByUp01' icon.
  static const IconData sortByUp01 = HugeIconData(0x4778);

  /// IconData for the 'strokeRoundedSortByUp02' icon.
  static const IconData sortByUp02 = HugeIconData(0x4779);

  /// IconData for the 'strokeRoundedSorting01' icon.
  static const IconData sorting01 = HugeIconData(0x477a);

  /// IconData for the 'strokeRoundedSorting02' icon.
  static const IconData sorting02 = HugeIconData(0x477b);

  /// IconData for the 'strokeRoundedSorting03' icon.
  static const IconData sorting03 = HugeIconData(0x477c);

  /// IconData for the 'strokeRoundedSorting04' icon.
  static const IconData sorting04 = HugeIconData(0x477d);

  /// IconData for the 'strokeRoundedSorting05' icon.
  static const IconData sorting05 = HugeIconData(0x477e);

  /// IconData for the 'strokeRoundedSorting19' icon.
  static const IconData sorting19 = HugeIconData(0x477f);

  /// IconData for the 'strokeRoundedSorting91' icon.
  static const IconData sorting91 = HugeIconData(0x4780);

  /// IconData for the 'strokeRoundedSortingAZ01' icon.
  static const IconData sortingAZ01 = HugeIconData(0x4781);

  /// IconData for the 'strokeRoundedSortingAZ02' icon.
  static const IconData sortingAZ02 = HugeIconData(0x4782);

  /// IconData for the 'strokeRoundedSortingDown' icon.
  static const IconData sortingDown = HugeIconData(0x4783);

  /// IconData for the 'strokeRoundedSortingUp' icon.
  static const IconData sortingUp = HugeIconData(0x4784);

  /// IconData for the 'strokeRoundedSortingZA01' icon.
  static const IconData sortingZA01 = HugeIconData(0x4785);

  /// IconData for the 'strokeRoundedSoundcloud' icon.
  static const IconData soundcloud = HugeIconData(0x4786);

  /// IconData for the 'strokeRoundedSourceCodeCircle' icon.
  static const IconData sourceCodeCircle = HugeIconData(0x4787);

  /// IconData for the 'strokeRoundedSourceCodeSquare' icon.
  static const IconData sourceCodeSquare = HugeIconData(0x4788);

  /// IconData for the 'strokeRoundedSourceCode' icon.
  static const IconData sourceCode = HugeIconData(0x4789);

  /// IconData for the 'strokeRoundedSpaceship' icon.
  static const IconData spaceship = HugeIconData(0x478a);

  /// IconData for the 'strokeRoundedSpades' icon.
  static const IconData spades = HugeIconData(0x478b);

  /// IconData for the 'strokeRoundedSpaghetti' icon.
  static const IconData spaghetti = HugeIconData(0x478c);

  /// IconData for the 'strokeRoundedSpam' icon.
  static const IconData spam = HugeIconData(0x478d);

  /// IconData for the 'strokeRoundedSparkles' icon.
  static const IconData sparkles = HugeIconData(0x478e);

  /// IconData for the 'strokeRoundedSpartanHelmet' icon.
  static const IconData spartanHelmet = HugeIconData(0x478f);

  /// IconData for the 'strokeRoundedSpatula' icon.
  static const IconData spatula = HugeIconData(0x4790);

  /// IconData for the 'strokeRoundedSpeaker01' icon.
  static const IconData speaker01 = HugeIconData(0x4791);

  /// IconData for the 'strokeRoundedSpeaker' icon.
  static const IconData speaker = HugeIconData(0x4792);

  /// IconData for the 'strokeRoundedSpeechToText' icon.
  static const IconData speechToText = HugeIconData(0x4793);

  /// IconData for the 'strokeRoundedSpeedTrain01' icon.
  static const IconData speedTrain01 = HugeIconData(0x4794);

  /// IconData for the 'strokeRoundedSpeedTrain02' icon.
  static const IconData speedTrain02 = HugeIconData(0x4795);

  /// IconData for the 'strokeRoundedSperm' icon.
  static const IconData sperm = HugeIconData(0x4796);

  /// IconData for the 'strokeRoundedSphere' icon.
  static const IconData sphere = HugeIconData(0x4797);

  /// IconData for the 'strokeRoundedSpirals' icon.
  static const IconData spirals = HugeIconData(0x4798);

  /// IconData for the 'strokeRoundedSpoonAndFork' icon.
  static const IconData spoonAndFork = HugeIconData(0x4799);

  /// IconData for the 'strokeRoundedSpoonAndKnife' icon.
  static const IconData spoonAndKnife = HugeIconData(0x479a);

  /// IconData for the 'strokeRoundedSpoon' icon.
  static const IconData spoon = HugeIconData(0x479b);

  /// IconData for the 'strokeRoundedSpotify' icon.
  static const IconData spotify = HugeIconData(0x479c);

  /// IconData for the 'strokeRoundedSql' icon.
  static const IconData sql = HugeIconData(0x479d);

  /// IconData for the 'strokeRoundedSquare01' icon.
  static const IconData square01 = HugeIconData(0x479e);

  /// IconData for the 'strokeRoundedSquareArrowDataTransferDiagonal' icon.
  static const IconData squareArrowDataTransferDiagonal = HugeIconData(0x479f);

  /// IconData for the 'strokeRoundedSquareArrowDataTransferHorizontal' icon.
  static const IconData squareArrowDataTransferHorizontal =
      HugeIconData(0x47a0);

  /// IconData for the 'strokeRoundedSquareArrowDataTransferVertical' icon.
  static const IconData squareArrowDataTransferVertical = HugeIconData(0x47a1);

  /// IconData for the 'strokeRoundedSquareArrowDiagonal01' icon.
  static const IconData squareArrowDiagonal01 = HugeIconData(0x47a2);

  /// IconData for the 'strokeRoundedSquareArrowDiagonal02' icon.
  static const IconData squareArrowDiagonal02 = HugeIconData(0x47a3);

  /// IconData for the 'strokeRoundedSquareArrowDown01' icon.
  static const IconData squareArrowDown01 = HugeIconData(0x47a4);

  /// IconData for the 'strokeRoundedSquareArrowDown02' icon.
  static const IconData squareArrowDown02 = HugeIconData(0x47a5);

  /// IconData for the 'strokeRoundedSquareArrowDown03' icon.
  static const IconData squareArrowDown03 = HugeIconData(0x47a6);

  /// IconData for the 'strokeRoundedSquareArrowDownDouble' icon.
  static const IconData squareArrowDownDouble = HugeIconData(0x47a7);

  /// IconData for the 'strokeRoundedSquareArrowDownLeft' icon.
  static const IconData squareArrowDownLeft = HugeIconData(0x47a8);

  /// IconData for the 'strokeRoundedSquareArrowDownRight' icon.
  static const IconData squareArrowDownRight = HugeIconData(0x47a9);

  /// IconData for the 'strokeRoundedSquareArrowExpand01' icon.
  static const IconData squareArrowExpand01 = HugeIconData(0x47aa);

  /// IconData for the 'strokeRoundedSquareArrowExpand02' icon.
  static const IconData squareArrowExpand02 = HugeIconData(0x47ab);

  /// IconData for the 'strokeRoundedSquareArrowHorizontal' icon.
  static const IconData squareArrowHorizontal = HugeIconData(0x47ac);

  /// IconData for the 'strokeRoundedSquareArrowLeft01' icon.
  static const IconData squareArrowLeft01 = HugeIconData(0x47ad);

  /// IconData for the 'strokeRoundedSquareArrowLeft02' icon.
  static const IconData squareArrowLeft02 = HugeIconData(0x47ae);

  /// IconData for the 'strokeRoundedSquareArrowLeft03' icon.
  static const IconData squareArrowLeft03 = HugeIconData(0x47af);

  /// IconData for the 'strokeRoundedSquareArrowLeftDouble' icon.
  static const IconData squareArrowLeftDouble = HugeIconData(0x47b0);

  /// IconData for the 'strokeRoundedSquareArrowLeftRight' icon.
  static const IconData squareArrowLeftRight = HugeIconData(0x47b1);

  /// IconData for the 'strokeRoundedSquareArrowMoveDownLeft' icon.
  static const IconData squareArrowMoveDownLeft = HugeIconData(0x47b2);

  /// IconData for the 'strokeRoundedSquareArrowMoveDownRight' icon.
  static const IconData squareArrowMoveDownRight = HugeIconData(0x47b3);

  /// IconData for the 'strokeRoundedSquareArrowMoveLeftDown' icon.
  static const IconData squareArrowMoveLeftDown = HugeIconData(0x47b4);

  /// IconData for the 'strokeRoundedSquareArrowMoveLeftUp' icon.
  static const IconData squareArrowMoveLeftUp = HugeIconData(0x47b5);

  /// IconData for the 'strokeRoundedSquareArrowMoveRightDown' icon.
  static const IconData squareArrowMoveRightDown = HugeIconData(0x47b6);

  /// IconData for the 'strokeRoundedSquareArrowMoveRightUp' icon.
  static const IconData squareArrowMoveRightUp = HugeIconData(0x47b7);

  /// IconData for the 'strokeRoundedSquareArrowReload01' icon.
  static const IconData squareArrowReload01 = HugeIconData(0x47b8);

  /// IconData for the 'strokeRoundedSquareArrowReload02' icon.
  static const IconData squareArrowReload02 = HugeIconData(0x47b9);

  /// IconData for the 'strokeRoundedSquareArrowRight01' icon.
  static const IconData squareArrowRight01 = HugeIconData(0x47ba);

  /// IconData for the 'strokeRoundedSquareArrowRight02' icon.
  static const IconData squareArrowRight02 = HugeIconData(0x47bb);

  /// IconData for the 'strokeRoundedSquareArrowRight03' icon.
  static const IconData squareArrowRight03 = HugeIconData(0x47bc);

  /// IconData for the 'strokeRoundedSquareArrowRightDouble' icon.
  static const IconData squareArrowRightDouble = HugeIconData(0x47bd);

  /// IconData for the 'strokeRoundedSquareArrowShrink01' icon.
  static const IconData squareArrowShrink01 = HugeIconData(0x47be);

  /// IconData for the 'strokeRoundedSquareArrowShrink02' icon.
  static const IconData squareArrowShrink02 = HugeIconData(0x47bf);

  /// IconData for the 'strokeRoundedSquareArrowUp01' icon.
  static const IconData squareArrowUp01 = HugeIconData(0x47c0);

  /// IconData for the 'strokeRoundedSquareArrowUp02' icon.
  static const IconData squareArrowUp02 = HugeIconData(0x47c1);

  /// IconData for the 'strokeRoundedSquareArrowUp03' icon.
  static const IconData squareArrowUp03 = HugeIconData(0x47c2);

  /// IconData for the 'strokeRoundedSquareArrowUpDouble' icon.
  static const IconData squareArrowUpDouble = HugeIconData(0x47c3);

  /// IconData for the 'strokeRoundedSquareArrowUpDown' icon.
  static const IconData squareArrowUpDown = HugeIconData(0x47c4);

  /// IconData for the 'strokeRoundedSquareArrowUpLeft' icon.
  static const IconData squareArrowUpLeft = HugeIconData(0x47c5);

  /// IconData for the 'strokeRoundedSquareArrowUpRight' icon.
  static const IconData squareArrowUpRight = HugeIconData(0x47c6);

  /// IconData for the 'strokeRoundedSquareArrowVertical' icon.
  static const IconData squareArrowVertical = HugeIconData(0x47c7);

  /// IconData for the 'strokeRoundedSquareCircle' icon.
  static const IconData squareCircle = HugeIconData(0x47c8);

  /// IconData for the 'strokeRoundedSquareLock01' icon.
  static const IconData squareLock01 = HugeIconData(0x47c9);

  /// IconData for the 'strokeRoundedSquareLock02' icon.
  static const IconData squareLock02 = HugeIconData(0x47ca);

  /// IconData for the 'strokeRoundedSquareLockAdd01' icon.
  static const IconData squareLockAdd01 = HugeIconData(0x47cb);

  /// IconData for the 'strokeRoundedSquareLockAdd02' icon.
  static const IconData squareLockAdd02 = HugeIconData(0x47cc);

  /// IconData for the 'strokeRoundedSquareLockCheck01' icon.
  static const IconData squareLockCheck01 = HugeIconData(0x47cd);

  /// IconData for the 'strokeRoundedSquareLockCheck02' icon.
  static const IconData squareLockCheck02 = HugeIconData(0x47ce);

  /// IconData for the 'strokeRoundedSquareLockMinus01' icon.
  static const IconData squareLockMinus01 = HugeIconData(0x47cf);

  /// IconData for the 'strokeRoundedSquareLockMinus02' icon.
  static const IconData squareLockMinus02 = HugeIconData(0x47d0);

  /// IconData for the 'strokeRoundedSquareLockPassword' icon.
  static const IconData squareLockPassword = HugeIconData(0x47d1);

  /// IconData for the 'strokeRoundedSquareLockRemove01' icon.
  static const IconData squareLockRemove01 = HugeIconData(0x47d2);

  /// IconData for the 'strokeRoundedSquareLockRemove02' icon.
  static const IconData squareLockRemove02 = HugeIconData(0x47d3);

  /// IconData for the 'strokeRoundedSquareRootSquare' icon.
  static const IconData squareRootSquare = HugeIconData(0x47d4);

  /// IconData for the 'strokeRoundedSquareSquare' icon.
  static const IconData squareSquare = HugeIconData(0x47d5);

  /// IconData for the 'strokeRoundedSquareUnlock01' icon.
  static const IconData squareUnlock01 = HugeIconData(0x47d6);

  /// IconData for the 'strokeRoundedSquareUnlock02' icon.
  static const IconData squareUnlock02 = HugeIconData(0x47d7);

  /// IconData for the 'strokeRoundedSquare' icon.
  static const IconData square = HugeIconData(0x47d8);

  /// IconData for the 'strokeRoundedStackStar' icon.
  static const IconData stackStar = HugeIconData(0x47d9);

  /// IconData for the 'strokeRoundedStake' icon.
  static const IconData stake = HugeIconData(0x47da);

  /// IconData for the 'strokeRoundedStamp01' icon.
  static const IconData stamp01 = HugeIconData(0x47db);

  /// IconData for the 'strokeRoundedStamp02' icon.
  static const IconData stamp02 = HugeIconData(0x47dc);

  /// IconData for the 'strokeRoundedStamp' icon.
  static const IconData stamp = HugeIconData(0x47dd);

  /// IconData for the 'strokeRoundedStarCircle' icon.
  static const IconData starCircle = HugeIconData(0x47de);

  /// IconData for the 'strokeRoundedStarFace' icon.
  static const IconData starFace = HugeIconData(0x47df);

  /// IconData for the 'strokeRoundedStarHalf' icon.
  static const IconData starHalf = HugeIconData(0x47e0);

  /// IconData for the 'strokeRoundedStarOff' icon.
  static const IconData starOff = HugeIconData(0x47e1);

  /// IconData for the 'strokeRoundedStarSquare' icon.
  static const IconData starSquare = HugeIconData(0x47e2);

  /// IconData for the 'strokeRoundedStar' icon.
  static const IconData star = HugeIconData(0x47e3);

  /// IconData for the 'strokeRoundedStars' icon.
  static const IconData stars = HugeIconData(0x47e4);

  /// IconData for the 'strokeRoundedStartUp01' icon.
  static const IconData startUp01 = HugeIconData(0x47e5);

  /// IconData for the 'strokeRoundedStartUp02' icon.
  static const IconData startUp02 = HugeIconData(0x47e6);

  /// IconData for the 'strokeRoundedStationery' icon.
  static const IconData stationery = HugeIconData(0x47e7);

  /// IconData for the 'strokeRoundedSteak' icon.
  static const IconData steak = HugeIconData(0x47e8);

  /// IconData for the 'strokeRoundedSteering' icon.
  static const IconData steering = HugeIconData(0x47e9);

  /// IconData for the 'strokeRoundedStepInto' icon.
  static const IconData stepInto = HugeIconData(0x47ea);

  /// IconData for the 'strokeRoundedStepOut' icon.
  static const IconData stepOut = HugeIconData(0x47eb);

  /// IconData for the 'strokeRoundedStepOver' icon.
  static const IconData stepOver = HugeIconData(0x47ec);

  /// IconData for the 'strokeRoundedStethoscope02' icon.
  static const IconData stethoscope02 = HugeIconData(0x47ed);

  /// IconData for the 'strokeRoundedStethoscope' icon.
  static const IconData stethoscope = HugeIconData(0x47ee);

  /// IconData for the 'strokeRoundedStickyNote01' icon.
  static const IconData stickyNote01 = HugeIconData(0x47ef);

  /// IconData for the 'strokeRoundedStickyNote02' icon.
  static const IconData stickyNote02 = HugeIconData(0x47f0);

  /// IconData for the 'strokeRoundedStopWatch' icon.
  static const IconData stopWatch = HugeIconData(0x47f1);

  /// IconData for the 'strokeRoundedStop' icon.
  static const IconData stop = HugeIconData(0x47f2);

  /// IconData for the 'strokeRoundedStore01' icon.
  static const IconData store01 = HugeIconData(0x47f3);

  /// IconData for the 'strokeRoundedStore02' icon.
  static const IconData store02 = HugeIconData(0x47f4);

  /// IconData for the 'strokeRoundedStore03' icon.
  static const IconData store03 = HugeIconData(0x47f5);

  /// IconData for the 'strokeRoundedStore04' icon.
  static const IconData store04 = HugeIconData(0x47f6);

  /// IconData for the 'strokeRoundedStoreAdd01' icon.
  static const IconData storeAdd01 = HugeIconData(0x47f7);

  /// IconData for the 'strokeRoundedStoreAdd02' icon.
  static const IconData storeAdd02 = HugeIconData(0x47f8);

  /// IconData for the 'strokeRoundedStoreLocation01' icon.
  static const IconData storeLocation01 = HugeIconData(0x47f9);

  /// IconData for the 'strokeRoundedStoreLocation02' icon.
  static const IconData storeLocation02 = HugeIconData(0x47fa);

  /// IconData for the 'strokeRoundedStoreRemove01' icon.
  static const IconData storeRemove01 = HugeIconData(0x47fb);

  /// IconData for the 'strokeRoundedStoreRemove02' icon.
  static const IconData storeRemove02 = HugeIconData(0x47fc);

  /// IconData for the 'strokeRoundedStoreVerified01' icon.
  static const IconData storeVerified01 = HugeIconData(0x47fd);

  /// IconData for the 'strokeRoundedStoreVerified02' icon.
  static const IconData storeVerified02 = HugeIconData(0x47fe);

  /// IconData for the 'strokeRoundedStraightEdge' icon.
  static const IconData straightEdge = HugeIconData(0x47ff);

  /// IconData for the 'strokeRoundedStrategy' icon.
  static const IconData strategy = HugeIconData(0x4800);

  /// IconData for the 'strokeRoundedStrokeBottom' icon.
  static const IconData strokeBottom = HugeIconData(0x4801);

  /// IconData for the 'strokeRoundedStrokeCenter' icon.
  static const IconData strokeCenter = HugeIconData(0x4802);

  /// IconData for the 'strokeRoundedStrokeInside' icon.
  static const IconData strokeInside = HugeIconData(0x4803);

  /// IconData for the 'strokeRoundedStrokeLeft' icon.
  static const IconData strokeLeft = HugeIconData(0x4804);

  /// IconData for the 'strokeRoundedStrokeOutside' icon.
  static const IconData strokeOutside = HugeIconData(0x4805);

  /// IconData for the 'strokeRoundedStrokeRight' icon.
  static const IconData strokeRight = HugeIconData(0x4806);

  /// IconData for the 'strokeRoundedStrokeTop' icon.
  static const IconData strokeTop = HugeIconData(0x4807);

  /// IconData for the 'strokeRoundedStructure01' icon.
  static const IconData structure01 = HugeIconData(0x4808);

  /// IconData for the 'strokeRoundedStructure02' icon.
  static const IconData structure02 = HugeIconData(0x4809);

  /// IconData for the 'strokeRoundedStructure03' icon.
  static const IconData structure03 = HugeIconData(0x480a);

  /// IconData for the 'strokeRoundedStructure04' icon.
  static const IconData structure04 = HugeIconData(0x480b);

  /// IconData for the 'strokeRoundedStructure05' icon.
  static const IconData structure05 = HugeIconData(0x480c);

  /// IconData for the 'strokeRoundedStructureAdd' icon.
  static const IconData structureAdd = HugeIconData(0x480d);

  /// IconData for the 'strokeRoundedStructureCheck' icon.
  static const IconData structureCheck = HugeIconData(0x480e);

  /// IconData for the 'strokeRoundedStructureFail' icon.
  static const IconData structureFail = HugeIconData(0x480f);

  /// IconData for the 'strokeRoundedStructureFolderCircle' icon.
  static const IconData structureFolderCircle = HugeIconData(0x4810);

  /// IconData for the 'strokeRoundedStructureFolder' icon.
  static const IconData structureFolder = HugeIconData(0x4811);

  /// IconData for the 'strokeRoundedStudentCard' icon.
  static const IconData studentCard = HugeIconData(0x4812);

  /// IconData for the 'strokeRoundedStudent' icon.
  static const IconData student = HugeIconData(0x4813);

  /// IconData for the 'strokeRoundedStudents' icon.
  static const IconData students = HugeIconData(0x4814);

  /// IconData for the 'strokeRoundedStudyDesk' icon.
  static const IconData studyDesk = HugeIconData(0x4815);

  /// IconData for the 'strokeRoundedStudyLamp' icon.
  static const IconData studyLamp = HugeIconData(0x4816);

  /// IconData for the 'strokeRoundedStumbleupon' icon.
  static const IconData stumbleupon = HugeIconData(0x4817);

  /// IconData for the 'strokeRoundedSubmarine' icon.
  static const IconData submarine = HugeIconData(0x4818);

  /// IconData for the 'strokeRoundedSubmerge' icon.
  static const IconData submerge = HugeIconData(0x4819);

  /// IconData for the 'strokeRoundedSubnodeAdd' icon.
  static const IconData subnodeAdd = HugeIconData(0x481a);

  /// IconData for the 'strokeRoundedSubnodeDelete' icon.
  static const IconData subnodeDelete = HugeIconData(0x481b);

  /// IconData for the 'strokeRoundedSubpoena' icon.
  static const IconData subpoena = HugeIconData(0x481c);

  /// IconData for the 'strokeRoundedSubtitle' icon.
  static const IconData subtitle = HugeIconData(0x481d);

  /// IconData for the 'strokeRoundedSuit01' icon.
  static const IconData suit01 = HugeIconData(0x481e);

  /// IconData for the 'strokeRoundedSuit02' icon.
  static const IconData suit02 = HugeIconData(0x481f);

  /// IconData for the 'strokeRoundedSujood' icon.
  static const IconData sujood = HugeIconData(0x4820);

  /// IconData for the 'strokeRoundedSummation01' icon.
  static const IconData summation01 = HugeIconData(0x4821);

  /// IconData for the 'strokeRoundedSummation02' icon.
  static const IconData summation02 = HugeIconData(0x4822);

  /// IconData for the 'strokeRoundedSummationCircle' icon.
  static const IconData summationCircle = HugeIconData(0x4823);

  /// IconData for the 'strokeRoundedSummationSquare' icon.
  static const IconData summationSquare = HugeIconData(0x4824);

  /// IconData for the 'strokeRoundedSun01' icon.
  static const IconData sun01 = HugeIconData(0x4825);

  /// IconData for the 'strokeRoundedSun02' icon.
  static const IconData sun02 = HugeIconData(0x4826);

  /// IconData for the 'strokeRoundedSun03' icon.
  static const IconData sun03 = HugeIconData(0x4827);

  /// IconData for the 'strokeRoundedSunCloud01' icon.
  static const IconData sunCloud01 = HugeIconData(0x4828);

  /// IconData for the 'strokeRoundedSunCloud02' icon.
  static const IconData sunCloud02 = HugeIconData(0x4829);

  /// IconData for the 'strokeRoundedSunCloudAngledRain01' icon.
  static const IconData sunCloudAngledRain01 = HugeIconData(0x482a);

  /// IconData for the 'strokeRoundedSunCloudAngledRain02' icon.
  static const IconData sunCloudAngledRain02 = HugeIconData(0x482b);

  /// IconData for the 'strokeRoundedSunCloudAngledRainZap01' icon.
  static const IconData sunCloudAngledRainZap01 = HugeIconData(0x482c);

  /// IconData for the 'strokeRoundedSunCloudAngledRainZap02' icon.
  static const IconData sunCloudAngledRainZap02 = HugeIconData(0x482d);

  /// IconData for the 'strokeRoundedSunCloudAngledZap01' icon.
  static const IconData sunCloudAngledZap01 = HugeIconData(0x482e);

  /// IconData for the 'strokeRoundedSunCloudAngledZap02' icon.
  static const IconData sunCloudAngledZap02 = HugeIconData(0x482f);

  /// IconData for the 'strokeRoundedSunCloudBigRain01' icon.
  static const IconData sunCloudBigRain01 = HugeIconData(0x4830);

  /// IconData for the 'strokeRoundedSunCloudBigRain02' icon.
  static const IconData sunCloudBigRain02 = HugeIconData(0x4831);

  /// IconData for the 'strokeRoundedSunCloudFastWind01' icon.
  static const IconData sunCloudFastWind01 = HugeIconData(0x4832);

  /// IconData for the 'strokeRoundedSunCloudFastWind02' icon.
  static const IconData sunCloudFastWind02 = HugeIconData(0x4833);

  /// IconData for the 'strokeRoundedSunCloudHailstone01' icon.
  static const IconData sunCloudHailstone01 = HugeIconData(0x4834);

  /// IconData for the 'strokeRoundedSunCloudHailstone02' icon.
  static const IconData sunCloudHailstone02 = HugeIconData(0x4835);

  /// IconData for the 'strokeRoundedSunCloudLittleRain01' icon.
  static const IconData sunCloudLittleRain01 = HugeIconData(0x4836);

  /// IconData for the 'strokeRoundedSunCloudLittleRain02' icon.
  static const IconData sunCloudLittleRain02 = HugeIconData(0x4837);

  /// IconData for the 'strokeRoundedSunCloudLittleSnow01' icon.
  static const IconData sunCloudLittleSnow01 = HugeIconData(0x4838);

  /// IconData for the 'strokeRoundedSunCloudLittleSnow02' icon.
  static const IconData sunCloudLittleSnow02 = HugeIconData(0x4839);

  /// IconData for the 'strokeRoundedSunCloudMidRain01' icon.
  static const IconData sunCloudMidRain01 = HugeIconData(0x483a);

  /// IconData for the 'strokeRoundedSunCloudMidRain02' icon.
  static const IconData sunCloudMidRain02 = HugeIconData(0x483b);

  /// IconData for the 'strokeRoundedSunCloudMidSnow01' icon.
  static const IconData sunCloudMidSnow01 = HugeIconData(0x483c);

  /// IconData for the 'strokeRoundedSunCloudMidSnow02' icon.
  static const IconData sunCloudMidSnow02 = HugeIconData(0x483d);

  /// IconData for the 'strokeRoundedSunCloudSlowWind01' icon.
  static const IconData sunCloudSlowWind01 = HugeIconData(0x483e);

  /// IconData for the 'strokeRoundedSunCloudSlowWind02' icon.
  static const IconData sunCloudSlowWind02 = HugeIconData(0x483f);

  /// IconData for the 'strokeRoundedSunCloudSnow01' icon.
  static const IconData sunCloudSnow01 = HugeIconData(0x4840);

  /// IconData for the 'strokeRoundedSunCloudSnow02' icon.
  static const IconData sunCloudSnow02 = HugeIconData(0x4841);

  /// IconData for the 'strokeRoundedSunglasses' icon.
  static const IconData sunglasses = HugeIconData(0x4842);

  /// IconData for the 'strokeRoundedSunrise' icon.
  static const IconData sunrise = HugeIconData(0x4843);

  /// IconData for the 'strokeRoundedSunset' icon.
  static const IconData sunset = HugeIconData(0x4844);

  /// IconData for the 'strokeRoundedSuperMarioToad' icon.
  static const IconData superMarioToad = HugeIconData(0x4845);

  /// IconData for the 'strokeRoundedSuperMario' icon.
  static const IconData superMario = HugeIconData(0x4846);

  /// IconData for the 'strokeRoundedSurfboard' icon.
  static const IconData surfboard = HugeIconData(0x4847);

  /// IconData for the 'strokeRoundedSurprise' icon.
  static const IconData surprise = HugeIconData(0x4848);

  /// IconData for the 'strokeRoundedSushi01' icon.
  static const IconData sushi01 = HugeIconData(0x4849);

  /// IconData for the 'strokeRoundedSushi02' icon.
  static const IconData sushi02 = HugeIconData(0x484a);

  /// IconData for the 'strokeRoundedSushi03' icon.
  static const IconData sushi03 = HugeIconData(0x484b);

  /// IconData for the 'strokeRoundedSuspicious' icon.
  static const IconData suspicious = HugeIconData(0x484c);

  /// IconData for the 'strokeRoundedSustainableEnergy' icon.
  static const IconData sustainableEnergy = HugeIconData(0x484d);

  /// IconData for the 'strokeRoundedSvg01' icon.
  static const IconData svg01 = HugeIconData(0x484e);

  /// IconData for the 'strokeRoundedSvg02' icon.
  static const IconData svg02 = HugeIconData(0x484f);

  /// IconData for the 'strokeRoundedSwarm' icon.
  static const IconData swarm = HugeIconData(0x4850);

  /// IconData for the 'strokeRoundedSwatch' icon.
  static const IconData swatch = HugeIconData(0x4851);

  /// IconData for the 'strokeRoundedSwimmingCap' icon.
  static const IconData swimmingCap = HugeIconData(0x4852);

  /// IconData for the 'strokeRoundedSwimming' icon.
  static const IconData swimming = HugeIconData(0x4853);

  /// IconData for the 'strokeRoundedSwipeDown01' icon.
  static const IconData swipeDown01 = HugeIconData(0x4854);

  /// IconData for the 'strokeRoundedSwipeDown02' icon.
  static const IconData swipeDown02 = HugeIconData(0x4855);

  /// IconData for the 'strokeRoundedSwipeDown03' icon.
  static const IconData swipeDown03 = HugeIconData(0x4856);

  /// IconData for the 'strokeRoundedSwipeDown04' icon.
  static const IconData swipeDown04 = HugeIconData(0x4857);

  /// IconData for the 'strokeRoundedSwipeDown05' icon.
  static const IconData swipeDown05 = HugeIconData(0x4858);

  /// IconData for the 'strokeRoundedSwipeDown06' icon.
  static const IconData swipeDown06 = HugeIconData(0x4859);

  /// IconData for the 'strokeRoundedSwipeDown07' icon.
  static const IconData swipeDown07 = HugeIconData(0x485a);

  /// IconData for the 'strokeRoundedSwipeDown08' icon.
  static const IconData swipeDown08 = HugeIconData(0x485b);

  /// IconData for the 'strokeRoundedSwipeLeft01' icon.
  static const IconData swipeLeft01 = HugeIconData(0x485c);

  /// IconData for the 'strokeRoundedSwipeLeft02' icon.
  static const IconData swipeLeft02 = HugeIconData(0x485d);

  /// IconData for the 'strokeRoundedSwipeLeft03' icon.
  static const IconData swipeLeft03 = HugeIconData(0x485e);

  /// IconData for the 'strokeRoundedSwipeLeft04' icon.
  static const IconData swipeLeft04 = HugeIconData(0x485f);

  /// IconData for the 'strokeRoundedSwipeLeft05' icon.
  static const IconData swipeLeft05 = HugeIconData(0x4860);

  /// IconData for the 'strokeRoundedSwipeLeft06' icon.
  static const IconData swipeLeft06 = HugeIconData(0x4861);

  /// IconData for the 'strokeRoundedSwipeLeft07' icon.
  static const IconData swipeLeft07 = HugeIconData(0x4862);

  /// IconData for the 'strokeRoundedSwipeLeft08' icon.
  static const IconData swipeLeft08 = HugeIconData(0x4863);

  /// IconData for the 'strokeRoundedSwipeLeft09' icon.
  static const IconData swipeLeft09 = HugeIconData(0x4864);

  /// IconData for the 'strokeRoundedSwipeRight01' icon.
  static const IconData swipeRight01 = HugeIconData(0x4865);

  /// IconData for the 'strokeRoundedSwipeRight02' icon.
  static const IconData swipeRight02 = HugeIconData(0x4866);

  /// IconData for the 'strokeRoundedSwipeRight03' icon.
  static const IconData swipeRight03 = HugeIconData(0x4867);

  /// IconData for the 'strokeRoundedSwipeRight04' icon.
  static const IconData swipeRight04 = HugeIconData(0x4868);

  /// IconData for the 'strokeRoundedSwipeRight05' icon.
  static const IconData swipeRight05 = HugeIconData(0x4869);

  /// IconData for the 'strokeRoundedSwipeRight06' icon.
  static const IconData swipeRight06 = HugeIconData(0x486a);

  /// IconData for the 'strokeRoundedSwipeRight07' icon.
  static const IconData swipeRight07 = HugeIconData(0x486b);

  /// IconData for the 'strokeRoundedSwipeRight08' icon.
  static const IconData swipeRight08 = HugeIconData(0x486c);

  /// IconData for the 'strokeRoundedSwipeRight09' icon.
  static const IconData swipeRight09 = HugeIconData(0x486d);

  /// IconData for the 'strokeRoundedSwipeUp01' icon.
  static const IconData swipeUp01 = HugeIconData(0x486e);

  /// IconData for the 'strokeRoundedSwipeUp02' icon.
  static const IconData swipeUp02 = HugeIconData(0x486f);

  /// IconData for the 'strokeRoundedSwipeUp03' icon.
  static const IconData swipeUp03 = HugeIconData(0x4870);

  /// IconData for the 'strokeRoundedSwipeUp04' icon.
  static const IconData swipeUp04 = HugeIconData(0x4871);

  /// IconData for the 'strokeRoundedSwipeUp05' icon.
  static const IconData swipeUp05 = HugeIconData(0x4872);

  /// IconData for the 'strokeRoundedSwipeUp06' icon.
  static const IconData swipeUp06 = HugeIconData(0x4873);

  /// IconData for the 'strokeRoundedSwipeUp07' icon.
  static const IconData swipeUp07 = HugeIconData(0x4874);

  /// IconData for the 'strokeRoundedSwipeUp08' icon.
  static const IconData swipeUp08 = HugeIconData(0x4875);

  /// IconData for the 'strokeRoundedSword01' icon.
  static const IconData sword01 = HugeIconData(0x4876);

  /// IconData for the 'strokeRoundedSword02' icon.
  static const IconData sword02 = HugeIconData(0x4877);

  /// IconData for the 'strokeRoundedSword03' icon.
  static const IconData sword03 = HugeIconData(0x4878);

  /// IconData for the 'strokeRoundedSystemUpdate01' icon.
  static const IconData systemUpdate01 = HugeIconData(0x4879);

  /// IconData for the 'strokeRoundedSystemUpdate02' icon.
  static const IconData systemUpdate02 = HugeIconData(0x487a);

  /// IconData for the 'strokeRoundedTShirt' icon.
  static const IconData tShirt = HugeIconData(0x487b);

  /// IconData for the 'strokeRoundedTable01' icon.
  static const IconData table01 = HugeIconData(0x487c);

  /// IconData for the 'strokeRoundedTable02' icon.
  static const IconData table02 = HugeIconData(0x487d);

  /// IconData for the 'strokeRoundedTable03' icon.
  static const IconData table03 = HugeIconData(0x487e);

  /// IconData for the 'strokeRoundedTableLamp01' icon.
  static const IconData tableLamp01 = HugeIconData(0x487f);

  /// IconData for the 'strokeRoundedTableLamp02' icon.
  static const IconData tableLamp02 = HugeIconData(0x4880);

  /// IconData for the 'strokeRoundedTableRound' icon.
  static const IconData tableRound = HugeIconData(0x4881);

  /// IconData for the 'strokeRoundedTableTennisBat' icon.
  static const IconData tableTennisBat = HugeIconData(0x4882);

  /// IconData for the 'strokeRoundedTable' icon.
  static const IconData table = HugeIconData(0x4883);

  /// IconData for the 'strokeRoundedTablet01' icon.
  static const IconData tablet01 = HugeIconData(0x4884);

  /// IconData for the 'strokeRoundedTablet02' icon.
  static const IconData tablet02 = HugeIconData(0x4885);

  /// IconData for the 'strokeRoundedTabletConnectedBluetooth' icon.
  static const IconData tabletConnectedBluetooth = HugeIconData(0x4886);

  /// IconData for the 'strokeRoundedTabletConnectedUsb' icon.
  static const IconData tabletConnectedUsb = HugeIconData(0x4887);

  /// IconData for the 'strokeRoundedTabletConnectedWifi' icon.
  static const IconData tabletConnectedWifi = HugeIconData(0x4888);

  /// IconData for the 'strokeRoundedTabletPen' icon.
  static const IconData tabletPen = HugeIconData(0x4889);

  /// IconData for the 'strokeRoundedTaco01' icon.
  static const IconData taco01 = HugeIconData(0x488a);

  /// IconData for the 'strokeRoundedTaco02' icon.
  static const IconData taco02 = HugeIconData(0x488b);

  /// IconData for the 'strokeRoundedTag01' icon.
  static const IconData tag01 = HugeIconData(0x488c);

  /// IconData for the 'strokeRoundedTag02' icon.
  static const IconData tag02 = HugeIconData(0x488d);

  /// IconData for the 'strokeRoundedTags' icon.
  static const IconData tags = HugeIconData(0x488e);

  /// IconData for the 'strokeRoundedTajMahal' icon.
  static const IconData tajMahal = HugeIconData(0x488f);

  /// IconData for the 'strokeRoundedTan' icon.
  static const IconData tan = HugeIconData(0x4890);

  /// IconData for the 'strokeRoundedTankTop' icon.
  static const IconData tankTop = HugeIconData(0x4891);

  /// IconData for the 'strokeRoundedTap01' icon.
  static const IconData tap01 = HugeIconData(0x4892);

  /// IconData for the 'strokeRoundedTap02' icon.
  static const IconData tap02 = HugeIconData(0x4893);

  /// IconData for the 'strokeRoundedTap03' icon.
  static const IconData tap03 = HugeIconData(0x4894);

  /// IconData for the 'strokeRoundedTap04' icon.
  static const IconData tap04 = HugeIconData(0x4895);

  /// IconData for the 'strokeRoundedTap05' icon.
  static const IconData tap05 = HugeIconData(0x4896);

  /// IconData for the 'strokeRoundedTap06' icon.
  static const IconData tap06 = HugeIconData(0x4897);

  /// IconData for the 'strokeRoundedTap07' icon.
  static const IconData tap07 = HugeIconData(0x4898);

  /// IconData for the 'strokeRoundedTap08' icon.
  static const IconData tap08 = HugeIconData(0x4899);

  /// IconData for the 'strokeRoundedTapeMeasure' icon.
  static const IconData tapeMeasure = HugeIconData(0x489a);

  /// IconData for the 'strokeRoundedTarget01' icon.
  static const IconData target01 = HugeIconData(0x489b);

  /// IconData for the 'strokeRoundedTarget02' icon.
  static const IconData target02 = HugeIconData(0x489c);

  /// IconData for the 'strokeRoundedTarget03' icon.
  static const IconData target03 = HugeIconData(0x489d);

  /// IconData for the 'strokeRoundedTargetDollar' icon.
  static const IconData targetDollar = HugeIconData(0x489e);

  /// IconData for the 'strokeRoundedTasbih' icon.
  static const IconData tasbih = HugeIconData(0x489f);

  /// IconData for the 'strokeRoundedTask01' icon.
  static const IconData task01 = HugeIconData(0x48a0);

  /// IconData for the 'strokeRoundedTask02' icon.
  static const IconData task02 = HugeIconData(0x48a1);

  /// IconData for the 'strokeRoundedTaskAdd01' icon.
  static const IconData taskAdd01 = HugeIconData(0x48a2);

  /// IconData for the 'strokeRoundedTaskAdd02' icon.
  static const IconData taskAdd02 = HugeIconData(0x48a3);

  /// IconData for the 'strokeRoundedTaskDaily01' icon.
  static const IconData taskDaily01 = HugeIconData(0x48a4);

  /// IconData for the 'strokeRoundedTaskDaily02' icon.
  static const IconData taskDaily02 = HugeIconData(0x48a5);

  /// IconData for the 'strokeRoundedTaskDone01' icon.
  static const IconData taskDone01 = HugeIconData(0x48a6);

  /// IconData for the 'strokeRoundedTaskDone02' icon.
  static const IconData taskDone02 = HugeIconData(0x48a7);

  /// IconData for the 'strokeRoundedTaskEdit01' icon.
  static const IconData taskEdit01 = HugeIconData(0x48a8);

  /// IconData for the 'strokeRoundedTaskEdit02' icon.
  static const IconData taskEdit02 = HugeIconData(0x48a9);

  /// IconData for the 'strokeRoundedTaskRemove01' icon.
  static const IconData taskRemove01 = HugeIconData(0x48aa);

  /// IconData for the 'strokeRoundedTaskRemove02' icon.
  static const IconData taskRemove02 = HugeIconData(0x48ab);

  /// IconData for the 'strokeRoundedTaxes' icon.
  static const IconData taxes = HugeIconData(0x48ac);

  /// IconData for the 'strokeRoundedTaxi' icon.
  static const IconData taxi = HugeIconData(0x48ad);

  /// IconData for the 'strokeRoundedTeaPod' icon.
  static const IconData teaPod = HugeIconData(0x48ae);

  /// IconData for the 'strokeRoundedTea' icon.
  static const IconData tea = HugeIconData(0x48af);

  /// IconData for the 'strokeRoundedTeacher' icon.
  static const IconData teacher = HugeIconData(0x48b0);

  /// IconData for the 'strokeRoundedTeaching' icon.
  static const IconData teaching = HugeIconData(0x48b1);

  /// IconData for the 'strokeRoundedTeamviewer' icon.
  static const IconData teamviewer = HugeIconData(0x48b2);

  /// IconData for the 'strokeRoundedTelegram' icon.
  static const IconData telegram = HugeIconData(0x48b3);

  /// IconData for the 'strokeRoundedTelephone' icon.
  static const IconData telephone = HugeIconData(0x48b4);

  /// IconData for the 'strokeRoundedTelescope01' icon.
  static const IconData telescope01 = HugeIconData(0x48b5);

  /// IconData for the 'strokeRoundedTelescope02' icon.
  static const IconData telescope02 = HugeIconData(0x48b6);

  /// IconData for the 'strokeRoundedTelevisionTable' icon.
  static const IconData televisionTable = HugeIconData(0x48b7);

  /// IconData for the 'strokeRoundedTemperature' icon.
  static const IconData temperature = HugeIconData(0x48b8);

  /// IconData for the 'strokeRoundedTennisBall' icon.
  static const IconData tennisBall = HugeIconData(0x48b9);

  /// IconData for the 'strokeRoundedTerrace' icon.
  static const IconData terrace = HugeIconData(0x48ba);

  /// IconData for the 'strokeRoundedTestTube01' icon.
  static const IconData testTube01 = HugeIconData(0x48bb);

  /// IconData for the 'strokeRoundedTestTube02' icon.
  static const IconData testTube02 = HugeIconData(0x48bc);

  /// IconData for the 'strokeRoundedTestTube03' icon.
  static const IconData testTube03 = HugeIconData(0x48bd);

  /// IconData for the 'strokeRoundedTestTube' icon.
  static const IconData testTube = HugeIconData(0x48be);

  /// IconData for the 'strokeRoundedTetris' icon.
  static const IconData tetris = HugeIconData(0x48bf);

  /// IconData for the 'strokeRoundedTextAlignCenter' icon.
  static const IconData textAlignCenter = HugeIconData(0x48c0);

  /// IconData for the 'strokeRoundedTextAlignJustifyCenter' icon.
  static const IconData textAlignJustifyCenter = HugeIconData(0x48c1);

  /// IconData for the 'strokeRoundedTextAlignJustifyLeft' icon.
  static const IconData textAlignJustifyLeft = HugeIconData(0x48c2);

  /// IconData for the 'strokeRoundedTextAlignJustifyRight' icon.
  static const IconData textAlignJustifyRight = HugeIconData(0x48c3);

  /// IconData for the 'strokeRoundedTextAlignLeft01' icon.
  static const IconData textAlignLeft01 = HugeIconData(0x48c4);

  /// IconData for the 'strokeRoundedTextAlignLeft' icon.
  static const IconData textAlignLeft = HugeIconData(0x48c5);

  /// IconData for the 'strokeRoundedTextAlignRight01' icon.
  static const IconData textAlignRight01 = HugeIconData(0x48c6);

  /// IconData for the 'strokeRoundedTextAlignRight' icon.
  static const IconData textAlignRight = HugeIconData(0x48c7);

  /// IconData for the 'strokeRoundedTextAllCaps' icon.
  static const IconData textAllCaps = HugeIconData(0x48c8);

  /// IconData for the 'strokeRoundedTextBold' icon.
  static const IconData textBold = HugeIconData(0x48c9);

  /// IconData for the 'strokeRoundedTextCenterlineCenterTop' icon.
  static const IconData textCenterlineCenterTop = HugeIconData(0x48ca);

  /// IconData for the 'strokeRoundedTextCenterlineLeft' icon.
  static const IconData textCenterlineLeft = HugeIconData(0x48cb);

  /// IconData for the 'strokeRoundedTextCenterlineMiddle' icon.
  static const IconData textCenterlineMiddle = HugeIconData(0x48cc);

  /// IconData for the 'strokeRoundedTextCenterlineRight' icon.
  static const IconData textCenterlineRight = HugeIconData(0x48cd);

  /// IconData for the 'strokeRoundedTextCheck' icon.
  static const IconData textCheck = HugeIconData(0x48ce);

  /// IconData for the 'strokeRoundedTextCircle' icon.
  static const IconData textCircle = HugeIconData(0x48cf);

  /// IconData for the 'strokeRoundedTextClear' icon.
  static const IconData textClear = HugeIconData(0x48d0);

  /// IconData for the 'strokeRoundedTextColor' icon.
  static const IconData textColor = HugeIconData(0x48d1);

  /// IconData for the 'strokeRoundedTextCreation' icon.
  static const IconData textCreation = HugeIconData(0x48d2);

  /// IconData for the 'strokeRoundedTextFirstlineLeft' icon.
  static const IconData textFirstlineLeft = HugeIconData(0x48d3);

  /// IconData for the 'strokeRoundedTextFirstlineRight' icon.
  static const IconData textFirstlineRight = HugeIconData(0x48d4);

  /// IconData for the 'strokeRoundedTextFont' icon.
  static const IconData textFont = HugeIconData(0x48d5);

  /// IconData for the 'strokeRoundedTextFootnote' icon.
  static const IconData textFootnote = HugeIconData(0x48d6);

  /// IconData for the 'strokeRoundedTextIndent01' icon.
  static const IconData textIndent01 = HugeIconData(0x48d7);

  /// IconData for the 'strokeRoundedTextIndentLess' icon.
  static const IconData textIndentLess = HugeIconData(0x48d8);

  /// IconData for the 'strokeRoundedTextIndentMore' icon.
  static const IconData textIndentMore = HugeIconData(0x48d9);

  /// IconData for the 'strokeRoundedTextIndent' icon.
  static const IconData textIndent = HugeIconData(0x48da);

  /// IconData for the 'strokeRoundedTextItalicSlash' icon.
  static const IconData textItalicSlash = HugeIconData(0x48db);

  /// IconData for the 'strokeRoundedTextItalic' icon.
  static const IconData textItalic = HugeIconData(0x48dc);

  /// IconData for the 'strokeRoundedTextKerning' icon.
  static const IconData textKerning = HugeIconData(0x48dd);

  /// IconData for the 'strokeRoundedTextNumberSign' icon.
  static const IconData textNumberSign = HugeIconData(0x48de);

  /// IconData for the 'strokeRoundedTextSelection' icon.
  static const IconData textSelection = HugeIconData(0x48df);

  /// IconData for the 'strokeRoundedTextSmallcaps' icon.
  static const IconData textSmallcaps = HugeIconData(0x48e0);

  /// IconData for the 'strokeRoundedTextSquare' icon.
  static const IconData textSquare = HugeIconData(0x48e1);

  /// IconData for the 'strokeRoundedTextStrikethrough' icon.
  static const IconData textStrikethrough = HugeIconData(0x48e2);

  /// IconData for the 'strokeRoundedTextSubscript' icon.
  static const IconData textSubscript = HugeIconData(0x48e3);

  /// IconData for the 'strokeRoundedTextSuperscript' icon.
  static const IconData textSuperscript = HugeIconData(0x48e4);

  /// IconData for the 'strokeRoundedTextTracking' icon.
  static const IconData textTracking = HugeIconData(0x48e5);

  /// IconData for the 'strokeRoundedTextUnderline' icon.
  static const IconData textUnderline = HugeIconData(0x48e6);

  /// IconData for the 'strokeRoundedTextVariableFront' icon.
  static const IconData textVariableFront = HugeIconData(0x48e7);

  /// IconData for the 'strokeRoundedTextVerticalAlignment' icon.
  static const IconData textVerticalAlignment = HugeIconData(0x48e8);

  /// IconData for the 'strokeRoundedTextWrap' icon.
  static const IconData textWrap = HugeIconData(0x48e9);

  /// IconData for the 'strokeRoundedText' icon.
  static const IconData text = HugeIconData(0x48ea);

  /// IconData for the 'strokeRoundedTheProphetsMosque' icon.
  static const IconData theProphetsMosque = HugeIconData(0x48eb);

  /// IconData for the 'strokeRoundedThermometerCold' icon.
  static const IconData thermometerCold = HugeIconData(0x48ec);

  /// IconData for the 'strokeRoundedThermometerWarm' icon.
  static const IconData thermometerWarm = HugeIconData(0x48ed);

  /// IconData for the 'strokeRoundedThermometer' icon.
  static const IconData thermometer = HugeIconData(0x48ee);

  /// IconData for the 'strokeRoundedThirdBracketCircle' icon.
  static const IconData thirdBracketCircle = HugeIconData(0x48ef);

  /// IconData for the 'strokeRoundedThirdBracketSquare' icon.
  static const IconData thirdBracketSquare = HugeIconData(0x48f0);

  /// IconData for the 'strokeRoundedThirdBracket' icon.
  static const IconData thirdBracket = HugeIconData(0x48f1);

  /// IconData for the 'strokeRoundedThread' icon.
  static const IconData thread = HugeIconData(0x48f2);

  /// IconData for the 'strokeRoundedThreadsEllipse' icon.
  static const IconData threadsEllipse = HugeIconData(0x48f3);

  /// IconData for the 'strokeRoundedThreadsRectangle' icon.
  static const IconData threadsRectangle = HugeIconData(0x48f4);

  /// IconData for the 'strokeRoundedThreads' icon.
  static const IconData threads = HugeIconData(0x48f5);

  /// IconData for the 'strokeRoundedThreeDMove' icon.
  static const IconData threeDMove = HugeIconData(0x48f6);

  /// IconData for the 'strokeRoundedThreeDRotate' icon.
  static const IconData threeDRotate = HugeIconData(0x48f7);

  /// IconData for the 'strokeRoundedThreeDScale' icon.
  static const IconData threeDScale = HugeIconData(0x48f8);

  /// IconData for the 'strokeRoundedThreeDView' icon.
  static const IconData threeDView = HugeIconData(0x48f9);

  /// IconData for the 'strokeRoundedThreeFinger01' icon.
  static const IconData threeFinger01 = HugeIconData(0x48fa);

  /// IconData for the 'strokeRoundedThreeFinger02' icon.
  static const IconData threeFinger02 = HugeIconData(0x48fb);

  /// IconData for the 'strokeRoundedThreeFinger03' icon.
  static const IconData threeFinger03 = HugeIconData(0x48fc);

  /// IconData for the 'strokeRoundedThreeFinger04' icon.
  static const IconData threeFinger04 = HugeIconData(0x48fd);

  /// IconData for the 'strokeRoundedThreeFinger05' icon.
  static const IconData threeFinger05 = HugeIconData(0x48fe);

  /// IconData for the 'strokeRoundedThumbsDownEllipse' icon.
  static const IconData thumbsDownEllipse = HugeIconData(0x48ff);

  /// IconData for the 'strokeRoundedThumbsDownRectangle' icon.
  static const IconData thumbsDownRectangle = HugeIconData(0x4900);

  /// IconData for the 'strokeRoundedThumbsDown' icon.
  static const IconData thumbsDown = HugeIconData(0x4901);

  /// IconData for the 'strokeRoundedThumbsUpDown' icon.
  static const IconData thumbsUpDown = HugeIconData(0x4902);

  /// IconData for the 'strokeRoundedThumbsUpEllipse' icon.
  static const IconData thumbsUpEllipse = HugeIconData(0x4903);

  /// IconData for the 'strokeRoundedThumbsUpRectangle' icon.
  static const IconData thumbsUpRectangle = HugeIconData(0x4904);

  /// IconData for the 'strokeRoundedThumbsUp' icon.
  static const IconData thumbsUp = HugeIconData(0x4905);

  /// IconData for the 'strokeRoundedTicTacToe' icon.
  static const IconData ticTacToe = HugeIconData(0x4906);

  /// IconData for the 'strokeRoundedTick01' icon.
  static const IconData tick01 = HugeIconData(0x4907);

  /// IconData for the 'strokeRoundedTick02' icon.
  static const IconData tick02 = HugeIconData(0x4908);

  /// IconData for the 'strokeRoundedTick03' icon.
  static const IconData tick03 = HugeIconData(0x4909);

  /// IconData for the 'strokeRoundedTick04' icon.
  static const IconData tick04 = HugeIconData(0x490a);

  /// IconData for the 'strokeRoundedTickDouble01' icon.
  static const IconData tickDouble01 = HugeIconData(0x490b);

  /// IconData for the 'strokeRoundedTickDouble02' icon.
  static const IconData tickDouble02 = HugeIconData(0x490c);

  /// IconData for the 'strokeRoundedTickDouble03' icon.
  static const IconData tickDouble03 = HugeIconData(0x490d);

  /// IconData for the 'strokeRoundedTickDouble04' icon.
  static const IconData tickDouble04 = HugeIconData(0x490e);

  /// IconData for the 'strokeRoundedTicket01' icon.
  static const IconData ticket01 = HugeIconData(0x490f);

  /// IconData for the 'strokeRoundedTicket02' icon.
  static const IconData ticket02 = HugeIconData(0x4910);

  /// IconData for the 'strokeRoundedTicket03' icon.
  static const IconData ticket03 = HugeIconData(0x4911);

  /// IconData for the 'strokeRoundedTicketStar' icon.
  static const IconData ticketStar = HugeIconData(0x4912);

  /// IconData for the 'strokeRoundedTie' icon.
  static const IconData tie = HugeIconData(0x4913);

  /// IconData for the 'strokeRoundedTiktok' icon.
  static const IconData tiktok = HugeIconData(0x4914);

  /// IconData for the 'strokeRoundedTime01' icon.
  static const IconData time01 = HugeIconData(0x4915);

  /// IconData for the 'strokeRoundedTime02' icon.
  static const IconData time02 = HugeIconData(0x4916);

  /// IconData for the 'strokeRoundedTime03' icon.
  static const IconData time03 = HugeIconData(0x4917);

  /// IconData for the 'strokeRoundedTime04' icon.
  static const IconData time04 = HugeIconData(0x4918);

  /// IconData for the 'strokeRoundedTimeHalfPass' icon.
  static const IconData timeHalfPass = HugeIconData(0x4919);

  /// IconData for the 'strokeRoundedTimeManagementCircle' icon.
  static const IconData timeManagementCircle = HugeIconData(0x491a);

  /// IconData for the 'strokeRoundedTimeManagement' icon.
  static const IconData timeManagement = HugeIconData(0x491b);

  /// IconData for the 'strokeRoundedTimeQuarterPass' icon.
  static const IconData timeQuarterPass = HugeIconData(0x491c);

  /// IconData for the 'strokeRoundedTimeQuarter' icon.
  static const IconData timeQuarter = HugeIconData(0x491d);

  /// IconData for the 'strokeRoundedTimeSchedule' icon.
  static const IconData timeSchedule = HugeIconData(0x491e);

  /// IconData for the 'strokeRoundedTimeSetting01' icon.
  static const IconData timeSetting01 = HugeIconData(0x491f);

  /// IconData for the 'strokeRoundedTimeSetting02' icon.
  static const IconData timeSetting02 = HugeIconData(0x4920);

  /// IconData for the 'strokeRoundedTimeSetting03' icon.
  static const IconData timeSetting03 = HugeIconData(0x4921);

  /// IconData for the 'strokeRoundedTimer01' icon.
  static const IconData timer01 = HugeIconData(0x4922);

  /// IconData for the 'strokeRoundedTimer02' icon.
  static const IconData timer02 = HugeIconData(0x4923);

  /// IconData for the 'strokeRoundedTips' icon.
  static const IconData tips = HugeIconData(0x4924);

  /// IconData for the 'strokeRoundedTired01' icon.
  static const IconData tired01 = HugeIconData(0x4925);

  /// IconData for the 'strokeRoundedTired02' icon.
  static const IconData tired02 = HugeIconData(0x4926);

  /// IconData for the 'strokeRoundedTissuePaper' icon.
  static const IconData tissuePaper = HugeIconData(0x4927);

  /// IconData for the 'strokeRoundedToggleOff' icon.
  static const IconData toggleOff = HugeIconData(0x4928);

  /// IconData for the 'strokeRoundedToggleOn' icon.
  static const IconData toggleOn = HugeIconData(0x4929);

  /// IconData for the 'strokeRoundedToilet01' icon.
  static const IconData toilet01 = HugeIconData(0x492a);

  /// IconData for the 'strokeRoundedToilet02' icon.
  static const IconData toilet02 = HugeIconData(0x492b);

  /// IconData for the 'strokeRoundedTongue01' icon.
  static const IconData tongue01 = HugeIconData(0x492c);

  /// IconData for the 'strokeRoundedTongueWinkLeft' icon.
  static const IconData tongueWinkLeft = HugeIconData(0x492d);

  /// IconData for the 'strokeRoundedTongueWinkRight' icon.
  static const IconData tongueWinkRight = HugeIconData(0x492e);

  /// IconData for the 'strokeRoundedTongue' icon.
  static const IconData tongue = HugeIconData(0x492f);

  /// IconData for the 'strokeRoundedTools' icon.
  static const IconData tools = HugeIconData(0x4930);

  /// IconData for the 'strokeRoundedTornado01' icon.
  static const IconData tornado01 = HugeIconData(0x4931);

  /// IconData for the 'strokeRoundedTornado02' icon.
  static const IconData tornado02 = HugeIconData(0x4932);

  /// IconData for the 'strokeRoundedTorriGate' icon.
  static const IconData torriGate = HugeIconData(0x4933);

  /// IconData for the 'strokeRoundedTouch01' icon.
  static const IconData touch01 = HugeIconData(0x4934);

  /// IconData for the 'strokeRoundedTouch02' icon.
  static const IconData touch02 = HugeIconData(0x4935);

  /// IconData for the 'strokeRoundedTouch03' icon.
  static const IconData touch03 = HugeIconData(0x4936);

  /// IconData for the 'strokeRoundedTouch04' icon.
  static const IconData touch04 = HugeIconData(0x4937);

  /// IconData for the 'strokeRoundedTouch05' icon.
  static const IconData touch05 = HugeIconData(0x4938);

  /// IconData for the 'strokeRoundedTouch06' icon.
  static const IconData touch06 = HugeIconData(0x4939);

  /// IconData for the 'strokeRoundedTouch07' icon.
  static const IconData touch07 = HugeIconData(0x493a);

  /// IconData for the 'strokeRoundedTouch08' icon.
  static const IconData touch08 = HugeIconData(0x493b);

  /// IconData for the 'strokeRoundedTouch09' icon.
  static const IconData touch09 = HugeIconData(0x493c);

  /// IconData for the 'strokeRoundedTouch10' icon.
  static const IconData touch10 = HugeIconData(0x493d);

  /// IconData for the 'strokeRoundedTouchInteraction01' icon.
  static const IconData touchInteraction01 = HugeIconData(0x493e);

  /// IconData for the 'strokeRoundedTouchInteraction02' icon.
  static const IconData touchInteraction02 = HugeIconData(0x493f);

  /// IconData for the 'strokeRoundedTouchInteraction03' icon.
  static const IconData touchInteraction03 = HugeIconData(0x4940);

  /// IconData for the 'strokeRoundedTouchInteraction04' icon.
  static const IconData touchInteraction04 = HugeIconData(0x4941);

  /// IconData for the 'strokeRoundedTouchLocked01' icon.
  static const IconData touchLocked01 = HugeIconData(0x4942);

  /// IconData for the 'strokeRoundedTouchLocked02' icon.
  static const IconData touchLocked02 = HugeIconData(0x4943);

  /// IconData for the 'strokeRoundedTouchLocked03' icon.
  static const IconData touchLocked03 = HugeIconData(0x4944);

  /// IconData for the 'strokeRoundedTouchLocked04' icon.
  static const IconData touchLocked04 = HugeIconData(0x4945);

  /// IconData for the 'strokeRoundedTouchpad01' icon.
  static const IconData touchpad01 = HugeIconData(0x4946);

  /// IconData for the 'strokeRoundedTouchpad02' icon.
  static const IconData touchpad02 = HugeIconData(0x4947);

  /// IconData for the 'strokeRoundedTouchpad03' icon.
  static const IconData touchpad03 = HugeIconData(0x4948);

  /// IconData for the 'strokeRoundedTouchpad04' icon.
  static const IconData touchpad04 = HugeIconData(0x4949);

  /// IconData for the 'strokeRoundedTowTruck' icon.
  static const IconData towTruck = HugeIconData(0x494a);

  /// IconData for the 'strokeRoundedTowels' icon.
  static const IconData towels = HugeIconData(0x494b);

  /// IconData for the 'strokeRoundedToyTrain' icon.
  static const IconData toyTrain = HugeIconData(0x494c);

  /// IconData for the 'strokeRoundedTractor' icon.
  static const IconData tractor = HugeIconData(0x494d);

  /// IconData for the 'strokeRoundedTradeDown' icon.
  static const IconData tradeDown = HugeIconData(0x494e);

  /// IconData for the 'strokeRoundedTradeMark' icon.
  static const IconData tradeMark = HugeIconData(0x494f);

  /// IconData for the 'strokeRoundedTradeUp' icon.
  static const IconData tradeUp = HugeIconData(0x4950);

  /// IconData for the 'strokeRoundedTrademark' icon.
  static const IconData trademark = HugeIconData(0x4951);

  /// IconData for the 'strokeRoundedTrafficIncident' icon.
  static const IconData trafficIncident = HugeIconData(0x4952);

  /// IconData for the 'strokeRoundedTrafficLight' icon.
  static const IconData trafficLight = HugeIconData(0x4953);

  /// IconData for the 'strokeRoundedTrain01' icon.
  static const IconData train01 = HugeIconData(0x4954);

  /// IconData for the 'strokeRoundedTrain02' icon.
  static const IconData train02 = HugeIconData(0x4955);

  /// IconData for the 'strokeRoundedTram' icon.
  static const IconData tram = HugeIconData(0x4956);

  /// IconData for the 'strokeRoundedTrampoline' icon.
  static const IconData trampoline = HugeIconData(0x4957);

  /// IconData for the 'strokeRoundedTransaction' icon.
  static const IconData transaction = HugeIconData(0x4958);

  /// IconData for the 'strokeRoundedTransitionBottom' icon.
  static const IconData transitionBottom = HugeIconData(0x4959);

  /// IconData for the 'strokeRoundedTransitionLeft' icon.
  static const IconData transitionLeft = HugeIconData(0x495a);

  /// IconData for the 'strokeRoundedTransitionRight' icon.
  static const IconData transitionRight = HugeIconData(0x495b);

  /// IconData for the 'strokeRoundedTransitionTop' icon.
  static const IconData transitionTop = HugeIconData(0x495c);

  /// IconData for the 'strokeRoundedTranslate' icon.
  static const IconData translate = HugeIconData(0x495d);

  /// IconData for the 'strokeRoundedTranslation' icon.
  static const IconData translation = HugeIconData(0x495e);

  /// IconData for the 'strokeRoundedTransmission' icon.
  static const IconData transmission = HugeIconData(0x495f);

  /// IconData for the 'strokeRoundedTransparency' icon.
  static const IconData transparency = HugeIconData(0x4960);

  /// IconData for the 'strokeRoundedTrapezoidLineHorizontal' icon.
  static const IconData trapezoidLineHorizontal = HugeIconData(0x4961);

  /// IconData for the 'strokeRoundedTrapezoidLineVertical' icon.
  static const IconData trapezoidLineVertical = HugeIconData(0x4962);

  /// IconData for the 'strokeRoundedTravelBag' icon.
  static const IconData travelBag = HugeIconData(0x4963);

  /// IconData for the 'strokeRoundedTreadmill01' icon.
  static const IconData treadmill01 = HugeIconData(0x4964);

  /// IconData for the 'strokeRoundedTreadmill02' icon.
  static const IconData treadmill02 = HugeIconData(0x4965);

  /// IconData for the 'strokeRoundedTreatment' icon.
  static const IconData treatment = HugeIconData(0x4966);

  /// IconData for the 'strokeRoundedTree01' icon.
  static const IconData tree01 = HugeIconData(0x4967);

  /// IconData for the 'strokeRoundedTree02' icon.
  static const IconData tree02 = HugeIconData(0x4968);

  /// IconData for the 'strokeRoundedTree03' icon.
  static const IconData tree03 = HugeIconData(0x4969);

  /// IconData for the 'strokeRoundedTree04' icon.
  static const IconData tree04 = HugeIconData(0x496a);

  /// IconData for the 'strokeRoundedTree05' icon.
  static const IconData tree05 = HugeIconData(0x496b);

  /// IconData for the 'strokeRoundedTree06' icon.
  static const IconData tree06 = HugeIconData(0x496c);

  /// IconData for the 'strokeRoundedTree07' icon.
  static const IconData tree07 = HugeIconData(0x496d);

  /// IconData for the 'strokeRoundedTrello' icon.
  static const IconData trello = HugeIconData(0x496e);

  /// IconData for the 'strokeRoundedTriangle01' icon.
  static const IconData triangle01 = HugeIconData(0x496f);

  /// IconData for the 'strokeRoundedTriangle02' icon.
  static const IconData triangle02 = HugeIconData(0x4970);

  /// IconData for the 'strokeRoundedTriangle03' icon.
  static const IconData triangle03 = HugeIconData(0x4971);

  /// IconData for the 'strokeRoundedTriangle' icon.
  static const IconData triangle = HugeIconData(0x4972);

  /// IconData for the 'strokeRoundedTrolley01' icon.
  static const IconData trolley01 = HugeIconData(0x4973);

  /// IconData for the 'strokeRoundedTrolley02' icon.
  static const IconData trolley02 = HugeIconData(0x4974);

  /// IconData for the 'strokeRoundedTropicalStormTracks01' icon.
  static const IconData tropicalStormTracks01 = HugeIconData(0x4975);

  /// IconData for the 'strokeRoundedTropicalStormTracks02' icon.
  static const IconData tropicalStormTracks02 = HugeIconData(0x4976);

  /// IconData for the 'strokeRoundedTropicalStorm' icon.
  static const IconData tropicalStorm = HugeIconData(0x4977);

  /// IconData for the 'strokeRoundedTruckDelivery' icon.
  static const IconData truckDelivery = HugeIconData(0x4978);

  /// IconData for the 'strokeRoundedTruckMonster' icon.
  static const IconData truckMonster = HugeIconData(0x4979);

  /// IconData for the 'strokeRoundedTruckReturn' icon.
  static const IconData truckReturn = HugeIconData(0x497a);

  /// IconData for the 'strokeRoundedTruck' icon.
  static const IconData truck = HugeIconData(0x497b);

  /// IconData for the 'strokeRoundedTrulli' icon.
  static const IconData trulli = HugeIconData(0x497c);

  /// IconData for the 'strokeRoundedTsunami' icon.
  static const IconData tsunami = HugeIconData(0x497d);

  /// IconData for the 'strokeRoundedTulip' icon.
  static const IconData tulip = HugeIconData(0x497e);

  /// IconData for the 'strokeRoundedTumblr' icon.
  static const IconData tumblr = HugeIconData(0x497f);

  /// IconData for the 'strokeRoundedTurtleNeck' icon.
  static const IconData turtleNeck = HugeIconData(0x4980);

  /// IconData for the 'strokeRoundedTv01' icon.
  static const IconData tv01 = HugeIconData(0x4981);

  /// IconData for the 'strokeRoundedTv02' icon.
  static const IconData tv02 = HugeIconData(0x4982);

  /// IconData for the 'strokeRoundedTvFix' icon.
  static const IconData tvFix = HugeIconData(0x4983);

  /// IconData for the 'strokeRoundedTvIssue' icon.
  static const IconData tvIssue = HugeIconData(0x4984);

  /// IconData for the 'strokeRoundedTvSmart' icon.
  static const IconData tvSmart = HugeIconData(0x4985);

  /// IconData for the 'strokeRoundedTwinTower' icon.
  static const IconData twinTower = HugeIconData(0x4986);

  /// IconData for the 'strokeRoundedTwitch' icon.
  static const IconData twitch = HugeIconData(0x4987);

  /// IconData for the 'strokeRoundedTwitterSquare' icon.
  static const IconData twitterSquare = HugeIconData(0x4988);

  /// IconData for the 'strokeRoundedTwitter' icon.
  static const IconData twitter = HugeIconData(0x4989);

  /// IconData for the 'strokeRoundedTwoFactorAccess' icon.
  static const IconData twoFactorAccess = HugeIconData(0x498a);

  /// IconData for the 'strokeRoundedTwoFinger01' icon.
  static const IconData twoFinger01 = HugeIconData(0x498b);

  /// IconData for the 'strokeRoundedTwoFinger02' icon.
  static const IconData twoFinger02 = HugeIconData(0x498c);

  /// IconData for the 'strokeRoundedTwoFinger03' icon.
  static const IconData twoFinger03 = HugeIconData(0x498d);

  /// IconData for the 'strokeRoundedTwoFinger04' icon.
  static const IconData twoFinger04 = HugeIconData(0x498e);

  /// IconData for the 'strokeRoundedTwoFinger05' icon.
  static const IconData twoFinger05 = HugeIconData(0x498f);

  /// IconData for the 'strokeRoundedTxt01' icon.
  static const IconData txt01 = HugeIconData(0x4990);

  /// IconData for the 'strokeRoundedTxt02' icon.
  static const IconData txt02 = HugeIconData(0x4991);

  /// IconData for the 'strokeRoundedTypeCursor' icon.
  static const IconData typeCursor = HugeIconData(0x4992);

  /// IconData for the 'strokeRoundedTypescript01' icon.
  static const IconData typescript01 = HugeIconData(0x4993);

  /// IconData for the 'strokeRoundedTypescript02' icon.
  static const IconData typescript02 = HugeIconData(0x4994);

  /// IconData for the 'strokeRoundedTypescript03' icon.
  static const IconData typescript03 = HugeIconData(0x4995);

  /// IconData for the 'strokeRoundedUber' icon.
  static const IconData uber = HugeIconData(0x4996);

  /// IconData for the 'strokeRoundedUfo01' icon.
  static const IconData ufo01 = HugeIconData(0x4997);

  /// IconData for the 'strokeRoundedUfo' icon.
  static const IconData ufo = HugeIconData(0x4998);

  /// IconData for the 'strokeRoundedUmbrellaDollar' icon.
  static const IconData umbrellaDollar = HugeIconData(0x4999);

  /// IconData for the 'strokeRoundedUmbrella' icon.
  static const IconData umbrella = HugeIconData(0x499a);

  /// IconData for the 'strokeRoundedUnamused' icon.
  static const IconData unamused = HugeIconData(0x499b);

  /// IconData for the 'strokeRoundedUnavailable' icon.
  static const IconData unavailable = HugeIconData(0x499c);

  /// IconData for the 'strokeRoundedUnderpants01' icon.
  static const IconData underpants01 = HugeIconData(0x499d);

  /// IconData for the 'strokeRoundedUnderpants02' icon.
  static const IconData underpants02 = HugeIconData(0x499e);

  /// IconData for the 'strokeRoundedUnderpants03' icon.
  static const IconData underpants03 = HugeIconData(0x499f);

  /// IconData for the 'strokeRoundedUnfoldLess' icon.
  static const IconData unfoldLess = HugeIconData(0x49a0);

  /// IconData for the 'strokeRoundedUnfoldMore' icon.
  static const IconData unfoldMore = HugeIconData(0x49a1);

  /// IconData for the 'strokeRoundedUngroupItems' icon.
  static const IconData ungroupItems = HugeIconData(0x49a2);

  /// IconData for the 'strokeRoundedUngroupLayers' icon.
  static const IconData ungroupLayers = HugeIconData(0x49a3);

  /// IconData for the 'strokeRoundedUnhappy' icon.
  static const IconData unhappy = HugeIconData(0x49a4);

  /// IconData for the 'strokeRoundedUniversity' icon.
  static const IconData university = HugeIconData(0x49a5);

  /// IconData for the 'strokeRoundedUnlink01' icon.
  static const IconData unlink01 = HugeIconData(0x49a6);

  /// IconData for the 'strokeRoundedUnlink02' icon.
  static const IconData unlink02 = HugeIconData(0x49a7);

  /// IconData for the 'strokeRoundedUnlink03' icon.
  static const IconData unlink03 = HugeIconData(0x49a8);

  /// IconData for the 'strokeRoundedUnlink04' icon.
  static const IconData unlink04 = HugeIconData(0x49a9);

  /// IconData for the 'strokeRoundedUnlink05' icon.
  static const IconData unlink05 = HugeIconData(0x49aa);

  /// IconData for the 'strokeRoundedUnlink06' icon.
  static const IconData unlink06 = HugeIconData(0x49ab);

  /// IconData for the 'strokeRoundedUnsplash' icon.
  static const IconData unsplash = HugeIconData(0x49ac);

  /// IconData for the 'strokeRoundedUpload01' icon.
  static const IconData upload01 = HugeIconData(0x49ad);

  /// IconData for the 'strokeRoundedUpload02' icon.
  static const IconData upload02 = HugeIconData(0x49ae);

  /// IconData for the 'strokeRoundedUpload03' icon.
  static const IconData upload03 = HugeIconData(0x49af);

  /// IconData for the 'strokeRoundedUpload04' icon.
  static const IconData upload04 = HugeIconData(0x49b0);

  /// IconData for the 'strokeRoundedUpload05' icon.
  static const IconData upload05 = HugeIconData(0x49b1);

  /// IconData for the 'strokeRoundedUploadCircle01' icon.
  static const IconData uploadCircle01 = HugeIconData(0x49b2);

  /// IconData for the 'strokeRoundedUploadCircle02' icon.
  static const IconData uploadCircle02 = HugeIconData(0x49b3);

  /// IconData for the 'strokeRoundedUploadSquare01' icon.
  static const IconData uploadSquare01 = HugeIconData(0x49b4);

  /// IconData for the 'strokeRoundedUploadSquare02' icon.
  static const IconData uploadSquare02 = HugeIconData(0x49b5);

  /// IconData for the 'strokeRoundedUpwork' icon.
  static const IconData upwork = HugeIconData(0x49b6);

  /// IconData for the 'strokeRoundedUsbBugs' icon.
  static const IconData usbBugs = HugeIconData(0x49b7);

  /// IconData for the 'strokeRoundedUsbConnected01' icon.
  static const IconData usbConnected01 = HugeIconData(0x49b8);

  /// IconData for the 'strokeRoundedUsbConnected02' icon.
  static const IconData usbConnected02 = HugeIconData(0x49b9);

  /// IconData for the 'strokeRoundedUsbConnected03' icon.
  static const IconData usbConnected03 = HugeIconData(0x49ba);

  /// IconData for the 'strokeRoundedUsbError' icon.
  static const IconData usbError = HugeIconData(0x49bb);

  /// IconData for the 'strokeRoundedUsbMemory01' icon.
  static const IconData usbMemory01 = HugeIconData(0x49bc);

  /// IconData for the 'strokeRoundedUsbMemory02' icon.
  static const IconData usbMemory02 = HugeIconData(0x49bd);

  /// IconData for the 'strokeRoundedUsbNotConnected01' icon.
  static const IconData usbNotConnected01 = HugeIconData(0x49be);

  /// IconData for the 'strokeRoundedUsbNotConnected02' icon.
  static const IconData usbNotConnected02 = HugeIconData(0x49bf);

  /// IconData for the 'strokeRoundedUsb' icon.
  static const IconData usb = HugeIconData(0x49c0);

  /// IconData for the 'strokeRoundedUserAccount' icon.
  static const IconData userAccount = HugeIconData(0x49c1);

  /// IconData for the 'strokeRoundedUserAdd01' icon.
  static const IconData userAdd01 = HugeIconData(0x49c2);

  /// IconData for the 'strokeRoundedUserAdd02' icon.
  static const IconData userAdd02 = HugeIconData(0x49c3);

  /// IconData for the 'strokeRoundedUserArrowLeftRight' icon.
  static const IconData userArrowLeftRight = HugeIconData(0x49c4);

  /// IconData for the 'strokeRoundedUserBlock01' icon.
  static const IconData userBlock01 = HugeIconData(0x49c5);

  /// IconData for the 'strokeRoundedUserBlock02' icon.
  static const IconData userBlock02 = HugeIconData(0x49c6);

  /// IconData for the 'strokeRoundedUserCheck01' icon.
  static const IconData userCheck01 = HugeIconData(0x49c7);

  /// IconData for the 'strokeRoundedUserCheck02' icon.
  static const IconData userCheck02 = HugeIconData(0x49c8);

  /// IconData for the 'strokeRoundedUserCircle02' icon.
  static const IconData userCircle02 = HugeIconData(0x49c9);

  /// IconData for the 'strokeRoundedUserCircle' icon.
  static const IconData userCircle = HugeIconData(0x49ca);

  /// IconData for the 'strokeRoundedUserEdit01' icon.
  static const IconData userEdit01 = HugeIconData(0x49cb);

  /// IconData for the 'strokeRoundedUserFullView' icon.
  static const IconData userFullView = HugeIconData(0x49cc);

  /// IconData for the 'strokeRoundedUserGroup' icon.
  static const IconData userGroup = HugeIconData(0x49cd);

  /// IconData for the 'strokeRoundedUserIdVerification' icon.
  static const IconData userIdVerification = HugeIconData(0x49ce);

  /// IconData for the 'strokeRoundedUserList' icon.
  static const IconData userList = HugeIconData(0x49cf);

  /// IconData for the 'strokeRoundedUserLock01' icon.
  static const IconData userLock01 = HugeIconData(0x49d0);

  /// IconData for the 'strokeRoundedUserLock02' icon.
  static const IconData userLock02 = HugeIconData(0x49d1);

  /// IconData for the 'strokeRoundedUserLove01' icon.
  static const IconData userLove01 = HugeIconData(0x49d2);

  /// IconData for the 'strokeRoundedUserLove02' icon.
  static const IconData userLove02 = HugeIconData(0x49d3);

  /// IconData for the 'strokeRoundedUserMinus01' icon.
  static const IconData userMinus01 = HugeIconData(0x49d4);

  /// IconData for the 'strokeRoundedUserMinus02' icon.
  static const IconData userMinus02 = HugeIconData(0x49d5);

  /// IconData for the 'strokeRoundedUserMultiple02' icon.
  static const IconData userMultiple02 = HugeIconData(0x49d6);

  /// IconData for the 'strokeRoundedUserMultiple' icon.
  static const IconData userMultiple = HugeIconData(0x49d7);

  /// IconData for the 'strokeRoundedUserQuestion01' icon.
  static const IconData userQuestion01 = HugeIconData(0x49d8);

  /// IconData for the 'strokeRoundedUserQuestion02' icon.
  static const IconData userQuestion02 = HugeIconData(0x49d9);

  /// IconData for the 'strokeRoundedUserRemove01' icon.
  static const IconData userRemove01 = HugeIconData(0x49da);

  /// IconData for the 'strokeRoundedUserRemove02' icon.
  static const IconData userRemove02 = HugeIconData(0x49db);

  /// IconData for the 'strokeRoundedUserRoadside' icon.
  static const IconData userRoadside = HugeIconData(0x49dc);

  /// IconData for the 'strokeRoundedUserSearch01' icon.
  static const IconData userSearch01 = HugeIconData(0x49dd);

  /// IconData for the 'strokeRoundedUserSearch02' icon.
  static const IconData userSearch02 = HugeIconData(0x49de);

  /// IconData for the 'strokeRoundedUserSettings01' icon.
  static const IconData userSettings01 = HugeIconData(0x49df);

  /// IconData for the 'strokeRoundedUserSettings02' icon.
  static const IconData userSettings02 = HugeIconData(0x49e0);

  /// IconData for the 'strokeRoundedUserSharing' icon.
  static const IconData userSharing = HugeIconData(0x49e1);

  /// IconData for the 'strokeRoundedUserShield01' icon.
  static const IconData userShield01 = HugeIconData(0x49e2);

  /// IconData for the 'strokeRoundedUserShield02' icon.
  static const IconData userShield02 = HugeIconData(0x49e3);

  /// IconData for the 'strokeRoundedUserSquare' icon.
  static const IconData userSquare = HugeIconData(0x49e4);

  /// IconData for the 'strokeRoundedUserStar01' icon.
  static const IconData userStar01 = HugeIconData(0x49e5);

  /// IconData for the 'strokeRoundedUserStar02' icon.
  static const IconData userStar02 = HugeIconData(0x49e6);

  /// IconData for the 'strokeRoundedUserStatus' icon.
  static const IconData userStatus = HugeIconData(0x49e7);

  /// IconData for the 'strokeRoundedUserStory' icon.
  static const IconData userStory = HugeIconData(0x49e8);

  /// IconData for the 'strokeRoundedUserSwitch' icon.
  static const IconData userSwitch = HugeIconData(0x49e9);

  /// IconData for the 'strokeRoundedUserUnlock01' icon.
  static const IconData userUnlock01 = HugeIconData(0x49ea);

  /// IconData for the 'strokeRoundedUserUnlock02' icon.
  static const IconData userUnlock02 = HugeIconData(0x49eb);

  /// IconData for the 'strokeRoundedUser' icon.
  static const IconData user = HugeIconData(0x49ec);

  /// IconData for the 'strokeRoundedUv01' icon.
  static const IconData uv01 = HugeIconData(0x49ed);

  /// IconData for the 'strokeRoundedUv02' icon.
  static const IconData uv02 = HugeIconData(0x49ee);

  /// IconData for the 'strokeRoundedUv03' icon.
  static const IconData uv03 = HugeIconData(0x49ef);

  /// IconData for the 'strokeRoundedVaccine' icon.
  static const IconData vaccine = HugeIconData(0x49f0);

  /// IconData for the 'strokeRoundedValidationApproval' icon.
  static const IconData validationApproval = HugeIconData(0x49f1);

  /// IconData for the 'strokeRoundedValidation' icon.
  static const IconData validation = HugeIconData(0x49f2);

  /// IconData for the 'strokeRoundedVan' icon.
  static const IconData van = HugeIconData(0x49f3);

  /// IconData for the 'strokeRoundedVariable' icon.
  static const IconData variable = HugeIconData(0x49f4);

  /// IconData for the 'strokeRoundedVegetarianFood' icon.
  static const IconData vegetarianFood = HugeIconData(0x49f5);

  /// IconData for the 'strokeRoundedVerticalResize' icon.
  static const IconData verticalResize = HugeIconData(0x49f6);

  /// IconData for the 'strokeRoundedVerticalScrollPoint' icon.
  static const IconData verticalScrollPoint = HugeIconData(0x49f7);

  /// IconData for the 'strokeRoundedVest' icon.
  static const IconData vest = HugeIconData(0x49f8);

  /// IconData for the 'strokeRoundedVictoryFinger01' icon.
  static const IconData victoryFinger01 = HugeIconData(0x49f9);

  /// IconData for the 'strokeRoundedVictoryFinger02' icon.
  static const IconData victoryFinger02 = HugeIconData(0x49fa);

  /// IconData for the 'strokeRoundedVictoryFinger03' icon.
  static const IconData victoryFinger03 = HugeIconData(0x49fb);

  /// IconData for the 'strokeRoundedVideo01' icon.
  static const IconData video01 = HugeIconData(0x49fc);

  /// IconData for the 'strokeRoundedVideo02' icon.
  static const IconData video02 = HugeIconData(0x49fd);

  /// IconData for the 'strokeRoundedVideoConsole' icon.
  static const IconData videoConsole = HugeIconData(0x49fe);

  /// IconData for the 'strokeRoundedVideoOff' icon.
  static const IconData videoOff = HugeIconData(0x49ff);

  /// IconData for the 'strokeRoundedVideoReplay' icon.
  static const IconData videoReplay = HugeIconData(0x4a00);

  /// IconData for the 'strokeRoundedViewOffSlash' icon.
  static const IconData viewOffSlash = HugeIconData(0x4a01);

  /// IconData for the 'strokeRoundedViewOff' icon.
  static const IconData viewOff = HugeIconData(0x4a02);

  /// IconData for the 'strokeRoundedView' icon.
  static const IconData view = HugeIconData(0x4a03);

  /// IconData for the 'strokeRoundedVimeo' icon.
  static const IconData vimeo = HugeIconData(0x4a04);

  /// IconData for the 'strokeRoundedVineSquare' icon.
  static const IconData vineSquare = HugeIconData(0x4a05);

  /// IconData for the 'strokeRoundedVine' icon.
  static const IconData vine = HugeIconData(0x4a06);

  /// IconData for the 'strokeRoundedVintageClock' icon.
  static const IconData vintageClock = HugeIconData(0x4a07);

  /// IconData for the 'strokeRoundedVirtualRealityVr01' icon.
  static const IconData virtualRealityVr01 = HugeIconData(0x4a08);

  /// IconData for the 'strokeRoundedVirtualRealityVr02' icon.
  static const IconData virtualRealityVr02 = HugeIconData(0x4a09);

  /// IconData for the 'strokeRoundedVision' icon.
  static const IconData vision = HugeIconData(0x4a0a);

  /// IconData for the 'strokeRoundedVkSquare' icon.
  static const IconData vkSquare = HugeIconData(0x4a0b);

  /// IconData for the 'strokeRoundedVk' icon.
  static const IconData vk = HugeIconData(0x4a0c);

  /// IconData for the 'strokeRoundedVoiceId' icon.
  static const IconData voiceId = HugeIconData(0x4a0d);

  /// IconData for the 'strokeRoundedVoice' icon.
  static const IconData voice = HugeIconData(0x4a0e);

  /// IconData for the 'strokeRoundedVolleyball' icon.
  static const IconData volleyball = HugeIconData(0x4a0f);

  /// IconData for the 'strokeRoundedVolumeHigh' icon.
  static const IconData volumeHigh = HugeIconData(0x4a10);

  /// IconData for the 'strokeRoundedVolumeLow' icon.
  static const IconData volumeLow = HugeIconData(0x4a11);

  /// IconData for the 'strokeRoundedVolumeMinus' icon.
  static const IconData volumeMinus = HugeIconData(0x4a12);

  /// IconData for the 'strokeRoundedVolumeMute01' icon.
  static const IconData volumeMute01 = HugeIconData(0x4a13);

  /// IconData for the 'strokeRoundedVolumeMute02' icon.
  static const IconData volumeMute02 = HugeIconData(0x4a14);

  /// IconData for the 'strokeRoundedVolumeOff' icon.
  static const IconData volumeOff = HugeIconData(0x4a15);

  /// IconData for the 'strokeRoundedVolumeUp' icon.
  static const IconData volumeUp = HugeIconData(0x4a16);

  /// IconData for the 'strokeRoundedVomiting' icon.
  static const IconData vomiting = HugeIconData(0x4a17);

  /// IconData for the 'strokeRoundedVoucher' icon.
  static const IconData voucher = HugeIconData(0x4a18);

  /// IconData for the 'strokeRoundedVrGlasses' icon.
  static const IconData vrGlasses = HugeIconData(0x4a19);

  /// IconData for the 'strokeRoundedVr' icon.
  static const IconData vr = HugeIconData(0x4a1a);

  /// IconData for the 'strokeRoundedVynil01' icon.
  static const IconData vynil01 = HugeIconData(0x4a1b);

  /// IconData for the 'strokeRoundedVynil02' icon.
  static const IconData vynil02 = HugeIconData(0x4a1c);

  /// IconData for the 'strokeRoundedVynil03' icon.
  static const IconData vynil03 = HugeIconData(0x4a1d);

  /// IconData for the 'strokeRoundedWaiter' icon.
  static const IconData waiter = HugeIconData(0x4a1e);

  /// IconData for the 'strokeRoundedWaiters' icon.
  static const IconData waiters = HugeIconData(0x4a1f);

  /// IconData for the 'strokeRoundedWallLamp' icon.
  static const IconData wallLamp = HugeIconData(0x4a20);

  /// IconData for the 'strokeRoundedWallet01' icon.
  static const IconData wallet01 = HugeIconData(0x4a21);

  /// IconData for the 'strokeRoundedWallet02' icon.
  static const IconData wallet02 = HugeIconData(0x4a22);

  /// IconData for the 'strokeRoundedWallet03' icon.
  static const IconData wallet03 = HugeIconData(0x4a23);

  /// IconData for the 'strokeRoundedWalletAdd01' icon.
  static const IconData walletAdd01 = HugeIconData(0x4a24);

  /// IconData for the 'strokeRoundedWalletAdd02' icon.
  static const IconData walletAdd02 = HugeIconData(0x4a25);

  /// IconData for the 'strokeRoundedWalletDone01' icon.
  static const IconData walletDone01 = HugeIconData(0x4a26);

  /// IconData for the 'strokeRoundedWalletDone02' icon.
  static const IconData walletDone02 = HugeIconData(0x4a27);

  /// IconData for the 'strokeRoundedWalletNotFound01' icon.
  static const IconData walletNotFound01 = HugeIconData(0x4a28);

  /// IconData for the 'strokeRoundedWalletNotFound02' icon.
  static const IconData walletNotFound02 = HugeIconData(0x4a29);

  /// IconData for the 'strokeRoundedWalletRemove01' icon.
  static const IconData walletRemove01 = HugeIconData(0x4a2a);

  /// IconData for the 'strokeRoundedWalletRemove02' icon.
  static const IconData walletRemove02 = HugeIconData(0x4a2b);

  /// IconData for the 'strokeRoundedWanted' icon.
  static const IconData wanted = HugeIconData(0x4a2c);

  /// IconData for the 'strokeRoundedWardrobe01' icon.
  static const IconData wardrobe01 = HugeIconData(0x4a2d);

  /// IconData for the 'strokeRoundedWardrobe02' icon.
  static const IconData wardrobe02 = HugeIconData(0x4a2e);

  /// IconData for the 'strokeRoundedWardrobe03' icon.
  static const IconData wardrobe03 = HugeIconData(0x4a2f);

  /// IconData for the 'strokeRoundedWardrobe04' icon.
  static const IconData wardrobe04 = HugeIconData(0x4a30);

  /// IconData for the 'strokeRoundedWarehouse' icon.
  static const IconData warehouse = HugeIconData(0x4a31);

  /// IconData for the 'strokeRoundedWashingtonMonument' icon.
  static const IconData washingtonMonument = HugeIconData(0x4a32);

  /// IconData for the 'strokeRoundedWasteRestore' icon.
  static const IconData wasteRestore = HugeIconData(0x4a33);

  /// IconData for the 'strokeRoundedWaste' icon.
  static const IconData waste = HugeIconData(0x4a34);

  /// IconData for the 'strokeRoundedWatch01' icon.
  static const IconData watch01 = HugeIconData(0x4a35);

  /// IconData for the 'strokeRoundedWatch02' icon.
  static const IconData watch02 = HugeIconData(0x4a36);

  /// IconData for the 'strokeRoundedWaterEnergy' icon.
  static const IconData waterEnergy = HugeIconData(0x4a37);

  /// IconData for the 'strokeRoundedWaterPolo' icon.
  static const IconData waterPolo = HugeIconData(0x4a38);

  /// IconData for the 'strokeRoundedWaterPump' icon.
  static const IconData waterPump = HugeIconData(0x4a39);

  /// IconData for the 'strokeRoundedWaterfallDown01' icon.
  static const IconData waterfallDown01 = HugeIconData(0x4a3a);

  /// IconData for the 'strokeRoundedWaterfallDown03' icon.
  static const IconData waterfallDown03 = HugeIconData(0x4a3b);

  /// IconData for the 'strokeRoundedWaterfallUp01' icon.
  static const IconData waterfallUp01 = HugeIconData(0x4a3c);

  /// IconData for the 'strokeRoundedWaterfallUp02' icon.
  static const IconData waterfallUp02 = HugeIconData(0x4a3d);

  /// IconData for the 'strokeRoundedWatermelon' icon.
  static const IconData watermelon = HugeIconData(0x4a3e);

  /// IconData for the 'strokeRoundedWattpadSquare' icon.
  static const IconData wattpadSquare = HugeIconData(0x4a3f);

  /// IconData for the 'strokeRoundedWattpad' icon.
  static const IconData wattpad = HugeIconData(0x4a40);

  /// IconData for the 'strokeRoundedWavingHand01' icon.
  static const IconData wavingHand01 = HugeIconData(0x4a41);

  /// IconData for the 'strokeRoundedWavingHand02' icon.
  static const IconData wavingHand02 = HugeIconData(0x4a42);

  /// IconData for the 'strokeRoundedWaze' icon.
  static const IconData waze = HugeIconData(0x4a43);

  /// IconData for the 'strokeRoundedWebDesign01' icon.
  static const IconData webDesign01 = HugeIconData(0x4a44);

  /// IconData for the 'strokeRoundedWebDesign02' icon.
  static const IconData webDesign02 = HugeIconData(0x4a45);

  /// IconData for the 'strokeRoundedWebProgramming' icon.
  static const IconData webProgramming = HugeIconData(0x4a46);

  /// IconData for the 'strokeRoundedWebProtection' icon.
  static const IconData webProtection = HugeIconData(0x4a47);

  /// IconData for the 'strokeRoundedWebSecurity' icon.
  static const IconData webSecurity = HugeIconData(0x4a48);

  /// IconData for the 'strokeRoundedWebValidation' icon.
  static const IconData webValidation = HugeIconData(0x4a49);

  /// IconData for the 'strokeRoundedWebflow' icon.
  static const IconData webflow = HugeIconData(0x4a4a);

  /// IconData for the 'strokeRoundedWechat' icon.
  static const IconData wechat = HugeIconData(0x4a4b);

  /// IconData for the 'strokeRoundedWeightScale01' icon.
  static const IconData weightScale01 = HugeIconData(0x4a4c);

  /// IconData for the 'strokeRoundedWeightScale' icon.
  static const IconData weightScale = HugeIconData(0x4a4d);

  /// IconData for the 'strokeRoundedWellness' icon.
  static const IconData wellness = HugeIconData(0x4a4e);

  /// IconData for the 'strokeRoundedWhatsappBusiness' icon.
  static const IconData whatsappBusiness = HugeIconData(0x4a4f);

  /// IconData for the 'strokeRoundedWhatsapp' icon.
  static const IconData whatsapp = HugeIconData(0x4a50);

  /// IconData for the 'strokeRoundedWheelchair' icon.
  static const IconData wheelchair = HugeIconData(0x4a51);

  /// IconData for the 'strokeRoundedWhisk' icon.
  static const IconData whisk = HugeIconData(0x4a52);

  /// IconData for the 'strokeRoundedWhistle' icon.
  static const IconData whistle = HugeIconData(0x4a53);

  /// IconData for the 'strokeRoundedWifi01' icon.
  static const IconData wifi01 = HugeIconData(0x4a54);

  /// IconData for the 'strokeRoundedWifi02' icon.
  static const IconData wifi02 = HugeIconData(0x4a55);

  /// IconData for the 'strokeRoundedWifiCircle' icon.
  static const IconData wifiCircle = HugeIconData(0x4a56);

  /// IconData for the 'strokeRoundedWifiConnected01' icon.
  static const IconData wifiConnected01 = HugeIconData(0x4a57);

  /// IconData for the 'strokeRoundedWifiConnected02' icon.
  static const IconData wifiConnected02 = HugeIconData(0x4a58);

  /// IconData for the 'strokeRoundedWifiConnected03' icon.
  static const IconData wifiConnected03 = HugeIconData(0x4a59);

  /// IconData for the 'strokeRoundedWifiDisconnected01' icon.
  static const IconData wifiDisconnected01 = HugeIconData(0x4a5a);

  /// IconData for the 'strokeRoundedWifiDisconnected02' icon.
  static const IconData wifiDisconnected02 = HugeIconData(0x4a5b);

  /// IconData for the 'strokeRoundedWifiDisconnected03' icon.
  static const IconData wifiDisconnected03 = HugeIconData(0x4a5c);

  /// IconData for the 'strokeRoundedWifiDisconnected04' icon.
  static const IconData wifiDisconnected04 = HugeIconData(0x4a5d);

  /// IconData for the 'strokeRoundedWifiError01' icon.
  static const IconData wifiError01 = HugeIconData(0x4a5e);

  /// IconData for the 'strokeRoundedWifiError02' icon.
  static const IconData wifiError02 = HugeIconData(0x4a5f);

  /// IconData for the 'strokeRoundedWifiFullSignal' icon.
  static const IconData wifiFullSignal = HugeIconData(0x4a60);

  /// IconData for the 'strokeRoundedWifiLocation' icon.
  static const IconData wifiLocation = HugeIconData(0x4a61);

  /// IconData for the 'strokeRoundedWifiLock' icon.
  static const IconData wifiLock = HugeIconData(0x4a62);

  /// IconData for the 'strokeRoundedWifiLowSignal' icon.
  static const IconData wifiLowSignal = HugeIconData(0x4a63);

  /// IconData for the 'strokeRoundedWifiMediumSignal' icon.
  static const IconData wifiMediumSignal = HugeIconData(0x4a64);

  /// IconData for the 'strokeRoundedWifiNoSignal' icon.
  static const IconData wifiNoSignal = HugeIconData(0x4a65);

  /// IconData for the 'strokeRoundedWifiOff01' icon.
  static const IconData wifiOff01 = HugeIconData(0x4a66);

  /// IconData for the 'strokeRoundedWifiOff02' icon.
  static const IconData wifiOff02 = HugeIconData(0x4a67);

  /// IconData for the 'strokeRoundedWifiSquare' icon.
  static const IconData wifiSquare = HugeIconData(0x4a68);

  /// IconData for the 'strokeRoundedWifiUnlock' icon.
  static const IconData wifiUnlock = HugeIconData(0x4a69);

  /// IconData for the 'strokeRoundedWikipedia' icon.
  static const IconData wikipedia = HugeIconData(0x4a6a);

  /// IconData for the 'strokeRoundedWindPower01' icon.
  static const IconData windPower01 = HugeIconData(0x4a6b);

  /// IconData for the 'strokeRoundedWindPower02' icon.
  static const IconData windPower02 = HugeIconData(0x4a6c);

  /// IconData for the 'strokeRoundedWindPower03' icon.
  static const IconData windPower03 = HugeIconData(0x4a6d);

  /// IconData for the 'strokeRoundedWindPower' icon.
  static const IconData windPower = HugeIconData(0x4a6e);

  /// IconData for the 'strokeRoundedWindSurf' icon.
  static const IconData windSurf = HugeIconData(0x4a6f);

  /// IconData for the 'strokeRoundedWindTurbine' icon.
  static const IconData windTurbine = HugeIconData(0x4a70);

  /// IconData for the 'strokeRoundedWink' icon.
  static const IconData wink = HugeIconData(0x4a71);

  /// IconData for the 'strokeRoundedWinking' icon.
  static const IconData winking = HugeIconData(0x4a72);

  /// IconData for the 'strokeRoundedWirelessCloudAccess' icon.
  static const IconData wirelessCloudAccess = HugeIconData(0x4a73);

  /// IconData for the 'strokeRoundedWireless' icon.
  static const IconData wireless = HugeIconData(0x4a74);

  /// IconData for the 'strokeRoundedWise' icon.
  static const IconData wise = HugeIconData(0x4a75);

  /// IconData for the 'strokeRoundedWordpress' icon.
  static const IconData wordpress = HugeIconData(0x4a76);

  /// IconData for the 'strokeRoundedWorkAlert' icon.
  static const IconData workAlert = HugeIconData(0x4a77);

  /// IconData for the 'strokeRoundedWorkHistory' icon.
  static const IconData workHistory = HugeIconData(0x4a78);

  /// IconData for the 'strokeRoundedWorkUpdate' icon.
  static const IconData workUpdate = HugeIconData(0x4a79);

  /// IconData for the 'strokeRoundedWorkflowCircle01' icon.
  static const IconData workflowCircle01 = HugeIconData(0x4a7a);

  /// IconData for the 'strokeRoundedWorkflowCircle02' icon.
  static const IconData workflowCircle02 = HugeIconData(0x4a7b);

  /// IconData for the 'strokeRoundedWorkflowCircle03' icon.
  static const IconData workflowCircle03 = HugeIconData(0x4a7c);

  /// IconData for the 'strokeRoundedWorkflowCircle04' icon.
  static const IconData workflowCircle04 = HugeIconData(0x4a7d);

  /// IconData for the 'strokeRoundedWorkflowCircle05' icon.
  static const IconData workflowCircle05 = HugeIconData(0x4a7e);

  /// IconData for the 'strokeRoundedWorkflowCircle06' icon.
  static const IconData workflowCircle06 = HugeIconData(0x4a7f);

  /// IconData for the 'strokeRoundedWorkflowSquare01' icon.
  static const IconData workflowSquare01 = HugeIconData(0x4a80);

  /// IconData for the 'strokeRoundedWorkflowSquare02' icon.
  static const IconData workflowSquare02 = HugeIconData(0x4a81);

  /// IconData for the 'strokeRoundedWorkflowSquare03' icon.
  static const IconData workflowSquare03 = HugeIconData(0x4a82);

  /// IconData for the 'strokeRoundedWorkflowSquare04' icon.
  static const IconData workflowSquare04 = HugeIconData(0x4a83);

  /// IconData for the 'strokeRoundedWorkflowSquare05' icon.
  static const IconData workflowSquare05 = HugeIconData(0x4a84);

  /// IconData for the 'strokeRoundedWorkflowSquare06' icon.
  static const IconData workflowSquare06 = HugeIconData(0x4a85);

  /// IconData for the 'strokeRoundedWorkflowSquare07' icon.
  static const IconData workflowSquare07 = HugeIconData(0x4a86);

  /// IconData for the 'strokeRoundedWorkflowSquare08' icon.
  static const IconData workflowSquare08 = HugeIconData(0x4a87);

  /// IconData for the 'strokeRoundedWorkflowSquare09' icon.
  static const IconData workflowSquare09 = HugeIconData(0x4a88);

  /// IconData for the 'strokeRoundedWorkflowSquare10' icon.
  static const IconData workflowSquare10 = HugeIconData(0x4a89);

  /// IconData for the 'strokeRoundedWorkoutBattleRopes' icon.
  static const IconData workoutBattleRopes = HugeIconData(0x4a8a);

  /// IconData for the 'strokeRoundedWorkoutGymnastics' icon.
  static const IconData workoutGymnastics = HugeIconData(0x4a8b);

  /// IconData for the 'strokeRoundedWorkoutKicking' icon.
  static const IconData workoutKicking = HugeIconData(0x4a8c);

  /// IconData for the 'strokeRoundedWorkoutRun' icon.
  static const IconData workoutRun = HugeIconData(0x4a8d);

  /// IconData for the 'strokeRoundedWorkoutSport' icon.
  static const IconData workoutSport = HugeIconData(0x4a8e);

  /// IconData for the 'strokeRoundedWorkoutSquats' icon.
  static const IconData workoutSquats = HugeIconData(0x4a8f);

  /// IconData for the 'strokeRoundedWorkoutStretching' icon.
  static const IconData workoutStretching = HugeIconData(0x4a90);

  /// IconData for the 'strokeRoundedWorkoutWarmUp' icon.
  static const IconData workoutWarmUp = HugeIconData(0x4a91);

  /// IconData for the 'strokeRoundedWorry' icon.
  static const IconData worry = HugeIconData(0x4a92);

  /// IconData for the 'strokeRoundedWpsOfficeRectangle' icon.
  static const IconData wpsOfficeRectangle = HugeIconData(0x4a93);

  /// IconData for the 'strokeRoundedWpsOffice' icon.
  static const IconData wpsOffice = HugeIconData(0x4a94);

  /// IconData for the 'strokeRoundedWrench01' icon.
  static const IconData wrench01 = HugeIconData(0x4a95);

  /// IconData for the 'strokeRoundedWrench02' icon.
  static const IconData wrench02 = HugeIconData(0x4a96);

  /// IconData for the 'strokeRoundedWudu' icon.
  static const IconData wudu = HugeIconData(0x4a97);

  /// IconData for the 'strokeRoundedXRay' icon.
  static const IconData xRay = HugeIconData(0x4a98);

  /// IconData for the 'strokeRoundedXVariableCircle' icon.
  static const IconData xVariableCircle = HugeIconData(0x4a99);

  /// IconData for the 'strokeRoundedXVariableSquare' icon.
  static const IconData xVariableSquare = HugeIconData(0x4a9a);

  /// IconData for the 'strokeRoundedXVariable' icon.
  static const IconData xVariable = HugeIconData(0x4a9b);

  /// IconData for the 'strokeRoundedXing' icon.
  static const IconData xing = HugeIconData(0x4a9c);

  /// IconData for the 'strokeRoundedXls01' icon.
  static const IconData xls01 = HugeIconData(0x4a9d);

  /// IconData for the 'strokeRoundedXls02' icon.
  static const IconData xls02 = HugeIconData(0x4a9e);

  /// IconData for the 'strokeRoundedXml01' icon.
  static const IconData xml01 = HugeIconData(0x4a9f);

  /// IconData for the 'strokeRoundedXml02' icon.
  static const IconData xml02 = HugeIconData(0x4aa0);

  /// IconData for the 'strokeRoundedXsl01' icon.
  static const IconData xsl01 = HugeIconData(0x4aa1);

  /// IconData for the 'strokeRoundedXsl02' icon.
  static const IconData xsl02 = HugeIconData(0x4aa2);

  /// IconData for the 'strokeRoundedYelp' icon.
  static const IconData yelp = HugeIconData(0x4aa3);

  /// IconData for the 'strokeRoundedYenCircle' icon.
  static const IconData yenCircle = HugeIconData(0x4aa4);

  /// IconData for the 'strokeRoundedYenReceive' icon.
  static const IconData yenReceive = HugeIconData(0x4aa5);

  /// IconData for the 'strokeRoundedYenSend' icon.
  static const IconData yenSend = HugeIconData(0x4aa6);

  /// IconData for the 'strokeRoundedYenSquare' icon.
  static const IconData yenSquare = HugeIconData(0x4aa7);

  /// IconData for the 'strokeRoundedYen' icon.
  static const IconData yen = HugeIconData(0x4aa8);

  /// IconData for the 'strokeRoundedYoga01' icon.
  static const IconData yoga01 = HugeIconData(0x4aa9);

  /// IconData for the 'strokeRoundedYoga02' icon.
  static const IconData yoga02 = HugeIconData(0x4aaa);

  /// IconData for the 'strokeRoundedYoga03' icon.
  static const IconData yoga03 = HugeIconData(0x4aab);

  /// IconData for the 'strokeRoundedYogaBall' icon.
  static const IconData yogaBall = HugeIconData(0x4aac);

  /// IconData for the 'strokeRoundedYogaMat' icon.
  static const IconData yogaMat = HugeIconData(0x4aad);

  /// IconData for the 'strokeRoundedYogurt' icon.
  static const IconData yogurt = HugeIconData(0x4aae);

  /// IconData for the 'strokeRoundedYoutube' icon.
  static const IconData youtube = HugeIconData(0x4aaf);

  /// IconData for the 'strokeRoundedYurt' icon.
  static const IconData yurt = HugeIconData(0x4ab0);

  /// IconData for the 'strokeRoundedZakat' icon.
  static const IconData zakat = HugeIconData(0x4ab1);

  /// IconData for the 'strokeRoundedZap' icon.
  static const IconData zap = HugeIconData(0x4ab2);

  /// IconData for the 'strokeRoundedZeppelin' icon.
  static const IconData zeppelin = HugeIconData(0x4ab3);

  /// IconData for the 'strokeRoundedZip01' icon.
  static const IconData zip01 = HugeIconData(0x4ab4);

  /// IconData for the 'strokeRoundedZip02' icon.
  static const IconData zip02 = HugeIconData(0x4ab5);

  /// IconData for the 'strokeRoundedZoomCircle' icon.
  static const IconData zoomCircle = HugeIconData(0x4ab6);

  /// IconData for the 'strokeRoundedZoomInArea' icon.
  static const IconData zoomInArea = HugeIconData(0x4ab7);

  /// IconData for the 'strokeRoundedZoomOutArea' icon.
  static const IconData zoomOutArea = HugeIconData(0x4ab8);

  /// IconData for the 'strokeRoundedZoomSquare' icon.
  static const IconData zoomSquare = HugeIconData(0x4ab9);

  /// IconData for the 'strokeRoundedZoom' icon.
  static const IconData zoom = HugeIconData(0x4aba);
}

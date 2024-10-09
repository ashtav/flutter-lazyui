import 'package:flutter/widgets.dart';

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

/// A collection of stroke-rounded icons for use in Flutter applications.
///
/// The [HugeIcons] class provides a comprehensive set of stroke-rounded icons
/// for enhancing the UI design of your Flutter applications.
class Hi {
  /// IconData for the 'strokeRoundedAbacus' icon.
  static const IconData strokeRoundedAbacus = HugeIconData(0x3a9c);

  /// IconData for the 'strokeRoundedAbsolute' icon.
  static const IconData strokeRoundedAbsolute = HugeIconData(0x3a9d);

  /// IconData for the 'strokeRoundedAcceleration' icon.
  static const IconData strokeRoundedAcceleration = HugeIconData(0x3a9e);

  /// IconData for the 'strokeRoundedAccess' icon.
  static const IconData strokeRoundedAccess = HugeIconData(0x3a9f);

  /// IconData for the 'strokeRoundedAccident' icon.
  static const IconData strokeRoundedAccident = HugeIconData(0x3aa0);

  /// IconData for the 'strokeRoundedAccountSetting01' icon.
  static const IconData strokeRoundedAccountSetting01 = HugeIconData(0x3aa1);

  /// IconData for the 'strokeRoundedAccountSetting02' icon.
  static const IconData strokeRoundedAccountSetting02 = HugeIconData(0x3aa2);

  /// IconData for the 'strokeRoundedAccountSetting03' icon.
  static const IconData strokeRoundedAccountSetting03 = HugeIconData(0x3aa3);

  /// IconData for the 'strokeRoundedActivity01' icon.
  static const IconData strokeRoundedActivity01 = HugeIconData(0x3aa4);

  /// IconData for the 'strokeRoundedActivity02' icon.
  static const IconData strokeRoundedActivity02 = HugeIconData(0x3aa5);

  /// IconData for the 'strokeRoundedActivity03' icon.
  static const IconData strokeRoundedActivity03 = HugeIconData(0x3aa6);

  /// IconData for the 'strokeRoundedActivity04' icon.
  static const IconData strokeRoundedActivity04 = HugeIconData(0x3aa7);

  /// IconData for the 'strokeRoundedAcute' icon.
  static const IconData strokeRoundedAcute = HugeIconData(0x3aa8);

  /// IconData for the 'strokeRoundedAdd01' icon.
  static const IconData strokeRoundedAdd01 = HugeIconData(0x3aa9);

  /// IconData for the 'strokeRoundedAdd02' icon.
  static const IconData strokeRoundedAdd02 = HugeIconData(0x3aaa);

  /// IconData for the 'strokeRoundedAddCircleHalfDot' icon.
  static const IconData strokeRoundedAddCircleHalfDot = HugeIconData(0x3aab);

  /// IconData for the 'strokeRoundedAddCircle' icon.
  static const IconData strokeRoundedAddCircle = HugeIconData(0x3aac);

  /// IconData for the 'strokeRoundedAddSquare' icon.
  static const IconData strokeRoundedAddSquare = HugeIconData(0x3aad);

  /// IconData for the 'strokeRoundedAddTeam' icon.
  static const IconData strokeRoundedAddTeam = HugeIconData(0x3aae);

  /// IconData for the 'strokeRoundedAddressBook' icon.
  static const IconData strokeRoundedAddressBook = HugeIconData(0x3aaf);

  /// IconData for the 'strokeRoundedAdobeAfterEffect' icon.
  static const IconData strokeRoundedAdobeAfterEffect = HugeIconData(0x3ab0);

  /// IconData for the 'strokeRoundedAdobeIllustrator' icon.
  static const IconData strokeRoundedAdobeIllustrator = HugeIconData(0x3ab1);

  /// IconData for the 'strokeRoundedAdobeIndesign' icon.
  static const IconData strokeRoundedAdobeIndesign = HugeIconData(0x3ab2);

  /// IconData for the 'strokeRoundedAdobePhotoshop' icon.
  static const IconData strokeRoundedAdobePhotoshop = HugeIconData(0x3ab3);

  /// IconData for the 'strokeRoundedAdobePremier' icon.
  static const IconData strokeRoundedAdobePremier = HugeIconData(0x3ab4);

  /// IconData for the 'strokeRoundedAdobeXd' icon.
  static const IconData strokeRoundedAdobeXd = HugeIconData(0x3ab5);

  /// IconData for the 'strokeRoundedAdventure' icon.
  static const IconData strokeRoundedAdventure = HugeIconData(0x3ab6);

  /// IconData for the 'strokeRoundedAdvertisiment' icon.
  static const IconData strokeRoundedAdvertisiment = HugeIconData(0x3ab7);

  /// IconData for the 'strokeRoundedAdzan' icon.
  static const IconData strokeRoundedAdzan = HugeIconData(0x3ab8);

  /// IconData for the 'strokeRoundedAffiliate' icon.
  static const IconData strokeRoundedAffiliate = HugeIconData(0x3ab9);

  /// IconData for the 'strokeRoundedAgreement01' icon.
  static const IconData strokeRoundedAgreement01 = HugeIconData(0x3aba);

  /// IconData for the 'strokeRoundedAgreement02' icon.
  static const IconData strokeRoundedAgreement02 = HugeIconData(0x3abb);

  /// IconData for the 'strokeRoundedAgreement03' icon.
  static const IconData strokeRoundedAgreement03 = HugeIconData(0x3abc);

  /// IconData for the 'strokeRoundedAiBeautify' icon.
  static const IconData strokeRoundedAiBeautify = HugeIconData(0x3abd);

  /// IconData for the 'strokeRoundedAiBook' icon.
  static const IconData strokeRoundedAiBook = HugeIconData(0x3abe);

  /// IconData for the 'strokeRoundedAiBrain01' icon.
  static const IconData strokeRoundedAiBrain01 = HugeIconData(0x3abf);

  /// IconData for the 'strokeRoundedAiBrain02' icon.
  static const IconData strokeRoundedAiBrain02 = HugeIconData(0x3ac0);

  /// IconData for the 'strokeRoundedAiBrain03' icon.
  static const IconData strokeRoundedAiBrain03 = HugeIconData(0x3ac1);

  /// IconData for the 'strokeRoundedAiBrain04' icon.
  static const IconData strokeRoundedAiBrain04 = HugeIconData(0x3ac2);

  /// IconData for the 'strokeRoundedAiBrain05' icon.
  static const IconData strokeRoundedAiBrain05 = HugeIconData(0x3ac3);

  /// IconData for the 'strokeRoundedAiBrowser' icon.
  static const IconData strokeRoundedAiBrowser = HugeIconData(0x3ac4);

  /// IconData for the 'strokeRoundedAiChat01' icon.
  static const IconData strokeRoundedAiChat01 = HugeIconData(0x3ac5);

  /// IconData for the 'strokeRoundedAiChat02' icon.
  static const IconData strokeRoundedAiChat02 = HugeIconData(0x3ac6);

  /// IconData for the 'strokeRoundedAiCloud01' icon.
  static const IconData strokeRoundedAiCloud01 = HugeIconData(0x3ac7);

  /// IconData for the 'strokeRoundedAiCloud02' icon.
  static const IconData strokeRoundedAiCloud02 = HugeIconData(0x3ac8);

  /// IconData for the 'strokeRoundedAiCloud' icon.
  static const IconData strokeRoundedAiCloud = HugeIconData(0x3ac9);

  /// IconData for the 'strokeRoundedAiComputer' icon.
  static const IconData strokeRoundedAiComputer = HugeIconData(0x3aca);

  /// IconData for the 'strokeRoundedAiDna' icon.
  static const IconData strokeRoundedAiDna = HugeIconData(0x3acb);

  /// IconData for the 'strokeRoundedAiEraser' icon.
  static const IconData strokeRoundedAiEraser = HugeIconData(0x3acc);

  /// IconData for the 'strokeRoundedAiFolder01' icon.
  static const IconData strokeRoundedAiFolder01 = HugeIconData(0x3acd);

  /// IconData for the 'strokeRoundedAiFolder02' icon.
  static const IconData strokeRoundedAiFolder02 = HugeIconData(0x3ace);

  /// IconData for the 'strokeRoundedAiGame' icon.
  static const IconData strokeRoundedAiGame = HugeIconData(0x3acf);

  /// IconData for the 'strokeRoundedAiGenerative' icon.
  static const IconData strokeRoundedAiGenerative = HugeIconData(0x3ad0);

  /// IconData for the 'strokeRoundedAiIdea' icon.
  static const IconData strokeRoundedAiIdea = HugeIconData(0x3ad1);

  /// IconData for the 'strokeRoundedAiImage' icon.
  static const IconData strokeRoundedAiImage = HugeIconData(0x3ad2);

  /// IconData for the 'strokeRoundedAiInnovation01' icon.
  static const IconData strokeRoundedAiInnovation01 = HugeIconData(0x3ad3);

  /// IconData for the 'strokeRoundedAiInnovation02' icon.
  static const IconData strokeRoundedAiInnovation02 = HugeIconData(0x3ad4);

  /// IconData for the 'strokeRoundedAiInnovation03' icon.
  static const IconData strokeRoundedAiInnovation03 = HugeIconData(0x3ad5);

  /// IconData for the 'strokeRoundedAiLaptop' icon.
  static const IconData strokeRoundedAiLaptop = HugeIconData(0x3ad6);

  /// IconData for the 'strokeRoundedAiLearning' icon.
  static const IconData strokeRoundedAiLearning = HugeIconData(0x3ad7);

  /// IconData for the 'strokeRoundedAiLock' icon.
  static const IconData strokeRoundedAiLock = HugeIconData(0x3ad8);

  /// IconData for the 'strokeRoundedAiMagic' icon.
  static const IconData strokeRoundedAiMagic = HugeIconData(0x3ad9);

  /// IconData for the 'strokeRoundedAiMail01' icon.
  static const IconData strokeRoundedAiMail01 = HugeIconData(0x3ada);

  /// IconData for the 'strokeRoundedAiMail02' icon.
  static const IconData strokeRoundedAiMail02 = HugeIconData(0x3adb);

  /// IconData for the 'strokeRoundedAiMail' icon.
  static const IconData strokeRoundedAiMail = HugeIconData(0x3adc);

  /// IconData for the 'strokeRoundedAiNetwork' icon.
  static const IconData strokeRoundedAiNetwork = HugeIconData(0x3add);

  /// IconData for the 'strokeRoundedAiPhone01' icon.
  static const IconData strokeRoundedAiPhone01 = HugeIconData(0x3ade);

  /// IconData for the 'strokeRoundedAiPhone02' icon.
  static const IconData strokeRoundedAiPhone02 = HugeIconData(0x3adf);

  /// IconData for the 'strokeRoundedAiProgramming' icon.
  static const IconData strokeRoundedAiProgramming = HugeIconData(0x3ae0);

  /// IconData for the 'strokeRoundedAiSearch' icon.
  static const IconData strokeRoundedAiSearch = HugeIconData(0x3ae1);

  /// IconData for the 'strokeRoundedAiSecurity01' icon.
  static const IconData strokeRoundedAiSecurity01 = HugeIconData(0x3ae2);

  /// IconData for the 'strokeRoundedAiSecurity02' icon.
  static const IconData strokeRoundedAiSecurity02 = HugeIconData(0x3ae3);

  /// IconData for the 'strokeRoundedAiSetting' icon.
  static const IconData strokeRoundedAiSetting = HugeIconData(0x3ae4);

  /// IconData for the 'strokeRoundedAiSmartwatch' icon.
  static const IconData strokeRoundedAiSmartwatch = HugeIconData(0x3ae5);

  /// IconData for the 'strokeRoundedAiUser' icon.
  static const IconData strokeRoundedAiUser = HugeIconData(0x3ae6);

  /// IconData for the 'strokeRoundedAiVideo' icon.
  static const IconData strokeRoundedAiVideo = HugeIconData(0x3ae7);

  /// IconData for the 'strokeRoundedAiView' icon.
  static const IconData strokeRoundedAiView = HugeIconData(0x3ae8);

  /// IconData for the 'strokeRoundedAids' icon.
  static const IconData strokeRoundedAids = HugeIconData(0x3ae9);

  /// IconData for the 'strokeRoundedAirbnb' icon.
  static const IconData strokeRoundedAirbnb = HugeIconData(0x3aea);

  /// IconData for the 'strokeRoundedAircraftGame' icon.
  static const IconData strokeRoundedAircraftGame = HugeIconData(0x3aeb);

  /// IconData for the 'strokeRoundedAirdrop' icon.
  static const IconData strokeRoundedAirdrop = HugeIconData(0x3aec);

  /// IconData for the 'strokeRoundedAirplane01' icon.
  static const IconData strokeRoundedAirplane01 = HugeIconData(0x3aed);

  /// IconData for the 'strokeRoundedAirplane02' icon.
  static const IconData strokeRoundedAirplane02 = HugeIconData(0x3aee);

  /// IconData for the 'strokeRoundedAirplaneLanding01' icon.
  static const IconData strokeRoundedAirplaneLanding01 = HugeIconData(0x3aef);

  /// IconData for the 'strokeRoundedAirplaneLanding02' icon.
  static const IconData strokeRoundedAirplaneLanding02 = HugeIconData(0x3af0);

  /// IconData for the 'strokeRoundedAirplaneModeOff' icon.
  static const IconData strokeRoundedAirplaneModeOff = HugeIconData(0x3af1);

  /// IconData for the 'strokeRoundedAirplaneMode' icon.
  static const IconData strokeRoundedAirplaneMode = HugeIconData(0x3af2);

  /// IconData for the 'strokeRoundedAirplaneSeat' icon.
  static const IconData strokeRoundedAirplaneSeat = HugeIconData(0x3af3);

  /// IconData for the 'strokeRoundedAirplaneTakeOff01' icon.
  static const IconData strokeRoundedAirplaneTakeOff01 = HugeIconData(0x3af4);

  /// IconData for the 'strokeRoundedAirplaneTakeOff02' icon.
  static const IconData strokeRoundedAirplaneTakeOff02 = HugeIconData(0x3af5);

  /// IconData for the 'strokeRoundedAirplayLine' icon.
  static const IconData strokeRoundedAirplayLine = HugeIconData(0x3af6);

  /// IconData for the 'strokeRoundedAirpod01' icon.
  static const IconData strokeRoundedAirpod01 = HugeIconData(0x3af7);

  /// IconData for the 'strokeRoundedAirpod02' icon.
  static const IconData strokeRoundedAirpod02 = HugeIconData(0x3af8);

  /// IconData for the 'strokeRoundedAirpod03' icon.
  static const IconData strokeRoundedAirpod03 = HugeIconData(0x3af9);

  /// IconData for the 'strokeRoundedAirport' icon.
  static const IconData strokeRoundedAirport = HugeIconData(0x3afa);

  /// IconData for the 'strokeRoundedAlAqsaMosque' icon.
  static const IconData strokeRoundedAlAqsaMosque = HugeIconData(0x3afb);

  /// IconData for the 'strokeRoundedAlarmClock' icon.
  static const IconData strokeRoundedAlarmClock = HugeIconData(0x3afc);

  /// IconData for the 'strokeRoundedAlbum01' icon.
  static const IconData strokeRoundedAlbum01 = HugeIconData(0x3afd);

  /// IconData for the 'strokeRoundedAlbum02' icon.
  static const IconData strokeRoundedAlbum02 = HugeIconData(0x3afe);

  /// IconData for the 'strokeRoundedAlbumNotFound01' icon.
  static const IconData strokeRoundedAlbumNotFound01 = HugeIconData(0x3aff);

  /// IconData for the 'strokeRoundedAlbumNotFound02' icon.
  static const IconData strokeRoundedAlbumNotFound02 = HugeIconData(0x3b00);

  /// IconData for the 'strokeRoundedAlert01' icon.
  static const IconData strokeRoundedAlert01 = HugeIconData(0x3b01);

  /// IconData for the 'strokeRoundedAlert02' icon.
  static const IconData strokeRoundedAlert02 = HugeIconData(0x3b02);

  /// IconData for the 'strokeRoundedAlertCircle' icon.
  static const IconData strokeRoundedAlertCircle = HugeIconData(0x3b03);

  /// IconData for the 'strokeRoundedAlertDiamond' icon.
  static const IconData strokeRoundedAlertDiamond = HugeIconData(0x3b04);

  /// IconData for the 'strokeRoundedAlertSquare' icon.
  static const IconData strokeRoundedAlertSquare = HugeIconData(0x3b05);

  /// IconData for the 'strokeRoundedAlgorithm' icon.
  static const IconData strokeRoundedAlgorithm = HugeIconData(0x3b06);

  /// IconData for the 'strokeRoundedAlien01' icon.
  static const IconData strokeRoundedAlien01 = HugeIconData(0x3b07);

  /// IconData for the 'strokeRoundedAlien02' icon.
  static const IconData strokeRoundedAlien02 = HugeIconData(0x3b08);

  /// IconData for the 'strokeRoundedAlignBottom' icon.
  static const IconData strokeRoundedAlignBottom = HugeIconData(0x3b09);

  /// IconData for the 'strokeRoundedAlignBoxBottomCenter' icon.
  static const IconData strokeRoundedAlignBoxBottomCenter =
      HugeIconData(0x3b0a);

  /// IconData for the 'strokeRoundedAlignBoxBottomLeft' icon.
  static const IconData strokeRoundedAlignBoxBottomLeft = HugeIconData(0x3b0b);

  /// IconData for the 'strokeRoundedAlignBoxBottomRight' icon.
  static const IconData strokeRoundedAlignBoxBottomRight = HugeIconData(0x3b0c);

  /// IconData for the 'strokeRoundedAlignBoxMiddleCenter' icon.
  static const IconData strokeRoundedAlignBoxMiddleCenter =
      HugeIconData(0x3b0d);

  /// IconData for the 'strokeRoundedAlignBoxMiddleLeft' icon.
  static const IconData strokeRoundedAlignBoxMiddleLeft = HugeIconData(0x3b0e);

  /// IconData for the 'strokeRoundedAlignBoxMiddleRight' icon.
  static const IconData strokeRoundedAlignBoxMiddleRight = HugeIconData(0x3b0f);

  /// IconData for the 'strokeRoundedAlignBoxTopCenter' icon.
  static const IconData strokeRoundedAlignBoxTopCenter = HugeIconData(0x3b10);

  /// IconData for the 'strokeRoundedAlignBoxTopLeft' icon.
  static const IconData strokeRoundedAlignBoxTopLeft = HugeIconData(0x3b11);

  /// IconData for the 'strokeRoundedAlignBoxTopRight' icon.
  static const IconData strokeRoundedAlignBoxTopRight = HugeIconData(0x3b12);

  /// IconData for the 'strokeRoundedAlignHorizontalCenter' icon.
  static const IconData strokeRoundedAlignHorizontalCenter =
      HugeIconData(0x3b13);

  /// IconData for the 'strokeRoundedAlignKeyObject' icon.
  static const IconData strokeRoundedAlignKeyObject = HugeIconData(0x3b14);

  /// IconData for the 'strokeRoundedAlignLeft' icon.
  static const IconData strokeRoundedAlignLeft = HugeIconData(0x3b15);

  /// IconData for the 'strokeRoundedAlignRight' icon.
  static const IconData strokeRoundedAlignRight = HugeIconData(0x3b16);

  /// IconData for the 'strokeRoundedAlignSelection' icon.
  static const IconData strokeRoundedAlignSelection = HugeIconData(0x3b17);

  /// IconData for the 'strokeRoundedAlignTop' icon.
  static const IconData strokeRoundedAlignTop = HugeIconData(0x3b18);

  /// IconData for the 'strokeRoundedAlignVerticalCenter' icon.
  static const IconData strokeRoundedAlignVerticalCenter = HugeIconData(0x3b19);

  /// IconData for the 'strokeRoundedAllBookmark' icon.
  static const IconData strokeRoundedAllBookmark = HugeIconData(0x3b1a);

  /// IconData for the 'strokeRoundedAllah' icon.
  static const IconData strokeRoundedAllah = HugeIconData(0x3b1b);

  /// IconData for the 'strokeRoundedAlms' icon.
  static const IconData strokeRoundedAlms = HugeIconData(0x3b1c);

  /// IconData for the 'strokeRoundedAlphaCircle' icon.
  static const IconData strokeRoundedAlphaCircle = HugeIconData(0x3b1d);

  /// IconData for the 'strokeRoundedAlphaSquare' icon.
  static const IconData strokeRoundedAlphaSquare = HugeIconData(0x3b1e);

  /// IconData for the 'strokeRoundedAlpha' icon.
  static const IconData strokeRoundedAlpha = HugeIconData(0x3b1f);

  /// IconData for the 'strokeRoundedAlphabetArabic' icon.
  static const IconData strokeRoundedAlphabetArabic = HugeIconData(0x3b20);

  /// IconData for the 'strokeRoundedAlphabetBangla' icon.
  static const IconData strokeRoundedAlphabetBangla = HugeIconData(0x3b21);

  /// IconData for the 'strokeRoundedAlphabetChinese' icon.
  static const IconData strokeRoundedAlphabetChinese = HugeIconData(0x3b22);

  /// IconData for the 'strokeRoundedAlphabetGreek' icon.
  static const IconData strokeRoundedAlphabetGreek = HugeIconData(0x3b23);

  /// IconData for the 'strokeRoundedAlphabetHebrew' icon.
  static const IconData strokeRoundedAlphabetHebrew = HugeIconData(0x3b24);

  /// IconData for the 'strokeRoundedAlphabetHindi' icon.
  static const IconData strokeRoundedAlphabetHindi = HugeIconData(0x3b25);

  /// IconData for the 'strokeRoundedAlphabetJapanese' icon.
  static const IconData strokeRoundedAlphabetJapanese = HugeIconData(0x3b26);

  /// IconData for the 'strokeRoundedAlphabetKorean' icon.
  static const IconData strokeRoundedAlphabetKorean = HugeIconData(0x3b27);

  /// IconData for the 'strokeRoundedAlphabetThai' icon.
  static const IconData strokeRoundedAlphabetThai = HugeIconData(0x3b28);

  /// IconData for the 'strokeRoundedAmazon' icon.
  static const IconData strokeRoundedAmazon = HugeIconData(0x3b29);

  /// IconData for the 'strokeRoundedAmbulance' icon.
  static const IconData strokeRoundedAmbulance = HugeIconData(0x3b2a);

  /// IconData for the 'strokeRoundedAmericanFootball' icon.
  static const IconData strokeRoundedAmericanFootball = HugeIconData(0x3b2b);

  /// IconData for the 'strokeRoundedAmie' icon.
  static const IconData strokeRoundedAmie = HugeIconData(0x3b2c);

  /// IconData for the 'strokeRoundedAmpoule' icon.
  static const IconData strokeRoundedAmpoule = HugeIconData(0x3b2d);

  /// IconData for the 'strokeRoundedAnalysisTextLink' icon.
  static const IconData strokeRoundedAnalysisTextLink = HugeIconData(0x3b2e);

  /// IconData for the 'strokeRoundedAnalytics01' icon.
  static const IconData strokeRoundedAnalytics01 = HugeIconData(0x3b2f);

  /// IconData for the 'strokeRoundedAnalytics02' icon.
  static const IconData strokeRoundedAnalytics02 = HugeIconData(0x3b30);

  /// IconData for the 'strokeRoundedAnalyticsDown' icon.
  static const IconData strokeRoundedAnalyticsDown = HugeIconData(0x3b31);

  /// IconData for the 'strokeRoundedAnalyticsUp' icon.
  static const IconData strokeRoundedAnalyticsUp = HugeIconData(0x3b32);

  /// IconData for the 'strokeRoundedAnchorPoint' icon.
  static const IconData strokeRoundedAnchorPoint = HugeIconData(0x3b33);

  /// IconData for the 'strokeRoundedAndroid' icon.
  static const IconData strokeRoundedAndroid = HugeIconData(0x3b34);

  /// IconData for the 'strokeRoundedAngel' icon.
  static const IconData strokeRoundedAngel = HugeIconData(0x3b35);

  /// IconData for the 'strokeRoundedAngle01' icon.
  static const IconData strokeRoundedAngle01 = HugeIconData(0x3b36);

  /// IconData for the 'strokeRoundedAngle' icon.
  static const IconData strokeRoundedAngle = HugeIconData(0x3b37);

  /// IconData for the 'strokeRoundedAngryBird' icon.
  static const IconData strokeRoundedAngryBird = HugeIconData(0x3b38);

  /// IconData for the 'strokeRoundedAngry' icon.
  static const IconData strokeRoundedAngry = HugeIconData(0x3b39);

  /// IconData for the 'strokeRoundedAnonymous' icon.
  static const IconData strokeRoundedAnonymous = HugeIconData(0x3b3a);

  /// IconData for the 'strokeRoundedApi' icon.
  static const IconData strokeRoundedApi = HugeIconData(0x3b3b);

  /// IconData for the 'strokeRoundedAppStore' icon.
  static const IconData strokeRoundedAppStore = HugeIconData(0x3b3c);

  /// IconData for the 'strokeRoundedApple01' icon.
  static const IconData strokeRoundedApple01 = HugeIconData(0x3b3d);

  /// IconData for the 'strokeRoundedAppleFinder' icon.
  static const IconData strokeRoundedAppleFinder = HugeIconData(0x3b3e);

  /// IconData for the 'strokeRoundedAppleNews' icon.
  static const IconData strokeRoundedAppleNews = HugeIconData(0x3b3f);

  /// IconData for the 'strokeRoundedApplePie' icon.
  static const IconData strokeRoundedApplePie = HugeIconData(0x3b40);

  /// IconData for the 'strokeRoundedAppleReminder' icon.
  static const IconData strokeRoundedAppleReminder = HugeIconData(0x3b41);

  /// IconData for the 'strokeRoundedAppleStocks' icon.
  static const IconData strokeRoundedAppleStocks = HugeIconData(0x3b42);

  /// IconData for the 'strokeRoundedAppleVisionPro' icon.
  static const IconData strokeRoundedAppleVisionPro = HugeIconData(0x3b43);

  /// IconData for the 'strokeRoundedApple' icon.
  static const IconData strokeRoundedApple = HugeIconData(0x3b44);

  /// IconData for the 'strokeRoundedApproximatelyEqualCircle' icon.
  static const IconData strokeRoundedApproximatelyEqualCircle =
      HugeIconData(0x3b45);

  /// IconData for the 'strokeRoundedApproximatelyEqualSquare' icon.
  static const IconData strokeRoundedApproximatelyEqualSquare =
      HugeIconData(0x3b46);

  /// IconData for the 'strokeRoundedApproximatelyEqual' icon.
  static const IconData strokeRoundedApproximatelyEqual = HugeIconData(0x3b47);

  /// IconData for the 'strokeRoundedApricot' icon.
  static const IconData strokeRoundedApricot = HugeIconData(0x3b48);

  /// IconData for the 'strokeRoundedApron' icon.
  static const IconData strokeRoundedApron = HugeIconData(0x3b49);

  /// IconData for the 'strokeRoundedArcBrowser' icon.
  static const IconData strokeRoundedArcBrowser = HugeIconData(0x3b4a);

  /// IconData for the 'strokeRoundedArcher' icon.
  static const IconData strokeRoundedArcher = HugeIconData(0x3b4b);

  /// IconData for the 'strokeRoundedArchive01' icon.
  static const IconData strokeRoundedArchive01 = HugeIconData(0x3b4c);

  /// IconData for the 'strokeRoundedArchive02' icon.
  static const IconData strokeRoundedArchive02 = HugeIconData(0x3b4d);

  /// IconData for the 'strokeRoundedArchive' icon.
  static const IconData strokeRoundedArchive = HugeIconData(0x3b4e);

  /// IconData for the 'strokeRoundedArmoredBoot' icon.
  static const IconData strokeRoundedArmoredBoot = HugeIconData(0x3b4f);

  /// IconData for the 'strokeRoundedArrangeByLettersAZ' icon.
  static const IconData strokeRoundedArrangeByLettersAZ = HugeIconData(0x3b50);

  /// IconData for the 'strokeRoundedArrangeByLettersZA' icon.
  static const IconData strokeRoundedArrangeByLettersZA = HugeIconData(0x3b51);

  /// IconData for the 'strokeRoundedArrangeByNumbers19' icon.
  static const IconData strokeRoundedArrangeByNumbers19 = HugeIconData(0x3b52);

  /// IconData for the 'strokeRoundedArrangeByNumbers91' icon.
  static const IconData strokeRoundedArrangeByNumbers91 = HugeIconData(0x3b53);

  /// IconData for the 'strokeRoundedArrange' icon.
  static const IconData strokeRoundedArrange = HugeIconData(0x3b54);

  /// IconData for the 'strokeRoundedArrowAllDirection' icon.
  static const IconData strokeRoundedArrowAllDirection = HugeIconData(0x3b55);

  /// IconData for the 'strokeRoundedArrowDataTransferDiagonal' icon.
  static const IconData strokeRoundedArrowDataTransferDiagonal =
      HugeIconData(0x3b56);

  /// IconData for the 'strokeRoundedArrowDataTransferHorizontal' icon.
  static const IconData strokeRoundedArrowDataTransferHorizontal =
      HugeIconData(0x3b57);

  /// IconData for the 'strokeRoundedArrowDataTransferVertical' icon.
  static const IconData strokeRoundedArrowDataTransferVertical =
      HugeIconData(0x3b58);

  /// IconData for the 'strokeRoundedArrowDiagonal' icon.
  static const IconData strokeRoundedArrowDiagonal = HugeIconData(0x3b59);

  /// IconData for the 'strokeRoundedArrowDown01' icon.
  static const IconData strokeRoundedArrowDown01 = HugeIconData(0x3b5a);

  /// IconData for the 'strokeRoundedArrowDown02' icon.
  static const IconData strokeRoundedArrowDown02 = HugeIconData(0x3b5b);

  /// IconData for the 'strokeRoundedArrowDown03' icon.
  static const IconData strokeRoundedArrowDown03 = HugeIconData(0x3b5c);

  /// IconData for the 'strokeRoundedArrowDown04' icon.
  static const IconData strokeRoundedArrowDown04 = HugeIconData(0x3b5d);

  /// IconData for the 'strokeRoundedArrowDown05' icon.
  static const IconData strokeRoundedArrowDown05 = HugeIconData(0x3b5e);

  /// IconData for the 'strokeRoundedArrowDownDouble' icon.
  static const IconData strokeRoundedArrowDownDouble = HugeIconData(0x3b5f);

  /// IconData for the 'strokeRoundedArrowDownLeft01' icon.
  static const IconData strokeRoundedArrowDownLeft01 = HugeIconData(0x3b60);

  /// IconData for the 'strokeRoundedArrowDownLeft02' icon.
  static const IconData strokeRoundedArrowDownLeft02 = HugeIconData(0x3b61);

  /// IconData for the 'strokeRoundedArrowDownRight01' icon.
  static const IconData strokeRoundedArrowDownRight01 = HugeIconData(0x3b62);

  /// IconData for the 'strokeRoundedArrowDownRight02' icon.
  static const IconData strokeRoundedArrowDownRight02 = HugeIconData(0x3b63);

  /// IconData for the 'strokeRoundedArrowExpand01' icon.
  static const IconData strokeRoundedArrowExpand01 = HugeIconData(0x3b64);

  /// IconData for the 'strokeRoundedArrowExpand02' icon.
  static const IconData strokeRoundedArrowExpand02 = HugeIconData(0x3b65);

  /// IconData for the 'strokeRoundedArrowExpandDiagonal01' icon.
  static const IconData strokeRoundedArrowExpandDiagonal01 =
      HugeIconData(0x3b66);

  /// IconData for the 'strokeRoundedArrowExpandDiagonal02' icon.
  static const IconData strokeRoundedArrowExpandDiagonal02 =
      HugeIconData(0x3b67);

  /// IconData for the 'strokeRoundedArrowExpand' icon.
  static const IconData strokeRoundedArrowExpand = HugeIconData(0x3b68);

  /// IconData for the 'strokeRoundedArrowHorizontal' icon.
  static const IconData strokeRoundedArrowHorizontal = HugeIconData(0x3b69);

  /// IconData for the 'strokeRoundedArrowLeft01' icon.
  static const IconData strokeRoundedArrowLeft01 = HugeIconData(0x3b6a);

  /// IconData for the 'strokeRoundedArrowLeft02' icon.
  static const IconData strokeRoundedArrowLeft02 = HugeIconData(0x3b6b);

  /// IconData for the 'strokeRoundedArrowLeft03' icon.
  static const IconData strokeRoundedArrowLeft03 = HugeIconData(0x3b6c);

  /// IconData for the 'strokeRoundedArrowLeft04' icon.
  static const IconData strokeRoundedArrowLeft04 = HugeIconData(0x3b6d);

  /// IconData for the 'strokeRoundedArrowLeft05' icon.
  static const IconData strokeRoundedArrowLeft05 = HugeIconData(0x3b6e);

  /// IconData for the 'strokeRoundedArrowLeftDouble' icon.
  static const IconData strokeRoundedArrowLeftDouble = HugeIconData(0x3b6f);

  /// IconData for the 'strokeRoundedArrowLeftRight' icon.
  static const IconData strokeRoundedArrowLeftRight = HugeIconData(0x3b70);

  /// IconData for the 'strokeRoundedArrowMoveDownLeft' icon.
  static const IconData strokeRoundedArrowMoveDownLeft = HugeIconData(0x3b71);

  /// IconData for the 'strokeRoundedArrowMoveDownRight' icon.
  static const IconData strokeRoundedArrowMoveDownRight = HugeIconData(0x3b72);

  /// IconData for the 'strokeRoundedArrowMoveLeftDown' icon.
  static const IconData strokeRoundedArrowMoveLeftDown = HugeIconData(0x3b73);

  /// IconData for the 'strokeRoundedArrowMoveRightDown' icon.
  static const IconData strokeRoundedArrowMoveRightDown = HugeIconData(0x3b74);

  /// IconData for the 'strokeRoundedArrowMoveUpLeft' icon.
  static const IconData strokeRoundedArrowMoveUpLeft = HugeIconData(0x3b75);

  /// IconData for the 'strokeRoundedArrowMoveUpRight' icon.
  static const IconData strokeRoundedArrowMoveUpRight = HugeIconData(0x3b76);

  /// IconData for the 'strokeRoundedArrowReloadHorizontal' icon.
  static const IconData strokeRoundedArrowReloadHorizontal =
      HugeIconData(0x3b77);

  /// IconData for the 'strokeRoundedArrowReloadVertical' icon.
  static const IconData strokeRoundedArrowReloadVertical = HugeIconData(0x3b78);

  /// IconData for the 'strokeRoundedArrowRight01' icon.
  static const IconData strokeRoundedArrowRight01 = HugeIconData(0x3b79);

  /// IconData for the 'strokeRoundedArrowRight02' icon.
  static const IconData strokeRoundedArrowRight02 = HugeIconData(0x3b7a);

  /// IconData for the 'strokeRoundedArrowRight03' icon.
  static const IconData strokeRoundedArrowRight03 = HugeIconData(0x3b7b);

  /// IconData for the 'strokeRoundedArrowRight04' icon.
  static const IconData strokeRoundedArrowRight04 = HugeIconData(0x3b7c);

  /// IconData for the 'strokeRoundedArrowRight05' icon.
  static const IconData strokeRoundedArrowRight05 = HugeIconData(0x3b7d);

  /// IconData for the 'strokeRoundedArrowRightDouble' icon.
  static const IconData strokeRoundedArrowRightDouble = HugeIconData(0x3b7e);

  /// IconData for the 'strokeRoundedArrowShrink01' icon.
  static const IconData strokeRoundedArrowShrink01 = HugeIconData(0x3b7f);

  /// IconData for the 'strokeRoundedArrowShrink02' icon.
  static const IconData strokeRoundedArrowShrink02 = HugeIconData(0x3b80);

  /// IconData for the 'strokeRoundedArrowShrink' icon.
  static const IconData strokeRoundedArrowShrink = HugeIconData(0x3b81);

  /// IconData for the 'strokeRoundedArrowTurnBackward' icon.
  static const IconData strokeRoundedArrowTurnBackward = HugeIconData(0x3b82);

  /// IconData for the 'strokeRoundedArrowTurnDown' icon.
  static const IconData strokeRoundedArrowTurnDown = HugeIconData(0x3b83);

  /// IconData for the 'strokeRoundedArrowTurnForward' icon.
  static const IconData strokeRoundedArrowTurnForward = HugeIconData(0x3b84);

  /// IconData for the 'strokeRoundedArrowTurnUp' icon.
  static const IconData strokeRoundedArrowTurnUp = HugeIconData(0x3b85);

  /// IconData for the 'strokeRoundedArrowUp01' icon.
  static const IconData strokeRoundedArrowUp01 = HugeIconData(0x3b86);

  /// IconData for the 'strokeRoundedArrowUp02' icon.
  static const IconData strokeRoundedArrowUp02 = HugeIconData(0x3b87);

  /// IconData for the 'strokeRoundedArrowUp03' icon.
  static const IconData strokeRoundedArrowUp03 = HugeIconData(0x3b88);

  /// IconData for the 'strokeRoundedArrowUp04' icon.
  static const IconData strokeRoundedArrowUp04 = HugeIconData(0x3b89);

  /// IconData for the 'strokeRoundedArrowUp05' icon.
  static const IconData strokeRoundedArrowUp05 = HugeIconData(0x3b8a);

  /// IconData for the 'strokeRoundedArrowUpDouble' icon.
  static const IconData strokeRoundedArrowUpDouble = HugeIconData(0x3b8b);

  /// IconData for the 'strokeRoundedArrowUpDown' icon.
  static const IconData strokeRoundedArrowUpDown = HugeIconData(0x3b8c);

  /// IconData for the 'strokeRoundedArrowUpLeft01' icon.
  static const IconData strokeRoundedArrowUpLeft01 = HugeIconData(0x3b8d);

  /// IconData for the 'strokeRoundedArrowUpLeft02' icon.
  static const IconData strokeRoundedArrowUpLeft02 = HugeIconData(0x3b8e);

  /// IconData for the 'strokeRoundedArrowUpRight01' icon.
  static const IconData strokeRoundedArrowUpRight01 = HugeIconData(0x3b8f);

  /// IconData for the 'strokeRoundedArrowUpRight02' icon.
  static const IconData strokeRoundedArrowUpRight02 = HugeIconData(0x3b90);

  /// IconData for the 'strokeRoundedArrowVertical' icon.
  static const IconData strokeRoundedArrowVertical = HugeIconData(0x3b91);

  /// IconData for the 'strokeRoundedArtboardTool' icon.
  static const IconData strokeRoundedArtboardTool = HugeIconData(0x3b92);

  /// IconData for the 'strokeRoundedArtboard' icon.
  static const IconData strokeRoundedArtboard = HugeIconData(0x3b93);

  /// IconData for the 'strokeRoundedArtificialIntelligence01' icon.
  static const IconData strokeRoundedArtificialIntelligence01 =
      HugeIconData(0x3b94);

  /// IconData for the 'strokeRoundedArtificialIntelligence02' icon.
  static const IconData strokeRoundedArtificialIntelligence02 =
      HugeIconData(0x3b95);

  /// IconData for the 'strokeRoundedArtificialIntelligence03' icon.
  static const IconData strokeRoundedArtificialIntelligence03 =
      HugeIconData(0x3b96);

  /// IconData for the 'strokeRoundedArtificialIntelligence04' icon.
  static const IconData strokeRoundedArtificialIntelligence04 =
      HugeIconData(0x3b97);

  /// IconData for the 'strokeRoundedArtificialIntelligence05' icon.
  static const IconData strokeRoundedArtificialIntelligence05 =
      HugeIconData(0x3b98);

  /// IconData for the 'strokeRoundedArtificialIntelligence06' icon.
  static const IconData strokeRoundedArtificialIntelligence06 =
      HugeIconData(0x3b99);

  /// IconData for the 'strokeRoundedArtificialIntelligence07' icon.
  static const IconData strokeRoundedArtificialIntelligence07 =
      HugeIconData(0x3b9a);

  /// IconData for the 'strokeRoundedAspectRatio' icon.
  static const IconData strokeRoundedAspectRatio = HugeIconData(0x3b9b);

  /// IconData for the 'strokeRoundedAssignments' icon.
  static const IconData strokeRoundedAssignments = HugeIconData(0x3b9c);

  /// IconData for the 'strokeRoundedAsteroid01' icon.
  static const IconData strokeRoundedAsteroid01 = HugeIconData(0x3b9d);

  /// IconData for the 'strokeRoundedAsteroid02' icon.
  static const IconData strokeRoundedAsteroid02 = HugeIconData(0x3b9e);

  /// IconData for the 'strokeRoundedAstronaut01' icon.
  static const IconData strokeRoundedAstronaut01 = HugeIconData(0x3b9f);

  /// IconData for the 'strokeRoundedAstronaut02' icon.
  static const IconData strokeRoundedAstronaut02 = HugeIconData(0x3ba0);

  /// IconData for the 'strokeRoundedAt' icon.
  static const IconData strokeRoundedAt = HugeIconData(0x3ba1);

  /// IconData for the 'strokeRoundedAtm01' icon.
  static const IconData strokeRoundedAtm01 = HugeIconData(0x3ba2);

  /// IconData for the 'strokeRoundedAtm02' icon.
  static const IconData strokeRoundedAtm02 = HugeIconData(0x3ba3);

  /// IconData for the 'strokeRoundedAtom01' icon.
  static const IconData strokeRoundedAtom01 = HugeIconData(0x3ba4);

  /// IconData for the 'strokeRoundedAtom02' icon.
  static const IconData strokeRoundedAtom02 = HugeIconData(0x3ba5);

  /// IconData for the 'strokeRoundedAtomicPower' icon.
  static const IconData strokeRoundedAtomicPower = HugeIconData(0x3ba6);

  /// IconData for the 'strokeRoundedAttachment01' icon.
  static const IconData strokeRoundedAttachment01 = HugeIconData(0x3ba7);

  /// IconData for the 'strokeRoundedAttachment02' icon.
  static const IconData strokeRoundedAttachment02 = HugeIconData(0x3ba8);

  /// IconData for the 'strokeRoundedAttachmentCircle' icon.
  static const IconData strokeRoundedAttachmentCircle = HugeIconData(0x3ba9);

  /// IconData for the 'strokeRoundedAttachmentSquare' icon.
  static const IconData strokeRoundedAttachmentSquare = HugeIconData(0x3baa);

  /// IconData for the 'strokeRoundedAttachment' icon.
  static const IconData strokeRoundedAttachment = HugeIconData(0x3bab);

  /// IconData for the 'strokeRoundedAuction' icon.
  static const IconData strokeRoundedAuction = HugeIconData(0x3bac);

  /// IconData for the 'strokeRoundedAudioBook01' icon.
  static const IconData strokeRoundedAudioBook01 = HugeIconData(0x3bad);

  /// IconData for the 'strokeRoundedAudioBook02' icon.
  static const IconData strokeRoundedAudioBook02 = HugeIconData(0x3bae);

  /// IconData for the 'strokeRoundedAudioBook03' icon.
  static const IconData strokeRoundedAudioBook03 = HugeIconData(0x3baf);

  /// IconData for the 'strokeRoundedAudioBook04' icon.
  static const IconData strokeRoundedAudioBook04 = HugeIconData(0x3bb0);

  /// IconData for the 'strokeRoundedAudit01' icon.
  static const IconData strokeRoundedAudit01 = HugeIconData(0x3bb1);

  /// IconData for the 'strokeRoundedAudit02' icon.
  static const IconData strokeRoundedAudit02 = HugeIconData(0x3bb2);

  /// IconData for the 'strokeRoundedAugmentedRealityAr' icon.
  static const IconData strokeRoundedAugmentedRealityAr = HugeIconData(0x3bb3);

  /// IconData for the 'strokeRoundedAuthorized' icon.
  static const IconData strokeRoundedAuthorized = HugeIconData(0x3bb4);

  /// IconData for the 'strokeRoundedAutoConversations' icon.
  static const IconData strokeRoundedAutoConversations = HugeIconData(0x3bb5);

  /// IconData for the 'strokeRoundedAutomotiveBattery01' icon.
  static const IconData strokeRoundedAutomotiveBattery01 = HugeIconData(0x3bb6);

  /// IconData for the 'strokeRoundedAutomotiveBattery02' icon.
  static const IconData strokeRoundedAutomotiveBattery02 = HugeIconData(0x3bb7);

  /// IconData for the 'strokeRoundedAvalanche' icon.
  static const IconData strokeRoundedAvalanche = HugeIconData(0x3bb8);

  /// IconData for the 'strokeRoundedAvocado' icon.
  static const IconData strokeRoundedAvocado = HugeIconData(0x3bb9);

  /// IconData for the 'strokeRoundedAward01' icon.
  static const IconData strokeRoundedAward01 = HugeIconData(0x3bba);

  /// IconData for the 'strokeRoundedAward02' icon.
  static const IconData strokeRoundedAward02 = HugeIconData(0x3bbb);

  /// IconData for the 'strokeRoundedAward03' icon.
  static const IconData strokeRoundedAward03 = HugeIconData(0x3bbc);

  /// IconData for the 'strokeRoundedAward04' icon.
  static const IconData strokeRoundedAward04 = HugeIconData(0x3bbd);

  /// IconData for the 'strokeRoundedAward05' icon.
  static const IconData strokeRoundedAward05 = HugeIconData(0x3bbe);

  /// IconData for the 'strokeRoundedBaby01' icon.
  static const IconData strokeRoundedBaby01 = HugeIconData(0x3bbf);

  /// IconData for the 'strokeRoundedBaby02' icon.
  static const IconData strokeRoundedBaby02 = HugeIconData(0x3bc0);

  /// IconData for the 'strokeRoundedBabyBed01' icon.
  static const IconData strokeRoundedBabyBed01 = HugeIconData(0x3bc1);

  /// IconData for the 'strokeRoundedBabyBed02' icon.
  static const IconData strokeRoundedBabyBed02 = HugeIconData(0x3bc2);

  /// IconData for the 'strokeRoundedBabyBottle' icon.
  static const IconData strokeRoundedBabyBottle = HugeIconData(0x3bc3);

  /// IconData for the 'strokeRoundedBabyBoyDress' icon.
  static const IconData strokeRoundedBabyBoyDress = HugeIconData(0x3bc4);

  /// IconData for the 'strokeRoundedBabyGirlDress' icon.
  static const IconData strokeRoundedBabyGirlDress = HugeIconData(0x3bc5);

  /// IconData for the 'strokeRoundedBackpack01' icon.
  static const IconData strokeRoundedBackpack01 = HugeIconData(0x3bc6);

  /// IconData for the 'strokeRoundedBackpack02' icon.
  static const IconData strokeRoundedBackpack02 = HugeIconData(0x3bc7);

  /// IconData for the 'strokeRoundedBackpack03' icon.
  static const IconData strokeRoundedBackpack03 = HugeIconData(0x3bc8);

  /// IconData for the 'strokeRoundedBackward01' icon.
  static const IconData strokeRoundedBackward01 = HugeIconData(0x3bc9);

  /// IconData for the 'strokeRoundedBackward02' icon.
  static const IconData strokeRoundedBackward02 = HugeIconData(0x3bca);

  /// IconData for the 'strokeRoundedBacteria' icon.
  static const IconData strokeRoundedBacteria = HugeIconData(0x3bcb);

  /// IconData for the 'strokeRoundedBadmintonShuttle' icon.
  static const IconData strokeRoundedBadmintonShuttle = HugeIconData(0x3bcc);

  /// IconData for the 'strokeRoundedBadminton' icon.
  static const IconData strokeRoundedBadminton = HugeIconData(0x3bcd);

  /// IconData for the 'strokeRoundedBanana' icon.
  static const IconData strokeRoundedBanana = HugeIconData(0x3bce);

  /// IconData for the 'strokeRoundedBandage' icon.
  static const IconData strokeRoundedBandage = HugeIconData(0x3bcf);

  /// IconData for the 'strokeRoundedBank' icon.
  static const IconData strokeRoundedBank = HugeIconData(0x3bd0);

  /// IconData for the 'strokeRoundedBarCode01' icon.
  static const IconData strokeRoundedBarCode01 = HugeIconData(0x3bd1);

  /// IconData for the 'strokeRoundedBarCode02' icon.
  static const IconData strokeRoundedBarCode02 = HugeIconData(0x3bd2);

  /// IconData for the 'strokeRoundedBarns' icon.
  static const IconData strokeRoundedBarns = HugeIconData(0x3bd3);

  /// IconData for the 'strokeRoundedBaseballBat' icon.
  static const IconData strokeRoundedBaseballBat = HugeIconData(0x3bd4);

  /// IconData for the 'strokeRoundedBaseballHelmet' icon.
  static const IconData strokeRoundedBaseballHelmet = HugeIconData(0x3bd5);

  /// IconData for the 'strokeRoundedBaseball' icon.
  static const IconData strokeRoundedBaseball = HugeIconData(0x3bd6);

  /// IconData for the 'strokeRoundedBasketball01' icon.
  static const IconData strokeRoundedBasketball01 = HugeIconData(0x3bd7);

  /// IconData for the 'strokeRoundedBasketball02' icon.
  static const IconData strokeRoundedBasketball02 = HugeIconData(0x3bd8);

  /// IconData for the 'strokeRoundedBasketballHoop' icon.
  static const IconData strokeRoundedBasketballHoop = HugeIconData(0x3bd9);

  /// IconData for the 'strokeRoundedBathtub01' icon.
  static const IconData strokeRoundedBathtub01 = HugeIconData(0x3bda);

  /// IconData for the 'strokeRoundedBathtub02' icon.
  static const IconData strokeRoundedBathtub02 = HugeIconData(0x3bdb);

  /// IconData for the 'strokeRoundedBatteriesEnergy' icon.
  static const IconData strokeRoundedBatteriesEnergy = HugeIconData(0x3bdc);

  /// IconData for the 'strokeRoundedBatteryCharging01' icon.
  static const IconData strokeRoundedBatteryCharging01 = HugeIconData(0x3bdd);

  /// IconData for the 'strokeRoundedBatteryCharging02' icon.
  static const IconData strokeRoundedBatteryCharging02 = HugeIconData(0x3bde);

  /// IconData for the 'strokeRoundedBatteryEcoCharging' icon.
  static const IconData strokeRoundedBatteryEcoCharging = HugeIconData(0x3bdf);

  /// IconData for the 'strokeRoundedBatteryEmpty' icon.
  static const IconData strokeRoundedBatteryEmpty = HugeIconData(0x3be0);

  /// IconData for the 'strokeRoundedBatteryFull' icon.
  static const IconData strokeRoundedBatteryFull = HugeIconData(0x3be1);

  /// IconData for the 'strokeRoundedBatteryLow' icon.
  static const IconData strokeRoundedBatteryLow = HugeIconData(0x3be2);

  /// IconData for the 'strokeRoundedBatteryMedium01' icon.
  static const IconData strokeRoundedBatteryMedium01 = HugeIconData(0x3be3);

  /// IconData for the 'strokeRoundedBatteryMedium02' icon.
  static const IconData strokeRoundedBatteryMedium02 = HugeIconData(0x3be4);

  /// IconData for the 'strokeRoundedBbqGrill' icon.
  static const IconData strokeRoundedBbqGrill = HugeIconData(0x3be5);

  /// IconData for the 'strokeRoundedBeach02' icon.
  static const IconData strokeRoundedBeach02 = HugeIconData(0x3be6);

  /// IconData for the 'strokeRoundedBeach' icon.
  static const IconData strokeRoundedBeach = HugeIconData(0x3be7);

  /// IconData for the 'strokeRoundedBeater' icon.
  static const IconData strokeRoundedBeater = HugeIconData(0x3be8);

  /// IconData for the 'strokeRoundedBebo' icon.
  static const IconData strokeRoundedBebo = HugeIconData(0x3be9);

  /// IconData for the 'strokeRoundedBedBunk' icon.
  static const IconData strokeRoundedBedBunk = HugeIconData(0x3bea);

  /// IconData for the 'strokeRoundedBedDouble' icon.
  static const IconData strokeRoundedBedDouble = HugeIconData(0x3beb);

  /// IconData for the 'strokeRoundedBedSingle01' icon.
  static const IconData strokeRoundedBedSingle01 = HugeIconData(0x3bec);

  /// IconData for the 'strokeRoundedBedSingle02' icon.
  static const IconData strokeRoundedBedSingle02 = HugeIconData(0x3bed);

  /// IconData for the 'strokeRoundedBed' icon.
  static const IconData strokeRoundedBed = HugeIconData(0x3bee);

  /// IconData for the 'strokeRoundedBedug01' icon.
  static const IconData strokeRoundedBedug01 = HugeIconData(0x3bef);

  /// IconData for the 'strokeRoundedBedug02' icon.
  static const IconData strokeRoundedBedug02 = HugeIconData(0x3bf0);

  /// IconData for the 'strokeRoundedBehance01' icon.
  static const IconData strokeRoundedBehance01 = HugeIconData(0x3bf1);

  /// IconData for the 'strokeRoundedBehance02' icon.
  static const IconData strokeRoundedBehance02 = HugeIconData(0x3bf2);

  /// IconData for the 'strokeRoundedBelt' icon.
  static const IconData strokeRoundedBelt = HugeIconData(0x3bf3);

  /// IconData for the 'strokeRoundedBendTool' icon.
  static const IconData strokeRoundedBendTool = HugeIconData(0x3bf4);

  /// IconData for the 'strokeRoundedBerlinTower' icon.
  static const IconData strokeRoundedBerlinTower = HugeIconData(0x3bf5);

  /// IconData for the 'strokeRoundedBerlin' icon.
  static const IconData strokeRoundedBerlin = HugeIconData(0x3bf6);

  /// IconData for the 'strokeRoundedBeta' icon.
  static const IconData strokeRoundedBeta = HugeIconData(0x3bf7);

  /// IconData for the 'strokeRoundedBicycle01' icon.
  static const IconData strokeRoundedBicycle01 = HugeIconData(0x3bf8);

  /// IconData for the 'strokeRoundedBicycle' icon.
  static const IconData strokeRoundedBicycle = HugeIconData(0x3bf9);

  /// IconData for the 'strokeRoundedBilliard01' icon.
  static const IconData strokeRoundedBilliard01 = HugeIconData(0x3bfa);

  /// IconData for the 'strokeRoundedBilliard02' icon.
  static const IconData strokeRoundedBilliard02 = HugeIconData(0x3bfb);

  /// IconData for the 'strokeRoundedBinaryCode' icon.
  static const IconData strokeRoundedBinaryCode = HugeIconData(0x3bfc);

  /// IconData for the 'strokeRoundedBing' icon.
  static const IconData strokeRoundedBing = HugeIconData(0x3bfd);

  /// IconData for the 'strokeRoundedBioEnergy' icon.
  static const IconData strokeRoundedBioEnergy = HugeIconData(0x3bfe);

  /// IconData for the 'strokeRoundedBiomassEnergy' icon.
  static const IconData strokeRoundedBiomassEnergy = HugeIconData(0x3bff);

  /// IconData for the 'strokeRoundedBiometricAccess' icon.
  static const IconData strokeRoundedBiometricAccess = HugeIconData(0x3c00);

  /// IconData for the 'strokeRoundedBiometricDevice' icon.
  static const IconData strokeRoundedBiometricDevice = HugeIconData(0x3c01);

  /// IconData for the 'strokeRoundedBirthdayCake' icon.
  static const IconData strokeRoundedBirthdayCake = HugeIconData(0x3c02);

  /// IconData for the 'strokeRoundedBiscuit' icon.
  static const IconData strokeRoundedBiscuit = HugeIconData(0x3c03);

  /// IconData for the 'strokeRoundedBitcoin01' icon.
  static const IconData strokeRoundedBitcoin01 = HugeIconData(0x3c04);

  /// IconData for the 'strokeRoundedBitcoin02' icon.
  static const IconData strokeRoundedBitcoin02 = HugeIconData(0x3c05);

  /// IconData for the 'strokeRoundedBitcoin03' icon.
  static const IconData strokeRoundedBitcoin03 = HugeIconData(0x3c06);

  /// IconData for the 'strokeRoundedBitcoin04' icon.
  static const IconData strokeRoundedBitcoin04 = HugeIconData(0x3c07);

  /// IconData for the 'strokeRoundedBitcoinBag' icon.
  static const IconData strokeRoundedBitcoinBag = HugeIconData(0x3c08);

  /// IconData for the 'strokeRoundedBitcoinCircle' icon.
  static const IconData strokeRoundedBitcoinCircle = HugeIconData(0x3c09);

  /// IconData for the 'strokeRoundedBitcoinCloud' icon.
  static const IconData strokeRoundedBitcoinCloud = HugeIconData(0x3c0a);

  /// IconData for the 'strokeRoundedBitcoinCpu' icon.
  static const IconData strokeRoundedBitcoinCpu = HugeIconData(0x3c0b);

  /// IconData for the 'strokeRoundedBitcoinCreditCard' icon.
  static const IconData strokeRoundedBitcoinCreditCard = HugeIconData(0x3c0c);

  /// IconData for the 'strokeRoundedBitcoinDatabase' icon.
  static const IconData strokeRoundedBitcoinDatabase = HugeIconData(0x3c0d);

  /// IconData for the 'strokeRoundedBitcoinDown01' icon.
  static const IconData strokeRoundedBitcoinDown01 = HugeIconData(0x3c0e);

  /// IconData for the 'strokeRoundedBitcoinDown02' icon.
  static const IconData strokeRoundedBitcoinDown02 = HugeIconData(0x3c0f);

  /// IconData for the 'strokeRoundedBitcoinEllipse' icon.
  static const IconData strokeRoundedBitcoinEllipse = HugeIconData(0x3c10);

  /// IconData for the 'strokeRoundedBitcoinEye' icon.
  static const IconData strokeRoundedBitcoinEye = HugeIconData(0x3c11);

  /// IconData for the 'strokeRoundedBitcoinFilter' icon.
  static const IconData strokeRoundedBitcoinFilter = HugeIconData(0x3c12);

  /// IconData for the 'strokeRoundedBitcoinFlashdisk' icon.
  static const IconData strokeRoundedBitcoinFlashdisk = HugeIconData(0x3c13);

  /// IconData for the 'strokeRoundedBitcoinGraph' icon.
  static const IconData strokeRoundedBitcoinGraph = HugeIconData(0x3c14);

  /// IconData for the 'strokeRoundedBitcoinInvoice' icon.
  static const IconData strokeRoundedBitcoinInvoice = HugeIconData(0x3c15);

  /// IconData for the 'strokeRoundedBitcoinKey' icon.
  static const IconData strokeRoundedBitcoinKey = HugeIconData(0x3c16);

  /// IconData for the 'strokeRoundedBitcoinLocation' icon.
  static const IconData strokeRoundedBitcoinLocation = HugeIconData(0x3c17);

  /// IconData for the 'strokeRoundedBitcoinLock' icon.
  static const IconData strokeRoundedBitcoinLock = HugeIconData(0x3c18);

  /// IconData for the 'strokeRoundedBitcoinMail' icon.
  static const IconData strokeRoundedBitcoinMail = HugeIconData(0x3c19);

  /// IconData for the 'strokeRoundedBitcoinMind' icon.
  static const IconData strokeRoundedBitcoinMind = HugeIconData(0x3c1a);

  /// IconData for the 'strokeRoundedBitcoinMoney01' icon.
  static const IconData strokeRoundedBitcoinMoney01 = HugeIconData(0x3c1b);

  /// IconData for the 'strokeRoundedBitcoinMoney02' icon.
  static const IconData strokeRoundedBitcoinMoney02 = HugeIconData(0x3c1c);

  /// IconData for the 'strokeRoundedBitcoinPieChart' icon.
  static const IconData strokeRoundedBitcoinPieChart = HugeIconData(0x3c1d);

  /// IconData for the 'strokeRoundedBitcoinPiggyBank' icon.
  static const IconData strokeRoundedBitcoinPiggyBank = HugeIconData(0x3c1e);

  /// IconData for the 'strokeRoundedBitcoinPresentation' icon.
  static const IconData strokeRoundedBitcoinPresentation = HugeIconData(0x3c1f);

  /// IconData for the 'strokeRoundedBitcoinReceipt' icon.
  static const IconData strokeRoundedBitcoinReceipt = HugeIconData(0x3c20);

  /// IconData for the 'strokeRoundedBitcoinReceive' icon.
  static const IconData strokeRoundedBitcoinReceive = HugeIconData(0x3c21);

  /// IconData for the 'strokeRoundedBitcoinRectangle' icon.
  static const IconData strokeRoundedBitcoinRectangle = HugeIconData(0x3c22);

  /// IconData for the 'strokeRoundedBitcoinSafe' icon.
  static const IconData strokeRoundedBitcoinSafe = HugeIconData(0x3c23);

  /// IconData for the 'strokeRoundedBitcoinSearch' icon.
  static const IconData strokeRoundedBitcoinSearch = HugeIconData(0x3c24);

  /// IconData for the 'strokeRoundedBitcoinSend' icon.
  static const IconData strokeRoundedBitcoinSend = HugeIconData(0x3c25);

  /// IconData for the 'strokeRoundedBitcoinSetting' icon.
  static const IconData strokeRoundedBitcoinSetting = HugeIconData(0x3c26);

  /// IconData for the 'strokeRoundedBitcoinShield' icon.
  static const IconData strokeRoundedBitcoinShield = HugeIconData(0x3c27);

  /// IconData for the 'strokeRoundedBitcoinShopping' icon.
  static const IconData strokeRoundedBitcoinShopping = HugeIconData(0x3c28);

  /// IconData for the 'strokeRoundedBitcoinSmartphone01' icon.
  static const IconData strokeRoundedBitcoinSmartphone01 = HugeIconData(0x3c29);

  /// IconData for the 'strokeRoundedBitcoinSmartphone02' icon.
  static const IconData strokeRoundedBitcoinSmartphone02 = HugeIconData(0x3c2a);

  /// IconData for the 'strokeRoundedBitcoinSquare' icon.
  static const IconData strokeRoundedBitcoinSquare = HugeIconData(0x3c2b);

  /// IconData for the 'strokeRoundedBitcoinStore' icon.
  static const IconData strokeRoundedBitcoinStore = HugeIconData(0x3c2c);

  /// IconData for the 'strokeRoundedBitcoinTag' icon.
  static const IconData strokeRoundedBitcoinTag = HugeIconData(0x3c2d);

  /// IconData for the 'strokeRoundedBitcoinTarget' icon.
  static const IconData strokeRoundedBitcoinTarget = HugeIconData(0x3c2e);

  /// IconData for the 'strokeRoundedBitcoinTransaction' icon.
  static const IconData strokeRoundedBitcoinTransaction = HugeIconData(0x3c2f);

  /// IconData for the 'strokeRoundedBitcoinUp01' icon.
  static const IconData strokeRoundedBitcoinUp01 = HugeIconData(0x3c30);

  /// IconData for the 'strokeRoundedBitcoinUp02' icon.
  static const IconData strokeRoundedBitcoinUp02 = HugeIconData(0x3c31);

  /// IconData for the 'strokeRoundedBitcoinWallet' icon.
  static const IconData strokeRoundedBitcoinWallet = HugeIconData(0x3c32);

  /// IconData for the 'strokeRoundedBitcoinWithdraw' icon.
  static const IconData strokeRoundedBitcoinWithdraw = HugeIconData(0x3c33);

  /// IconData for the 'strokeRoundedBitcoin' icon.
  static const IconData strokeRoundedBitcoin = HugeIconData(0x3c34);

  /// IconData for the 'strokeRoundedBlackHole01' icon.
  static const IconData strokeRoundedBlackHole01 = HugeIconData(0x3c35);

  /// IconData for the 'strokeRoundedBlackHole' icon.
  static const IconData strokeRoundedBlackHole = HugeIconData(0x3c36);

  /// IconData for the 'strokeRoundedBlend' icon.
  static const IconData strokeRoundedBlend = HugeIconData(0x3c37);

  /// IconData for the 'strokeRoundedBlender' icon.
  static const IconData strokeRoundedBlender = HugeIconData(0x3c38);

  /// IconData for the 'strokeRoundedBlockGame' icon.
  static const IconData strokeRoundedBlockGame = HugeIconData(0x3c39);

  /// IconData for the 'strokeRoundedBlockchain01' icon.
  static const IconData strokeRoundedBlockchain01 = HugeIconData(0x3c3a);

  /// IconData for the 'strokeRoundedBlockchain02' icon.
  static const IconData strokeRoundedBlockchain02 = HugeIconData(0x3c3b);

  /// IconData for the 'strokeRoundedBlockchain03' icon.
  static const IconData strokeRoundedBlockchain03 = HugeIconData(0x3c3c);

  /// IconData for the 'strokeRoundedBlockchain04' icon.
  static const IconData strokeRoundedBlockchain04 = HugeIconData(0x3c3d);

  /// IconData for the 'strokeRoundedBlockchain05' icon.
  static const IconData strokeRoundedBlockchain05 = HugeIconData(0x3c3e);

  /// IconData for the 'strokeRoundedBlockchain06' icon.
  static const IconData strokeRoundedBlockchain06 = HugeIconData(0x3c3f);

  /// IconData for the 'strokeRoundedBlockchain07' icon.
  static const IconData strokeRoundedBlockchain07 = HugeIconData(0x3c40);

  /// IconData for the 'strokeRoundedBlocked' icon.
  static const IconData strokeRoundedBlocked = HugeIconData(0x3c41);

  /// IconData for the 'strokeRoundedBlogger' icon.
  static const IconData strokeRoundedBlogger = HugeIconData(0x3c42);

  /// IconData for the 'strokeRoundedBloodBag' icon.
  static const IconData strokeRoundedBloodBag = HugeIconData(0x3c43);

  /// IconData for the 'strokeRoundedBloodBottle' icon.
  static const IconData strokeRoundedBloodBottle = HugeIconData(0x3c44);

  /// IconData for the 'strokeRoundedBloodPressure' icon.
  static const IconData strokeRoundedBloodPressure = HugeIconData(0x3c45);

  /// IconData for the 'strokeRoundedBloodType' icon.
  static const IconData strokeRoundedBloodType = HugeIconData(0x3c46);

  /// IconData for the 'strokeRoundedBlood' icon.
  static const IconData strokeRoundedBlood = HugeIconData(0x3c47);

  /// IconData for the 'strokeRoundedBluetoothCircle' icon.
  static const IconData strokeRoundedBluetoothCircle = HugeIconData(0x3c48);

  /// IconData for the 'strokeRoundedBluetoothNotConnected' icon.
  static const IconData strokeRoundedBluetoothNotConnected =
      HugeIconData(0x3c49);

  /// IconData for the 'strokeRoundedBluetoothSearch' icon.
  static const IconData strokeRoundedBluetoothSearch = HugeIconData(0x3c4a);

  /// IconData for the 'strokeRoundedBluetoothSquare' icon.
  static const IconData strokeRoundedBluetoothSquare = HugeIconData(0x3c4b);

  /// IconData for the 'strokeRoundedBluetooth' icon.
  static const IconData strokeRoundedBluetooth = HugeIconData(0x3c4c);

  /// IconData for the 'strokeRoundedBlur' icon.
  static const IconData strokeRoundedBlur = HugeIconData(0x3c4d);

  /// IconData for the 'strokeRoundedBlushBrush01' icon.
  static const IconData strokeRoundedBlushBrush01 = HugeIconData(0x3c4e);

  /// IconData for the 'strokeRoundedBlushBrush02' icon.
  static const IconData strokeRoundedBlushBrush02 = HugeIconData(0x3c4f);

  /// IconData for the 'strokeRoundedBoardMath' icon.
  static const IconData strokeRoundedBoardMath = HugeIconData(0x3c50);

  /// IconData for the 'strokeRoundedBoat' icon.
  static const IconData strokeRoundedBoat = HugeIconData(0x3c51);

  /// IconData for the 'strokeRoundedBodyArmor' icon.
  static const IconData strokeRoundedBodyArmor = HugeIconData(0x3c52);

  /// IconData for the 'strokeRoundedBodyPartLeg' icon.
  static const IconData strokeRoundedBodyPartLeg = HugeIconData(0x3c53);

  /// IconData for the 'strokeRoundedBodyPartMuscle' icon.
  static const IconData strokeRoundedBodyPartMuscle = HugeIconData(0x3c54);

  /// IconData for the 'strokeRoundedBodyPartSixPack' icon.
  static const IconData strokeRoundedBodyPartSixPack = HugeIconData(0x3c55);

  /// IconData for the 'strokeRoundedBodySoap' icon.
  static const IconData strokeRoundedBodySoap = HugeIconData(0x3c56);

  /// IconData for the 'strokeRoundedBodyWeight' icon.
  static const IconData strokeRoundedBodyWeight = HugeIconData(0x3c57);

  /// IconData for the 'strokeRoundedBomb' icon.
  static const IconData strokeRoundedBomb = HugeIconData(0x3c58);

  /// IconData for the 'strokeRoundedBone01' icon.
  static const IconData strokeRoundedBone01 = HugeIconData(0x3c59);

  /// IconData for the 'strokeRoundedBone02' icon.
  static const IconData strokeRoundedBone02 = HugeIconData(0x3c5a);

  /// IconData for the 'strokeRoundedBook01' icon.
  static const IconData strokeRoundedBook01 = HugeIconData(0x3c5b);

  /// IconData for the 'strokeRoundedBook02' icon.
  static const IconData strokeRoundedBook02 = HugeIconData(0x3c5c);

  /// IconData for the 'strokeRoundedBook03' icon.
  static const IconData strokeRoundedBook03 = HugeIconData(0x3c5d);

  /// IconData for the 'strokeRoundedBook04' icon.
  static const IconData strokeRoundedBook04 = HugeIconData(0x3c5e);

  /// IconData for the 'strokeRoundedBookBookmark01' icon.
  static const IconData strokeRoundedBookBookmark01 = HugeIconData(0x3c5f);

  /// IconData for the 'strokeRoundedBookBookmark02' icon.
  static const IconData strokeRoundedBookBookmark02 = HugeIconData(0x3c60);

  /// IconData for the 'strokeRoundedBookDownload' icon.
  static const IconData strokeRoundedBookDownload = HugeIconData(0x3c61);

  /// IconData for the 'strokeRoundedBookEdit' icon.
  static const IconData strokeRoundedBookEdit = HugeIconData(0x3c62);

  /// IconData for the 'strokeRoundedBookOpen01' icon.
  static const IconData strokeRoundedBookOpen01 = HugeIconData(0x3c63);

  /// IconData for the 'strokeRoundedBookOpen02' icon.
  static const IconData strokeRoundedBookOpen02 = HugeIconData(0x3c64);

  /// IconData for the 'strokeRoundedBookUpload' icon.
  static const IconData strokeRoundedBookUpload = HugeIconData(0x3c65);

  /// IconData for the 'strokeRoundedBookmark01' icon.
  static const IconData strokeRoundedBookmark01 = HugeIconData(0x3c66);

  /// IconData for the 'strokeRoundedBookmark02' icon.
  static const IconData strokeRoundedBookmark02 = HugeIconData(0x3c67);

  /// IconData for the 'strokeRoundedBookmark03' icon.
  static const IconData strokeRoundedBookmark03 = HugeIconData(0x3c68);

  /// IconData for the 'strokeRoundedBookmarkAdd01' icon.
  static const IconData strokeRoundedBookmarkAdd01 = HugeIconData(0x3c69);

  /// IconData for the 'strokeRoundedBookmarkAdd02' icon.
  static const IconData strokeRoundedBookmarkAdd02 = HugeIconData(0x3c6a);

  /// IconData for the 'strokeRoundedBookmarkBlock01' icon.
  static const IconData strokeRoundedBookmarkBlock01 = HugeIconData(0x3c6b);

  /// IconData for the 'strokeRoundedBookmarkBlock02' icon.
  static const IconData strokeRoundedBookmarkBlock02 = HugeIconData(0x3c6c);

  /// IconData for the 'strokeRoundedBookmarkCheck01' icon.
  static const IconData strokeRoundedBookmarkCheck01 = HugeIconData(0x3c6d);

  /// IconData for the 'strokeRoundedBookmarkCheck02' icon.
  static const IconData strokeRoundedBookmarkCheck02 = HugeIconData(0x3c6e);

  /// IconData for the 'strokeRoundedBookmarkMinus01' icon.
  static const IconData strokeRoundedBookmarkMinus01 = HugeIconData(0x3c6f);

  /// IconData for the 'strokeRoundedBookmarkMinus02' icon.
  static const IconData strokeRoundedBookmarkMinus02 = HugeIconData(0x3c70);

  /// IconData for the 'strokeRoundedBookmarkOff01' icon.
  static const IconData strokeRoundedBookmarkOff01 = HugeIconData(0x3c71);

  /// IconData for the 'strokeRoundedBookmarkOff02' icon.
  static const IconData strokeRoundedBookmarkOff02 = HugeIconData(0x3c72);

  /// IconData for the 'strokeRoundedBookmarkRemove01' icon.
  static const IconData strokeRoundedBookmarkRemove01 = HugeIconData(0x3c73);

  /// IconData for the 'strokeRoundedBookmarkRemove02' icon.
  static const IconData strokeRoundedBookmarkRemove02 = HugeIconData(0x3c74);

  /// IconData for the 'strokeRoundedBooks01' icon.
  static const IconData strokeRoundedBooks01 = HugeIconData(0x3c75);

  /// IconData for the 'strokeRoundedBooks02' icon.
  static const IconData strokeRoundedBooks02 = HugeIconData(0x3c76);

  /// IconData for the 'strokeRoundedBookshelf01' icon.
  static const IconData strokeRoundedBookshelf01 = HugeIconData(0x3c77);

  /// IconData for the 'strokeRoundedBookshelf02' icon.
  static const IconData strokeRoundedBookshelf02 = HugeIconData(0x3c78);

  /// IconData for the 'strokeRoundedBookshelf03' icon.
  static const IconData strokeRoundedBookshelf03 = HugeIconData(0x3c79);

  /// IconData for the 'strokeRoundedBootstrap' icon.
  static const IconData strokeRoundedBootstrap = HugeIconData(0x3c7a);

  /// IconData for the 'strokeRoundedBorderAll01' icon.
  static const IconData strokeRoundedBorderAll01 = HugeIconData(0x3c7b);

  /// IconData for the 'strokeRoundedBorderAll02' icon.
  static const IconData strokeRoundedBorderAll02 = HugeIconData(0x3c7c);

  /// IconData for the 'strokeRoundedBorderBottom01' icon.
  static const IconData strokeRoundedBorderBottom01 = HugeIconData(0x3c7d);

  /// IconData for the 'strokeRoundedBorderBottom02' icon.
  static const IconData strokeRoundedBorderBottom02 = HugeIconData(0x3c7e);

  /// IconData for the 'strokeRoundedBorderFull' icon.
  static const IconData strokeRoundedBorderFull = HugeIconData(0x3c7f);

  /// IconData for the 'strokeRoundedBorderHorizontal' icon.
  static const IconData strokeRoundedBorderHorizontal = HugeIconData(0x3c80);

  /// IconData for the 'strokeRoundedBorderInner' icon.
  static const IconData strokeRoundedBorderInner = HugeIconData(0x3c81);

  /// IconData for the 'strokeRoundedBorderLeft01' icon.
  static const IconData strokeRoundedBorderLeft01 = HugeIconData(0x3c82);

  /// IconData for the 'strokeRoundedBorderLeft02' icon.
  static const IconData strokeRoundedBorderLeft02 = HugeIconData(0x3c83);

  /// IconData for the 'strokeRoundedBorderNone01' icon.
  static const IconData strokeRoundedBorderNone01 = HugeIconData(0x3c84);

  /// IconData for the 'strokeRoundedBorderNone02' icon.
  static const IconData strokeRoundedBorderNone02 = HugeIconData(0x3c85);

  /// IconData for the 'strokeRoundedBorderRight01' icon.
  static const IconData strokeRoundedBorderRight01 = HugeIconData(0x3c86);

  /// IconData for the 'strokeRoundedBorderRight02' icon.
  static const IconData strokeRoundedBorderRight02 = HugeIconData(0x3c87);

  /// IconData for the 'strokeRoundedBorderTop01' icon.
  static const IconData strokeRoundedBorderTop01 = HugeIconData(0x3c88);

  /// IconData for the 'strokeRoundedBorderTop02' icon.
  static const IconData strokeRoundedBorderTop02 = HugeIconData(0x3c89);

  /// IconData for the 'strokeRoundedBorderVertical' icon.
  static const IconData strokeRoundedBorderVertical = HugeIconData(0x3c8a);

  /// IconData for the 'strokeRoundedBorobudur' icon.
  static const IconData strokeRoundedBorobudur = HugeIconData(0x3c8b);

  /// IconData for the 'strokeRoundedBot' icon.
  static const IconData strokeRoundedBot = HugeIconData(0x3c8c);

  /// IconData for the 'strokeRoundedBounceLeft' icon.
  static const IconData strokeRoundedBounceLeft = HugeIconData(0x3c8d);

  /// IconData for the 'strokeRoundedBounceRight' icon.
  static const IconData strokeRoundedBounceRight = HugeIconData(0x3c8e);

  /// IconData for the 'strokeRoundedBoundingBox' icon.
  static const IconData strokeRoundedBoundingBox = HugeIconData(0x3c8f);

  /// IconData for the 'strokeRoundedBowTie' icon.
  static const IconData strokeRoundedBowTie = HugeIconData(0x3c90);

  /// IconData for the 'strokeRoundedBowlingPins' icon.
  static const IconData strokeRoundedBowlingPins = HugeIconData(0x3c91);

  /// IconData for the 'strokeRoundedBowling' icon.
  static const IconData strokeRoundedBowling = HugeIconData(0x3c92);

  /// IconData for the 'strokeRoundedBoxer' icon.
  static const IconData strokeRoundedBoxer = HugeIconData(0x3c93);

  /// IconData for the 'strokeRoundedBoxingBag' icon.
  static const IconData strokeRoundedBoxingBag = HugeIconData(0x3c94);

  /// IconData for the 'strokeRoundedBoxingGlove01' icon.
  static const IconData strokeRoundedBoxingGlove01 = HugeIconData(0x3c95);

  /// IconData for the 'strokeRoundedBoxingGlove' icon.
  static const IconData strokeRoundedBoxingGlove = HugeIconData(0x3c96);

  /// IconData for the 'strokeRoundedBrain01' icon.
  static const IconData strokeRoundedBrain01 = HugeIconData(0x3c97);

  /// IconData for the 'strokeRoundedBrain02' icon.
  static const IconData strokeRoundedBrain02 = HugeIconData(0x3c98);

  /// IconData for the 'strokeRoundedBrain' icon.
  static const IconData strokeRoundedBrain = HugeIconData(0x3c99);

  /// IconData for the 'strokeRoundedBrandfetch' icon.
  static const IconData strokeRoundedBrandfetch = HugeIconData(0x3c9a);

  /// IconData for the 'strokeRoundedBread01' icon.
  static const IconData strokeRoundedBread01 = HugeIconData(0x3c9b);

  /// IconData for the 'strokeRoundedBread02' icon.
  static const IconData strokeRoundedBread02 = HugeIconData(0x3c9c);

  /// IconData for the 'strokeRoundedBread03' icon.
  static const IconData strokeRoundedBread03 = HugeIconData(0x3c9d);

  /// IconData for the 'strokeRoundedBread04' icon.
  static const IconData strokeRoundedBread04 = HugeIconData(0x3c9e);

  /// IconData for the 'strokeRoundedBreastPump' icon.
  static const IconData strokeRoundedBreastPump = HugeIconData(0x3c9f);

  /// IconData for the 'strokeRoundedBridge' icon.
  static const IconData strokeRoundedBridge = HugeIconData(0x3ca0);

  /// IconData for the 'strokeRoundedBriefcase01' icon.
  static const IconData strokeRoundedBriefcase01 = HugeIconData(0x3ca1);

  /// IconData for the 'strokeRoundedBriefcase02' icon.
  static const IconData strokeRoundedBriefcase02 = HugeIconData(0x3ca2);

  /// IconData for the 'strokeRoundedBriefcase03' icon.
  static const IconData strokeRoundedBriefcase03 = HugeIconData(0x3ca3);

  /// IconData for the 'strokeRoundedBriefcase04' icon.
  static const IconData strokeRoundedBriefcase04 = HugeIconData(0x3ca4);

  /// IconData for the 'strokeRoundedBriefcase05' icon.
  static const IconData strokeRoundedBriefcase05 = HugeIconData(0x3ca5);

  /// IconData for the 'strokeRoundedBriefcase06' icon.
  static const IconData strokeRoundedBriefcase06 = HugeIconData(0x3ca6);

  /// IconData for the 'strokeRoundedBriefcase07' icon.
  static const IconData strokeRoundedBriefcase07 = HugeIconData(0x3ca7);

  /// IconData for the 'strokeRoundedBriefcase08' icon.
  static const IconData strokeRoundedBriefcase08 = HugeIconData(0x3ca8);

  /// IconData for the 'strokeRoundedBriefcase09' icon.
  static const IconData strokeRoundedBriefcase09 = HugeIconData(0x3ca9);

  /// IconData for the 'strokeRoundedBriefcaseDollar' icon.
  static const IconData strokeRoundedBriefcaseDollar = HugeIconData(0x3caa);

  /// IconData for the 'strokeRoundedBroccoli' icon.
  static const IconData strokeRoundedBroccoli = HugeIconData(0x3cab);

  /// IconData for the 'strokeRoundedBrochure' icon.
  static const IconData strokeRoundedBrochure = HugeIconData(0x3cac);

  /// IconData for the 'strokeRoundedBrokenBone' icon.
  static const IconData strokeRoundedBrokenBone = HugeIconData(0x3cad);

  /// IconData for the 'strokeRoundedBrowser' icon.
  static const IconData strokeRoundedBrowser = HugeIconData(0x3cae);

  /// IconData for the 'strokeRoundedBrush' icon.
  static const IconData strokeRoundedBrush = HugeIconData(0x3caf);

  /// IconData for the 'strokeRoundedBubbleChatAdd' icon.
  static const IconData strokeRoundedBubbleChatAdd = HugeIconData(0x3cb0);

  /// IconData for the 'strokeRoundedBubbleChatBlocked' icon.
  static const IconData strokeRoundedBubbleChatBlocked = HugeIconData(0x3cb1);

  /// IconData for the 'strokeRoundedBubbleChatCancel' icon.
  static const IconData strokeRoundedBubbleChatCancel = HugeIconData(0x3cb2);

  /// IconData for the 'strokeRoundedBubbleChatDelay' icon.
  static const IconData strokeRoundedBubbleChatDelay = HugeIconData(0x3cb3);

  /// IconData for the 'strokeRoundedBubbleChatDone' icon.
  static const IconData strokeRoundedBubbleChatDone = HugeIconData(0x3cb4);

  /// IconData for the 'strokeRoundedBubbleChatDownload01' icon.
  static const IconData strokeRoundedBubbleChatDownload01 =
      HugeIconData(0x3cb5);

  /// IconData for the 'strokeRoundedBubbleChatDownload02' icon.
  static const IconData strokeRoundedBubbleChatDownload02 =
      HugeIconData(0x3cb6);

  /// IconData for the 'strokeRoundedBubbleChatEdit' icon.
  static const IconData strokeRoundedBubbleChatEdit = HugeIconData(0x3cb7);

  /// IconData for the 'strokeRoundedBubbleChatFavourite' icon.
  static const IconData strokeRoundedBubbleChatFavourite = HugeIconData(0x3cb8);

  /// IconData for the 'strokeRoundedBubbleChatIncome' icon.
  static const IconData strokeRoundedBubbleChatIncome = HugeIconData(0x3cb9);

  /// IconData for the 'strokeRoundedBubbleChatLock' icon.
  static const IconData strokeRoundedBubbleChatLock = HugeIconData(0x3cba);

  /// IconData for the 'strokeRoundedBubbleChatNotification' icon.
  static const IconData strokeRoundedBubbleChatNotification =
      HugeIconData(0x3cbb);

  /// IconData for the 'strokeRoundedBubbleChatOutcome' icon.
  static const IconData strokeRoundedBubbleChatOutcome = HugeIconData(0x3cbc);

  /// IconData for the 'strokeRoundedBubbleChatPreview' icon.
  static const IconData strokeRoundedBubbleChatPreview = HugeIconData(0x3cbd);

  /// IconData for the 'strokeRoundedBubbleChatQuestion' icon.
  static const IconData strokeRoundedBubbleChatQuestion = HugeIconData(0x3cbe);

  /// IconData for the 'strokeRoundedBubbleChatSearch' icon.
  static const IconData strokeRoundedBubbleChatSearch = HugeIconData(0x3cbf);

  /// IconData for the 'strokeRoundedBubbleChatSecure' icon.
  static const IconData strokeRoundedBubbleChatSecure = HugeIconData(0x3cc0);

  /// IconData for the 'strokeRoundedBubbleChatTranslate' icon.
  static const IconData strokeRoundedBubbleChatTranslate = HugeIconData(0x3cc1);

  /// IconData for the 'strokeRoundedBubbleChatUnlock' icon.
  static const IconData strokeRoundedBubbleChatUnlock = HugeIconData(0x3cc2);

  /// IconData for the 'strokeRoundedBubbleChatUpload' icon.
  static const IconData strokeRoundedBubbleChatUpload = HugeIconData(0x3cc3);

  /// IconData for the 'strokeRoundedBubbleChatUser' icon.
  static const IconData strokeRoundedBubbleChatUser = HugeIconData(0x3cc4);

  /// IconData for the 'strokeRoundedBubbleChat' icon.
  static const IconData strokeRoundedBubbleChat = HugeIconData(0x3cc5);

  /// IconData for the 'strokeRoundedBubbleTea01' icon.
  static const IconData strokeRoundedBubbleTea01 = HugeIconData(0x3cc6);

  /// IconData for the 'strokeRoundedBubbleTea02' icon.
  static const IconData strokeRoundedBubbleTea02 = HugeIconData(0x3cc7);

  /// IconData for the 'strokeRoundedBug01' icon.
  static const IconData strokeRoundedBug01 = HugeIconData(0x3cc8);

  /// IconData for the 'strokeRoundedBug02' icon.
  static const IconData strokeRoundedBug02 = HugeIconData(0x3cc9);

  /// IconData for the 'strokeRoundedBuilding01' icon.
  static const IconData strokeRoundedBuilding01 = HugeIconData(0x3cca);

  /// IconData for the 'strokeRoundedBuilding02' icon.
  static const IconData strokeRoundedBuilding02 = HugeIconData(0x3ccb);

  /// IconData for the 'strokeRoundedBuilding03' icon.
  static const IconData strokeRoundedBuilding03 = HugeIconData(0x3ccc);

  /// IconData for the 'strokeRoundedBuilding04' icon.
  static const IconData strokeRoundedBuilding04 = HugeIconData(0x3ccd);

  /// IconData for the 'strokeRoundedBuilding05' icon.
  static const IconData strokeRoundedBuilding05 = HugeIconData(0x3cce);

  /// IconData for the 'strokeRoundedBuilding06' icon.
  static const IconData strokeRoundedBuilding06 = HugeIconData(0x3ccf);

  /// IconData for the 'strokeRoundedBulbCharging' icon.
  static const IconData strokeRoundedBulbCharging = HugeIconData(0x3cd0);

  /// IconData for the 'strokeRoundedBulb' icon.
  static const IconData strokeRoundedBulb = HugeIconData(0x3cd1);

  /// IconData for the 'strokeRoundedBulletproofVest' icon.
  static const IconData strokeRoundedBulletproofVest = HugeIconData(0x3cd2);

  /// IconData for the 'strokeRoundedBurjAlArab' icon.
  static const IconData strokeRoundedBurjAlArab = HugeIconData(0x3cd3);

  /// IconData for the 'strokeRoundedBurningCd' icon.
  static const IconData strokeRoundedBurningCd = HugeIconData(0x3cd4);

  /// IconData for the 'strokeRoundedBus01' icon.
  static const IconData strokeRoundedBus01 = HugeIconData(0x3cd5);

  /// IconData for the 'strokeRoundedBus02' icon.
  static const IconData strokeRoundedBus02 = HugeIconData(0x3cd6);

  /// IconData for the 'strokeRoundedBus03' icon.
  static const IconData strokeRoundedBus03 = HugeIconData(0x3cd7);

  /// IconData for the 'strokeRoundedCProgramming' icon.
  static const IconData strokeRoundedCProgramming = HugeIconData(0x3cd8);

  /// IconData for the 'strokeRoundedCabinet01' icon.
  static const IconData strokeRoundedCabinet01 = HugeIconData(0x3cd9);

  /// IconData for the 'strokeRoundedCabinet02' icon.
  static const IconData strokeRoundedCabinet02 = HugeIconData(0x3cda);

  /// IconData for the 'strokeRoundedCabinet03' icon.
  static const IconData strokeRoundedCabinet03 = HugeIconData(0x3cdb);

  /// IconData for the 'strokeRoundedCabinet04' icon.
  static const IconData strokeRoundedCabinet04 = HugeIconData(0x3cdc);

  /// IconData for the 'strokeRoundedCableCar' icon.
  static const IconData strokeRoundedCableCar = HugeIconData(0x3cdd);

  /// IconData for the 'strokeRoundedCactus' icon.
  static const IconData strokeRoundedCactus = HugeIconData(0x3cde);

  /// IconData for the 'strokeRoundedCaduceus' icon.
  static const IconData strokeRoundedCaduceus = HugeIconData(0x3cdf);

  /// IconData for the 'strokeRoundedCafe' icon.
  static const IconData strokeRoundedCafe = HugeIconData(0x3ce0);

  /// IconData for the 'strokeRoundedCalculate' icon.
  static const IconData strokeRoundedCalculate = HugeIconData(0x3ce1);

  /// IconData for the 'strokeRoundedCalculator01' icon.
  static const IconData strokeRoundedCalculator01 = HugeIconData(0x3ce2);

  /// IconData for the 'strokeRoundedCalculator' icon.
  static const IconData strokeRoundedCalculator = HugeIconData(0x3ce3);

  /// IconData for the 'strokeRoundedCalendar01' icon.
  static const IconData strokeRoundedCalendar01 = HugeIconData(0x3ce4);

  /// IconData for the 'strokeRoundedCalendar02' icon.
  static const IconData strokeRoundedCalendar02 = HugeIconData(0x3ce5);

  /// IconData for the 'strokeRoundedCalendar03' icon.
  static const IconData strokeRoundedCalendar03 = HugeIconData(0x3ce6);

  /// IconData for the 'strokeRoundedCalendar04' icon.
  static const IconData strokeRoundedCalendar04 = HugeIconData(0x3ce7);

  /// IconData for the 'strokeRoundedCalendarAdd01' icon.
  static const IconData strokeRoundedCalendarAdd01 = HugeIconData(0x3ce8);

  /// IconData for the 'strokeRoundedCalendarAdd02' icon.
  static const IconData strokeRoundedCalendarAdd02 = HugeIconData(0x3ce9);

  /// IconData for the 'strokeRoundedCalendarBlock01' icon.
  static const IconData strokeRoundedCalendarBlock01 = HugeIconData(0x3cea);

  /// IconData for the 'strokeRoundedCalendarBlock02' icon.
  static const IconData strokeRoundedCalendarBlock02 = HugeIconData(0x3ceb);

  /// IconData for the 'strokeRoundedCalendarCheckIn01' icon.
  static const IconData strokeRoundedCalendarCheckIn01 = HugeIconData(0x3cec);

  /// IconData for the 'strokeRoundedCalendarCheckIn02' icon.
  static const IconData strokeRoundedCalendarCheckIn02 = HugeIconData(0x3ced);

  /// IconData for the 'strokeRoundedCalendarCheckOut01' icon.
  static const IconData strokeRoundedCalendarCheckOut01 = HugeIconData(0x3cee);

  /// IconData for the 'strokeRoundedCalendarCheckOut02' icon.
  static const IconData strokeRoundedCalendarCheckOut02 = HugeIconData(0x3cef);

  /// IconData for the 'strokeRoundedCalendarDownload01' icon.
  static const IconData strokeRoundedCalendarDownload01 = HugeIconData(0x3cf0);

  /// IconData for the 'strokeRoundedCalendarDownload02' icon.
  static const IconData strokeRoundedCalendarDownload02 = HugeIconData(0x3cf1);

  /// IconData for the 'strokeRoundedCalendarFavorite01' icon.
  static const IconData strokeRoundedCalendarFavorite01 = HugeIconData(0x3cf2);

  /// IconData for the 'strokeRoundedCalendarFavorite02' icon.
  static const IconData strokeRoundedCalendarFavorite02 = HugeIconData(0x3cf3);

  /// IconData for the 'strokeRoundedCalendarLock01' icon.
  static const IconData strokeRoundedCalendarLock01 = HugeIconData(0x3cf4);

  /// IconData for the 'strokeRoundedCalendarLock02' icon.
  static const IconData strokeRoundedCalendarLock02 = HugeIconData(0x3cf5);

  /// IconData for the 'strokeRoundedCalendarLove01' icon.
  static const IconData strokeRoundedCalendarLove01 = HugeIconData(0x3cf6);

  /// IconData for the 'strokeRoundedCalendarLove02' icon.
  static const IconData strokeRoundedCalendarLove02 = HugeIconData(0x3cf7);

  /// IconData for the 'strokeRoundedCalendarMinus01' icon.
  static const IconData strokeRoundedCalendarMinus01 = HugeIconData(0x3cf8);

  /// IconData for the 'strokeRoundedCalendarMinus02' icon.
  static const IconData strokeRoundedCalendarMinus02 = HugeIconData(0x3cf9);

  /// IconData for the 'strokeRoundedCalendarRemove01' icon.
  static const IconData strokeRoundedCalendarRemove01 = HugeIconData(0x3cfa);

  /// IconData for the 'strokeRoundedCalendarRemove02' icon.
  static const IconData strokeRoundedCalendarRemove02 = HugeIconData(0x3cfb);

  /// IconData for the 'strokeRoundedCalendarSetting01' icon.
  static const IconData strokeRoundedCalendarSetting01 = HugeIconData(0x3cfc);

  /// IconData for the 'strokeRoundedCalendarSetting02' icon.
  static const IconData strokeRoundedCalendarSetting02 = HugeIconData(0x3cfd);

  /// IconData for the 'strokeRoundedCalendarUpload01' icon.
  static const IconData strokeRoundedCalendarUpload01 = HugeIconData(0x3cfe);

  /// IconData for the 'strokeRoundedCalendarUpload02' icon.
  static const IconData strokeRoundedCalendarUpload02 = HugeIconData(0x3cff);

  /// IconData for the 'strokeRoundedCall02' icon.
  static const IconData strokeRoundedCall02 = HugeIconData(0x3d00);

  /// IconData for the 'strokeRoundedCallAdd02' icon.
  static const IconData strokeRoundedCallAdd02 = HugeIconData(0x3d01);

  /// IconData for the 'strokeRoundedCallAdd' icon.
  static const IconData strokeRoundedCallAdd = HugeIconData(0x3d02);

  /// IconData for the 'strokeRoundedCallBlocked02' icon.
  static const IconData strokeRoundedCallBlocked02 = HugeIconData(0x3d03);

  /// IconData for the 'strokeRoundedCallBlocked' icon.
  static const IconData strokeRoundedCallBlocked = HugeIconData(0x3d04);

  /// IconData for the 'strokeRoundedCallDisabled02' icon.
  static const IconData strokeRoundedCallDisabled02 = HugeIconData(0x3d05);

  /// IconData for the 'strokeRoundedCallDisabled' icon.
  static const IconData strokeRoundedCallDisabled = HugeIconData(0x3d06);

  /// IconData for the 'strokeRoundedCallDone02' icon.
  static const IconData strokeRoundedCallDone02 = HugeIconData(0x3d07);

  /// IconData for the 'strokeRoundedCallDone' icon.
  static const IconData strokeRoundedCallDone = HugeIconData(0x3d08);

  /// IconData for the 'strokeRoundedCallEnd01' icon.
  static const IconData strokeRoundedCallEnd01 = HugeIconData(0x3d09);

  /// IconData for the 'strokeRoundedCallEnd02' icon.
  static const IconData strokeRoundedCallEnd02 = HugeIconData(0x3d0a);

  /// IconData for the 'strokeRoundedCallEnd03' icon.
  static const IconData strokeRoundedCallEnd03 = HugeIconData(0x3d0b);

  /// IconData for the 'strokeRoundedCallEnd04' icon.
  static const IconData strokeRoundedCallEnd04 = HugeIconData(0x3d0c);

  /// IconData for the 'strokeRoundedCallIncoming01' icon.
  static const IconData strokeRoundedCallIncoming01 = HugeIconData(0x3d0d);

  /// IconData for the 'strokeRoundedCallIncoming02' icon.
  static const IconData strokeRoundedCallIncoming02 = HugeIconData(0x3d0e);

  /// IconData for the 'strokeRoundedCallIncoming03' icon.
  static const IconData strokeRoundedCallIncoming03 = HugeIconData(0x3d0f);

  /// IconData for the 'strokeRoundedCallIncoming04' icon.
  static const IconData strokeRoundedCallIncoming04 = HugeIconData(0x3d10);

  /// IconData for the 'strokeRoundedCallInternal02' icon.
  static const IconData strokeRoundedCallInternal02 = HugeIconData(0x3d11);

  /// IconData for the 'strokeRoundedCallInternal' icon.
  static const IconData strokeRoundedCallInternal = HugeIconData(0x3d12);

  /// IconData for the 'strokeRoundedCallLocked02' icon.
  static const IconData strokeRoundedCallLocked02 = HugeIconData(0x3d13);

  /// IconData for the 'strokeRoundedCallLocked' icon.
  static const IconData strokeRoundedCallLocked = HugeIconData(0x3d14);

  /// IconData for the 'strokeRoundedCallMinus02' icon.
  static const IconData strokeRoundedCallMinus02 = HugeIconData(0x3d15);

  /// IconData for the 'strokeRoundedCallMinus' icon.
  static const IconData strokeRoundedCallMinus = HugeIconData(0x3d16);

  /// IconData for the 'strokeRoundedCallMissed01' icon.
  static const IconData strokeRoundedCallMissed01 = HugeIconData(0x3d17);

  /// IconData for the 'strokeRoundedCallMissed02' icon.
  static const IconData strokeRoundedCallMissed02 = HugeIconData(0x3d18);

  /// IconData for the 'strokeRoundedCallMissed03' icon.
  static const IconData strokeRoundedCallMissed03 = HugeIconData(0x3d19);

  /// IconData for the 'strokeRoundedCallMissed04' icon.
  static const IconData strokeRoundedCallMissed04 = HugeIconData(0x3d1a);

  /// IconData for the 'strokeRoundedCallOutgoing01' icon.
  static const IconData strokeRoundedCallOutgoing01 = HugeIconData(0x3d1b);

  /// IconData for the 'strokeRoundedCallOutgoing02' icon.
  static const IconData strokeRoundedCallOutgoing02 = HugeIconData(0x3d1c);

  /// IconData for the 'strokeRoundedCallOutgoing03' icon.
  static const IconData strokeRoundedCallOutgoing03 = HugeIconData(0x3d1d);

  /// IconData for the 'strokeRoundedCallOutgoing04' icon.
  static const IconData strokeRoundedCallOutgoing04 = HugeIconData(0x3d1e);

  /// IconData for the 'strokeRoundedCallPaused02' icon.
  static const IconData strokeRoundedCallPaused02 = HugeIconData(0x3d1f);

  /// IconData for the 'strokeRoundedCallPaused' icon.
  static const IconData strokeRoundedCallPaused = HugeIconData(0x3d20);

  /// IconData for the 'strokeRoundedCallReceived02' icon.
  static const IconData strokeRoundedCallReceived02 = HugeIconData(0x3d21);

  /// IconData for the 'strokeRoundedCallReceived' icon.
  static const IconData strokeRoundedCallReceived = HugeIconData(0x3d22);

  /// IconData for the 'strokeRoundedCallRinging01' icon.
  static const IconData strokeRoundedCallRinging01 = HugeIconData(0x3d23);

  /// IconData for the 'strokeRoundedCallRinging02' icon.
  static const IconData strokeRoundedCallRinging02 = HugeIconData(0x3d24);

  /// IconData for the 'strokeRoundedCallRinging03' icon.
  static const IconData strokeRoundedCallRinging03 = HugeIconData(0x3d25);

  /// IconData for the 'strokeRoundedCallRinging04' icon.
  static const IconData strokeRoundedCallRinging04 = HugeIconData(0x3d26);

  /// IconData for the 'strokeRoundedCallUnlocked02' icon.
  static const IconData strokeRoundedCallUnlocked02 = HugeIconData(0x3d27);

  /// IconData for the 'strokeRoundedCallUnlocked' icon.
  static const IconData strokeRoundedCallUnlocked = HugeIconData(0x3d28);

  /// IconData for the 'strokeRoundedCall' icon.
  static const IconData strokeRoundedCall = HugeIconData(0x3d29);

  /// IconData for the 'strokeRoundedCalling02' icon.
  static const IconData strokeRoundedCalling02 = HugeIconData(0x3d2a);

  /// IconData for the 'strokeRoundedCalling' icon.
  static const IconData strokeRoundedCalling = HugeIconData(0x3d2b);

  /// IconData for the 'strokeRoundedCamel' icon.
  static const IconData strokeRoundedCamel = HugeIconData(0x3d2c);

  /// IconData for the 'strokeRoundedCamera01' icon.
  static const IconData strokeRoundedCamera01 = HugeIconData(0x3d2d);

  /// IconData for the 'strokeRoundedCamera02' icon.
  static const IconData strokeRoundedCamera02 = HugeIconData(0x3d2e);

  /// IconData for the 'strokeRoundedCameraAdd01' icon.
  static const IconData strokeRoundedCameraAdd01 = HugeIconData(0x3d2f);

  /// IconData for the 'strokeRoundedCameraAdd02' icon.
  static const IconData strokeRoundedCameraAdd02 = HugeIconData(0x3d30);

  /// IconData for the 'strokeRoundedCameraAutomatically01' icon.
  static const IconData strokeRoundedCameraAutomatically01 =
      HugeIconData(0x3d31);

  /// IconData for the 'strokeRoundedCameraAutomatically02' icon.
  static const IconData strokeRoundedCameraAutomatically02 =
      HugeIconData(0x3d32);

  /// IconData for the 'strokeRoundedCameraLens' icon.
  static const IconData strokeRoundedCameraLens = HugeIconData(0x3d33);

  /// IconData for the 'strokeRoundedCameraMicrophone01' icon.
  static const IconData strokeRoundedCameraMicrophone01 = HugeIconData(0x3d34);

  /// IconData for the 'strokeRoundedCameraMicrophone02' icon.
  static const IconData strokeRoundedCameraMicrophone02 = HugeIconData(0x3d35);

  /// IconData for the 'strokeRoundedCameraNightMode01' icon.
  static const IconData strokeRoundedCameraNightMode01 = HugeIconData(0x3d36);

  /// IconData for the 'strokeRoundedCameraNightMode02' icon.
  static const IconData strokeRoundedCameraNightMode02 = HugeIconData(0x3d37);

  /// IconData for the 'strokeRoundedCameraOff01' icon.
  static const IconData strokeRoundedCameraOff01 = HugeIconData(0x3d38);

  /// IconData for the 'strokeRoundedCameraOff02' icon.
  static const IconData strokeRoundedCameraOff02 = HugeIconData(0x3d39);

  /// IconData for the 'strokeRoundedCameraRotated01' icon.
  static const IconData strokeRoundedCameraRotated01 = HugeIconData(0x3d3a);

  /// IconData for the 'strokeRoundedCameraRotated02' icon.
  static const IconData strokeRoundedCameraRotated02 = HugeIconData(0x3d3b);

  /// IconData for the 'strokeRoundedCameraSmile01' icon.
  static const IconData strokeRoundedCameraSmile01 = HugeIconData(0x3d3c);

  /// IconData for the 'strokeRoundedCameraSmile02' icon.
  static const IconData strokeRoundedCameraSmile02 = HugeIconData(0x3d3d);

  /// IconData for the 'strokeRoundedCameraTripod' icon.
  static const IconData strokeRoundedCameraTripod = HugeIconData(0x3d3e);

  /// IconData for the 'strokeRoundedCameraVideo' icon.
  static const IconData strokeRoundedCameraVideo = HugeIconData(0x3d3f);

  /// IconData for the 'strokeRoundedCamper' icon.
  static const IconData strokeRoundedCamper = HugeIconData(0x3d40);

  /// IconData for the 'strokeRoundedCampfire' icon.
  static const IconData strokeRoundedCampfire = HugeIconData(0x3d41);

  /// IconData for the 'strokeRoundedCancel01' icon.
  static const IconData strokeRoundedCancel01 = HugeIconData(0x3d42);

  /// IconData for the 'strokeRoundedCancel02' icon.
  static const IconData strokeRoundedCancel02 = HugeIconData(0x3d43);

  /// IconData for the 'strokeRoundedCancelCircleHalfDot' icon.
  static const IconData strokeRoundedCancelCircleHalfDot = HugeIconData(0x3d44);

  /// IconData for the 'strokeRoundedCancelCircle' icon.
  static const IconData strokeRoundedCancelCircle = HugeIconData(0x3d45);

  /// IconData for the 'strokeRoundedCancelSquare' icon.
  static const IconData strokeRoundedCancelSquare = HugeIconData(0x3d46);

  /// IconData for the 'strokeRoundedCandelier01' icon.
  static const IconData strokeRoundedCandelier01 = HugeIconData(0x3d47);

  /// IconData for the 'strokeRoundedCandelier02' icon.
  static const IconData strokeRoundedCandelier02 = HugeIconData(0x3d48);

  /// IconData for the 'strokeRoundedCanvas' icon.
  static const IconData strokeRoundedCanvas = HugeIconData(0x3d49);

  /// IconData for the 'strokeRoundedCapProjecting' icon.
  static const IconData strokeRoundedCapProjecting = HugeIconData(0x3d4a);

  /// IconData for the 'strokeRoundedCapRound' icon.
  static const IconData strokeRoundedCapRound = HugeIconData(0x3d4b);

  /// IconData for the 'strokeRoundedCapStraight' icon.
  static const IconData strokeRoundedCapStraight = HugeIconData(0x3d4c);

  /// IconData for the 'strokeRoundedCap' icon.
  static const IconData strokeRoundedCap = HugeIconData(0x3d4d);

  /// IconData for the 'strokeRoundedCapcutRectangle' icon.
  static const IconData strokeRoundedCapcutRectangle = HugeIconData(0x3d4e);

  /// IconData for the 'strokeRoundedCapcut' icon.
  static const IconData strokeRoundedCapcut = HugeIconData(0x3d4f);

  /// IconData for the 'strokeRoundedCar01' icon.
  static const IconData strokeRoundedCar01 = HugeIconData(0x3d50);

  /// IconData for the 'strokeRoundedCar02' icon.
  static const IconData strokeRoundedCar02 = HugeIconData(0x3d51);

  /// IconData for the 'strokeRoundedCar03' icon.
  static const IconData strokeRoundedCar03 = HugeIconData(0x3d52);

  /// IconData for the 'strokeRoundedCar04' icon.
  static const IconData strokeRoundedCar04 = HugeIconData(0x3d53);

  /// IconData for the 'strokeRoundedCarParking01' icon.
  static const IconData strokeRoundedCarParking01 = HugeIconData(0x3d54);

  /// IconData for the 'strokeRoundedCarParking02' icon.
  static const IconData strokeRoundedCarParking02 = HugeIconData(0x3d55);

  /// IconData for the 'strokeRoundedCaravan' icon.
  static const IconData strokeRoundedCaravan = HugeIconData(0x3d56);

  /// IconData for the 'strokeRoundedCardExchange01' icon.
  static const IconData strokeRoundedCardExchange01 = HugeIconData(0x3d57);

  /// IconData for the 'strokeRoundedCardExchange02' icon.
  static const IconData strokeRoundedCardExchange02 = HugeIconData(0x3d58);

  /// IconData for the 'strokeRoundedCardigan' icon.
  static const IconData strokeRoundedCardigan = HugeIconData(0x3d59);

  /// IconData for the 'strokeRoundedCardiogram01' icon.
  static const IconData strokeRoundedCardiogram01 = HugeIconData(0x3d5a);

  /// IconData for the 'strokeRoundedCardiogram02' icon.
  static const IconData strokeRoundedCardiogram02 = HugeIconData(0x3d5b);

  /// IconData for the 'strokeRoundedCards01' icon.
  static const IconData strokeRoundedCards01 = HugeIconData(0x3d5c);

  /// IconData for the 'strokeRoundedCards02' icon.
  static const IconData strokeRoundedCards02 = HugeIconData(0x3d5d);

  /// IconData for the 'strokeRoundedCargoShip' icon.
  static const IconData strokeRoundedCargoShip = HugeIconData(0x3d5e);

  /// IconData for the 'strokeRoundedCarouselHorizontal02' icon.
  static const IconData strokeRoundedCarouselHorizontal02 =
      HugeIconData(0x3d5f);

  /// IconData for the 'strokeRoundedCarouselHorizontal' icon.
  static const IconData strokeRoundedCarouselHorizontal = HugeIconData(0x3d60);

  /// IconData for the 'strokeRoundedCarouselVertical' icon.
  static const IconData strokeRoundedCarouselVertical = HugeIconData(0x3d61);

  /// IconData for the 'strokeRoundedCarrot' icon.
  static const IconData strokeRoundedCarrot = HugeIconData(0x3d62);

  /// IconData for the 'strokeRoundedCash01' icon.
  static const IconData strokeRoundedCash01 = HugeIconData(0x3d63);

  /// IconData for the 'strokeRoundedCash02' icon.
  static const IconData strokeRoundedCash02 = HugeIconData(0x3d64);

  /// IconData for the 'strokeRoundedCashback' icon.
  static const IconData strokeRoundedCashback = HugeIconData(0x3d65);

  /// IconData for the 'strokeRoundedCashier02' icon.
  static const IconData strokeRoundedCashier02 = HugeIconData(0x3d66);

  /// IconData for the 'strokeRoundedCashier' icon.
  static const IconData strokeRoundedCashier = HugeIconData(0x3d67);

  /// IconData for the 'strokeRoundedCastle01' icon.
  static const IconData strokeRoundedCastle01 = HugeIconData(0x3d68);

  /// IconData for the 'strokeRoundedCastle02' icon.
  static const IconData strokeRoundedCastle02 = HugeIconData(0x3d69);

  /// IconData for the 'strokeRoundedCastle' icon.
  static const IconData strokeRoundedCastle = HugeIconData(0x3d6a);

  /// IconData for the 'strokeRoundedCatalogue' icon.
  static const IconData strokeRoundedCatalogue = HugeIconData(0x3d6b);

  /// IconData for the 'strokeRoundedCayanTower' icon.
  static const IconData strokeRoundedCayanTower = HugeIconData(0x3d6c);

  /// IconData for the 'strokeRoundedCctvCamera' icon.
  static const IconData strokeRoundedCctvCamera = HugeIconData(0x3d6d);

  /// IconData for the 'strokeRoundedCd' icon.
  static const IconData strokeRoundedCd = HugeIconData(0x3d6e);

  /// IconData for the 'strokeRoundedCells' icon.
  static const IconData strokeRoundedCells = HugeIconData(0x3d6f);

  /// IconData for the 'strokeRoundedCellularNetworkOffline' icon.
  static const IconData strokeRoundedCellularNetworkOffline =
      HugeIconData(0x3d70);

  /// IconData for the 'strokeRoundedCellularNetwork' icon.
  static const IconData strokeRoundedCellularNetwork = HugeIconData(0x3d71);

  /// IconData for the 'strokeRoundedCelsius' icon.
  static const IconData strokeRoundedCelsius = HugeIconData(0x3d72);

  /// IconData for the 'strokeRoundedCenterFocus' icon.
  static const IconData strokeRoundedCenterFocus = HugeIconData(0x3d73);

  /// IconData for the 'strokeRoundedCentralShaheedMinar' icon.
  static const IconData strokeRoundedCentralShaheedMinar = HugeIconData(0x3d74);

  /// IconData for the 'strokeRoundedCentralized' icon.
  static const IconData strokeRoundedCentralized = HugeIconData(0x3d75);

  /// IconData for the 'strokeRoundedCertificate01' icon.
  static const IconData strokeRoundedCertificate01 = HugeIconData(0x3d76);

  /// IconData for the 'strokeRoundedCertificate02' icon.
  static const IconData strokeRoundedCertificate02 = HugeIconData(0x3d77);

  /// IconData for the 'strokeRoundedChair01' icon.
  static const IconData strokeRoundedChair01 = HugeIconData(0x3d78);

  /// IconData for the 'strokeRoundedChair02' icon.
  static const IconData strokeRoundedChair02 = HugeIconData(0x3d79);

  /// IconData for the 'strokeRoundedChair03' icon.
  static const IconData strokeRoundedChair03 = HugeIconData(0x3d7a);

  /// IconData for the 'strokeRoundedChair04' icon.
  static const IconData strokeRoundedChair04 = HugeIconData(0x3d7b);

  /// IconData for the 'strokeRoundedChair05' icon.
  static const IconData strokeRoundedChair05 = HugeIconData(0x3d7c);

  /// IconData for the 'strokeRoundedChairBarber' icon.
  static const IconData strokeRoundedChairBarber = HugeIconData(0x3d7d);

  /// IconData for the 'strokeRoundedChampion' icon.
  static const IconData strokeRoundedChampion = HugeIconData(0x3d7e);

  /// IconData for the 'strokeRoundedChangeScreenMode' icon.
  static const IconData strokeRoundedChangeScreenMode = HugeIconData(0x3d7f);

  /// IconData for the 'strokeRoundedCharacterPhonetic' icon.
  static const IconData strokeRoundedCharacterPhonetic = HugeIconData(0x3d80);

  /// IconData for the 'strokeRoundedCharity' icon.
  static const IconData strokeRoundedCharity = HugeIconData(0x3d81);

  /// IconData for the 'strokeRoundedChartAverage' icon.
  static const IconData strokeRoundedChartAverage = HugeIconData(0x3d82);

  /// IconData for the 'strokeRoundedChartBarLine' icon.
  static const IconData strokeRoundedChartBarLine = HugeIconData(0x3d83);

  /// IconData for the 'strokeRoundedChartBreakoutCircle' icon.
  static const IconData strokeRoundedChartBreakoutCircle = HugeIconData(0x3d84);

  /// IconData for the 'strokeRoundedChartBreakoutSquare' icon.
  static const IconData strokeRoundedChartBreakoutSquare = HugeIconData(0x3d85);

  /// IconData for the 'strokeRoundedChartBubble01' icon.
  static const IconData strokeRoundedChartBubble01 = HugeIconData(0x3d86);

  /// IconData for the 'strokeRoundedChartBubble02' icon.
  static const IconData strokeRoundedChartBubble02 = HugeIconData(0x3d87);

  /// IconData for the 'strokeRoundedChartColumn' icon.
  static const IconData strokeRoundedChartColumn = HugeIconData(0x3d88);

  /// IconData for the 'strokeRoundedChartDecrease' icon.
  static const IconData strokeRoundedChartDecrease = HugeIconData(0x3d89);

  /// IconData for the 'strokeRoundedChartEvaluation' icon.
  static const IconData strokeRoundedChartEvaluation = HugeIconData(0x3d8a);

  /// IconData for the 'strokeRoundedChartHighLow' icon.
  static const IconData strokeRoundedChartHighLow = HugeIconData(0x3d8b);

  /// IconData for the 'strokeRoundedChartHistogram' icon.
  static const IconData strokeRoundedChartHistogram = HugeIconData(0x3d8c);

  /// IconData for the 'strokeRoundedChartIncrease' icon.
  static const IconData strokeRoundedChartIncrease = HugeIconData(0x3d8d);

  /// IconData for the 'strokeRoundedChartLineData01' icon.
  static const IconData strokeRoundedChartLineData01 = HugeIconData(0x3d8e);

  /// IconData for the 'strokeRoundedChartLineData02' icon.
  static const IconData strokeRoundedChartLineData02 = HugeIconData(0x3d8f);

  /// IconData for the 'strokeRoundedChartLineData03' icon.
  static const IconData strokeRoundedChartLineData03 = HugeIconData(0x3d90);

  /// IconData for the 'strokeRoundedChartMaximum' icon.
  static const IconData strokeRoundedChartMaximum = HugeIconData(0x3d91);

  /// IconData for the 'strokeRoundedChartMedium' icon.
  static const IconData strokeRoundedChartMedium = HugeIconData(0x3d92);

  /// IconData for the 'strokeRoundedChartMinimum' icon.
  static const IconData strokeRoundedChartMinimum = HugeIconData(0x3d93);

  /// IconData for the 'strokeRoundedChartRadar' icon.
  static const IconData strokeRoundedChartRadar = HugeIconData(0x3d94);

  /// IconData for the 'strokeRoundedChartRelationship' icon.
  static const IconData strokeRoundedChartRelationship = HugeIconData(0x3d95);

  /// IconData for the 'strokeRoundedChartRing' icon.
  static const IconData strokeRoundedChartRing = HugeIconData(0x3d96);

  /// IconData for the 'strokeRoundedChartRose' icon.
  static const IconData strokeRoundedChartRose = HugeIconData(0x3d97);

  /// IconData for the 'strokeRoundedChartScatter' icon.
  static const IconData strokeRoundedChartScatter = HugeIconData(0x3d98);

  /// IconData for the 'strokeRoundedChart' icon.
  static const IconData strokeRoundedChart = HugeIconData(0x3d99);

  /// IconData for the 'strokeRoundedChatBot' icon.
  static const IconData strokeRoundedChatBot = HugeIconData(0x3d9a);

  /// IconData for the 'strokeRoundedChatGpt' icon.
  static const IconData strokeRoundedChatGpt = HugeIconData(0x3d9b);

  /// IconData for the 'strokeRoundedChatting01' icon.
  static const IconData strokeRoundedChatting01 = HugeIconData(0x3d9c);

  /// IconData for the 'strokeRoundedCheckList' icon.
  static const IconData strokeRoundedCheckList = HugeIconData(0x3d9d);

  /// IconData for the 'strokeRoundedCheckUnread01' icon.
  static const IconData strokeRoundedCheckUnread01 = HugeIconData(0x3d9e);

  /// IconData for the 'strokeRoundedCheckUnread02' icon.
  static const IconData strokeRoundedCheckUnread02 = HugeIconData(0x3d9f);

  /// IconData for the 'strokeRoundedCheckUnread03' icon.
  static const IconData strokeRoundedCheckUnread03 = HugeIconData(0x3da0);

  /// IconData for the 'strokeRoundedCheckUnread04' icon.
  static const IconData strokeRoundedCheckUnread04 = HugeIconData(0x3da1);

  /// IconData for the 'strokeRoundedCheckmarkBadge01' icon.
  static const IconData strokeRoundedCheckmarkBadge01 = HugeIconData(0x3da2);

  /// IconData for the 'strokeRoundedCheckmarkBadge02' icon.
  static const IconData strokeRoundedCheckmarkBadge02 = HugeIconData(0x3da3);

  /// IconData for the 'strokeRoundedCheckmarkBadge03' icon.
  static const IconData strokeRoundedCheckmarkBadge03 = HugeIconData(0x3da4);

  /// IconData for the 'strokeRoundedCheckmarkBadge04' icon.
  static const IconData strokeRoundedCheckmarkBadge04 = HugeIconData(0x3da5);

  /// IconData for the 'strokeRoundedCheckmarkCircle01' icon.
  static const IconData strokeRoundedCheckmarkCircle01 = HugeIconData(0x3da6);

  /// IconData for the 'strokeRoundedCheckmarkCircle02' icon.
  static const IconData strokeRoundedCheckmarkCircle02 = HugeIconData(0x3da7);

  /// IconData for the 'strokeRoundedCheckmarkCircle03' icon.
  static const IconData strokeRoundedCheckmarkCircle03 = HugeIconData(0x3da8);

  /// IconData for the 'strokeRoundedCheckmarkCircle04' icon.
  static const IconData strokeRoundedCheckmarkCircle04 = HugeIconData(0x3da9);

  /// IconData for the 'strokeRoundedCheckmarkSquare01' icon.
  static const IconData strokeRoundedCheckmarkSquare01 = HugeIconData(0x3daa);

  /// IconData for the 'strokeRoundedCheckmarkSquare02' icon.
  static const IconData strokeRoundedCheckmarkSquare02 = HugeIconData(0x3dab);

  /// IconData for the 'strokeRoundedCheckmarkSquare03' icon.
  static const IconData strokeRoundedCheckmarkSquare03 = HugeIconData(0x3dac);

  /// IconData for the 'strokeRoundedCheckmarkSquare04' icon.
  static const IconData strokeRoundedCheckmarkSquare04 = HugeIconData(0x3dad);

  /// IconData for the 'strokeRoundedCheeseCake01' icon.
  static const IconData strokeRoundedCheeseCake01 = HugeIconData(0x3dae);

  /// IconData for the 'strokeRoundedCheeseCake02' icon.
  static const IconData strokeRoundedCheeseCake02 = HugeIconData(0x3daf);

  /// IconData for the 'strokeRoundedCheese' icon.
  static const IconData strokeRoundedCheese = HugeIconData(0x3db0);

  /// IconData for the 'strokeRoundedChefHat' icon.
  static const IconData strokeRoundedChefHat = HugeIconData(0x3db1);

  /// IconData for the 'strokeRoundedChef' icon.
  static const IconData strokeRoundedChef = HugeIconData(0x3db2);

  /// IconData for the 'strokeRoundedChemistry01' icon.
  static const IconData strokeRoundedChemistry01 = HugeIconData(0x3db3);

  /// IconData for the 'strokeRoundedChemistry02' icon.
  static const IconData strokeRoundedChemistry02 = HugeIconData(0x3db4);

  /// IconData for the 'strokeRoundedChemistry03' icon.
  static const IconData strokeRoundedChemistry03 = HugeIconData(0x3db5);

  /// IconData for the 'strokeRoundedCherry' icon.
  static const IconData strokeRoundedCherry = HugeIconData(0x3db6);

  /// IconData for the 'strokeRoundedChess01' icon.
  static const IconData strokeRoundedChess01 = HugeIconData(0x3db7);

  /// IconData for the 'strokeRoundedChess02' icon.
  static const IconData strokeRoundedChess02 = HugeIconData(0x3db8);

  /// IconData for the 'strokeRoundedChessPawn' icon.
  static const IconData strokeRoundedChessPawn = HugeIconData(0x3db9);

  /// IconData for the 'strokeRoundedChickenThighs' icon.
  static const IconData strokeRoundedChickenThighs = HugeIconData(0x3dba);

  /// IconData for the 'strokeRoundedChimney' icon.
  static const IconData strokeRoundedChimney = HugeIconData(0x3dbb);

  /// IconData for the 'strokeRoundedChinaTemple' icon.
  static const IconData strokeRoundedChinaTemple = HugeIconData(0x3dbc);

  /// IconData for the 'strokeRoundedChip02' icon.
  static const IconData strokeRoundedChip02 = HugeIconData(0x3dbd);

  /// IconData for the 'strokeRoundedChip' icon.
  static const IconData strokeRoundedChip = HugeIconData(0x3dbe);

  /// IconData for the 'strokeRoundedChocolate' icon.
  static const IconData strokeRoundedChocolate = HugeIconData(0x3dbf);

  /// IconData for the 'strokeRoundedChrome' icon.
  static const IconData strokeRoundedChrome = HugeIconData(0x3dc0);

  /// IconData for the 'strokeRoundedChrysler' icon.
  static const IconData strokeRoundedChrysler = HugeIconData(0x3dc1);

  /// IconData for the 'strokeRoundedChurch' icon.
  static const IconData strokeRoundedChurch = HugeIconData(0x3dc2);

  /// IconData for the 'strokeRoundedCinnamonRoll' icon.
  static const IconData strokeRoundedCinnamonRoll = HugeIconData(0x3dc3);

  /// IconData for the 'strokeRoundedCircleArrowDataTransferDiagonal' icon.
  static const IconData strokeRoundedCircleArrowDataTransferDiagonal =
      HugeIconData(0x3dc4);

  /// IconData for the 'strokeRoundedCircleArrowDataTransferHorizontal' icon.
  static const IconData strokeRoundedCircleArrowDataTransferHorizontal =
      HugeIconData(0x3dc5);

  /// IconData for the 'strokeRoundedCircleArrowDataTransferVertical' icon.
  static const IconData strokeRoundedCircleArrowDataTransferVertical =
      HugeIconData(0x3dc6);

  /// IconData for the 'strokeRoundedCircleArrowDiagonal01' icon.
  static const IconData strokeRoundedCircleArrowDiagonal01 =
      HugeIconData(0x3dc7);

  /// IconData for the 'strokeRoundedCircleArrowDiagonal02' icon.
  static const IconData strokeRoundedCircleArrowDiagonal02 =
      HugeIconData(0x3dc8);

  /// IconData for the 'strokeRoundedCircleArrowDown01' icon.
  static const IconData strokeRoundedCircleArrowDown01 = HugeIconData(0x3dc9);

  /// IconData for the 'strokeRoundedCircleArrowDown02' icon.
  static const IconData strokeRoundedCircleArrowDown02 = HugeIconData(0x3dca);

  /// IconData for the 'strokeRoundedCircleArrowDown03' icon.
  static const IconData strokeRoundedCircleArrowDown03 = HugeIconData(0x3dcb);

  /// IconData for the 'strokeRoundedCircleArrowDownDouble' icon.
  static const IconData strokeRoundedCircleArrowDownDouble =
      HugeIconData(0x3dcc);

  /// IconData for the 'strokeRoundedCircleArrowDownLeft' icon.
  static const IconData strokeRoundedCircleArrowDownLeft = HugeIconData(0x3dcd);

  /// IconData for the 'strokeRoundedCircleArrowDownRight' icon.
  static const IconData strokeRoundedCircleArrowDownRight =
      HugeIconData(0x3dce);

  /// IconData for the 'strokeRoundedCircleArrowExpand01' icon.
  static const IconData strokeRoundedCircleArrowExpand01 = HugeIconData(0x3dcf);

  /// IconData for the 'strokeRoundedCircleArrowExpand02' icon.
  static const IconData strokeRoundedCircleArrowExpand02 = HugeIconData(0x3dd0);

  /// IconData for the 'strokeRoundedCircleArrowHorizontal' icon.
  static const IconData strokeRoundedCircleArrowHorizontal =
      HugeIconData(0x3dd1);

  /// IconData for the 'strokeRoundedCircleArrowLeft01' icon.
  static const IconData strokeRoundedCircleArrowLeft01 = HugeIconData(0x3dd2);

  /// IconData for the 'strokeRoundedCircleArrowLeft02' icon.
  static const IconData strokeRoundedCircleArrowLeft02 = HugeIconData(0x3dd3);

  /// IconData for the 'strokeRoundedCircleArrowLeft03' icon.
  static const IconData strokeRoundedCircleArrowLeft03 = HugeIconData(0x3dd4);

  /// IconData for the 'strokeRoundedCircleArrowLeftDouble' icon.
  static const IconData strokeRoundedCircleArrowLeftDouble =
      HugeIconData(0x3dd5);

  /// IconData for the 'strokeRoundedCircleArrowLeftRight' icon.
  static const IconData strokeRoundedCircleArrowLeftRight =
      HugeIconData(0x3dd6);

  /// IconData for the 'strokeRoundedCircleArrowMoveDownLeft' icon.
  static const IconData strokeRoundedCircleArrowMoveDownLeft =
      HugeIconData(0x3dd7);

  /// IconData for the 'strokeRoundedCircleArrowMoveDownRight' icon.
  static const IconData strokeRoundedCircleArrowMoveDownRight =
      HugeIconData(0x3dd8);

  /// IconData for the 'strokeRoundedCircleArrowMoveLeftDown' icon.
  static const IconData strokeRoundedCircleArrowMoveLeftDown =
      HugeIconData(0x3dd9);

  /// IconData for the 'strokeRoundedCircleArrowMoveRightDown' icon.
  static const IconData strokeRoundedCircleArrowMoveRightDown =
      HugeIconData(0x3dda);

  /// IconData for the 'strokeRoundedCircleArrowMoveUpLeft' icon.
  static const IconData strokeRoundedCircleArrowMoveUpLeft =
      HugeIconData(0x3ddb);

  /// IconData for the 'strokeRoundedCircleArrowMoveUpRight' icon.
  static const IconData strokeRoundedCircleArrowMoveUpRight =
      HugeIconData(0x3ddc);

  /// IconData for the 'strokeRoundedCircleArrowReload01' icon.
  static const IconData strokeRoundedCircleArrowReload01 = HugeIconData(0x3ddd);

  /// IconData for the 'strokeRoundedCircleArrowReload02' icon.
  static const IconData strokeRoundedCircleArrowReload02 = HugeIconData(0x3dde);

  /// IconData for the 'strokeRoundedCircleArrowRight01' icon.
  static const IconData strokeRoundedCircleArrowRight01 = HugeIconData(0x3ddf);

  /// IconData for the 'strokeRoundedCircleArrowRight02' icon.
  static const IconData strokeRoundedCircleArrowRight02 = HugeIconData(0x3de0);

  /// IconData for the 'strokeRoundedCircleArrowRight03' icon.
  static const IconData strokeRoundedCircleArrowRight03 = HugeIconData(0x3de1);

  /// IconData for the 'strokeRoundedCircleArrowRightDouble' icon.
  static const IconData strokeRoundedCircleArrowRightDouble =
      HugeIconData(0x3de2);

  /// IconData for the 'strokeRoundedCircleArrowShrink01' icon.
  static const IconData strokeRoundedCircleArrowShrink01 = HugeIconData(0x3de3);

  /// IconData for the 'strokeRoundedCircleArrowShrink02' icon.
  static const IconData strokeRoundedCircleArrowShrink02 = HugeIconData(0x3de4);

  /// IconData for the 'strokeRoundedCircleArrowUp01' icon.
  static const IconData strokeRoundedCircleArrowUp01 = HugeIconData(0x3de5);

  /// IconData for the 'strokeRoundedCircleArrowUp02' icon.
  static const IconData strokeRoundedCircleArrowUp02 = HugeIconData(0x3de6);

  /// IconData for the 'strokeRoundedCircleArrowUp03' icon.
  static const IconData strokeRoundedCircleArrowUp03 = HugeIconData(0x3de7);

  /// IconData for the 'strokeRoundedCircleArrowUpDouble' icon.
  static const IconData strokeRoundedCircleArrowUpDouble = HugeIconData(0x3de8);

  /// IconData for the 'strokeRoundedCircleArrowUpDown' icon.
  static const IconData strokeRoundedCircleArrowUpDown = HugeIconData(0x3de9);

  /// IconData for the 'strokeRoundedCircleArrowUpLeft' icon.
  static const IconData strokeRoundedCircleArrowUpLeft = HugeIconData(0x3dea);

  /// IconData for the 'strokeRoundedCircleArrowUpRight' icon.
  static const IconData strokeRoundedCircleArrowUpRight = HugeIconData(0x3deb);

  /// IconData for the 'strokeRoundedCircleArrowVertical' icon.
  static const IconData strokeRoundedCircleArrowVertical = HugeIconData(0x3dec);

  /// IconData for the 'strokeRoundedCircleLock01' icon.
  static const IconData strokeRoundedCircleLock01 = HugeIconData(0x3ded);

  /// IconData for the 'strokeRoundedCircleLock02' icon.
  static const IconData strokeRoundedCircleLock02 = HugeIconData(0x3dee);

  /// IconData for the 'strokeRoundedCircleLockAdd01' icon.
  static const IconData strokeRoundedCircleLockAdd01 = HugeIconData(0x3def);

  /// IconData for the 'strokeRoundedCircleLockAdd02' icon.
  static const IconData strokeRoundedCircleLockAdd02 = HugeIconData(0x3df0);

  /// IconData for the 'strokeRoundedCircleLockCheck01' icon.
  static const IconData strokeRoundedCircleLockCheck01 = HugeIconData(0x3df1);

  /// IconData for the 'strokeRoundedCircleLockCheck02' icon.
  static const IconData strokeRoundedCircleLockCheck02 = HugeIconData(0x3df2);

  /// IconData for the 'strokeRoundedCircleLockMinus01' icon.
  static const IconData strokeRoundedCircleLockMinus01 = HugeIconData(0x3df3);

  /// IconData for the 'strokeRoundedCircleLockMinus02' icon.
  static const IconData strokeRoundedCircleLockMinus02 = HugeIconData(0x3df4);

  /// IconData for the 'strokeRoundedCircleLockRemove01' icon.
  static const IconData strokeRoundedCircleLockRemove01 = HugeIconData(0x3df5);

  /// IconData for the 'strokeRoundedCircleLockRemove02' icon.
  static const IconData strokeRoundedCircleLockRemove02 = HugeIconData(0x3df6);

  /// IconData for the 'strokeRoundedCirclePassword' icon.
  static const IconData strokeRoundedCirclePassword = HugeIconData(0x3df7);

  /// IconData for the 'strokeRoundedCircleUnlock01' icon.
  static const IconData strokeRoundedCircleUnlock01 = HugeIconData(0x3df8);

  /// IconData for the 'strokeRoundedCircleUnlock02' icon.
  static const IconData strokeRoundedCircleUnlock02 = HugeIconData(0x3df9);

  /// IconData for the 'strokeRoundedCircle' icon.
  static const IconData strokeRoundedCircle = HugeIconData(0x3dfa);

  /// IconData for the 'strokeRoundedCity01' icon.
  static const IconData strokeRoundedCity01 = HugeIconData(0x3dfb);

  /// IconData for the 'strokeRoundedCity02' icon.
  static const IconData strokeRoundedCity02 = HugeIconData(0x3dfc);

  /// IconData for the 'strokeRoundedCity03' icon.
  static const IconData strokeRoundedCity03 = HugeIconData(0x3dfd);

  /// IconData for the 'strokeRoundedClapping01' icon.
  static const IconData strokeRoundedClapping01 = HugeIconData(0x3dfe);

  /// IconData for the 'strokeRoundedClapping02' icon.
  static const IconData strokeRoundedClapping02 = HugeIconData(0x3dff);

  /// IconData for the 'strokeRoundedClean' icon.
  static const IconData strokeRoundedClean = HugeIconData(0x3e00);

  /// IconData for the 'strokeRoundedCleaningBucket' icon.
  static const IconData strokeRoundedCleaningBucket = HugeIconData(0x3e01);

  /// IconData for the 'strokeRoundedClinic' icon.
  static const IconData strokeRoundedClinic = HugeIconData(0x3e02);

  /// IconData for the 'strokeRoundedClip' icon.
  static const IconData strokeRoundedClip = HugeIconData(0x3e03);

  /// IconData for the 'strokeRoundedClipboard' icon.
  static const IconData strokeRoundedClipboard = HugeIconData(0x3e04);

  /// IconData for the 'strokeRoundedClock01' icon.
  static const IconData strokeRoundedClock01 = HugeIconData(0x3e05);

  /// IconData for the 'strokeRoundedClock02' icon.
  static const IconData strokeRoundedClock02 = HugeIconData(0x3e06);

  /// IconData for the 'strokeRoundedClock03' icon.
  static const IconData strokeRoundedClock03 = HugeIconData(0x3e07);

  /// IconData for the 'strokeRoundedClock04' icon.
  static const IconData strokeRoundedClock04 = HugeIconData(0x3e08);

  /// IconData for the 'strokeRoundedClock05' icon.
  static const IconData strokeRoundedClock05 = HugeIconData(0x3e09);

  /// IconData for the 'strokeRoundedClosedCaptionAlt' icon.
  static const IconData strokeRoundedClosedCaptionAlt = HugeIconData(0x3e0a);

  /// IconData for the 'strokeRoundedClosedCaption' icon.
  static const IconData strokeRoundedClosedCaption = HugeIconData(0x3e0b);

  /// IconData for the 'strokeRoundedClothes' icon.
  static const IconData strokeRoundedClothes = HugeIconData(0x3e0c);

  /// IconData for the 'strokeRoundedCloudAngledRainZap' icon.
  static const IconData strokeRoundedCloudAngledRainZap = HugeIconData(0x3e0d);

  /// IconData for the 'strokeRoundedCloudAngledRain' icon.
  static const IconData strokeRoundedCloudAngledRain = HugeIconData(0x3e0e);

  /// IconData for the 'strokeRoundedCloudAngledZap' icon.
  static const IconData strokeRoundedCloudAngledZap = HugeIconData(0x3e0f);

  /// IconData for the 'strokeRoundedCloudBigRain' icon.
  static const IconData strokeRoundedCloudBigRain = HugeIconData(0x3e10);

  /// IconData for the 'strokeRoundedCloudDownload' icon.
  static const IconData strokeRoundedCloudDownload = HugeIconData(0x3e11);

  /// IconData for the 'strokeRoundedCloudFastWind' icon.
  static const IconData strokeRoundedCloudFastWind = HugeIconData(0x3e12);

  /// IconData for the 'strokeRoundedCloudHailstone' icon.
  static const IconData strokeRoundedCloudHailstone = HugeIconData(0x3e13);

  /// IconData for the 'strokeRoundedCloudLittleRain' icon.
  static const IconData strokeRoundedCloudLittleRain = HugeIconData(0x3e14);

  /// IconData for the 'strokeRoundedCloudLittleSnow' icon.
  static const IconData strokeRoundedCloudLittleSnow = HugeIconData(0x3e15);

  /// IconData for the 'strokeRoundedCloudLoading' icon.
  static const IconData strokeRoundedCloudLoading = HugeIconData(0x3e16);

  /// IconData for the 'strokeRoundedCloudMidRain' icon.
  static const IconData strokeRoundedCloudMidRain = HugeIconData(0x3e17);

  /// IconData for the 'strokeRoundedCloudMidSnow' icon.
  static const IconData strokeRoundedCloudMidSnow = HugeIconData(0x3e18);

  /// IconData for the 'strokeRoundedCloudSavingDone01' icon.
  static const IconData strokeRoundedCloudSavingDone01 = HugeIconData(0x3e19);

  /// IconData for the 'strokeRoundedCloudSavingDone02' icon.
  static const IconData strokeRoundedCloudSavingDone02 = HugeIconData(0x3e1a);

  /// IconData for the 'strokeRoundedCloudServer' icon.
  static const IconData strokeRoundedCloudServer = HugeIconData(0x3e1b);

  /// IconData for the 'strokeRoundedCloudSlowWind' icon.
  static const IconData strokeRoundedCloudSlowWind = HugeIconData(0x3e1c);

  /// IconData for the 'strokeRoundedCloudSnow' icon.
  static const IconData strokeRoundedCloudSnow = HugeIconData(0x3e1d);

  /// IconData for the 'strokeRoundedCloudUpload' icon.
  static const IconData strokeRoundedCloudUpload = HugeIconData(0x3e1e);

  /// IconData for the 'strokeRoundedCloud' icon.
  static const IconData strokeRoundedCloud = HugeIconData(0x3e1f);

  /// IconData for the 'strokeRoundedClubs01' icon.
  static const IconData strokeRoundedClubs01 = HugeIconData(0x3e20);

  /// IconData for the 'strokeRoundedClubs02' icon.
  static const IconData strokeRoundedClubs02 = HugeIconData(0x3e21);

  /// IconData for the 'strokeRoundedCoPresent' icon.
  static const IconData strokeRoundedCoPresent = HugeIconData(0x3e22);

  /// IconData for the 'strokeRoundedCodeCircle' icon.
  static const IconData strokeRoundedCodeCircle = HugeIconData(0x3e23);

  /// IconData for the 'strokeRoundedCodeFolder' icon.
  static const IconData strokeRoundedCodeFolder = HugeIconData(0x3e24);

  /// IconData for the 'strokeRoundedCodeSquare' icon.
  static const IconData strokeRoundedCodeSquare = HugeIconData(0x3e25);

  /// IconData for the 'strokeRoundedCode' icon.
  static const IconData strokeRoundedCode = HugeIconData(0x3e26);

  /// IconData for the 'strokeRoundedCodesandbox' icon.
  static const IconData strokeRoundedCodesandbox = HugeIconData(0x3e27);

  /// IconData for the 'strokeRoundedCoffee01' icon.
  static const IconData strokeRoundedCoffee01 = HugeIconData(0x3e28);

  /// IconData for the 'strokeRoundedCoffee02' icon.
  static const IconData strokeRoundedCoffee02 = HugeIconData(0x3e29);

  /// IconData for the 'strokeRoundedCoffeeBeans' icon.
  static const IconData strokeRoundedCoffeeBeans = HugeIconData(0x3e2a);

  /// IconData for the 'strokeRoundedCoins01' icon.
  static const IconData strokeRoundedCoins01 = HugeIconData(0x3e2b);

  /// IconData for the 'strokeRoundedCoins02' icon.
  static const IconData strokeRoundedCoins02 = HugeIconData(0x3e2c);

  /// IconData for the 'strokeRoundedCoinsBitcoin' icon.
  static const IconData strokeRoundedCoinsBitcoin = HugeIconData(0x3e2d);

  /// IconData for the 'strokeRoundedCoinsDollar' icon.
  static const IconData strokeRoundedCoinsDollar = HugeIconData(0x3e2e);

  /// IconData for the 'strokeRoundedCoinsEuro' icon.
  static const IconData strokeRoundedCoinsEuro = HugeIconData(0x3e2f);

  /// IconData for the 'strokeRoundedCoinsPound' icon.
  static const IconData strokeRoundedCoinsPound = HugeIconData(0x3e30);

  /// IconData for the 'strokeRoundedCoinsSwap' icon.
  static const IconData strokeRoundedCoinsSwap = HugeIconData(0x3e31);

  /// IconData for the 'strokeRoundedCoinsYen' icon.
  static const IconData strokeRoundedCoinsYen = HugeIconData(0x3e32);

  /// IconData for the 'strokeRoundedCollectionsBookmark' icon.
  static const IconData strokeRoundedCollectionsBookmark = HugeIconData(0x3e33);

  /// IconData for the 'strokeRoundedColorPicker' icon.
  static const IconData strokeRoundedColorPicker = HugeIconData(0x3e34);

  /// IconData for the 'strokeRoundedColors' icon.
  static const IconData strokeRoundedColors = HugeIconData(0x3e35);

  /// IconData for the 'strokeRoundedColosseum' icon.
  static const IconData strokeRoundedColosseum = HugeIconData(0x3e36);

  /// IconData for the 'strokeRoundedColumnDelete' icon.
  static const IconData strokeRoundedColumnDelete = HugeIconData(0x3e37);

  /// IconData for the 'strokeRoundedColumnInsert' icon.
  static const IconData strokeRoundedColumnInsert = HugeIconData(0x3e38);

  /// IconData for the 'strokeRoundedComet01' icon.
  static const IconData strokeRoundedComet01 = HugeIconData(0x3e39);

  /// IconData for the 'strokeRoundedComet02' icon.
  static const IconData strokeRoundedComet02 = HugeIconData(0x3e3a);

  /// IconData for the 'strokeRoundedComingSoon01' icon.
  static const IconData strokeRoundedComingSoon01 = HugeIconData(0x3e3b);

  /// IconData for the 'strokeRoundedComingSoon02' icon.
  static const IconData strokeRoundedComingSoon02 = HugeIconData(0x3e3c);

  /// IconData for the 'strokeRoundedCommandLine' icon.
  static const IconData strokeRoundedCommandLine = HugeIconData(0x3e3d);

  /// IconData for the 'strokeRoundedCommand' icon.
  static const IconData strokeRoundedCommand = HugeIconData(0x3e3e);

  /// IconData for the 'strokeRoundedComment01' icon.
  static const IconData strokeRoundedComment01 = HugeIconData(0x3e3f);

  /// IconData for the 'strokeRoundedComment02' icon.
  static const IconData strokeRoundedComment02 = HugeIconData(0x3e40);

  /// IconData for the 'strokeRoundedCommentAdd01' icon.
  static const IconData strokeRoundedCommentAdd01 = HugeIconData(0x3e41);

  /// IconData for the 'strokeRoundedCommentAdd02' icon.
  static const IconData strokeRoundedCommentAdd02 = HugeIconData(0x3e42);

  /// IconData for the 'strokeRoundedCommentBlock01' icon.
  static const IconData strokeRoundedCommentBlock01 = HugeIconData(0x3e43);

  /// IconData for the 'strokeRoundedCommentBlock02' icon.
  static const IconData strokeRoundedCommentBlock02 = HugeIconData(0x3e44);

  /// IconData for the 'strokeRoundedCommentRemove01' icon.
  static const IconData strokeRoundedCommentRemove01 = HugeIconData(0x3e45);

  /// IconData for the 'strokeRoundedCommentRemove02' icon.
  static const IconData strokeRoundedCommentRemove02 = HugeIconData(0x3e46);

  /// IconData for the 'strokeRoundedCompass01' icon.
  static const IconData strokeRoundedCompass01 = HugeIconData(0x3e47);

  /// IconData for the 'strokeRoundedCompass' icon.
  static const IconData strokeRoundedCompass = HugeIconData(0x3e48);

  /// IconData for the 'strokeRoundedComplaint' icon.
  static const IconData strokeRoundedComplaint = HugeIconData(0x3e49);

  /// IconData for the 'strokeRoundedComputerAdd' icon.
  static const IconData strokeRoundedComputerAdd = HugeIconData(0x3e4a);

  /// IconData for the 'strokeRoundedComputerCheck' icon.
  static const IconData strokeRoundedComputerCheck = HugeIconData(0x3e4b);

  /// IconData for the 'strokeRoundedComputerCloud' icon.
  static const IconData strokeRoundedComputerCloud = HugeIconData(0x3e4c);

  /// IconData for the 'strokeRoundedComputerDesk01' icon.
  static const IconData strokeRoundedComputerDesk01 = HugeIconData(0x3e4d);

  /// IconData for the 'strokeRoundedComputerDesk02' icon.
  static const IconData strokeRoundedComputerDesk02 = HugeIconData(0x3e4e);

  /// IconData for the 'strokeRoundedComputerDesk03' icon.
  static const IconData strokeRoundedComputerDesk03 = HugeIconData(0x3e4f);

  /// IconData for the 'strokeRoundedComputerDollar' icon.
  static const IconData strokeRoundedComputerDollar = HugeIconData(0x3e50);

  /// IconData for the 'strokeRoundedComputerPhoneSync' icon.
  static const IconData strokeRoundedComputerPhoneSync = HugeIconData(0x3e51);

  /// IconData for the 'strokeRoundedComputerProgramming01' icon.
  static const IconData strokeRoundedComputerProgramming01 =
      HugeIconData(0x3e52);

  /// IconData for the 'strokeRoundedComputerProgramming02' icon.
  static const IconData strokeRoundedComputerProgramming02 =
      HugeIconData(0x3e53);

  /// IconData for the 'strokeRoundedComputerProtection' icon.
  static const IconData strokeRoundedComputerProtection = HugeIconData(0x3e54);

  /// IconData for the 'strokeRoundedComputerRemove' icon.
  static const IconData strokeRoundedComputerRemove = HugeIconData(0x3e55);

  /// IconData for the 'strokeRoundedComputerSettings' icon.
  static const IconData strokeRoundedComputerSettings = HugeIconData(0x3e56);

  /// IconData for the 'strokeRoundedComputerVideoCall' icon.
  static const IconData strokeRoundedComputerVideoCall = HugeIconData(0x3e57);

  /// IconData for the 'strokeRoundedComputerVideo' icon.
  static const IconData strokeRoundedComputerVideo = HugeIconData(0x3e58);

  /// IconData for the 'strokeRoundedComputer' icon.
  static const IconData strokeRoundedComputer = HugeIconData(0x3e59);

  /// IconData for the 'strokeRoundedCone01' icon.
  static const IconData strokeRoundedCone01 = HugeIconData(0x3e5a);

  /// IconData for the 'strokeRoundedCone02' icon.
  static const IconData strokeRoundedCone02 = HugeIconData(0x3e5b);

  /// IconData for the 'strokeRoundedConference' icon.
  static const IconData strokeRoundedConference = HugeIconData(0x3e5c);

  /// IconData for the 'strokeRoundedConfiguration01' icon.
  static const IconData strokeRoundedConfiguration01 = HugeIconData(0x3e5d);

  /// IconData for the 'strokeRoundedConfiguration02' icon.
  static const IconData strokeRoundedConfiguration02 = HugeIconData(0x3e5e);

  /// IconData for the 'strokeRoundedConfused' icon.
  static const IconData strokeRoundedConfused = HugeIconData(0x3e5f);

  /// IconData for the 'strokeRoundedCongruentToCircle' icon.
  static const IconData strokeRoundedCongruentToCircle = HugeIconData(0x3e60);

  /// IconData for the 'strokeRoundedCongruentToSquare' icon.
  static const IconData strokeRoundedCongruentToSquare = HugeIconData(0x3e61);

  /// IconData for the 'strokeRoundedCongruentTo' icon.
  static const IconData strokeRoundedCongruentTo = HugeIconData(0x3e62);

  /// IconData for the 'strokeRoundedConnect' icon.
  static const IconData strokeRoundedConnect = HugeIconData(0x3e63);

  /// IconData for the 'strokeRoundedConsole' icon.
  static const IconData strokeRoundedConsole = HugeIconData(0x3e64);

  /// IconData for the 'strokeRoundedConstellation' icon.
  static const IconData strokeRoundedConstellation = HugeIconData(0x3e65);

  /// IconData for the 'strokeRoundedContact01' icon.
  static const IconData strokeRoundedContact01 = HugeIconData(0x3e66);

  /// IconData for the 'strokeRoundedContact02' icon.
  static const IconData strokeRoundedContact02 = HugeIconData(0x3e67);

  /// IconData for the 'strokeRoundedContactBook' icon.
  static const IconData strokeRoundedContactBook = HugeIconData(0x3e68);

  /// IconData for the 'strokeRoundedContact' icon.
  static const IconData strokeRoundedContact = HugeIconData(0x3e69);

  /// IconData for the 'strokeRoundedContainerTruck01' icon.
  static const IconData strokeRoundedContainerTruck01 = HugeIconData(0x3e6a);

  /// IconData for the 'strokeRoundedContainerTruck02' icon.
  static const IconData strokeRoundedContainerTruck02 = HugeIconData(0x3e6b);

  /// IconData for the 'strokeRoundedContainerTruck' icon.
  static const IconData strokeRoundedContainerTruck = HugeIconData(0x3e6c);

  /// IconData for the 'strokeRoundedContracts' icon.
  static const IconData strokeRoundedContracts = HugeIconData(0x3e6d);

  /// IconData for the 'strokeRoundedConversation' icon.
  static const IconData strokeRoundedConversation = HugeIconData(0x3e6e);

  /// IconData for the 'strokeRoundedCookBook' icon.
  static const IconData strokeRoundedCookBook = HugeIconData(0x3e6f);

  /// IconData for the 'strokeRoundedCookie' icon.
  static const IconData strokeRoundedCookie = HugeIconData(0x3e70);

  /// IconData for the 'strokeRoundedCoordinate01' icon.
  static const IconData strokeRoundedCoordinate01 = HugeIconData(0x3e71);

  /// IconData for the 'strokeRoundedCoordinate02' icon.
  static const IconData strokeRoundedCoordinate02 = HugeIconData(0x3e72);

  /// IconData for the 'strokeRoundedCopilot' icon.
  static const IconData strokeRoundedCopilot = HugeIconData(0x3e73);

  /// IconData for the 'strokeRoundedCopy01' icon.
  static const IconData strokeRoundedCopy01 = HugeIconData(0x3e74);

  /// IconData for the 'strokeRoundedCopy02' icon.
  static const IconData strokeRoundedCopy02 = HugeIconData(0x3e75);

  /// IconData for the 'strokeRoundedCopyLink' icon.
  static const IconData strokeRoundedCopyLink = HugeIconData(0x3e76);

  /// IconData for the 'strokeRoundedCopyright' icon.
  static const IconData strokeRoundedCopyright = HugeIconData(0x3e77);

  /// IconData for the 'strokeRoundedCorn' icon.
  static const IconData strokeRoundedCorn = HugeIconData(0x3e78);

  /// IconData for the 'strokeRoundedCorporate' icon.
  static const IconData strokeRoundedCorporate = HugeIconData(0x3e79);

  /// IconData for the 'strokeRoundedCos' icon.
  static const IconData strokeRoundedCos = HugeIconData(0x3e7a);

  /// IconData for the 'strokeRoundedCosine01' icon.
  static const IconData strokeRoundedCosine01 = HugeIconData(0x3e7b);

  /// IconData for the 'strokeRoundedCosine02' icon.
  static const IconData strokeRoundedCosine02 = HugeIconData(0x3e7c);

  /// IconData for the 'strokeRoundedCottage' icon.
  static const IconData strokeRoundedCottage = HugeIconData(0x3e7d);

  /// IconData for the 'strokeRoundedCottonCandy' icon.
  static const IconData strokeRoundedCottonCandy = HugeIconData(0x3e7e);

  /// IconData for the 'strokeRoundedCoupon01' icon.
  static const IconData strokeRoundedCoupon01 = HugeIconData(0x3e7f);

  /// IconData for the 'strokeRoundedCoupon02' icon.
  static const IconData strokeRoundedCoupon02 = HugeIconData(0x3e80);

  /// IconData for the 'strokeRoundedCoupon03' icon.
  static const IconData strokeRoundedCoupon03 = HugeIconData(0x3e81);

  /// IconData for the 'strokeRoundedCouponPercent' icon.
  static const IconData strokeRoundedCouponPercent = HugeIconData(0x3e82);

  /// IconData for the 'strokeRoundedCourse' icon.
  static const IconData strokeRoundedCourse = HugeIconData(0x3e83);

  /// IconData for the 'strokeRoundedCourtHouse' icon.
  static const IconData strokeRoundedCourtHouse = HugeIconData(0x3e84);

  /// IconData for the 'strokeRoundedCourtLaw' icon.
  static const IconData strokeRoundedCourtLaw = HugeIconData(0x3e85);

  /// IconData for the 'strokeRoundedCovariate' icon.
  static const IconData strokeRoundedCovariate = HugeIconData(0x3e86);

  /// IconData for the 'strokeRoundedCovidInfo' icon.
  static const IconData strokeRoundedCovidInfo = HugeIconData(0x3e87);

  /// IconData for the 'strokeRoundedCowboyHat' icon.
  static const IconData strokeRoundedCowboyHat = HugeIconData(0x3e88);

  /// IconData for the 'strokeRoundedCplusplus' icon.
  static const IconData strokeRoundedCplusplus = HugeIconData(0x3e89);

  /// IconData for the 'strokeRoundedCpuCharge' icon.
  static const IconData strokeRoundedCpuCharge = HugeIconData(0x3e8a);

  /// IconData for the 'strokeRoundedCpuSettings' icon.
  static const IconData strokeRoundedCpuSettings = HugeIconData(0x3e8b);

  /// IconData for the 'strokeRoundedCpu' icon.
  static const IconData strokeRoundedCpu = HugeIconData(0x3e8c);

  /// IconData for the 'strokeRoundedCrab' icon.
  static const IconData strokeRoundedCrab = HugeIconData(0x3e8d);

  /// IconData for the 'strokeRoundedCrane' icon.
  static const IconData strokeRoundedCrane = HugeIconData(0x3e8e);

  /// IconData for the 'strokeRoundedCrazy' icon.
  static const IconData strokeRoundedCrazy = HugeIconData(0x3e8f);

  /// IconData for the 'strokeRoundedCreativeMarket' icon.
  static const IconData strokeRoundedCreativeMarket = HugeIconData(0x3e90);

  /// IconData for the 'strokeRoundedCreditCardAccept' icon.
  static const IconData strokeRoundedCreditCardAccept = HugeIconData(0x3e91);

  /// IconData for the 'strokeRoundedCreditCardAdd' icon.
  static const IconData strokeRoundedCreditCardAdd = HugeIconData(0x3e92);

  /// IconData for the 'strokeRoundedCreditCardChange' icon.
  static const IconData strokeRoundedCreditCardChange = HugeIconData(0x3e93);

  /// IconData for the 'strokeRoundedCreditCardDefrost' icon.
  static const IconData strokeRoundedCreditCardDefrost = HugeIconData(0x3e94);

  /// IconData for the 'strokeRoundedCreditCardFreeze' icon.
  static const IconData strokeRoundedCreditCardFreeze = HugeIconData(0x3e95);

  /// IconData for the 'strokeRoundedCreditCardNotAccept' icon.
  static const IconData strokeRoundedCreditCardNotAccept = HugeIconData(0x3e96);

  /// IconData for the 'strokeRoundedCreditCardNotFound' icon.
  static const IconData strokeRoundedCreditCardNotFound = HugeIconData(0x3e97);

  /// IconData for the 'strokeRoundedCreditCardPos' icon.
  static const IconData strokeRoundedCreditCardPos = HugeIconData(0x3e98);

  /// IconData for the 'strokeRoundedCreditCardValidation' icon.
  static const IconData strokeRoundedCreditCardValidation =
      HugeIconData(0x3e99);

  /// IconData for the 'strokeRoundedCreditCard' icon.
  static const IconData strokeRoundedCreditCard = HugeIconData(0x3e9a);

  /// IconData for the 'strokeRoundedCricketBat' icon.
  static const IconData strokeRoundedCricketBat = HugeIconData(0x3e9b);

  /// IconData for the 'strokeRoundedCricketHelmet' icon.
  static const IconData strokeRoundedCricketHelmet = HugeIconData(0x3e9c);

  /// IconData for the 'strokeRoundedCroissant' icon.
  static const IconData strokeRoundedCroissant = HugeIconData(0x3e9d);

  /// IconData for the 'strokeRoundedCrop' icon.
  static const IconData strokeRoundedCrop = HugeIconData(0x3e9e);

  /// IconData for the 'strokeRoundedCrowdfunding' icon.
  static const IconData strokeRoundedCrowdfunding = HugeIconData(0x3e9f);

  /// IconData for the 'strokeRoundedCrown' icon.
  static const IconData strokeRoundedCrown = HugeIconData(0x3ea0);

  /// IconData for the 'strokeRoundedCrying' icon.
  static const IconData strokeRoundedCrying = HugeIconData(0x3ea1);

  /// IconData for the 'strokeRoundedCsv01' icon.
  static const IconData strokeRoundedCsv01 = HugeIconData(0x3ea2);

  /// IconData for the 'strokeRoundedCsv02' icon.
  static const IconData strokeRoundedCsv02 = HugeIconData(0x3ea3);

  /// IconData for the 'strokeRoundedCube' icon.
  static const IconData strokeRoundedCube = HugeIconData(0x3ea4);

  /// IconData for the 'strokeRoundedCupcake01' icon.
  static const IconData strokeRoundedCupcake01 = HugeIconData(0x3ea5);

  /// IconData for the 'strokeRoundedCupcake02' icon.
  static const IconData strokeRoundedCupcake02 = HugeIconData(0x3ea6);

  /// IconData for the 'strokeRoundedCupcake03' icon.
  static const IconData strokeRoundedCupcake03 = HugeIconData(0x3ea7);

  /// IconData for the 'strokeRoundedCurling' icon.
  static const IconData strokeRoundedCurling = HugeIconData(0x3ea8);

  /// IconData for the 'strokeRoundedCursor01' icon.
  static const IconData strokeRoundedCursor01 = HugeIconData(0x3ea9);

  /// IconData for the 'strokeRoundedCursor02' icon.
  static const IconData strokeRoundedCursor02 = HugeIconData(0x3eaa);

  /// IconData for the 'strokeRoundedCursorAddSelection01' icon.
  static const IconData strokeRoundedCursorAddSelection01 =
      HugeIconData(0x3eab);

  /// IconData for the 'strokeRoundedCursorAddSelection02' icon.
  static const IconData strokeRoundedCursorAddSelection02 =
      HugeIconData(0x3eac);

  /// IconData for the 'strokeRoundedCursorCircleSelection01' icon.
  static const IconData strokeRoundedCursorCircleSelection01 =
      HugeIconData(0x3ead);

  /// IconData for the 'strokeRoundedCursorCircleSelection02' icon.
  static const IconData strokeRoundedCursorCircleSelection02 =
      HugeIconData(0x3eae);

  /// IconData for the 'strokeRoundedCursorDisabled01' icon.
  static const IconData strokeRoundedCursorDisabled01 = HugeIconData(0x3eaf);

  /// IconData for the 'strokeRoundedCursorDisabled02' icon.
  static const IconData strokeRoundedCursorDisabled02 = HugeIconData(0x3eb0);

  /// IconData for the 'strokeRoundedCursorEdit01' icon.
  static const IconData strokeRoundedCursorEdit01 = HugeIconData(0x3eb1);

  /// IconData for the 'strokeRoundedCursorEdit02' icon.
  static const IconData strokeRoundedCursorEdit02 = HugeIconData(0x3eb2);

  /// IconData for the 'strokeRoundedCursorHold01' icon.
  static const IconData strokeRoundedCursorHold01 = HugeIconData(0x3eb3);

  /// IconData for the 'strokeRoundedCursorHold02' icon.
  static const IconData strokeRoundedCursorHold02 = HugeIconData(0x3eb4);

  /// IconData for the 'strokeRoundedCursorInWindow' icon.
  static const IconData strokeRoundedCursorInWindow = HugeIconData(0x3eb5);

  /// IconData for the 'strokeRoundedCursorInfo01' icon.
  static const IconData strokeRoundedCursorInfo01 = HugeIconData(0x3eb6);

  /// IconData for the 'strokeRoundedCursorInfo02' icon.
  static const IconData strokeRoundedCursorInfo02 = HugeIconData(0x3eb7);

  /// IconData for the 'strokeRoundedCursorLoading01' icon.
  static const IconData strokeRoundedCursorLoading01 = HugeIconData(0x3eb8);

  /// IconData for the 'strokeRoundedCursorLoading02' icon.
  static const IconData strokeRoundedCursorLoading02 = HugeIconData(0x3eb9);

  /// IconData for the 'strokeRoundedCursorMagicSelection01' icon.
  static const IconData strokeRoundedCursorMagicSelection01 =
      HugeIconData(0x3eba);

  /// IconData for the 'strokeRoundedCursorMagicSelection02' icon.
  static const IconData strokeRoundedCursorMagicSelection02 =
      HugeIconData(0x3ebb);

  /// IconData for the 'strokeRoundedCursorMove01' icon.
  static const IconData strokeRoundedCursorMove01 = HugeIconData(0x3ebc);

  /// IconData for the 'strokeRoundedCursorMove02' icon.
  static const IconData strokeRoundedCursorMove02 = HugeIconData(0x3ebd);

  /// IconData for the 'strokeRoundedCursorPointer01' icon.
  static const IconData strokeRoundedCursorPointer01 = HugeIconData(0x3ebe);

  /// IconData for the 'strokeRoundedCursorPointer02' icon.
  static const IconData strokeRoundedCursorPointer02 = HugeIconData(0x3ebf);

  /// IconData for the 'strokeRoundedCursorProgress01' icon.
  static const IconData strokeRoundedCursorProgress01 = HugeIconData(0x3ec0);

  /// IconData for the 'strokeRoundedCursorProgress02' icon.
  static const IconData strokeRoundedCursorProgress02 = HugeIconData(0x3ec1);

  /// IconData for the 'strokeRoundedCursorProgress03' icon.
  static const IconData strokeRoundedCursorProgress03 = HugeIconData(0x3ec2);

  /// IconData for the 'strokeRoundedCursorProgress04' icon.
  static const IconData strokeRoundedCursorProgress04 = HugeIconData(0x3ec3);

  /// IconData for the 'strokeRoundedCursorRectangleSelection01' icon.
  static const IconData strokeRoundedCursorRectangleSelection01 =
      HugeIconData(0x3ec4);

  /// IconData for the 'strokeRoundedCursorRectangleSelection02' icon.
  static const IconData strokeRoundedCursorRectangleSelection02 =
      HugeIconData(0x3ec5);

  /// IconData for the 'strokeRoundedCursorRemoveSelection01' icon.
  static const IconData strokeRoundedCursorRemoveSelection01 =
      HugeIconData(0x3ec6);

  /// IconData for the 'strokeRoundedCursorRemoveSelection02' icon.
  static const IconData strokeRoundedCursorRemoveSelection02 =
      HugeIconData(0x3ec7);

  /// IconData for the 'strokeRoundedCursorText' icon.
  static const IconData strokeRoundedCursorText = HugeIconData(0x3ec8);

  /// IconData for the 'strokeRoundedCurtains' icon.
  static const IconData strokeRoundedCurtains = HugeIconData(0x3ec9);

  /// IconData for the 'strokeRoundedCurvyLeftDirection' icon.
  static const IconData strokeRoundedCurvyLeftDirection = HugeIconData(0x3eca);

  /// IconData for the 'strokeRoundedCurvyLeftRightDirection' icon.
  static const IconData strokeRoundedCurvyLeftRightDirection =
      HugeIconData(0x3ecb);

  /// IconData for the 'strokeRoundedCurvyRightDirection' icon.
  static const IconData strokeRoundedCurvyRightDirection = HugeIconData(0x3ecc);

  /// IconData for the 'strokeRoundedCurvyUpDownDirection' icon.
  static const IconData strokeRoundedCurvyUpDownDirection =
      HugeIconData(0x3ecd);

  /// IconData for the 'strokeRoundedCustomerService01' icon.
  static const IconData strokeRoundedCustomerService01 = HugeIconData(0x3ece);

  /// IconData for the 'strokeRoundedCustomerService02' icon.
  static const IconData strokeRoundedCustomerService02 = HugeIconData(0x3ecf);

  /// IconData for the 'strokeRoundedCustomerService' icon.
  static const IconData strokeRoundedCustomerService = HugeIconData(0x3ed0);

  /// IconData for the 'strokeRoundedCustomerSupport' icon.
  static const IconData strokeRoundedCustomerSupport = HugeIconData(0x3ed1);

  /// IconData for the 'strokeRoundedCustomize' icon.
  static const IconData strokeRoundedCustomize = HugeIconData(0x3ed2);

  /// IconData for the 'strokeRoundedCylinder01' icon.
  static const IconData strokeRoundedCylinder01 = HugeIconData(0x3ed3);

  /// IconData for the 'strokeRoundedCylinder02' icon.
  static const IconData strokeRoundedCylinder02 = HugeIconData(0x3ed4);

  /// IconData for the 'strokeRoundedCylinder03' icon.
  static const IconData strokeRoundedCylinder03 = HugeIconData(0x3ed5);

  /// IconData for the 'strokeRoundedCylinder04' icon.
  static const IconData strokeRoundedCylinder04 = HugeIconData(0x3ed6);

  /// IconData for the 'strokeRoundedDanger' icon.
  static const IconData strokeRoundedDanger = HugeIconData(0x3ed7);

  /// IconData for the 'strokeRoundedDarkMode' icon.
  static const IconData strokeRoundedDarkMode = HugeIconData(0x3ed8);

  /// IconData for the 'strokeRoundedDart' icon.
  static const IconData strokeRoundedDart = HugeIconData(0x3ed9);

  /// IconData for the 'strokeRoundedDashboardBrowsing' icon.
  static const IconData strokeRoundedDashboardBrowsing = HugeIconData(0x3eda);

  /// IconData for the 'strokeRoundedDashboardCircleAdd' icon.
  static const IconData strokeRoundedDashboardCircleAdd = HugeIconData(0x3edb);

  /// IconData for the 'strokeRoundedDashboardCircleEdit' icon.
  static const IconData strokeRoundedDashboardCircleEdit = HugeIconData(0x3edc);

  /// IconData for the 'strokeRoundedDashboardCircleRemove' icon.
  static const IconData strokeRoundedDashboardCircleRemove =
      HugeIconData(0x3edd);

  /// IconData for the 'strokeRoundedDashboardCircleSettings' icon.
  static const IconData strokeRoundedDashboardCircleSettings =
      HugeIconData(0x3ede);

  /// IconData for the 'strokeRoundedDashboardCircle' icon.
  static const IconData strokeRoundedDashboardCircle = HugeIconData(0x3edf);

  /// IconData for the 'strokeRoundedDashboardSpeed01' icon.
  static const IconData strokeRoundedDashboardSpeed01 = HugeIconData(0x3ee0);

  /// IconData for the 'strokeRoundedDashboardSpeed02' icon.
  static const IconData strokeRoundedDashboardSpeed02 = HugeIconData(0x3ee1);

  /// IconData for the 'strokeRoundedDashboardSquare01' icon.
  static const IconData strokeRoundedDashboardSquare01 = HugeIconData(0x3ee2);

  /// IconData for the 'strokeRoundedDashboardSquare02' icon.
  static const IconData strokeRoundedDashboardSquare02 = HugeIconData(0x3ee3);

  /// IconData for the 'strokeRoundedDashboardSquare03' icon.
  static const IconData strokeRoundedDashboardSquare03 = HugeIconData(0x3ee4);

  /// IconData for the 'strokeRoundedDashboardSquareAdd' icon.
  static const IconData strokeRoundedDashboardSquareAdd = HugeIconData(0x3ee5);

  /// IconData for the 'strokeRoundedDashboardSquareEdit' icon.
  static const IconData strokeRoundedDashboardSquareEdit = HugeIconData(0x3ee6);

  /// IconData for the 'strokeRoundedDashboardSquareRemove' icon.
  static const IconData strokeRoundedDashboardSquareRemove =
      HugeIconData(0x3ee7);

  /// IconData for the 'strokeRoundedDashboardSquareSetting' icon.
  static const IconData strokeRoundedDashboardSquareSetting =
      HugeIconData(0x3ee8);

  /// IconData for the 'strokeRoundedDashedLine01' icon.
  static const IconData strokeRoundedDashedLine01 = HugeIconData(0x3ee9);

  /// IconData for the 'strokeRoundedDashedLine02' icon.
  static const IconData strokeRoundedDashedLine02 = HugeIconData(0x3eea);

  /// IconData for the 'strokeRoundedDataRecovery' icon.
  static const IconData strokeRoundedDataRecovery = HugeIconData(0x3eeb);

  /// IconData for the 'strokeRoundedDatabase01' icon.
  static const IconData strokeRoundedDatabase01 = HugeIconData(0x3eec);

  /// IconData for the 'strokeRoundedDatabase02' icon.
  static const IconData strokeRoundedDatabase02 = HugeIconData(0x3eed);

  /// IconData for the 'strokeRoundedDatabaseAdd' icon.
  static const IconData strokeRoundedDatabaseAdd = HugeIconData(0x3eee);

  /// IconData for the 'strokeRoundedDatabaseExport' icon.
  static const IconData strokeRoundedDatabaseExport = HugeIconData(0x3eef);

  /// IconData for the 'strokeRoundedDatabaseImport' icon.
  static const IconData strokeRoundedDatabaseImport = HugeIconData(0x3ef0);

  /// IconData for the 'strokeRoundedDatabaseLocked' icon.
  static const IconData strokeRoundedDatabaseLocked = HugeIconData(0x3ef1);

  /// IconData for the 'strokeRoundedDatabaseRestore' icon.
  static const IconData strokeRoundedDatabaseRestore = HugeIconData(0x3ef2);

  /// IconData for the 'strokeRoundedDatabaseSetting' icon.
  static const IconData strokeRoundedDatabaseSetting = HugeIconData(0x3ef3);

  /// IconData for the 'strokeRoundedDatabaseSync01' icon.
  static const IconData strokeRoundedDatabaseSync01 = HugeIconData(0x3ef4);

  /// IconData for the 'strokeRoundedDatabaseSync' icon.
  static const IconData strokeRoundedDatabaseSync = HugeIconData(0x3ef5);

  /// IconData for the 'strokeRoundedDatabase' icon.
  static const IconData strokeRoundedDatabase = HugeIconData(0x3ef6);

  /// IconData for the 'strokeRoundedDates' icon.
  static const IconData strokeRoundedDates = HugeIconData(0x3ef7);

  /// IconData for the 'strokeRoundedDead' icon.
  static const IconData strokeRoundedDead = HugeIconData(0x3ef8);

  /// IconData for the 'strokeRoundedDelete01' icon.
  static const IconData strokeRoundedDelete01 = HugeIconData(0x3ef9);

  /// IconData for the 'strokeRoundedDelete02' icon.
  static const IconData strokeRoundedDelete02 = HugeIconData(0x3efa);

  /// IconData for the 'strokeRoundedDelete03' icon.
  static const IconData strokeRoundedDelete03 = HugeIconData(0x3efb);

  /// IconData for the 'strokeRoundedDelete04' icon.
  static const IconData strokeRoundedDelete04 = HugeIconData(0x3efc);

  /// IconData for the 'strokeRoundedDeleteColumn' icon.
  static const IconData strokeRoundedDeleteColumn = HugeIconData(0x3efd);

  /// IconData for the 'strokeRoundedDeletePutBack' icon.
  static const IconData strokeRoundedDeletePutBack = HugeIconData(0x3efe);

  /// IconData for the 'strokeRoundedDeleteRow' icon.
  static const IconData strokeRoundedDeleteRow = HugeIconData(0x3eff);

  /// IconData for the 'strokeRoundedDeleteThrow' icon.
  static const IconData strokeRoundedDeleteThrow = HugeIconData(0x3f00);

  /// IconData for the 'strokeRoundedDeliveredSent' icon.
  static const IconData strokeRoundedDeliveredSent = HugeIconData(0x3f01);

  /// IconData for the 'strokeRoundedDeliveryBox01' icon.
  static const IconData strokeRoundedDeliveryBox01 = HugeIconData(0x3f02);

  /// IconData for the 'strokeRoundedDeliveryBox02' icon.
  static const IconData strokeRoundedDeliveryBox02 = HugeIconData(0x3f03);

  /// IconData for the 'strokeRoundedDeliveryDelay01' icon.
  static const IconData strokeRoundedDeliveryDelay01 = HugeIconData(0x3f04);

  /// IconData for the 'strokeRoundedDeliveryDelay02' icon.
  static const IconData strokeRoundedDeliveryDelay02 = HugeIconData(0x3f05);

  /// IconData for the 'strokeRoundedDeliveryReturn01' icon.
  static const IconData strokeRoundedDeliveryReturn01 = HugeIconData(0x3f06);

  /// IconData for the 'strokeRoundedDeliveryReturn02' icon.
  static const IconData strokeRoundedDeliveryReturn02 = HugeIconData(0x3f07);

  /// IconData for the 'strokeRoundedDeliverySecure01' icon.
  static const IconData strokeRoundedDeliverySecure01 = HugeIconData(0x3f08);

  /// IconData for the 'strokeRoundedDeliverySecure02' icon.
  static const IconData strokeRoundedDeliverySecure02 = HugeIconData(0x3f09);

  /// IconData for the 'strokeRoundedDeliverySent01' icon.
  static const IconData strokeRoundedDeliverySent01 = HugeIconData(0x3f0a);

  /// IconData for the 'strokeRoundedDeliverySent02' icon.
  static const IconData strokeRoundedDeliverySent02 = HugeIconData(0x3f0b);

  /// IconData for the 'strokeRoundedDeliveryTracking01' icon.
  static const IconData strokeRoundedDeliveryTracking01 = HugeIconData(0x3f0c);

  /// IconData for the 'strokeRoundedDeliveryTracking02' icon.
  static const IconData strokeRoundedDeliveryTracking02 = HugeIconData(0x3f0d);

  /// IconData for the 'strokeRoundedDeliveryTruck01' icon.
  static const IconData strokeRoundedDeliveryTruck01 = HugeIconData(0x3f0e);

  /// IconData for the 'strokeRoundedDeliveryTruck02' icon.
  static const IconData strokeRoundedDeliveryTruck02 = HugeIconData(0x3f0f);

  /// IconData for the 'strokeRoundedDeliveryView01' icon.
  static const IconData strokeRoundedDeliveryView01 = HugeIconData(0x3f10);

  /// IconData for the 'strokeRoundedDeliveryView02' icon.
  static const IconData strokeRoundedDeliveryView02 = HugeIconData(0x3f11);

  /// IconData for the 'strokeRoundedDentalBraces' icon.
  static const IconData strokeRoundedDentalBraces = HugeIconData(0x3f12);

  /// IconData for the 'strokeRoundedDentalBrokenTooth' icon.
  static const IconData strokeRoundedDentalBrokenTooth = HugeIconData(0x3f13);

  /// IconData for the 'strokeRoundedDentalCare' icon.
  static const IconData strokeRoundedDentalCare = HugeIconData(0x3f14);

  /// IconData for the 'strokeRoundedDentalTooth' icon.
  static const IconData strokeRoundedDentalTooth = HugeIconData(0x3f15);

  /// IconData for the 'strokeRoundedDepartement' icon.
  static const IconData strokeRoundedDepartement = HugeIconData(0x3f16);

  /// IconData for the 'strokeRoundedDesert' icon.
  static const IconData strokeRoundedDesert = HugeIconData(0x3f17);

  /// IconData for the 'strokeRoundedDesk01' icon.
  static const IconData strokeRoundedDesk01 = HugeIconData(0x3f18);

  /// IconData for the 'strokeRoundedDesk02' icon.
  static const IconData strokeRoundedDesk02 = HugeIconData(0x3f19);

  /// IconData for the 'strokeRoundedDesk' icon.
  static const IconData strokeRoundedDesk = HugeIconData(0x3f1a);

  /// IconData for the 'strokeRoundedDeveloper' icon.
  static const IconData strokeRoundedDeveloper = HugeIconData(0x3f1b);

  /// IconData for the 'strokeRoundedDeviantart' icon.
  static const IconData strokeRoundedDeviantart = HugeIconData(0x3f1c);

  /// IconData for the 'strokeRoundedDeviceAccess' icon.
  static const IconData strokeRoundedDeviceAccess = HugeIconData(0x3f1d);

  /// IconData for the 'strokeRoundedDiagonalScrollPoint01' icon.
  static const IconData strokeRoundedDiagonalScrollPoint01 =
      HugeIconData(0x3f1e);

  /// IconData for the 'strokeRoundedDiagonalScrollPoint02' icon.
  static const IconData strokeRoundedDiagonalScrollPoint02 =
      HugeIconData(0x3f1f);

  /// IconData for the 'strokeRoundedDialpadCircle01' icon.
  static const IconData strokeRoundedDialpadCircle01 = HugeIconData(0x3f20);

  /// IconData for the 'strokeRoundedDialpadCircle02' icon.
  static const IconData strokeRoundedDialpadCircle02 = HugeIconData(0x3f21);

  /// IconData for the 'strokeRoundedDialpadSquare01' icon.
  static const IconData strokeRoundedDialpadSquare01 = HugeIconData(0x3f22);

  /// IconData for the 'strokeRoundedDialpadSquare02' icon.
  static const IconData strokeRoundedDialpadSquare02 = HugeIconData(0x3f23);

  /// IconData for the 'strokeRoundedDiameter' icon.
  static const IconData strokeRoundedDiameter = HugeIconData(0x3f24);

  /// IconData for the 'strokeRoundedDiamond01' icon.
  static const IconData strokeRoundedDiamond01 = HugeIconData(0x3f25);

  /// IconData for the 'strokeRoundedDiamond02' icon.
  static const IconData strokeRoundedDiamond02 = HugeIconData(0x3f26);

  /// IconData for the 'strokeRoundedDiamond' icon.
  static const IconData strokeRoundedDiamond = HugeIconData(0x3f27);

  /// IconData for the 'strokeRoundedDiaper' icon.
  static const IconData strokeRoundedDiaper = HugeIconData(0x3f28);

  /// IconData for the 'strokeRoundedDiceFaces01' icon.
  static const IconData strokeRoundedDiceFaces01 = HugeIconData(0x3f29);

  /// IconData for the 'strokeRoundedDiceFaces02' icon.
  static const IconData strokeRoundedDiceFaces02 = HugeIconData(0x3f2a);

  /// IconData for the 'strokeRoundedDiceFaces03' icon.
  static const IconData strokeRoundedDiceFaces03 = HugeIconData(0x3f2b);

  /// IconData for the 'strokeRoundedDiceFaces04' icon.
  static const IconData strokeRoundedDiceFaces04 = HugeIconData(0x3f2c);

  /// IconData for the 'strokeRoundedDiceFaces05' icon.
  static const IconData strokeRoundedDiceFaces05 = HugeIconData(0x3f2d);

  /// IconData for the 'strokeRoundedDiceFaces06' icon.
  static const IconData strokeRoundedDiceFaces06 = HugeIconData(0x3f2e);

  /// IconData for the 'strokeRoundedDice' icon.
  static const IconData strokeRoundedDice = HugeIconData(0x3f2f);

  /// IconData for the 'strokeRoundedDigestion' icon.
  static const IconData strokeRoundedDigestion = HugeIconData(0x3f30);

  /// IconData for the 'strokeRoundedDigg' icon.
  static const IconData strokeRoundedDigg = HugeIconData(0x3f31);

  /// IconData for the 'strokeRoundedDigitalClock' icon.
  static const IconData strokeRoundedDigitalClock = HugeIconData(0x3f32);

  /// IconData for the 'strokeRoundedDimSum01' icon.
  static const IconData strokeRoundedDimSum01 = HugeIconData(0x3f33);

  /// IconData for the 'strokeRoundedDimSum02' icon.
  static const IconData strokeRoundedDimSum02 = HugeIconData(0x3f34);

  /// IconData for the 'strokeRoundedDiningTable' icon.
  static const IconData strokeRoundedDiningTable = HugeIconData(0x3f35);

  /// IconData for the 'strokeRoundedDiploma' icon.
  static const IconData strokeRoundedDiploma = HugeIconData(0x3f36);

  /// IconData for the 'strokeRoundedDirectionLeft01' icon.
  static const IconData strokeRoundedDirectionLeft01 = HugeIconData(0x3f37);

  /// IconData for the 'strokeRoundedDirectionLeft02' icon.
  static const IconData strokeRoundedDirectionLeft02 = HugeIconData(0x3f38);

  /// IconData for the 'strokeRoundedDirectionRight01' icon.
  static const IconData strokeRoundedDirectionRight01 = HugeIconData(0x3f39);

  /// IconData for the 'strokeRoundedDirectionRight02' icon.
  static const IconData strokeRoundedDirectionRight02 = HugeIconData(0x3f3a);

  /// IconData for the 'strokeRoundedDirections01' icon.
  static const IconData strokeRoundedDirections01 = HugeIconData(0x3f3b);

  /// IconData for the 'strokeRoundedDirections02' icon.
  static const IconData strokeRoundedDirections02 = HugeIconData(0x3f3c);

  /// IconData for the 'strokeRoundedDirham' icon.
  static const IconData strokeRoundedDirham = HugeIconData(0x3f3d);

  /// IconData for the 'strokeRoundedDisability01' icon.
  static const IconData strokeRoundedDisability01 = HugeIconData(0x3f3e);

  /// IconData for the 'strokeRoundedDisability02' icon.
  static const IconData strokeRoundedDisability02 = HugeIconData(0x3f3f);

  /// IconData for the 'strokeRoundedDiscord' icon.
  static const IconData strokeRoundedDiscord = HugeIconData(0x3f40);

  /// IconData for the 'strokeRoundedDiscount01' icon.
  static const IconData strokeRoundedDiscount01 = HugeIconData(0x3f41);

  /// IconData for the 'strokeRoundedDiscountTag01' icon.
  static const IconData strokeRoundedDiscountTag01 = HugeIconData(0x3f42);

  /// IconData for the 'strokeRoundedDiscountTag02' icon.
  static const IconData strokeRoundedDiscountTag02 = HugeIconData(0x3f43);

  /// IconData for the 'strokeRoundedDiscount' icon.
  static const IconData strokeRoundedDiscount = HugeIconData(0x3f44);

  /// IconData for the 'strokeRoundedDiscoverCircle' icon.
  static const IconData strokeRoundedDiscoverCircle = HugeIconData(0x3f45);

  /// IconData for the 'strokeRoundedDiscoverSquare' icon.
  static const IconData strokeRoundedDiscoverSquare = HugeIconData(0x3f46);

  /// IconData for the 'strokeRoundedDish01' icon.
  static const IconData strokeRoundedDish01 = HugeIconData(0x3f47);

  /// IconData for the 'strokeRoundedDish02' icon.
  static const IconData strokeRoundedDish02 = HugeIconData(0x3f48);

  /// IconData for the 'strokeRoundedDishWasher' icon.
  static const IconData strokeRoundedDishWasher = HugeIconData(0x3f49);

  /// IconData for the 'strokeRoundedDispleased' icon.
  static const IconData strokeRoundedDispleased = HugeIconData(0x3f4a);

  /// IconData for the 'strokeRoundedDistributeHorizontalCenter' icon.
  static const IconData strokeRoundedDistributeHorizontalCenter =
      HugeIconData(0x3f4b);

  /// IconData for the 'strokeRoundedDistributeHorizontalLeft' icon.
  static const IconData strokeRoundedDistributeHorizontalLeft =
      HugeIconData(0x3f4c);

  /// IconData for the 'strokeRoundedDistributeHorizontalRight' icon.
  static const IconData strokeRoundedDistributeHorizontalRight =
      HugeIconData(0x3f4d);

  /// IconData for the 'strokeRoundedDistributeVerticalBottom' icon.
  static const IconData strokeRoundedDistributeVerticalBottom =
      HugeIconData(0x3f4e);

  /// IconData for the 'strokeRoundedDistributeVerticalCenter' icon.
  static const IconData strokeRoundedDistributeVerticalCenter =
      HugeIconData(0x3f4f);

  /// IconData for the 'strokeRoundedDistributeVerticalTop' icon.
  static const IconData strokeRoundedDistributeVerticalTop =
      HugeIconData(0x3f50);

  /// IconData for the 'strokeRoundedDistribution' icon.
  static const IconData strokeRoundedDistribution = HugeIconData(0x3f51);

  /// IconData for the 'strokeRoundedDivideSignCircle' icon.
  static const IconData strokeRoundedDivideSignCircle = HugeIconData(0x3f52);

  /// IconData for the 'strokeRoundedDivideSignSquare' icon.
  static const IconData strokeRoundedDivideSignSquare = HugeIconData(0x3f53);

  /// IconData for the 'strokeRoundedDivideSign' icon.
  static const IconData strokeRoundedDivideSign = HugeIconData(0x3f54);

  /// IconData for the 'strokeRoundedDna01' icon.
  static const IconData strokeRoundedDna01 = HugeIconData(0x3f55);

  /// IconData for the 'strokeRoundedDna' icon.
  static const IconData strokeRoundedDna = HugeIconData(0x3f56);

  /// IconData for the 'strokeRoundedDoNotTouch01' icon.
  static const IconData strokeRoundedDoNotTouch01 = HugeIconData(0x3f57);

  /// IconData for the 'strokeRoundedDoNotTouch02' icon.
  static const IconData strokeRoundedDoNotTouch02 = HugeIconData(0x3f58);

  /// IconData for the 'strokeRoundedDoc01' icon.
  static const IconData strokeRoundedDoc01 = HugeIconData(0x3f59);

  /// IconData for the 'strokeRoundedDoc02' icon.
  static const IconData strokeRoundedDoc02 = HugeIconData(0x3f5a);

  /// IconData for the 'strokeRoundedDoctor01' icon.
  static const IconData strokeRoundedDoctor01 = HugeIconData(0x3f5b);

  /// IconData for the 'strokeRoundedDoctor02' icon.
  static const IconData strokeRoundedDoctor02 = HugeIconData(0x3f5c);

  /// IconData for the 'strokeRoundedDoctor03' icon.
  static const IconData strokeRoundedDoctor03 = HugeIconData(0x3f5d);

  /// IconData for the 'strokeRoundedDocumentAttachment' icon.
  static const IconData strokeRoundedDocumentAttachment = HugeIconData(0x3f5e);

  /// IconData for the 'strokeRoundedDocumentCode' icon.
  static const IconData strokeRoundedDocumentCode = HugeIconData(0x3f5f);

  /// IconData for the 'strokeRoundedDocumentValidation' icon.
  static const IconData strokeRoundedDocumentValidation = HugeIconData(0x3f60);

  /// IconData for the 'strokeRoundedDollar01' icon.
  static const IconData strokeRoundedDollar01 = HugeIconData(0x3f61);

  /// IconData for the 'strokeRoundedDollar02' icon.
  static const IconData strokeRoundedDollar02 = HugeIconData(0x3f62);

  /// IconData for the 'strokeRoundedDollarCircle' icon.
  static const IconData strokeRoundedDollarCircle = HugeIconData(0x3f63);

  /// IconData for the 'strokeRoundedDollarReceive01' icon.
  static const IconData strokeRoundedDollarReceive01 = HugeIconData(0x3f64);

  /// IconData for the 'strokeRoundedDollarReceive02' icon.
  static const IconData strokeRoundedDollarReceive02 = HugeIconData(0x3f65);

  /// IconData for the 'strokeRoundedDollarSend01' icon.
  static const IconData strokeRoundedDollarSend01 = HugeIconData(0x3f66);

  /// IconData for the 'strokeRoundedDollarSend02' icon.
  static const IconData strokeRoundedDollarSend02 = HugeIconData(0x3f67);

  /// IconData for the 'strokeRoundedDollarSquare' icon.
  static const IconData strokeRoundedDollarSquare = HugeIconData(0x3f68);

  /// IconData for the 'strokeRoundedDome' icon.
  static const IconData strokeRoundedDome = HugeIconData(0x3f69);

  /// IconData for the 'strokeRoundedDomino' icon.
  static const IconData strokeRoundedDomino = HugeIconData(0x3f6a);

  /// IconData for the 'strokeRoundedDoor01' icon.
  static const IconData strokeRoundedDoor01 = HugeIconData(0x3f6b);

  /// IconData for the 'strokeRoundedDoor02' icon.
  static const IconData strokeRoundedDoor02 = HugeIconData(0x3f6c);

  /// IconData for the 'strokeRoundedDoorLock' icon.
  static const IconData strokeRoundedDoorLock = HugeIconData(0x3f6d);

  /// IconData for the 'strokeRoundedDoor' icon.
  static const IconData strokeRoundedDoor = HugeIconData(0x3f6e);

  /// IconData for the 'strokeRoundedDoughnut' icon.
  static const IconData strokeRoundedDoughnut = HugeIconData(0x3f6f);

  /// IconData for the 'strokeRoundedDownload01' icon.
  static const IconData strokeRoundedDownload01 = HugeIconData(0x3f70);

  /// IconData for the 'strokeRoundedDownload02' icon.
  static const IconData strokeRoundedDownload02 = HugeIconData(0x3f71);

  /// IconData for the 'strokeRoundedDownload03' icon.
  static const IconData strokeRoundedDownload03 = HugeIconData(0x3f72);

  /// IconData for the 'strokeRoundedDownload04' icon.
  static const IconData strokeRoundedDownload04 = HugeIconData(0x3f73);

  /// IconData for the 'strokeRoundedDownload05' icon.
  static const IconData strokeRoundedDownload05 = HugeIconData(0x3f74);

  /// IconData for the 'strokeRoundedDownloadCircle01' icon.
  static const IconData strokeRoundedDownloadCircle01 = HugeIconData(0x3f75);

  /// IconData for the 'strokeRoundedDownloadCircle02' icon.
  static const IconData strokeRoundedDownloadCircle02 = HugeIconData(0x3f76);

  /// IconData for the 'strokeRoundedDownloadSquare01' icon.
  static const IconData strokeRoundedDownloadSquare01 = HugeIconData(0x3f77);

  /// IconData for the 'strokeRoundedDownloadSquare02' icon.
  static const IconData strokeRoundedDownloadSquare02 = HugeIconData(0x3f78);

  /// IconData for the 'strokeRoundedDrag01' icon.
  static const IconData strokeRoundedDrag01 = HugeIconData(0x3f79);

  /// IconData for the 'strokeRoundedDrag02' icon.
  static const IconData strokeRoundedDrag02 = HugeIconData(0x3f7a);

  /// IconData for the 'strokeRoundedDrag03' icon.
  static const IconData strokeRoundedDrag03 = HugeIconData(0x3f7b);

  /// IconData for the 'strokeRoundedDrag04' icon.
  static const IconData strokeRoundedDrag04 = HugeIconData(0x3f7c);

  /// IconData for the 'strokeRoundedDragDropHorizontal' icon.
  static const IconData strokeRoundedDragDropHorizontal = HugeIconData(0x3f7d);

  /// IconData for the 'strokeRoundedDragDropVertical' icon.
  static const IconData strokeRoundedDragDropVertical = HugeIconData(0x3f7e);

  /// IconData for the 'strokeRoundedDragDrop' icon.
  static const IconData strokeRoundedDragDrop = HugeIconData(0x3f7f);

  /// IconData for the 'strokeRoundedDragLeft01' icon.
  static const IconData strokeRoundedDragLeft01 = HugeIconData(0x3f80);

  /// IconData for the 'strokeRoundedDragLeft02' icon.
  static const IconData strokeRoundedDragLeft02 = HugeIconData(0x3f81);

  /// IconData for the 'strokeRoundedDragLeft03' icon.
  static const IconData strokeRoundedDragLeft03 = HugeIconData(0x3f82);

  /// IconData for the 'strokeRoundedDragLeft04' icon.
  static const IconData strokeRoundedDragLeft04 = HugeIconData(0x3f83);

  /// IconData for the 'strokeRoundedDragRight01' icon.
  static const IconData strokeRoundedDragRight01 = HugeIconData(0x3f84);

  /// IconData for the 'strokeRoundedDragRight02' icon.
  static const IconData strokeRoundedDragRight02 = HugeIconData(0x3f85);

  /// IconData for the 'strokeRoundedDragRight03' icon.
  static const IconData strokeRoundedDragRight03 = HugeIconData(0x3f86);

  /// IconData for the 'strokeRoundedDragRight04' icon.
  static const IconData strokeRoundedDragRight04 = HugeIconData(0x3f87);

  /// IconData for the 'strokeRoundedDrawingCompass' icon.
  static const IconData strokeRoundedDrawingCompass = HugeIconData(0x3f88);

  /// IconData for the 'strokeRoundedDrawingMode' icon.
  static const IconData strokeRoundedDrawingMode = HugeIconData(0x3f89);

  /// IconData for the 'strokeRoundedDress01' icon.
  static const IconData strokeRoundedDress01 = HugeIconData(0x3f8a);

  /// IconData for the 'strokeRoundedDress02' icon.
  static const IconData strokeRoundedDress02 = HugeIconData(0x3f8b);

  /// IconData for the 'strokeRoundedDress03' icon.
  static const IconData strokeRoundedDress03 = HugeIconData(0x3f8c);

  /// IconData for the 'strokeRoundedDress04' icon.
  static const IconData strokeRoundedDress04 = HugeIconData(0x3f8d);

  /// IconData for the 'strokeRoundedDress05' icon.
  static const IconData strokeRoundedDress05 = HugeIconData(0x3f8e);

  /// IconData for the 'strokeRoundedDress06' icon.
  static const IconData strokeRoundedDress06 = HugeIconData(0x3f8f);

  /// IconData for the 'strokeRoundedDress07' icon.
  static const IconData strokeRoundedDress07 = HugeIconData(0x3f90);

  /// IconData for the 'strokeRoundedDressingTable01' icon.
  static const IconData strokeRoundedDressingTable01 = HugeIconData(0x3f91);

  /// IconData for the 'strokeRoundedDressingTable02' icon.
  static const IconData strokeRoundedDressingTable02 = HugeIconData(0x3f92);

  /// IconData for the 'strokeRoundedDressingTable03' icon.
  static const IconData strokeRoundedDressingTable03 = HugeIconData(0x3f93);

  /// IconData for the 'strokeRoundedDribbble' icon.
  static const IconData strokeRoundedDribbble = HugeIconData(0x3f94);

  /// IconData for the 'strokeRoundedDrink' icon.
  static const IconData strokeRoundedDrink = HugeIconData(0x3f95);

  /// IconData for the 'strokeRoundedDrone' icon.
  static const IconData strokeRoundedDrone = HugeIconData(0x3f96);

  /// IconData for the 'strokeRoundedDrooling' icon.
  static const IconData strokeRoundedDrooling = HugeIconData(0x3f97);

  /// IconData for the 'strokeRoundedDropbox' icon.
  static const IconData strokeRoundedDropbox = HugeIconData(0x3f98);

  /// IconData for the 'strokeRoundedDroplet' icon.
  static const IconData strokeRoundedDroplet = HugeIconData(0x3f99);

  /// IconData for the 'strokeRoundedDropper' icon.
  static const IconData strokeRoundedDropper = HugeIconData(0x3f9a);

  /// IconData for the 'strokeRoundedDs3Tool' icon.
  static const IconData strokeRoundedDs3Tool = HugeIconData(0x3f9b);

  /// IconData for the 'strokeRoundedDua' icon.
  static const IconData strokeRoundedDua = HugeIconData(0x3f9c);

  /// IconData for the 'strokeRoundedDumbbell01' icon.
  static const IconData strokeRoundedDumbbell01 = HugeIconData(0x3f9d);

  /// IconData for the 'strokeRoundedDumbbell02' icon.
  static const IconData strokeRoundedDumbbell02 = HugeIconData(0x3f9e);

  /// IconData for the 'strokeRoundedDumbbell03' icon.
  static const IconData strokeRoundedDumbbell03 = HugeIconData(0x3f9f);

  /// IconData for the 'strokeRoundedEarRings01' icon.
  static const IconData strokeRoundedEarRings01 = HugeIconData(0x3fa0);

  /// IconData for the 'strokeRoundedEarRings02' icon.
  static const IconData strokeRoundedEarRings02 = HugeIconData(0x3fa1);

  /// IconData for the 'strokeRoundedEarRings03' icon.
  static const IconData strokeRoundedEarRings03 = HugeIconData(0x3fa2);

  /// IconData for the 'strokeRoundedEar' icon.
  static const IconData strokeRoundedEar = HugeIconData(0x3fa3);

  /// IconData for the 'strokeRoundedEarth' icon.
  static const IconData strokeRoundedEarth = HugeIconData(0x3fa4);

  /// IconData for the 'strokeRoundedEaseCurveControlPoints' icon.
  static const IconData strokeRoundedEaseCurveControlPoints =
      HugeIconData(0x3fa5);

  /// IconData for the 'strokeRoundedEaseInControlPoint' icon.
  static const IconData strokeRoundedEaseInControlPoint = HugeIconData(0x3fa6);

  /// IconData for the 'strokeRoundedEaseInOut' icon.
  static const IconData strokeRoundedEaseInOut = HugeIconData(0x3fa7);

  /// IconData for the 'strokeRoundedEaseIn' icon.
  static const IconData strokeRoundedEaseIn = HugeIconData(0x3fa8);

  /// IconData for the 'strokeRoundedEaseOutControlPoint' icon.
  static const IconData strokeRoundedEaseOutControlPoint = HugeIconData(0x3fa9);

  /// IconData for the 'strokeRoundedEaseOut' icon.
  static const IconData strokeRoundedEaseOut = HugeIconData(0x3faa);

  /// IconData for the 'strokeRoundedEcoEnergy' icon.
  static const IconData strokeRoundedEcoEnergy = HugeIconData(0x3fab);

  /// IconData for the 'strokeRoundedEcoLab01' icon.
  static const IconData strokeRoundedEcoLab01 = HugeIconData(0x3fac);

  /// IconData for the 'strokeRoundedEcoLab02' icon.
  static const IconData strokeRoundedEcoLab02 = HugeIconData(0x3fad);

  /// IconData for the 'strokeRoundedEcoLab' icon.
  static const IconData strokeRoundedEcoLab = HugeIconData(0x3fae);

  /// IconData for the 'strokeRoundedEcoPower' icon.
  static const IconData strokeRoundedEcoPower = HugeIconData(0x3faf);

  /// IconData for the 'strokeRoundedEdgeStyle' icon.
  static const IconData strokeRoundedEdgeStyle = HugeIconData(0x3fb0);

  /// IconData for the 'strokeRoundedEdit01' icon.
  static const IconData strokeRoundedEdit01 = HugeIconData(0x3fb1);

  /// IconData for the 'strokeRoundedEdit02' icon.
  static const IconData strokeRoundedEdit02 = HugeIconData(0x3fb2);

  /// IconData for the 'strokeRoundedEditOff' icon.
  static const IconData strokeRoundedEditOff = HugeIconData(0x3fb3);

  /// IconData for the 'strokeRoundedEditRoad' icon.
  static const IconData strokeRoundedEditRoad = HugeIconData(0x3fb4);

  /// IconData for the 'strokeRoundedEditTable' icon.
  static const IconData strokeRoundedEditTable = HugeIconData(0x3fb5);

  /// IconData for the 'strokeRoundedEditUser02' icon.
  static const IconData strokeRoundedEditUser02 = HugeIconData(0x3fb6);

  /// IconData for the 'strokeRoundedEggs' icon.
  static const IconData strokeRoundedEggs = HugeIconData(0x3fb7);

  /// IconData for the 'strokeRoundedEidMubarak' icon.
  static const IconData strokeRoundedEidMubarak = HugeIconData(0x3fb8);

  /// IconData for the 'strokeRoundedEiffelTower' icon.
  static const IconData strokeRoundedEiffelTower = HugeIconData(0x3fb9);

  /// IconData for the 'strokeRoundedElearningExchange' icon.
  static const IconData strokeRoundedElearningExchange = HugeIconData(0x3fba);

  /// IconData for the 'strokeRoundedElectricHome01' icon.
  static const IconData strokeRoundedElectricHome01 = HugeIconData(0x3fbb);

  /// IconData for the 'strokeRoundedElectricHome02' icon.
  static const IconData strokeRoundedElectricHome02 = HugeIconData(0x3fbc);

  /// IconData for the 'strokeRoundedElectricPlugs' icon.
  static const IconData strokeRoundedElectricPlugs = HugeIconData(0x3fbd);

  /// IconData for the 'strokeRoundedElectricTower01' icon.
  static const IconData strokeRoundedElectricTower01 = HugeIconData(0x3fbe);

  /// IconData for the 'strokeRoundedElectricTower02' icon.
  static const IconData strokeRoundedElectricTower02 = HugeIconData(0x3fbf);

  /// IconData for the 'strokeRoundedElectricWire' icon.
  static const IconData strokeRoundedElectricWire = HugeIconData(0x3fc0);

  /// IconData for the 'strokeRoundedEllipseSelection' icon.
  static const IconData strokeRoundedEllipseSelection = HugeIconData(0x3fc1);

  /// IconData for the 'strokeRoundedEncrypt' icon.
  static const IconData strokeRoundedEncrypt = HugeIconData(0x3fc2);

  /// IconData for the 'strokeRoundedEnergyEllipse' icon.
  static const IconData strokeRoundedEnergyEllipse = HugeIconData(0x3fc3);

  /// IconData for the 'strokeRoundedEnergyRectangle' icon.
  static const IconData strokeRoundedEnergyRectangle = HugeIconData(0x3fc4);

  /// IconData for the 'strokeRoundedEnergy' icon.
  static const IconData strokeRoundedEnergy = HugeIconData(0x3fc5);

  /// IconData for the 'strokeRoundedEnteringGeoFence' icon.
  static const IconData strokeRoundedEnteringGeoFence = HugeIconData(0x3fc6);

  /// IconData for the 'strokeRoundedEnvato' icon.
  static const IconData strokeRoundedEnvato = HugeIconData(0x3fc7);

  /// IconData for the 'strokeRoundedEqualSignCircle' icon.
  static const IconData strokeRoundedEqualSignCircle = HugeIconData(0x3fc8);

  /// IconData for the 'strokeRoundedEqualSignSquare' icon.
  static const IconData strokeRoundedEqualSignSquare = HugeIconData(0x3fc9);

  /// IconData for the 'strokeRoundedEqualSign' icon.
  static const IconData strokeRoundedEqualSign = HugeIconData(0x3fca);

  /// IconData for the 'strokeRoundedEquipmentBenchPress' icon.
  static const IconData strokeRoundedEquipmentBenchPress = HugeIconData(0x3fcb);

  /// IconData for the 'strokeRoundedEquipmentChestPress' icon.
  static const IconData strokeRoundedEquipmentChestPress = HugeIconData(0x3fcc);

  /// IconData for the 'strokeRoundedEquipmentGym01' icon.
  static const IconData strokeRoundedEquipmentGym01 = HugeIconData(0x3fcd);

  /// IconData for the 'strokeRoundedEquipmentGym02' icon.
  static const IconData strokeRoundedEquipmentGym02 = HugeIconData(0x3fce);

  /// IconData for the 'strokeRoundedEquipmentGym03' icon.
  static const IconData strokeRoundedEquipmentGym03 = HugeIconData(0x3fcf);

  /// IconData for the 'strokeRoundedEquipmentWeightlifting' icon.
  static const IconData strokeRoundedEquipmentWeightlifting =
      HugeIconData(0x3fd0);

  /// IconData for the 'strokeRoundedEraser01' icon.
  static const IconData strokeRoundedEraser01 = HugeIconData(0x3fd1);

  /// IconData for the 'strokeRoundedEraserAdd' icon.
  static const IconData strokeRoundedEraserAdd = HugeIconData(0x3fd2);

  /// IconData for the 'strokeRoundedEraserAuto' icon.
  static const IconData strokeRoundedEraserAuto = HugeIconData(0x3fd3);

  /// IconData for the 'strokeRoundedEraser' icon.
  static const IconData strokeRoundedEraser = HugeIconData(0x3fd4);

  /// IconData for the 'strokeRoundedEstimate01' icon.
  static const IconData strokeRoundedEstimate01 = HugeIconData(0x3fd5);

  /// IconData for the 'strokeRoundedEstimate02' icon.
  static const IconData strokeRoundedEstimate02 = HugeIconData(0x3fd6);

  /// IconData for the 'strokeRoundedEthereumEllipse' icon.
  static const IconData strokeRoundedEthereumEllipse = HugeIconData(0x3fd7);

  /// IconData for the 'strokeRoundedEthereumRectangle' icon.
  static const IconData strokeRoundedEthereumRectangle = HugeIconData(0x3fd8);

  /// IconData for the 'strokeRoundedEthereum' icon.
  static const IconData strokeRoundedEthereum = HugeIconData(0x3fd9);

  /// IconData for the 'strokeRoundedEuroCircle' icon.
  static const IconData strokeRoundedEuroCircle = HugeIconData(0x3fda);

  /// IconData for the 'strokeRoundedEuroReceive' icon.
  static const IconData strokeRoundedEuroReceive = HugeIconData(0x3fdb);

  /// IconData for the 'strokeRoundedEuroSend' icon.
  static const IconData strokeRoundedEuroSend = HugeIconData(0x3fdc);

  /// IconData for the 'strokeRoundedEuroSquare' icon.
  static const IconData strokeRoundedEuroSquare = HugeIconData(0x3fdd);

  /// IconData for the 'strokeRoundedEuro' icon.
  static const IconData strokeRoundedEuro = HugeIconData(0x3fde);

  /// IconData for the 'strokeRoundedEvCharging' icon.
  static const IconData strokeRoundedEvCharging = HugeIconData(0x3fdf);

  /// IconData for the 'strokeRoundedEvil' icon.
  static const IconData strokeRoundedEvil = HugeIconData(0x3fe0);

  /// IconData for the 'strokeRoundedExchange01' icon.
  static const IconData strokeRoundedExchange01 = HugeIconData(0x3fe1);

  /// IconData for the 'strokeRoundedExchange02' icon.
  static const IconData strokeRoundedExchange02 = HugeIconData(0x3fe2);

  /// IconData for the 'strokeRoundedExchange03' icon.
  static const IconData strokeRoundedExchange03 = HugeIconData(0x3fe3);

  /// IconData for the 'strokeRoundedExpander' icon.
  static const IconData strokeRoundedExpander = HugeIconData(0x3fe4);

  /// IconData for the 'strokeRoundedExternalDrive' icon.
  static const IconData strokeRoundedExternalDrive = HugeIconData(0x3fe5);

  /// IconData for the 'strokeRoundedEye' icon.
  static const IconData strokeRoundedEye = HugeIconData(0x3fe6);

  /// IconData for the 'strokeRoundedFaceId' icon.
  static const IconData strokeRoundedFaceId = HugeIconData(0x3fe7);

  /// IconData for the 'strokeRoundedFacebook01' icon.
  static const IconData strokeRoundedFacebook01 = HugeIconData(0x3fe8);

  /// IconData for the 'strokeRoundedFacebook02' icon.
  static const IconData strokeRoundedFacebook02 = HugeIconData(0x3fe9);

  /// IconData for the 'strokeRoundedFactory01' icon.
  static const IconData strokeRoundedFactory01 = HugeIconData(0x3fea);

  /// IconData for the 'strokeRoundedFactory02' icon.
  static const IconData strokeRoundedFactory02 = HugeIconData(0x3feb);

  /// IconData for the 'strokeRoundedFactory' icon.
  static const IconData strokeRoundedFactory = HugeIconData(0x3fec);

  /// IconData for the 'strokeRoundedFahrenheit' icon.
  static const IconData strokeRoundedFahrenheit = HugeIconData(0x3fed);

  /// IconData for the 'strokeRoundedFallingStar' icon.
  static const IconData strokeRoundedFallingStar = HugeIconData(0x3fee);

  /// IconData for the 'strokeRoundedFastWind' icon.
  static const IconData strokeRoundedFastWind = HugeIconData(0x3fef);

  /// IconData for the 'strokeRoundedFavouriteCircle' icon.
  static const IconData strokeRoundedFavouriteCircle = HugeIconData(0x3ff0);

  /// IconData for the 'strokeRoundedFavouriteSquare' icon.
  static const IconData strokeRoundedFavouriteSquare = HugeIconData(0x3ff1);

  /// IconData for the 'strokeRoundedFavourite' icon.
  static const IconData strokeRoundedFavourite = HugeIconData(0x3ff2);

  /// IconData for the 'strokeRoundedFeather' icon.
  static const IconData strokeRoundedFeather = HugeIconData(0x3ff3);

  /// IconData for the 'strokeRoundedFencingMask' icon.
  static const IconData strokeRoundedFencingMask = HugeIconData(0x3ff4);

  /// IconData for the 'strokeRoundedFencing' icon.
  static const IconData strokeRoundedFencing = HugeIconData(0x3ff5);

  /// IconData for the 'strokeRoundedFerrisWheel' icon.
  static const IconData strokeRoundedFerrisWheel = HugeIconData(0x3ff6);

  /// IconData for the 'strokeRoundedFerryBoat' icon.
  static const IconData strokeRoundedFerryBoat = HugeIconData(0x3ff7);

  /// IconData for the 'strokeRoundedFigma' icon.
  static const IconData strokeRoundedFigma = HugeIconData(0x3ff8);

  /// IconData for the 'strokeRoundedFile01' icon.
  static const IconData strokeRoundedFile01 = HugeIconData(0x3ff9);

  /// IconData for the 'strokeRoundedFile02' icon.
  static const IconData strokeRoundedFile02 = HugeIconData(0x3ffa);

  /// IconData for the 'strokeRoundedFileAdd' icon.
  static const IconData strokeRoundedFileAdd = HugeIconData(0x3ffb);

  /// IconData for the 'strokeRoundedFileAttachment' icon.
  static const IconData strokeRoundedFileAttachment = HugeIconData(0x3ffc);

  /// IconData for the 'strokeRoundedFileAudio' icon.
  static const IconData strokeRoundedFileAudio = HugeIconData(0x3ffd);

  /// IconData for the 'strokeRoundedFileBitcoin' icon.
  static const IconData strokeRoundedFileBitcoin = HugeIconData(0x3ffe);

  /// IconData for the 'strokeRoundedFileBlock' icon.
  static const IconData strokeRoundedFileBlock = HugeIconData(0x3fff);

  /// IconData for the 'strokeRoundedFileBookmark' icon.
  static const IconData strokeRoundedFileBookmark = HugeIconData(0x4000);

  /// IconData for the 'strokeRoundedFileCloud' icon.
  static const IconData strokeRoundedFileCloud = HugeIconData(0x4001);

  /// IconData for the 'strokeRoundedFileCorrupt' icon.
  static const IconData strokeRoundedFileCorrupt = HugeIconData(0x4002);

  /// IconData for the 'strokeRoundedFileDollar' icon.
  static const IconData strokeRoundedFileDollar = HugeIconData(0x4003);

  /// IconData for the 'strokeRoundedFileDownload' icon.
  static const IconData strokeRoundedFileDownload = HugeIconData(0x4004);

  /// IconData for the 'strokeRoundedFileEdit' icon.
  static const IconData strokeRoundedFileEdit = HugeIconData(0x4005);

  /// IconData for the 'strokeRoundedFileEuro' icon.
  static const IconData strokeRoundedFileEuro = HugeIconData(0x4006);

  /// IconData for the 'strokeRoundedFileExport' icon.
  static const IconData strokeRoundedFileExport = HugeIconData(0x4007);

  /// IconData for the 'strokeRoundedFileFavourite' icon.
  static const IconData strokeRoundedFileFavourite = HugeIconData(0x4008);

  /// IconData for the 'strokeRoundedFileImport' icon.
  static const IconData strokeRoundedFileImport = HugeIconData(0x4009);

  /// IconData for the 'strokeRoundedFileLink' icon.
  static const IconData strokeRoundedFileLink = HugeIconData(0x400a);

  /// IconData for the 'strokeRoundedFileLocked' icon.
  static const IconData strokeRoundedFileLocked = HugeIconData(0x400b);

  /// IconData for the 'strokeRoundedFileManagement' icon.
  static const IconData strokeRoundedFileManagement = HugeIconData(0x400c);

  /// IconData for the 'strokeRoundedFileMinus' icon.
  static const IconData strokeRoundedFileMinus = HugeIconData(0x400d);

  /// IconData for the 'strokeRoundedFileMusic' icon.
  static const IconData strokeRoundedFileMusic = HugeIconData(0x400e);

  /// IconData for the 'strokeRoundedFileNotFound' icon.
  static const IconData strokeRoundedFileNotFound = HugeIconData(0x400f);

  /// IconData for the 'strokeRoundedFilePaste' icon.
  static const IconData strokeRoundedFilePaste = HugeIconData(0x4010);

  /// IconData for the 'strokeRoundedFilePin' icon.
  static const IconData strokeRoundedFilePin = HugeIconData(0x4011);

  /// IconData for the 'strokeRoundedFilePound' icon.
  static const IconData strokeRoundedFilePound = HugeIconData(0x4012);

  /// IconData for the 'strokeRoundedFileRemove' icon.
  static const IconData strokeRoundedFileRemove = HugeIconData(0x4013);

  /// IconData for the 'strokeRoundedFileScript' icon.
  static const IconData strokeRoundedFileScript = HugeIconData(0x4014);

  /// IconData for the 'strokeRoundedFileSearch' icon.
  static const IconData strokeRoundedFileSearch = HugeIconData(0x4015);

  /// IconData for the 'strokeRoundedFileSecurity' icon.
  static const IconData strokeRoundedFileSecurity = HugeIconData(0x4016);

  /// IconData for the 'strokeRoundedFileShredder' icon.
  static const IconData strokeRoundedFileShredder = HugeIconData(0x4017);

  /// IconData for the 'strokeRoundedFileStar' icon.
  static const IconData strokeRoundedFileStar = HugeIconData(0x4018);

  /// IconData for the 'strokeRoundedFileSync' icon.
  static const IconData strokeRoundedFileSync = HugeIconData(0x4019);

  /// IconData for the 'strokeRoundedFileUnknown' icon.
  static const IconData strokeRoundedFileUnknown = HugeIconData(0x401a);

  /// IconData for the 'strokeRoundedFileUnlocked' icon.
  static const IconData strokeRoundedFileUnlocked = HugeIconData(0x401b);

  /// IconData for the 'strokeRoundedFileUpload' icon.
  static const IconData strokeRoundedFileUpload = HugeIconData(0x401c);

  /// IconData for the 'strokeRoundedFileValidation' icon.
  static const IconData strokeRoundedFileValidation = HugeIconData(0x401d);

  /// IconData for the 'strokeRoundedFileVerified' icon.
  static const IconData strokeRoundedFileVerified = HugeIconData(0x401e);

  /// IconData for the 'strokeRoundedFileVideo' icon.
  static const IconData strokeRoundedFileVideo = HugeIconData(0x401f);

  /// IconData for the 'strokeRoundedFileView' icon.
  static const IconData strokeRoundedFileView = HugeIconData(0x4020);

  /// IconData for the 'strokeRoundedFileYen' icon.
  static const IconData strokeRoundedFileYen = HugeIconData(0x4021);

  /// IconData for the 'strokeRoundedFileZip' icon.
  static const IconData strokeRoundedFileZip = HugeIconData(0x4022);

  /// IconData for the 'strokeRoundedFiles01' icon.
  static const IconData strokeRoundedFiles01 = HugeIconData(0x4023);

  /// IconData for the 'strokeRoundedFiles02' icon.
  static const IconData strokeRoundedFiles02 = HugeIconData(0x4024);

  /// IconData for the 'strokeRoundedFilm01' icon.
  static const IconData strokeRoundedFilm01 = HugeIconData(0x4025);

  /// IconData for the 'strokeRoundedFilm02' icon.
  static const IconData strokeRoundedFilm02 = HugeIconData(0x4026);

  /// IconData for the 'strokeRoundedFilmRoll01' icon.
  static const IconData strokeRoundedFilmRoll01 = HugeIconData(0x4027);

  /// IconData for the 'strokeRoundedFilmRoll02' icon.
  static const IconData strokeRoundedFilmRoll02 = HugeIconData(0x4028);

  /// IconData for the 'strokeRoundedFilterAdd' icon.
  static const IconData strokeRoundedFilterAdd = HugeIconData(0x4029);

  /// IconData for the 'strokeRoundedFilterEdit' icon.
  static const IconData strokeRoundedFilterEdit = HugeIconData(0x402a);

  /// IconData for the 'strokeRoundedFilterHorizontal' icon.
  static const IconData strokeRoundedFilterHorizontal = HugeIconData(0x402b);

  /// IconData for the 'strokeRoundedFilterMailCircle' icon.
  static const IconData strokeRoundedFilterMailCircle = HugeIconData(0x402c);

  /// IconData for the 'strokeRoundedFilterMailSquare' icon.
  static const IconData strokeRoundedFilterMailSquare = HugeIconData(0x402d);

  /// IconData for the 'strokeRoundedFilterRemove' icon.
  static const IconData strokeRoundedFilterRemove = HugeIconData(0x402e);

  /// IconData for the 'strokeRoundedFilterReset' icon.
  static const IconData strokeRoundedFilterReset = HugeIconData(0x402f);

  /// IconData for the 'strokeRoundedFilterVertical' icon.
  static const IconData strokeRoundedFilterVertical = HugeIconData(0x4030);

  /// IconData for the 'strokeRoundedFilter' icon.
  static const IconData strokeRoundedFilter = HugeIconData(0x4031);

  /// IconData for the 'strokeRoundedFingerAccess' icon.
  static const IconData strokeRoundedFingerAccess = HugeIconData(0x4032);

  /// IconData for the 'strokeRoundedFingerPrintAdd' icon.
  static const IconData strokeRoundedFingerPrintAdd = HugeIconData(0x4033);

  /// IconData for the 'strokeRoundedFingerPrintCheck' icon.
  static const IconData strokeRoundedFingerPrintCheck = HugeIconData(0x4034);

  /// IconData for the 'strokeRoundedFingerPrintMinus' icon.
  static const IconData strokeRoundedFingerPrintMinus = HugeIconData(0x4035);

  /// IconData for the 'strokeRoundedFingerPrintRemove' icon.
  static const IconData strokeRoundedFingerPrintRemove = HugeIconData(0x4036);

  /// IconData for the 'strokeRoundedFingerPrintScan' icon.
  static const IconData strokeRoundedFingerPrintScan = HugeIconData(0x4037);

  /// IconData for the 'strokeRoundedFingerPrint' icon.
  static const IconData strokeRoundedFingerPrint = HugeIconData(0x4038);

  /// IconData for the 'strokeRoundedFingerprintScan' icon.
  static const IconData strokeRoundedFingerprintScan = HugeIconData(0x4039);

  /// IconData for the 'strokeRoundedFins' icon.
  static const IconData strokeRoundedFins = HugeIconData(0x403a);

  /// IconData for the 'strokeRoundedFirePit' icon.
  static const IconData strokeRoundedFirePit = HugeIconData(0x403b);

  /// IconData for the 'strokeRoundedFireSecurity' icon.
  static const IconData strokeRoundedFireSecurity = HugeIconData(0x403c);

  /// IconData for the 'strokeRoundedFire' icon.
  static const IconData strokeRoundedFire = HugeIconData(0x403d);

  /// IconData for the 'strokeRoundedFirewall' icon.
  static const IconData strokeRoundedFirewall = HugeIconData(0x403e);

  /// IconData for the 'strokeRoundedFirstAidKit' icon.
  static const IconData strokeRoundedFirstAidKit = HugeIconData(0x403f);

  /// IconData for the 'strokeRoundedFirstBracketCircle' icon.
  static const IconData strokeRoundedFirstBracketCircle = HugeIconData(0x4040);

  /// IconData for the 'strokeRoundedFirstBracketSquare' icon.
  static const IconData strokeRoundedFirstBracketSquare = HugeIconData(0x4041);

  /// IconData for the 'strokeRoundedFirstBracket' icon.
  static const IconData strokeRoundedFirstBracket = HugeIconData(0x4042);

  /// IconData for the 'strokeRoundedFishFood' icon.
  static const IconData strokeRoundedFishFood = HugeIconData(0x4043);

  /// IconData for the 'strokeRoundedFiverr' icon.
  static const IconData strokeRoundedFiverr = HugeIconData(0x4044);

  /// IconData for the 'strokeRoundedFlag01' icon.
  static const IconData strokeRoundedFlag01 = HugeIconData(0x4045);

  /// IconData for the 'strokeRoundedFlag02' icon.
  static const IconData strokeRoundedFlag02 = HugeIconData(0x4046);

  /// IconData for the 'strokeRoundedFlag03' icon.
  static const IconData strokeRoundedFlag03 = HugeIconData(0x4047);

  /// IconData for the 'strokeRoundedFlashOff' icon.
  static const IconData strokeRoundedFlashOff = HugeIconData(0x4048);

  /// IconData for the 'strokeRoundedFlash' icon.
  static const IconData strokeRoundedFlash = HugeIconData(0x4049);

  /// IconData for the 'strokeRoundedFlaticon' icon.
  static const IconData strokeRoundedFlaticon = HugeIconData(0x404a);

  /// IconData for the 'strokeRoundedFlickr' icon.
  static const IconData strokeRoundedFlickr = HugeIconData(0x404b);

  /// IconData for the 'strokeRoundedFlimSlate' icon.
  static const IconData strokeRoundedFlimSlate = HugeIconData(0x404c);

  /// IconData for the 'strokeRoundedFlipBottom' icon.
  static const IconData strokeRoundedFlipBottom = HugeIconData(0x404d);

  /// IconData for the 'strokeRoundedFlipHorizontal' icon.
  static const IconData strokeRoundedFlipHorizontal = HugeIconData(0x404e);

  /// IconData for the 'strokeRoundedFlipLeft' icon.
  static const IconData strokeRoundedFlipLeft = HugeIconData(0x404f);

  /// IconData for the 'strokeRoundedFlipPhone' icon.
  static const IconData strokeRoundedFlipPhone = HugeIconData(0x4050);

  /// IconData for the 'strokeRoundedFlipRight' icon.
  static const IconData strokeRoundedFlipRight = HugeIconData(0x4051);

  /// IconData for the 'strokeRoundedFlipTop' icon.
  static const IconData strokeRoundedFlipTop = HugeIconData(0x4052);

  /// IconData for the 'strokeRoundedFlipVertical' icon.
  static const IconData strokeRoundedFlipVertical = HugeIconData(0x4053);

  /// IconData for the 'strokeRoundedFloorPlan' icon.
  static const IconData strokeRoundedFloorPlan = HugeIconData(0x4054);

  /// IconData for the 'strokeRoundedFloppyDisk' icon.
  static const IconData strokeRoundedFloppyDisk = HugeIconData(0x4055);

  /// IconData for the 'strokeRoundedFlowCircle' icon.
  static const IconData strokeRoundedFlowCircle = HugeIconData(0x4056);

  /// IconData for the 'strokeRoundedFlowConnection' icon.
  static const IconData strokeRoundedFlowConnection = HugeIconData(0x4057);

  /// IconData for the 'strokeRoundedFlowSquare' icon.
  static const IconData strokeRoundedFlowSquare = HugeIconData(0x4058);

  /// IconData for the 'strokeRoundedFlow' icon.
  static const IconData strokeRoundedFlow = HugeIconData(0x4059);

  /// IconData for the 'strokeRoundedFlowchart01' icon.
  static const IconData strokeRoundedFlowchart01 = HugeIconData(0x405a);

  /// IconData for the 'strokeRoundedFlowchart02' icon.
  static const IconData strokeRoundedFlowchart02 = HugeIconData(0x405b);

  /// IconData for the 'strokeRoundedFlowerPot' icon.
  static const IconData strokeRoundedFlowerPot = HugeIconData(0x405c);

  /// IconData for the 'strokeRoundedFlower' icon.
  static const IconData strokeRoundedFlower = HugeIconData(0x405d);

  /// IconData for the 'strokeRoundedFlushed' icon.
  static const IconData strokeRoundedFlushed = HugeIconData(0x405e);

  /// IconData for the 'strokeRoundedFlyingHuman' icon.
  static const IconData strokeRoundedFlyingHuman = HugeIconData(0x405f);

  /// IconData for the 'strokeRoundedFocusPoint' icon.
  static const IconData strokeRoundedFocusPoint = HugeIconData(0x4060);

  /// IconData for the 'strokeRoundedFolder01' icon.
  static const IconData strokeRoundedFolder01 = HugeIconData(0x4061);

  /// IconData for the 'strokeRoundedFolder02' icon.
  static const IconData strokeRoundedFolder02 = HugeIconData(0x4062);

  /// IconData for the 'strokeRoundedFolder03' icon.
  static const IconData strokeRoundedFolder03 = HugeIconData(0x4063);

  /// IconData for the 'strokeRoundedFolderAdd' icon.
  static const IconData strokeRoundedFolderAdd = HugeIconData(0x4064);

  /// IconData for the 'strokeRoundedFolderAttachment' icon.
  static const IconData strokeRoundedFolderAttachment = HugeIconData(0x4065);

  /// IconData for the 'strokeRoundedFolderAudio' icon.
  static const IconData strokeRoundedFolderAudio = HugeIconData(0x4066);

  /// IconData for the 'strokeRoundedFolderBlock' icon.
  static const IconData strokeRoundedFolderBlock = HugeIconData(0x4067);

  /// IconData for the 'strokeRoundedFolderCheck' icon.
  static const IconData strokeRoundedFolderCheck = HugeIconData(0x4068);

  /// IconData for the 'strokeRoundedFolderCloud' icon.
  static const IconData strokeRoundedFolderCloud = HugeIconData(0x4069);

  /// IconData for the 'strokeRoundedFolderDetailsReference' icon.
  static const IconData strokeRoundedFolderDetailsReference =
      HugeIconData(0x406a);

  /// IconData for the 'strokeRoundedFolderDetails' icon.
  static const IconData strokeRoundedFolderDetails = HugeIconData(0x406b);

  /// IconData for the 'strokeRoundedFolderDownload' icon.
  static const IconData strokeRoundedFolderDownload = HugeIconData(0x406c);

  /// IconData for the 'strokeRoundedFolderEdit' icon.
  static const IconData strokeRoundedFolderEdit = HugeIconData(0x406d);

  /// IconData for the 'strokeRoundedFolderExport' icon.
  static const IconData strokeRoundedFolderExport = HugeIconData(0x406e);

  /// IconData for the 'strokeRoundedFolderFavourite' icon.
  static const IconData strokeRoundedFolderFavourite = HugeIconData(0x406f);

  /// IconData for the 'strokeRoundedFolderFileStorage' icon.
  static const IconData strokeRoundedFolderFileStorage = HugeIconData(0x4070);

  /// IconData for the 'strokeRoundedFolderImport' icon.
  static const IconData strokeRoundedFolderImport = HugeIconData(0x4071);

  /// IconData for the 'strokeRoundedFolderLibrary' icon.
  static const IconData strokeRoundedFolderLibrary = HugeIconData(0x4072);

  /// IconData for the 'strokeRoundedFolderLinks' icon.
  static const IconData strokeRoundedFolderLinks = HugeIconData(0x4073);

  /// IconData for the 'strokeRoundedFolderLocked' icon.
  static const IconData strokeRoundedFolderLocked = HugeIconData(0x4074);

  /// IconData for the 'strokeRoundedFolderManagement' icon.
  static const IconData strokeRoundedFolderManagement = HugeIconData(0x4075);

  /// IconData for the 'strokeRoundedFolderMinus' icon.
  static const IconData strokeRoundedFolderMinus = HugeIconData(0x4076);

  /// IconData for the 'strokeRoundedFolderMusic' icon.
  static const IconData strokeRoundedFolderMusic = HugeIconData(0x4077);

  /// IconData for the 'strokeRoundedFolderOff' icon.
  static const IconData strokeRoundedFolderOff = HugeIconData(0x4078);

  /// IconData for the 'strokeRoundedFolderOpen' icon.
  static const IconData strokeRoundedFolderOpen = HugeIconData(0x4079);

  /// IconData for the 'strokeRoundedFolderPin' icon.
  static const IconData strokeRoundedFolderPin = HugeIconData(0x407a);

  /// IconData for the 'strokeRoundedFolderRemove' icon.
  static const IconData strokeRoundedFolderRemove = HugeIconData(0x407b);

  /// IconData for the 'strokeRoundedFolderSearch' icon.
  static const IconData strokeRoundedFolderSearch = HugeIconData(0x407c);

  /// IconData for the 'strokeRoundedFolderSecurity' icon.
  static const IconData strokeRoundedFolderSecurity = HugeIconData(0x407d);

  /// IconData for the 'strokeRoundedFolderShared01' icon.
  static const IconData strokeRoundedFolderShared01 = HugeIconData(0x407e);

  /// IconData for the 'strokeRoundedFolderShared02' icon.
  static const IconData strokeRoundedFolderShared02 = HugeIconData(0x407f);

  /// IconData for the 'strokeRoundedFolderShared03' icon.
  static const IconData strokeRoundedFolderShared03 = HugeIconData(0x4080);

  /// IconData for the 'strokeRoundedFolderSync' icon.
  static const IconData strokeRoundedFolderSync = HugeIconData(0x4081);

  /// IconData for the 'strokeRoundedFolderTransfer' icon.
  static const IconData strokeRoundedFolderTransfer = HugeIconData(0x4082);

  /// IconData for the 'strokeRoundedFolderUnknown' icon.
  static const IconData strokeRoundedFolderUnknown = HugeIconData(0x4083);

  /// IconData for the 'strokeRoundedFolderUnlocked' icon.
  static const IconData strokeRoundedFolderUnlocked = HugeIconData(0x4084);

  /// IconData for the 'strokeRoundedFolderUpload' icon.
  static const IconData strokeRoundedFolderUpload = HugeIconData(0x4085);

  /// IconData for the 'strokeRoundedFolderVideo' icon.
  static const IconData strokeRoundedFolderVideo = HugeIconData(0x4086);

  /// IconData for the 'strokeRoundedFolderView' icon.
  static const IconData strokeRoundedFolderView = HugeIconData(0x4087);

  /// IconData for the 'strokeRoundedFolderZip' icon.
  static const IconData strokeRoundedFolderZip = HugeIconData(0x4088);

  /// IconData for the 'strokeRoundedFolders' icon.
  static const IconData strokeRoundedFolders = HugeIconData(0x4089);

  /// IconData for the 'strokeRoundedFootballPitch' icon.
  static const IconData strokeRoundedFootballPitch = HugeIconData(0x408a);

  /// IconData for the 'strokeRoundedFootball' icon.
  static const IconData strokeRoundedFootball = HugeIconData(0x408b);

  /// IconData for the 'strokeRoundedForgotPassword' icon.
  static const IconData strokeRoundedForgotPassword = HugeIconData(0x408c);

  /// IconData for the 'strokeRoundedFork' icon.
  static const IconData strokeRoundedFork = HugeIconData(0x408d);

  /// IconData for the 'strokeRoundedForrst' icon.
  static const IconData strokeRoundedForrst = HugeIconData(0x408e);

  /// IconData for the 'strokeRoundedFortress' icon.
  static const IconData strokeRoundedFortress = HugeIconData(0x408f);

  /// IconData for the 'strokeRoundedForward01' icon.
  static const IconData strokeRoundedForward01 = HugeIconData(0x4090);

  /// IconData for the 'strokeRoundedForward02' icon.
  static const IconData strokeRoundedForward02 = HugeIconData(0x4091);

  /// IconData for the 'strokeRoundedFourFinger02' icon.
  static const IconData strokeRoundedFourFinger02 = HugeIconData(0x4092);

  /// IconData for the 'strokeRoundedFourFinger03' icon.
  static const IconData strokeRoundedFourFinger03 = HugeIconData(0x4093);

  /// IconData for the 'strokeRoundedFourK' icon.
  static const IconData strokeRoundedFourK = HugeIconData(0x4094);

  /// IconData for the 'strokeRoundedFoursquare' icon.
  static const IconData strokeRoundedFoursquare = HugeIconData(0x4095);

  /// IconData for the 'strokeRoundedFramer' icon.
  static const IconData strokeRoundedFramer = HugeIconData(0x4096);

  /// IconData for the 'strokeRoundedFrameworks' icon.
  static const IconData strokeRoundedFrameworks = HugeIconData(0x4097);

  /// IconData for the 'strokeRoundedFrenchFries01' icon.
  static const IconData strokeRoundedFrenchFries01 = HugeIconData(0x4098);

  /// IconData for the 'strokeRoundedFrenchFries02' icon.
  static const IconData strokeRoundedFrenchFries02 = HugeIconData(0x4099);

  /// IconData for the 'strokeRoundedFridge' icon.
  static const IconData strokeRoundedFridge = HugeIconData(0x409a);

  /// IconData for the 'strokeRoundedFry' icon.
  static const IconData strokeRoundedFry = HugeIconData(0x409b);

  /// IconData for the 'strokeRoundedFuel01' icon.
  static const IconData strokeRoundedFuel01 = HugeIconData(0x409c);

  /// IconData for the 'strokeRoundedFuel02' icon.
  static const IconData strokeRoundedFuel02 = HugeIconData(0x409d);

  /// IconData for the 'strokeRoundedFuelStation' icon.
  static const IconData strokeRoundedFuelStation = HugeIconData(0x409e);

  /// IconData for the 'strokeRoundedFunctionCircle' icon.
  static const IconData strokeRoundedFunctionCircle = HugeIconData(0x409f);

  /// IconData for the 'strokeRoundedFunctionOfX' icon.
  static const IconData strokeRoundedFunctionOfX = HugeIconData(0x40a0);

  /// IconData for the 'strokeRoundedFunctionSquare' icon.
  static const IconData strokeRoundedFunctionSquare = HugeIconData(0x40a1);

  /// IconData for the 'strokeRoundedFunction' icon.
  static const IconData strokeRoundedFunction = HugeIconData(0x40a2);

  /// IconData for the 'strokeRoundedGalaxy' icon.
  static const IconData strokeRoundedGalaxy = HugeIconData(0x40a3);

  /// IconData for the 'strokeRoundedGameController01' icon.
  static const IconData strokeRoundedGameController01 = HugeIconData(0x40a4);

  /// IconData for the 'strokeRoundedGameController02' icon.
  static const IconData strokeRoundedGameController02 = HugeIconData(0x40a5);

  /// IconData for the 'strokeRoundedGameController03' icon.
  static const IconData strokeRoundedGameController03 = HugeIconData(0x40a6);

  /// IconData for the 'strokeRoundedGame' icon.
  static const IconData strokeRoundedGame = HugeIconData(0x40a7);

  /// IconData for the 'strokeRoundedGameboy' icon.
  static const IconData strokeRoundedGameboy = HugeIconData(0x40a8);

  /// IconData for the 'strokeRoundedGarage' icon.
  static const IconData strokeRoundedGarage = HugeIconData(0x40a9);

  /// IconData for the 'strokeRoundedGarbageTruck' icon.
  static const IconData strokeRoundedGarbageTruck = HugeIconData(0x40aa);

  /// IconData for the 'strokeRoundedGasPipe' icon.
  static const IconData strokeRoundedGasPipe = HugeIconData(0x40ab);

  /// IconData for the 'strokeRoundedGasStove' icon.
  static const IconData strokeRoundedGasStove = HugeIconData(0x40ac);

  /// IconData for the 'strokeRoundedGem' icon.
  static const IconData strokeRoundedGem = HugeIconData(0x40ad);

  /// IconData for the 'strokeRoundedGeologyCrust' icon.
  static const IconData strokeRoundedGeologyCrust = HugeIconData(0x40ae);

  /// IconData for the 'strokeRoundedGeometricShapes01' icon.
  static const IconData strokeRoundedGeometricShapes01 = HugeIconData(0x40af);

  /// IconData for the 'strokeRoundedGeometricShapes02' icon.
  static const IconData strokeRoundedGeometricShapes02 = HugeIconData(0x40b0);

  /// IconData for the 'strokeRoundedGibbousMoon' icon.
  static const IconData strokeRoundedGibbousMoon = HugeIconData(0x40b1);

  /// IconData for the 'strokeRoundedGif01' icon.
  static const IconData strokeRoundedGif01 = HugeIconData(0x40b2);

  /// IconData for the 'strokeRoundedGif02' icon.
  static const IconData strokeRoundedGif02 = HugeIconData(0x40b3);

  /// IconData for the 'strokeRoundedGiftCard' icon.
  static const IconData strokeRoundedGiftCard = HugeIconData(0x40b4);

  /// IconData for the 'strokeRoundedGift' icon.
  static const IconData strokeRoundedGift = HugeIconData(0x40b5);

  /// IconData for the 'strokeRoundedGitBranch' icon.
  static const IconData strokeRoundedGitBranch = HugeIconData(0x40b6);

  /// IconData for the 'strokeRoundedGitCommit' icon.
  static const IconData strokeRoundedGitCommit = HugeIconData(0x40b7);

  /// IconData for the 'strokeRoundedGitCompare' icon.
  static const IconData strokeRoundedGitCompare = HugeIconData(0x40b8);

  /// IconData for the 'strokeRoundedGitFork' icon.
  static const IconData strokeRoundedGitFork = HugeIconData(0x40b9);

  /// IconData for the 'strokeRoundedGitMerge' icon.
  static const IconData strokeRoundedGitMerge = HugeIconData(0x40ba);

  /// IconData for the 'strokeRoundedGitPullRequestClosed' icon.
  static const IconData strokeRoundedGitPullRequestClosed =
      HugeIconData(0x40bb);

  /// IconData for the 'strokeRoundedGitPullRequestDraft' icon.
  static const IconData strokeRoundedGitPullRequestDraft = HugeIconData(0x40bc);

  /// IconData for the 'strokeRoundedGitPullRequest' icon.
  static const IconData strokeRoundedGitPullRequest = HugeIconData(0x40bd);

  /// IconData for the 'strokeRoundedGitbook' icon.
  static const IconData strokeRoundedGitbook = HugeIconData(0x40be);

  /// IconData for the 'strokeRoundedGithub01' icon.
  static const IconData strokeRoundedGithub01 = HugeIconData(0x40bf);

  /// IconData for the 'strokeRoundedGithub' icon.
  static const IconData strokeRoundedGithub = HugeIconData(0x40c0);

  /// IconData for the 'strokeRoundedGitlab' icon.
  static const IconData strokeRoundedGitlab = HugeIconData(0x40c1);

  /// IconData for the 'strokeRoundedGiveBlood' icon.
  static const IconData strokeRoundedGiveBlood = HugeIconData(0x40c2);

  /// IconData for the 'strokeRoundedGivePill' icon.
  static const IconData strokeRoundedGivePill = HugeIconData(0x40c3);

  /// IconData for the 'strokeRoundedGlasses' icon.
  static const IconData strokeRoundedGlasses = HugeIconData(0x40c4);

  /// IconData for the 'strokeRoundedGlobalEditing' icon.
  static const IconData strokeRoundedGlobalEditing = HugeIconData(0x40c5);

  /// IconData for the 'strokeRoundedGlobalEducation' icon.
  static const IconData strokeRoundedGlobalEducation = HugeIconData(0x40c6);

  /// IconData for the 'strokeRoundedGlobalRefresh' icon.
  static const IconData strokeRoundedGlobalRefresh = HugeIconData(0x40c7);

  /// IconData for the 'strokeRoundedGlobalSearch' icon.
  static const IconData strokeRoundedGlobalSearch = HugeIconData(0x40c8);

  /// IconData for the 'strokeRoundedGlobal' icon.
  static const IconData strokeRoundedGlobal = HugeIconData(0x40c9);

  /// IconData for the 'strokeRoundedGlobe02' icon.
  static const IconData strokeRoundedGlobe02 = HugeIconData(0x40ca);

  /// IconData for the 'strokeRoundedGlobe' icon.
  static const IconData strokeRoundedGlobe = HugeIconData(0x40cb);

  /// IconData for the 'strokeRoundedGlove' icon.
  static const IconData strokeRoundedGlove = HugeIconData(0x40cc);

  /// IconData for the 'strokeRoundedGoBackward10Sec' icon.
  static const IconData strokeRoundedGoBackward10Sec = HugeIconData(0x40cd);

  /// IconData for the 'strokeRoundedGoBackward15Sec' icon.
  static const IconData strokeRoundedGoBackward15Sec = HugeIconData(0x40ce);

  /// IconData for the 'strokeRoundedGoBackward30Sec' icon.
  static const IconData strokeRoundedGoBackward30Sec = HugeIconData(0x40cf);

  /// IconData for the 'strokeRoundedGoBackward5Sec' icon.
  static const IconData strokeRoundedGoBackward5Sec = HugeIconData(0x40d0);

  /// IconData for the 'strokeRoundedGoBackward60Sec' icon.
  static const IconData strokeRoundedGoBackward60Sec = HugeIconData(0x40d1);

  /// IconData for the 'strokeRoundedGoForward10Sec' icon.
  static const IconData strokeRoundedGoForward10Sec = HugeIconData(0x40d2);

  /// IconData for the 'strokeRoundedGoForward15Sec' icon.
  static const IconData strokeRoundedGoForward15Sec = HugeIconData(0x40d3);

  /// IconData for the 'strokeRoundedGoForward30Sec' icon.
  static const IconData strokeRoundedGoForward30Sec = HugeIconData(0x40d4);

  /// IconData for the 'strokeRoundedGoForward5Sec' icon.
  static const IconData strokeRoundedGoForward5Sec = HugeIconData(0x40d5);

  /// IconData for the 'strokeRoundedGoForward60Sec' icon.
  static const IconData strokeRoundedGoForward60Sec = HugeIconData(0x40d6);

  /// IconData for the 'strokeRoundedGoldIngots' icon.
  static const IconData strokeRoundedGoldIngots = HugeIconData(0x40d7);

  /// IconData for the 'strokeRoundedGold' icon.
  static const IconData strokeRoundedGold = HugeIconData(0x40d8);

  /// IconData for the 'strokeRoundedGolfBall' icon.
  static const IconData strokeRoundedGolfBall = HugeIconData(0x40d9);

  /// IconData for the 'strokeRoundedGolfBat' icon.
  static const IconData strokeRoundedGolfBat = HugeIconData(0x40da);

  /// IconData for the 'strokeRoundedGolfCart' icon.
  static const IconData strokeRoundedGolfCart = HugeIconData(0x40db);

  /// IconData for the 'strokeRoundedGolfHole' icon.
  static const IconData strokeRoundedGolfHole = HugeIconData(0x40dc);

  /// IconData for the 'strokeRoundedGoogleDoc' icon.
  static const IconData strokeRoundedGoogleDoc = HugeIconData(0x40dd);

  /// IconData for the 'strokeRoundedGoogleDrive' icon.
  static const IconData strokeRoundedGoogleDrive = HugeIconData(0x40de);

  /// IconData for the 'strokeRoundedGoogleGemini' icon.
  static const IconData strokeRoundedGoogleGemini = HugeIconData(0x40df);

  /// IconData for the 'strokeRoundedGoogleHome' icon.
  static const IconData strokeRoundedGoogleHome = HugeIconData(0x40e0);

  /// IconData for the 'strokeRoundedGoogleLens' icon.
  static const IconData strokeRoundedGoogleLens = HugeIconData(0x40e1);

  /// IconData for the 'strokeRoundedGoogleMaps' icon.
  static const IconData strokeRoundedGoogleMaps = HugeIconData(0x40e2);

  /// IconData for the 'strokeRoundedGooglePhotos' icon.
  static const IconData strokeRoundedGooglePhotos = HugeIconData(0x40e3);

  /// IconData for the 'strokeRoundedGoogleSheet' icon.
  static const IconData strokeRoundedGoogleSheet = HugeIconData(0x40e4);

  /// IconData for the 'strokeRoundedGoogle' icon.
  static const IconData strokeRoundedGoogle = HugeIconData(0x40e5);

  /// IconData for the 'strokeRoundedGps01' icon.
  static const IconData strokeRoundedGps01 = HugeIconData(0x40e6);

  /// IconData for the 'strokeRoundedGps02' icon.
  static const IconData strokeRoundedGps02 = HugeIconData(0x40e7);

  /// IconData for the 'strokeRoundedGpsDisconnected' icon.
  static const IconData strokeRoundedGpsDisconnected = HugeIconData(0x40e8);

  /// IconData for the 'strokeRoundedGpsOff01' icon.
  static const IconData strokeRoundedGpsOff01 = HugeIconData(0x40e9);

  /// IconData for the 'strokeRoundedGpsOff02' icon.
  static const IconData strokeRoundedGpsOff02 = HugeIconData(0x40ea);

  /// IconData for the 'strokeRoundedGpsSignal01' icon.
  static const IconData strokeRoundedGpsSignal01 = HugeIconData(0x40eb);

  /// IconData for the 'strokeRoundedGpsSignal02' icon.
  static const IconData strokeRoundedGpsSignal02 = HugeIconData(0x40ec);

  /// IconData for the 'strokeRoundedGpu' icon.
  static const IconData strokeRoundedGpu = HugeIconData(0x40ed);

  /// IconData for the 'strokeRoundedGraduateFemale' icon.
  static const IconData strokeRoundedGraduateFemale = HugeIconData(0x40ee);

  /// IconData for the 'strokeRoundedGraduateMale' icon.
  static const IconData strokeRoundedGraduateMale = HugeIconData(0x40ef);

  /// IconData for the 'strokeRoundedGraduationScroll' icon.
  static const IconData strokeRoundedGraduationScroll = HugeIconData(0x40f0);

  /// IconData for the 'strokeRoundedGrapes' icon.
  static const IconData strokeRoundedGrapes = HugeIconData(0x40f1);

  /// IconData for the 'strokeRoundedGravity' icon.
  static const IconData strokeRoundedGravity = HugeIconData(0x40f2);

  /// IconData for the 'strokeRoundedGreaterThanCircle' icon.
  static const IconData strokeRoundedGreaterThanCircle = HugeIconData(0x40f3);

  /// IconData for the 'strokeRoundedGreaterThanSquare' icon.
  static const IconData strokeRoundedGreaterThanSquare = HugeIconData(0x40f4);

  /// IconData for the 'strokeRoundedGreaterThan' icon.
  static const IconData strokeRoundedGreaterThan = HugeIconData(0x40f5);

  /// IconData for the 'strokeRoundedGreekHelmet' icon.
  static const IconData strokeRoundedGreekHelmet = HugeIconData(0x40f6);

  /// IconData for the 'strokeRoundedGreenHouse' icon.
  static const IconData strokeRoundedGreenHouse = HugeIconData(0x40f7);

  /// IconData for the 'strokeRoundedGridOff' icon.
  static const IconData strokeRoundedGridOff = HugeIconData(0x40f8);

  /// IconData for the 'strokeRoundedGridTable' icon.
  static const IconData strokeRoundedGridTable = HugeIconData(0x40f9);

  /// IconData for the 'strokeRoundedGridView' icon.
  static const IconData strokeRoundedGridView = HugeIconData(0x40fa);

  /// IconData for the 'strokeRoundedGrid' icon.
  static const IconData strokeRoundedGrid = HugeIconData(0x40fb);

  /// IconData for the 'strokeRoundedGrimacing' icon.
  static const IconData strokeRoundedGrimacing = HugeIconData(0x40fc);

  /// IconData for the 'strokeRoundedGrinning' icon.
  static const IconData strokeRoundedGrinning = HugeIconData(0x40fd);

  /// IconData for the 'strokeRoundedGrok' icon.
  static const IconData strokeRoundedGrok = HugeIconData(0x40fe);

  /// IconData for the 'strokeRoundedGroupItems' icon.
  static const IconData strokeRoundedGroupItems = HugeIconData(0x40ff);

  /// IconData for the 'strokeRoundedGroupLayers' icon.
  static const IconData strokeRoundedGroupLayers = HugeIconData(0x4100);

  /// IconData for the 'strokeRoundedGuestHouse' icon.
  static const IconData strokeRoundedGuestHouse = HugeIconData(0x4101);

  /// IconData for the 'strokeRoundedGun' icon.
  static const IconData strokeRoundedGun = HugeIconData(0x4102);

  /// IconData for the 'strokeRoundedGymnasticRings' icon.
  static const IconData strokeRoundedGymnasticRings = HugeIconData(0x4103);

  /// IconData for the 'strokeRoundedGymnastic' icon.
  static const IconData strokeRoundedGymnastic = HugeIconData(0x4104);

  /// IconData for the 'strokeRoundedHackerrank' icon.
  static const IconData strokeRoundedHackerrank = HugeIconData(0x4105);

  /// IconData for the 'strokeRoundedHairClips' icon.
  static const IconData strokeRoundedHairClips = HugeIconData(0x4106);

  /// IconData for the 'strokeRoundedHairDryer' icon.
  static const IconData strokeRoundedHairDryer = HugeIconData(0x4107);

  /// IconData for the 'strokeRoundedHaji' icon.
  static const IconData strokeRoundedHaji = HugeIconData(0x4108);

  /// IconData for the 'strokeRoundedHalal' icon.
  static const IconData strokeRoundedHalal = HugeIconData(0x4109);

  /// IconData for the 'strokeRoundedHamburger01' icon.
  static const IconData strokeRoundedHamburger01 = HugeIconData(0x410a);

  /// IconData for the 'strokeRoundedHamburger02' icon.
  static const IconData strokeRoundedHamburger02 = HugeIconData(0x410b);

  /// IconData for the 'strokeRoundedHandBag01' icon.
  static const IconData strokeRoundedHandBag01 = HugeIconData(0x410c);

  /// IconData for the 'strokeRoundedHandBag02' icon.
  static const IconData strokeRoundedHandBag02 = HugeIconData(0x410d);

  /// IconData for the 'strokeRoundedHandBeater' icon.
  static const IconData strokeRoundedHandBeater = HugeIconData(0x410e);

  /// IconData for the 'strokeRoundedHandGrip' icon.
  static const IconData strokeRoundedHandGrip = HugeIconData(0x410f);

  /// IconData for the 'strokeRoundedHandPointingDown01' icon.
  static const IconData strokeRoundedHandPointingDown01 = HugeIconData(0x4110);

  /// IconData for the 'strokeRoundedHandPointingDown02' icon.
  static const IconData strokeRoundedHandPointingDown02 = HugeIconData(0x4111);

  /// IconData for the 'strokeRoundedHandPointingDown03' icon.
  static const IconData strokeRoundedHandPointingDown03 = HugeIconData(0x4112);

  /// IconData for the 'strokeRoundedHandPointingDown04' icon.
  static const IconData strokeRoundedHandPointingDown04 = HugeIconData(0x4113);

  /// IconData for the 'strokeRoundedHandPointingLeft01' icon.
  static const IconData strokeRoundedHandPointingLeft01 = HugeIconData(0x4114);

  /// IconData for the 'strokeRoundedHandPointingLeft02' icon.
  static const IconData strokeRoundedHandPointingLeft02 = HugeIconData(0x4115);

  /// IconData for the 'strokeRoundedHandPointingLeft03' icon.
  static const IconData strokeRoundedHandPointingLeft03 = HugeIconData(0x4116);

  /// IconData for the 'strokeRoundedHandPointingLeft04' icon.
  static const IconData strokeRoundedHandPointingLeft04 = HugeIconData(0x4117);

  /// IconData for the 'strokeRoundedHandPointingRight01' icon.
  static const IconData strokeRoundedHandPointingRight01 = HugeIconData(0x4118);

  /// IconData for the 'strokeRoundedHandPointingRight02' icon.
  static const IconData strokeRoundedHandPointingRight02 = HugeIconData(0x4119);

  /// IconData for the 'strokeRoundedHandPointingRight03' icon.
  static const IconData strokeRoundedHandPointingRight03 = HugeIconData(0x411a);

  /// IconData for the 'strokeRoundedHandPointingRight04' icon.
  static const IconData strokeRoundedHandPointingRight04 = HugeIconData(0x411b);

  /// IconData for the 'strokeRoundedHandPrayer' icon.
  static const IconData strokeRoundedHandPrayer = HugeIconData(0x411c);

  /// IconData for the 'strokeRoundedHandSanitizer' icon.
  static const IconData strokeRoundedHandSanitizer = HugeIconData(0x411d);

  /// IconData for the 'strokeRoundedHandcuffs' icon.
  static const IconData strokeRoundedHandcuffs = HugeIconData(0x411e);

  /// IconData for the 'strokeRoundedHanger' icon.
  static const IconData strokeRoundedHanger = HugeIconData(0x411f);

  /// IconData for the 'strokeRoundedHangingClock' icon.
  static const IconData strokeRoundedHangingClock = HugeIconData(0x4120);

  /// IconData for the 'strokeRoundedHangout' icon.
  static const IconData strokeRoundedHangout = HugeIconData(0x4121);

  /// IconData for the 'strokeRoundedHappy' icon.
  static const IconData strokeRoundedHappy = HugeIconData(0x4122);

  /// IconData for the 'strokeRoundedHardDrive' icon.
  static const IconData strokeRoundedHardDrive = HugeIconData(0x4123);

  /// IconData for the 'strokeRoundedHdd' icon.
  static const IconData strokeRoundedHdd = HugeIconData(0x4124);

  /// IconData for the 'strokeRoundedHdr01' icon.
  static const IconData strokeRoundedHdr01 = HugeIconData(0x4125);

  /// IconData for the 'strokeRoundedHdr02' icon.
  static const IconData strokeRoundedHdr02 = HugeIconData(0x4126);

  /// IconData for the 'strokeRoundedHeading01' icon.
  static const IconData strokeRoundedHeading01 = HugeIconData(0x4127);

  /// IconData for the 'strokeRoundedHeading02' icon.
  static const IconData strokeRoundedHeading02 = HugeIconData(0x4128);

  /// IconData for the 'strokeRoundedHeading03' icon.
  static const IconData strokeRoundedHeading03 = HugeIconData(0x4129);

  /// IconData for the 'strokeRoundedHeading04' icon.
  static const IconData strokeRoundedHeading04 = HugeIconData(0x412a);

  /// IconData for the 'strokeRoundedHeading05' icon.
  static const IconData strokeRoundedHeading05 = HugeIconData(0x412b);

  /// IconData for the 'strokeRoundedHeading06' icon.
  static const IconData strokeRoundedHeading06 = HugeIconData(0x412c);

  /// IconData for the 'strokeRoundedHeading' icon.
  static const IconData strokeRoundedHeading = HugeIconData(0x412d);

  /// IconData for the 'strokeRoundedHeadphoneMute' icon.
  static const IconData strokeRoundedHeadphoneMute = HugeIconData(0x412e);

  /// IconData for the 'strokeRoundedHeadphones' icon.
  static const IconData strokeRoundedHeadphones = HugeIconData(0x412f);

  /// IconData for the 'strokeRoundedHeadsetConnected' icon.
  static const IconData strokeRoundedHeadsetConnected = HugeIconData(0x4130);

  /// IconData for the 'strokeRoundedHeadsetOff' icon.
  static const IconData strokeRoundedHeadsetOff = HugeIconData(0x4131);

  /// IconData for the 'strokeRoundedHeadset' icon.
  static const IconData strokeRoundedHeadset = HugeIconData(0x4132);

  /// IconData for the 'strokeRoundedHealtcare' icon.
  static const IconData strokeRoundedHealtcare = HugeIconData(0x4133);

  /// IconData for the 'strokeRoundedHealth' icon.
  static const IconData strokeRoundedHealth = HugeIconData(0x4134);

  /// IconData for the 'strokeRoundedHeartAdd' icon.
  static const IconData strokeRoundedHeartAdd = HugeIconData(0x4135);

  /// IconData for the 'strokeRoundedHeartCheck' icon.
  static const IconData strokeRoundedHeartCheck = HugeIconData(0x4136);

  /// IconData for the 'strokeRoundedHeartRemove' icon.
  static const IconData strokeRoundedHeartRemove = HugeIconData(0x4137);

  /// IconData for the 'strokeRoundedHeartbreak' icon.
  static const IconData strokeRoundedHeartbreak = HugeIconData(0x4138);

  /// IconData for the 'strokeRoundedHelicopter' icon.
  static const IconData strokeRoundedHelicopter = HugeIconData(0x4139);

  /// IconData for the 'strokeRoundedHelpCircle' icon.
  static const IconData strokeRoundedHelpCircle = HugeIconData(0x413a);

  /// IconData for the 'strokeRoundedHelpSquare' icon.
  static const IconData strokeRoundedHelpSquare = HugeIconData(0x413b);

  /// IconData for the 'strokeRoundedHexagon01' icon.
  static const IconData strokeRoundedHexagon01 = HugeIconData(0x413c);

  /// IconData for the 'strokeRoundedHexagon' icon.
  static const IconData strokeRoundedHexagon = HugeIconData(0x413d);

  /// IconData for the 'strokeRoundedHierarchyCircle01' icon.
  static const IconData strokeRoundedHierarchyCircle01 = HugeIconData(0x413e);

  /// IconData for the 'strokeRoundedHierarchyCircle02' icon.
  static const IconData strokeRoundedHierarchyCircle02 = HugeIconData(0x413f);

  /// IconData for the 'strokeRoundedHierarchyCircle03' icon.
  static const IconData strokeRoundedHierarchyCircle03 = HugeIconData(0x4140);

  /// IconData for the 'strokeRoundedHierarchyFiles' icon.
  static const IconData strokeRoundedHierarchyFiles = HugeIconData(0x4141);

  /// IconData for the 'strokeRoundedHierarchySquare01' icon.
  static const IconData strokeRoundedHierarchySquare01 = HugeIconData(0x4142);

  /// IconData for the 'strokeRoundedHierarchySquare02' icon.
  static const IconData strokeRoundedHierarchySquare02 = HugeIconData(0x4143);

  /// IconData for the 'strokeRoundedHierarchySquare03' icon.
  static const IconData strokeRoundedHierarchySquare03 = HugeIconData(0x4144);

  /// IconData for the 'strokeRoundedHierarchySquare04' icon.
  static const IconData strokeRoundedHierarchySquare04 = HugeIconData(0x4145);

  /// IconData for the 'strokeRoundedHierarchySquare05' icon.
  static const IconData strokeRoundedHierarchySquare05 = HugeIconData(0x4146);

  /// IconData for the 'strokeRoundedHierarchySquare06' icon.
  static const IconData strokeRoundedHierarchySquare06 = HugeIconData(0x4147);

  /// IconData for the 'strokeRoundedHierarchySquare07' icon.
  static const IconData strokeRoundedHierarchySquare07 = HugeIconData(0x4148);

  /// IconData for the 'strokeRoundedHierarchySquare08' icon.
  static const IconData strokeRoundedHierarchySquare08 = HugeIconData(0x4149);

  /// IconData for the 'strokeRoundedHierarchySquare10' icon.
  static const IconData strokeRoundedHierarchySquare10 = HugeIconData(0x414a);

  /// IconData for the 'strokeRoundedHierarchy' icon.
  static const IconData strokeRoundedHierarchy = HugeIconData(0x414b);

  /// IconData for the 'strokeRoundedHighHeels01' icon.
  static const IconData strokeRoundedHighHeels01 = HugeIconData(0x414c);

  /// IconData for the 'strokeRoundedHighHeels02' icon.
  static const IconData strokeRoundedHighHeels02 = HugeIconData(0x414d);

  /// IconData for the 'strokeRoundedHijab' icon.
  static const IconData strokeRoundedHijab = HugeIconData(0x414e);

  /// IconData for the 'strokeRoundedHockey' icon.
  static const IconData strokeRoundedHockey = HugeIconData(0x414f);

  /// IconData for the 'strokeRoundedHold01' icon.
  static const IconData strokeRoundedHold01 = HugeIconData(0x4150);

  /// IconData for the 'strokeRoundedHold02' icon.
  static const IconData strokeRoundedHold02 = HugeIconData(0x4151);

  /// IconData for the 'strokeRoundedHold03' icon.
  static const IconData strokeRoundedHold03 = HugeIconData(0x4152);

  /// IconData for the 'strokeRoundedHold04' icon.
  static const IconData strokeRoundedHold04 = HugeIconData(0x4153);

  /// IconData for the 'strokeRoundedHold05' icon.
  static const IconData strokeRoundedHold05 = HugeIconData(0x4154);

  /// IconData for the 'strokeRoundedHoldLocked01' icon.
  static const IconData strokeRoundedHoldLocked01 = HugeIconData(0x4155);

  /// IconData for the 'strokeRoundedHoldLocked02' icon.
  static const IconData strokeRoundedHoldLocked02 = HugeIconData(0x4156);

  /// IconData for the 'strokeRoundedHoldPhone' icon.
  static const IconData strokeRoundedHoldPhone = HugeIconData(0x4157);

  /// IconData for the 'strokeRoundedHologram' icon.
  static const IconData strokeRoundedHologram = HugeIconData(0x4158);

  /// IconData for the 'strokeRoundedHome01' icon.
  static const IconData strokeRoundedHome01 = HugeIconData(0x4159);

  /// IconData for the 'strokeRoundedHome02' icon.
  static const IconData strokeRoundedHome02 = HugeIconData(0x415a);

  /// IconData for the 'strokeRoundedHome03' icon.
  static const IconData strokeRoundedHome03 = HugeIconData(0x415b);

  /// IconData for the 'strokeRoundedHome04' icon.
  static const IconData strokeRoundedHome04 = HugeIconData(0x415c);

  /// IconData for the 'strokeRoundedHome05' icon.
  static const IconData strokeRoundedHome05 = HugeIconData(0x415d);

  /// IconData for the 'strokeRoundedHome06' icon.
  static const IconData strokeRoundedHome06 = HugeIconData(0x415e);

  /// IconData for the 'strokeRoundedHome07' icon.
  static const IconData strokeRoundedHome07 = HugeIconData(0x415f);

  /// IconData for the 'strokeRoundedHome08' icon.
  static const IconData strokeRoundedHome08 = HugeIconData(0x4160);

  /// IconData for the 'strokeRoundedHome09' icon.
  static const IconData strokeRoundedHome09 = HugeIconData(0x4161);

  /// IconData for the 'strokeRoundedHome10' icon.
  static const IconData strokeRoundedHome10 = HugeIconData(0x4162);

  /// IconData for the 'strokeRoundedHome11' icon.
  static const IconData strokeRoundedHome11 = HugeIconData(0x4163);

  /// IconData for the 'strokeRoundedHome12' icon.
  static const IconData strokeRoundedHome12 = HugeIconData(0x4164);

  /// IconData for the 'strokeRoundedHome13' icon.
  static const IconData strokeRoundedHome13 = HugeIconData(0x4165);

  /// IconData for the 'strokeRoundedHomeWifi' icon.
  static const IconData strokeRoundedHomeWifi = HugeIconData(0x4166);

  /// IconData for the 'strokeRoundedHoney01' icon.
  static const IconData strokeRoundedHoney01 = HugeIconData(0x4167);

  /// IconData for the 'strokeRoundedHoney02' icon.
  static const IconData strokeRoundedHoney02 = HugeIconData(0x4168);

  /// IconData for the 'strokeRoundedHonor' icon.
  static const IconData strokeRoundedHonor = HugeIconData(0x4169);

  /// IconData for the 'strokeRoundedHonourStar' icon.
  static const IconData strokeRoundedHonourStar = HugeIconData(0x416a);

  /// IconData for the 'strokeRoundedHoodie' icon.
  static const IconData strokeRoundedHoodie = HugeIconData(0x416b);

  /// IconData for the 'strokeRoundedHorizonalScrollPoint' icon.
  static const IconData strokeRoundedHorizonalScrollPoint =
      HugeIconData(0x416c);

  /// IconData for the 'strokeRoundedHorizontalResize' icon.
  static const IconData strokeRoundedHorizontalResize = HugeIconData(0x416d);

  /// IconData for the 'strokeRoundedHospital01' icon.
  static const IconData strokeRoundedHospital01 = HugeIconData(0x416e);

  /// IconData for the 'strokeRoundedHospital02' icon.
  static const IconData strokeRoundedHospital02 = HugeIconData(0x416f);

  /// IconData for the 'strokeRoundedHospitalBed01' icon.
  static const IconData strokeRoundedHospitalBed01 = HugeIconData(0x4170);

  /// IconData for the 'strokeRoundedHospitalBed02' icon.
  static const IconData strokeRoundedHospitalBed02 = HugeIconData(0x4171);

  /// IconData for the 'strokeRoundedHospitalLocation' icon.
  static const IconData strokeRoundedHospitalLocation = HugeIconData(0x4172);

  /// IconData for the 'strokeRoundedHotAirBalloon' icon.
  static const IconData strokeRoundedHotAirBalloon = HugeIconData(0x4173);

  /// IconData for the 'strokeRoundedHotPrice' icon.
  static const IconData strokeRoundedHotPrice = HugeIconData(0x4174);

  /// IconData for the 'strokeRoundedHotTube' icon.
  static const IconData strokeRoundedHotTube = HugeIconData(0x4175);

  /// IconData for the 'strokeRoundedHotdog' icon.
  static const IconData strokeRoundedHotdog = HugeIconData(0x4176);

  /// IconData for the 'strokeRoundedHotel01' icon.
  static const IconData strokeRoundedHotel01 = HugeIconData(0x4177);

  /// IconData for the 'strokeRoundedHotel02' icon.
  static const IconData strokeRoundedHotel02 = HugeIconData(0x4178);

  /// IconData for the 'strokeRoundedHotspotOffline' icon.
  static const IconData strokeRoundedHotspotOffline = HugeIconData(0x4179);

  /// IconData for the 'strokeRoundedHotspot' icon.
  static const IconData strokeRoundedHotspot = HugeIconData(0x417a);

  /// IconData for the 'strokeRoundedHourglassOff' icon.
  static const IconData strokeRoundedHourglassOff = HugeIconData(0x417b);

  /// IconData for the 'strokeRoundedHourglass' icon.
  static const IconData strokeRoundedHourglass = HugeIconData(0x417c);

  /// IconData for the 'strokeRoundedHouse01' icon.
  static const IconData strokeRoundedHouse01 = HugeIconData(0x417d);

  /// IconData for the 'strokeRoundedHouse02' icon.
  static const IconData strokeRoundedHouse02 = HugeIconData(0x417e);

  /// IconData for the 'strokeRoundedHouse03' icon.
  static const IconData strokeRoundedHouse03 = HugeIconData(0x417f);

  /// IconData for the 'strokeRoundedHouse04' icon.
  static const IconData strokeRoundedHouse04 = HugeIconData(0x4180);

  /// IconData for the 'strokeRoundedHouse05' icon.
  static const IconData strokeRoundedHouse05 = HugeIconData(0x4181);

  /// IconData for the 'strokeRoundedHouseSolarPanel' icon.
  static const IconData strokeRoundedHouseSolarPanel = HugeIconData(0x4182);

  /// IconData for the 'strokeRoundedHtml5' icon.
  static const IconData strokeRoundedHtml5 = HugeIconData(0x4183);

  /// IconData for the 'strokeRoundedHumidity' icon.
  static const IconData strokeRoundedHumidity = HugeIconData(0x4184);

  /// IconData for the 'strokeRoundedHut' icon.
  static const IconData strokeRoundedHut = HugeIconData(0x4185);

  /// IconData for the 'strokeRoundedHydroPower' icon.
  static const IconData strokeRoundedHydroPower = HugeIconData(0x4186);

  /// IconData for the 'strokeRoundedHyperbole' icon.
  static const IconData strokeRoundedHyperbole = HugeIconData(0x4187);

  /// IconData for the 'strokeRoundedIceCream01' icon.
  static const IconData strokeRoundedIceCream01 = HugeIconData(0x4188);

  /// IconData for the 'strokeRoundedIceCream02' icon.
  static const IconData strokeRoundedIceCream02 = HugeIconData(0x4189);

  /// IconData for the 'strokeRoundedIceCream03' icon.
  static const IconData strokeRoundedIceCream03 = HugeIconData(0x418a);

  /// IconData for the 'strokeRoundedIceCream04' icon.
  static const IconData strokeRoundedIceCream04 = HugeIconData(0x418b);

  /// IconData for the 'strokeRoundedIceHockey' icon.
  static const IconData strokeRoundedIceHockey = HugeIconData(0x418c);

  /// IconData for the 'strokeRoundedIceSkating' icon.
  static const IconData strokeRoundedIceSkating = HugeIconData(0x418d);

  /// IconData for the 'strokeRoundedIco' icon.
  static const IconData strokeRoundedIco = HugeIconData(0x418e);

  /// IconData for the 'strokeRoundedIconjar' icon.
  static const IconData strokeRoundedIconjar = HugeIconData(0x418f);

  /// IconData for the 'strokeRoundedIdNotVerified' icon.
  static const IconData strokeRoundedIdNotVerified = HugeIconData(0x4190);

  /// IconData for the 'strokeRoundedIdVerified' icon.
  static const IconData strokeRoundedIdVerified = HugeIconData(0x4191);

  /// IconData for the 'strokeRoundedId' icon.
  static const IconData strokeRoundedId = HugeIconData(0x4192);

  /// IconData for the 'strokeRoundedIdea01' icon.
  static const IconData strokeRoundedIdea01 = HugeIconData(0x4193);

  /// IconData for the 'strokeRoundedIdea' icon.
  static const IconData strokeRoundedIdea = HugeIconData(0x4194);

  /// IconData for the 'strokeRoundedIdentification' icon.
  static const IconData strokeRoundedIdentification = HugeIconData(0x4195);

  /// IconData for the 'strokeRoundedIdentityCard' icon.
  static const IconData strokeRoundedIdentityCard = HugeIconData(0x4196);

  /// IconData for the 'strokeRoundedImage01' icon.
  static const IconData strokeRoundedImage01 = HugeIconData(0x4197);

  /// IconData for the 'strokeRoundedImage02' icon.
  static const IconData strokeRoundedImage02 = HugeIconData(0x4198);

  /// IconData for the 'strokeRoundedImageAdd01' icon.
  static const IconData strokeRoundedImageAdd01 = HugeIconData(0x4199);

  /// IconData for the 'strokeRoundedImageAdd02' icon.
  static const IconData strokeRoundedImageAdd02 = HugeIconData(0x419a);

  /// IconData for the 'strokeRoundedImageCompositionOval' icon.
  static const IconData strokeRoundedImageCompositionOval =
      HugeIconData(0x419b);

  /// IconData for the 'strokeRoundedImageComposition' icon.
  static const IconData strokeRoundedImageComposition = HugeIconData(0x419c);

  /// IconData for the 'strokeRoundedImageCrop' icon.
  static const IconData strokeRoundedImageCrop = HugeIconData(0x419d);

  /// IconData for the 'strokeRoundedImageDelete01' icon.
  static const IconData strokeRoundedImageDelete01 = HugeIconData(0x419e);

  /// IconData for the 'strokeRoundedImageDelete02' icon.
  static const IconData strokeRoundedImageDelete02 = HugeIconData(0x419f);

  /// IconData for the 'strokeRoundedImageDone01' icon.
  static const IconData strokeRoundedImageDone01 = HugeIconData(0x41a0);

  /// IconData for the 'strokeRoundedImageDone02' icon.
  static const IconData strokeRoundedImageDone02 = HugeIconData(0x41a1);

  /// IconData for the 'strokeRoundedImageDownload02' icon.
  static const IconData strokeRoundedImageDownload02 = HugeIconData(0x41a2);

  /// IconData for the 'strokeRoundedImageDownload' icon.
  static const IconData strokeRoundedImageDownload = HugeIconData(0x41a3);

  /// IconData for the 'strokeRoundedImageNotFound01' icon.
  static const IconData strokeRoundedImageNotFound01 = HugeIconData(0x41a4);

  /// IconData for the 'strokeRoundedImageNotFound02' icon.
  static const IconData strokeRoundedImageNotFound02 = HugeIconData(0x41a5);

  /// IconData for the 'strokeRoundedImageRemove01' icon.
  static const IconData strokeRoundedImageRemove01 = HugeIconData(0x41a6);

  /// IconData for the 'strokeRoundedImageRemove02' icon.
  static const IconData strokeRoundedImageRemove02 = HugeIconData(0x41a7);

  /// IconData for the 'strokeRoundedImageUpload01' icon.
  static const IconData strokeRoundedImageUpload01 = HugeIconData(0x41a8);

  /// IconData for the 'strokeRoundedImageUpload' icon.
  static const IconData strokeRoundedImageUpload = HugeIconData(0x41a9);

  /// IconData for the 'strokeRoundedImo' icon.
  static const IconData strokeRoundedImo = HugeIconData(0x41aa);

  /// IconData for the 'strokeRoundedImportantBook' icon.
  static const IconData strokeRoundedImportantBook = HugeIconData(0x41ab);

  /// IconData for the 'strokeRoundedInLove' icon.
  static const IconData strokeRoundedInLove = HugeIconData(0x41ac);

  /// IconData for the 'strokeRoundedInboxCheck' icon.
  static const IconData strokeRoundedInboxCheck = HugeIconData(0x41ad);

  /// IconData for the 'strokeRoundedInboxDownload' icon.
  static const IconData strokeRoundedInboxDownload = HugeIconData(0x41ae);

  /// IconData for the 'strokeRoundedInboxUnread' icon.
  static const IconData strokeRoundedInboxUnread = HugeIconData(0x41af);

  /// IconData for the 'strokeRoundedInboxUpload' icon.
  static const IconData strokeRoundedInboxUpload = HugeIconData(0x41b0);

  /// IconData for the 'strokeRoundedInbox' icon.
  static const IconData strokeRoundedInbox = HugeIconData(0x41b1);

  /// IconData for the 'strokeRoundedIncognito' icon.
  static const IconData strokeRoundedIncognito = HugeIconData(0x41b2);

  /// IconData for the 'strokeRoundedIndiaGate' icon.
  static const IconData strokeRoundedIndiaGate = HugeIconData(0x41b3);

  /// IconData for the 'strokeRoundedInequality01' icon.
  static const IconData strokeRoundedInequality01 = HugeIconData(0x41b4);

  /// IconData for the 'strokeRoundedInequality02' icon.
  static const IconData strokeRoundedInequality02 = HugeIconData(0x41b5);

  /// IconData for the 'strokeRoundedInequalityCircle01' icon.
  static const IconData strokeRoundedInequalityCircle01 = HugeIconData(0x41b6);

  /// IconData for the 'strokeRoundedInequalityCircle02' icon.
  static const IconData strokeRoundedInequalityCircle02 = HugeIconData(0x41b7);

  /// IconData for the 'strokeRoundedInequalitySquare01' icon.
  static const IconData strokeRoundedInequalitySquare01 = HugeIconData(0x41b8);

  /// IconData for the 'strokeRoundedInequalitySquare02' icon.
  static const IconData strokeRoundedInequalitySquare02 = HugeIconData(0x41b9);

  /// IconData for the 'strokeRoundedInfinity01' icon.
  static const IconData strokeRoundedInfinity01 = HugeIconData(0x41ba);

  /// IconData for the 'strokeRoundedInfinity02' icon.
  static const IconData strokeRoundedInfinity02 = HugeIconData(0x41bb);

  /// IconData for the 'strokeRoundedInfinityCircle' icon.
  static const IconData strokeRoundedInfinityCircle = HugeIconData(0x41bc);

  /// IconData for the 'strokeRoundedInfinitySquare' icon.
  static const IconData strokeRoundedInfinitySquare = HugeIconData(0x41bd);

  /// IconData for the 'strokeRoundedInformationCircle' icon.
  static const IconData strokeRoundedInformationCircle = HugeIconData(0x41be);

  /// IconData for the 'strokeRoundedInformationDiamond' icon.
  static const IconData strokeRoundedInformationDiamond = HugeIconData(0x41bf);

  /// IconData for the 'strokeRoundedInformationSquare' icon.
  static const IconData strokeRoundedInformationSquare = HugeIconData(0x41c0);

  /// IconData for the 'strokeRoundedInjection' icon.
  static const IconData strokeRoundedInjection = HugeIconData(0x41c1);

  /// IconData for the 'strokeRoundedInsertBottomImage' icon.
  static const IconData strokeRoundedInsertBottomImage = HugeIconData(0x41c2);

  /// IconData for the 'strokeRoundedInsertCenterImage' icon.
  static const IconData strokeRoundedInsertCenterImage = HugeIconData(0x41c3);

  /// IconData for the 'strokeRoundedInsertColumnLeft' icon.
  static const IconData strokeRoundedInsertColumnLeft = HugeIconData(0x41c4);

  /// IconData for the 'strokeRoundedInsertColumn' icon.
  static const IconData strokeRoundedInsertColumn = HugeIconData(0x41c5);

  /// IconData for the 'strokeRoundedInsertPi' icon.
  static const IconData strokeRoundedInsertPi = HugeIconData(0x41c6);

  /// IconData for the 'strokeRoundedInsertRowDown' icon.
  static const IconData strokeRoundedInsertRowDown = HugeIconData(0x41c7);

  /// IconData for the 'strokeRoundedInsertRowUp' icon.
  static const IconData strokeRoundedInsertRowUp = HugeIconData(0x41c8);

  /// IconData for the 'strokeRoundedInsertRow' icon.
  static const IconData strokeRoundedInsertRow = HugeIconData(0x41c9);

  /// IconData for the 'strokeRoundedInsertTopImage' icon.
  static const IconData strokeRoundedInsertTopImage = HugeIconData(0x41ca);

  /// IconData for the 'strokeRoundedInspectCode' icon.
  static const IconData strokeRoundedInspectCode = HugeIconData(0x41cb);

  /// IconData for the 'strokeRoundedInstagram' icon.
  static const IconData strokeRoundedInstagram = HugeIconData(0x41cc);

  /// IconData for the 'strokeRoundedInstallingUpdates01' icon.
  static const IconData strokeRoundedInstallingUpdates01 = HugeIconData(0x41cd);

  /// IconData for the 'strokeRoundedInstallingUpdates02' icon.
  static const IconData strokeRoundedInstallingUpdates02 = HugeIconData(0x41ce);

  /// IconData for the 'strokeRoundedInternetAntenna01' icon.
  static const IconData strokeRoundedInternetAntenna01 = HugeIconData(0x41cf);

  /// IconData for the 'strokeRoundedInternetAntenna02' icon.
  static const IconData strokeRoundedInternetAntenna02 = HugeIconData(0x41d0);

  /// IconData for the 'strokeRoundedInternetAntenna03' icon.
  static const IconData strokeRoundedInternetAntenna03 = HugeIconData(0x41d1);

  /// IconData for the 'strokeRoundedInternetAntenna04' icon.
  static const IconData strokeRoundedInternetAntenna04 = HugeIconData(0x41d2);

  /// IconData for the 'strokeRoundedInternet' icon.
  static const IconData strokeRoundedInternet = HugeIconData(0x41d3);

  /// IconData for the 'strokeRoundedInvestigation' icon.
  static const IconData strokeRoundedInvestigation = HugeIconData(0x41d4);

  /// IconData for the 'strokeRoundedInvoice01' icon.
  static const IconData strokeRoundedInvoice01 = HugeIconData(0x41d5);

  /// IconData for the 'strokeRoundedInvoice02' icon.
  static const IconData strokeRoundedInvoice02 = HugeIconData(0x41d6);

  /// IconData for the 'strokeRoundedInvoice03' icon.
  static const IconData strokeRoundedInvoice03 = HugeIconData(0x41d7);

  /// IconData for the 'strokeRoundedInvoice04' icon.
  static const IconData strokeRoundedInvoice04 = HugeIconData(0x41d8);

  /// IconData for the 'strokeRoundedInvoice' icon.
  static const IconData strokeRoundedInvoice = HugeIconData(0x41d9);

  /// IconData for the 'strokeRoundedIpod' icon.
  static const IconData strokeRoundedIpod = HugeIconData(0x41da);

  /// IconData for the 'strokeRoundedIrisScan' icon.
  static const IconData strokeRoundedIrisScan = HugeIconData(0x41db);

  /// IconData for the 'strokeRoundedIsland' icon.
  static const IconData strokeRoundedIsland = HugeIconData(0x41dc);

  /// IconData for the 'strokeRoundedJar' icon.
  static const IconData strokeRoundedJar = HugeIconData(0x41dd);

  /// IconData for the 'strokeRoundedJavaScript' icon.
  static const IconData strokeRoundedJavaScript = HugeIconData(0x41de);

  /// IconData for the 'strokeRoundedJava' icon.
  static const IconData strokeRoundedJava = HugeIconData(0x41df);

  /// IconData for the 'strokeRoundedJobLink' icon.
  static const IconData strokeRoundedJobLink = HugeIconData(0x41e0);

  /// IconData for the 'strokeRoundedJobSearch' icon.
  static const IconData strokeRoundedJobSearch = HugeIconData(0x41e1);

  /// IconData for the 'strokeRoundedJobShare' icon.
  static const IconData strokeRoundedJobShare = HugeIconData(0x41e2);

  /// IconData for the 'strokeRoundedJoggerPants' icon.
  static const IconData strokeRoundedJoggerPants = HugeIconData(0x41e3);

  /// IconData for the 'strokeRoundedJoinBevel' icon.
  static const IconData strokeRoundedJoinBevel = HugeIconData(0x41e4);

  /// IconData for the 'strokeRoundedJoinRound' icon.
  static const IconData strokeRoundedJoinRound = HugeIconData(0x41e5);

  /// IconData for the 'strokeRoundedJoinStraight' icon.
  static const IconData strokeRoundedJoinStraight = HugeIconData(0x41e6);

  /// IconData for the 'strokeRoundedJoker' icon.
  static const IconData strokeRoundedJoker = HugeIconData(0x41e7);

  /// IconData for the 'strokeRoundedJoystick01' icon.
  static const IconData strokeRoundedJoystick01 = HugeIconData(0x41e8);

  /// IconData for the 'strokeRoundedJoystick02' icon.
  static const IconData strokeRoundedJoystick02 = HugeIconData(0x41e9);

  /// IconData for the 'strokeRoundedJoystick03' icon.
  static const IconData strokeRoundedJoystick03 = HugeIconData(0x41ea);

  /// IconData for the 'strokeRoundedJoystick04' icon.
  static const IconData strokeRoundedJoystick04 = HugeIconData(0x41eb);

  /// IconData for the 'strokeRoundedJoystick05' icon.
  static const IconData strokeRoundedJoystick05 = HugeIconData(0x41ec);

  /// IconData for the 'strokeRoundedJpg01' icon.
  static const IconData strokeRoundedJpg01 = HugeIconData(0x41ed);

  /// IconData for the 'strokeRoundedJpg02' icon.
  static const IconData strokeRoundedJpg02 = HugeIconData(0x41ee);

  /// IconData for the 'strokeRoundedJsx01' icon.
  static const IconData strokeRoundedJsx01 = HugeIconData(0x41ef);

  /// IconData for the 'strokeRoundedJsx02' icon.
  static const IconData strokeRoundedJsx02 = HugeIconData(0x41f0);

  /// IconData for the 'strokeRoundedJsx03' icon.
  static const IconData strokeRoundedJsx03 = HugeIconData(0x41f1);

  /// IconData for the 'strokeRoundedJudge' icon.
  static const IconData strokeRoundedJudge = HugeIconData(0x41f2);

  /// IconData for the 'strokeRoundedJupiter' icon.
  static const IconData strokeRoundedJupiter = HugeIconData(0x41f3);

  /// IconData for the 'strokeRoundedJusticeScale01' icon.
  static const IconData strokeRoundedJusticeScale01 = HugeIconData(0x41f4);

  /// IconData for the 'strokeRoundedJusticeScale02' icon.
  static const IconData strokeRoundedJusticeScale02 = HugeIconData(0x41f5);

  /// IconData for the 'strokeRoundedKaaba01' icon.
  static const IconData strokeRoundedKaaba01 = HugeIconData(0x41f6);

  /// IconData for the 'strokeRoundedKaaba02' icon.
  static const IconData strokeRoundedKaaba02 = HugeIconData(0x41f7);

  /// IconData for the 'strokeRoundedKayak' icon.
  static const IconData strokeRoundedKayak = HugeIconData(0x41f8);

  /// IconData for the 'strokeRoundedKeffiyeh' icon.
  static const IconData strokeRoundedKeffiyeh = HugeIconData(0x41f9);

  /// IconData for the 'strokeRoundedKettle01' icon.
  static const IconData strokeRoundedKettle01 = HugeIconData(0x41fa);

  /// IconData for the 'strokeRoundedKettle' icon.
  static const IconData strokeRoundedKettle = HugeIconData(0x41fb);

  /// IconData for the 'strokeRoundedKettlebell' icon.
  static const IconData strokeRoundedKettlebell = HugeIconData(0x41fc);

  /// IconData for the 'strokeRoundedKetupat' icon.
  static const IconData strokeRoundedKetupat = HugeIconData(0x41fd);

  /// IconData for the 'strokeRoundedKey01' icon.
  static const IconData strokeRoundedKey01 = HugeIconData(0x41fe);

  /// IconData for the 'strokeRoundedKey02' icon.
  static const IconData strokeRoundedKey02 = HugeIconData(0x41ff);

  /// IconData for the 'strokeRoundedKeyGeneratorFob' icon.
  static const IconData strokeRoundedKeyGeneratorFob = HugeIconData(0x4200);

  /// IconData for the 'strokeRoundedKeyboard' icon.
  static const IconData strokeRoundedKeyboard = HugeIconData(0x4201);

  /// IconData for the 'strokeRoundedKeyframeAdd' icon.
  static const IconData strokeRoundedKeyframeAdd = HugeIconData(0x4202);

  /// IconData for the 'strokeRoundedKeyframeAlignCenter' icon.
  static const IconData strokeRoundedKeyframeAlignCenter = HugeIconData(0x4203);

  /// IconData for the 'strokeRoundedKeyframeAlignHorizontal' icon.
  static const IconData strokeRoundedKeyframeAlignHorizontal =
      HugeIconData(0x4204);

  /// IconData for the 'strokeRoundedKeyframeAlignVertical' icon.
  static const IconData strokeRoundedKeyframeAlignVertical =
      HugeIconData(0x4205);

  /// IconData for the 'strokeRoundedKeyframeBottom' icon.
  static const IconData strokeRoundedKeyframeBottom = HugeIconData(0x4206);

  /// IconData for the 'strokeRoundedKeyframeLeft' icon.
  static const IconData strokeRoundedKeyframeLeft = HugeIconData(0x4207);

  /// IconData for the 'strokeRoundedKeyframeRemove' icon.
  static const IconData strokeRoundedKeyframeRemove = HugeIconData(0x4208);

  /// IconData for the 'strokeRoundedKeyframeRight' icon.
  static const IconData strokeRoundedKeyframeRight = HugeIconData(0x4209);

  /// IconData for the 'strokeRoundedKeyframeTop' icon.
  static const IconData strokeRoundedKeyframeTop = HugeIconData(0x420a);

  /// IconData for the 'strokeRoundedKeyframe' icon.
  static const IconData strokeRoundedKeyframe = HugeIconData(0x420b);

  /// IconData for the 'strokeRoundedKeyframesDoubleAdd' icon.
  static const IconData strokeRoundedKeyframesDoubleAdd = HugeIconData(0x420c);

  /// IconData for the 'strokeRoundedKeyframesDoubleRemove' icon.
  static const IconData strokeRoundedKeyframesDoubleRemove =
      HugeIconData(0x420d);

  /// IconData for the 'strokeRoundedKeyframesDouble' icon.
  static const IconData strokeRoundedKeyframesDouble = HugeIconData(0x420e);

  /// IconData for the 'strokeRoundedKeyframesMultipleAdd' icon.
  static const IconData strokeRoundedKeyframesMultipleAdd =
      HugeIconData(0x420f);

  /// IconData for the 'strokeRoundedKeyframesMultipleRemove' icon.
  static const IconData strokeRoundedKeyframesMultipleRemove =
      HugeIconData(0x4210);

  /// IconData for the 'strokeRoundedKeyframesMultiple' icon.
  static const IconData strokeRoundedKeyframesMultiple = HugeIconData(0x4211);

  /// IconData for the 'strokeRoundedKickstarter01' icon.
  static const IconData strokeRoundedKickstarter01 = HugeIconData(0x4212);

  /// IconData for the 'strokeRoundedKickstarter02' icon.
  static const IconData strokeRoundedKickstarter02 = HugeIconData(0x4213);

  /// IconData for the 'strokeRoundedKid' icon.
  static const IconData strokeRoundedKid = HugeIconData(0x4214);

  /// IconData for the 'strokeRoundedKidneys' icon.
  static const IconData strokeRoundedKidneys = HugeIconData(0x4215);

  /// IconData for the 'strokeRoundedKissing' icon.
  static const IconData strokeRoundedKissing = HugeIconData(0x4216);

  /// IconData for the 'strokeRoundedKitchenUtensils' icon.
  static const IconData strokeRoundedKitchenUtensils = HugeIconData(0x4217);

  /// IconData for the 'strokeRoundedKite' icon.
  static const IconData strokeRoundedKite = HugeIconData(0x4218);

  /// IconData for the 'strokeRoundedKnife01' icon.
  static const IconData strokeRoundedKnife01 = HugeIconData(0x4219);

  /// IconData for the 'strokeRoundedKnife02' icon.
  static const IconData strokeRoundedKnife02 = HugeIconData(0x421a);

  /// IconData for the 'strokeRoundedKnifeBread' icon.
  static const IconData strokeRoundedKnifeBread = HugeIconData(0x421b);

  /// IconData for the 'strokeRoundedKnightShield' icon.
  static const IconData strokeRoundedKnightShield = HugeIconData(0x421c);

  /// IconData for the 'strokeRoundedKnives' icon.
  static const IconData strokeRoundedKnives = HugeIconData(0x421d);

  /// IconData for the 'strokeRoundedKnowledge01' icon.
  static const IconData strokeRoundedKnowledge01 = HugeIconData(0x421e);

  /// IconData for the 'strokeRoundedKnowledge02' icon.
  static const IconData strokeRoundedKnowledge02 = HugeIconData(0x421f);

  /// IconData for the 'strokeRoundedKurta01' icon.
  static const IconData strokeRoundedKurta01 = HugeIconData(0x4220);

  /// IconData for the 'strokeRoundedKurta' icon.
  static const IconData strokeRoundedKurta = HugeIconData(0x4221);

  /// IconData for the 'strokeRoundedLabelImportant' icon.
  static const IconData strokeRoundedLabelImportant = HugeIconData(0x4222);

  /// IconData for the 'strokeRoundedLabel' icon.
  static const IconData strokeRoundedLabel = HugeIconData(0x4223);

  /// IconData for the 'strokeRoundedLabor' icon.
  static const IconData strokeRoundedLabor = HugeIconData(0x4224);

  /// IconData for the 'strokeRoundedLabs' icon.
  static const IconData strokeRoundedLabs = HugeIconData(0x4225);

  /// IconData for the 'strokeRoundedLake' icon.
  static const IconData strokeRoundedLake = HugeIconData(0x4226);

  /// IconData for the 'strokeRoundedLamp01' icon.
  static const IconData strokeRoundedLamp01 = HugeIconData(0x4227);

  /// IconData for the 'strokeRoundedLamp02' icon.
  static const IconData strokeRoundedLamp02 = HugeIconData(0x4228);

  /// IconData for the 'strokeRoundedLamp03' icon.
  static const IconData strokeRoundedLamp03 = HugeIconData(0x4229);

  /// IconData for the 'strokeRoundedLamp04' icon.
  static const IconData strokeRoundedLamp04 = HugeIconData(0x422a);

  /// IconData for the 'strokeRoundedLamp05' icon.
  static const IconData strokeRoundedLamp05 = HugeIconData(0x422b);

  /// IconData for the 'strokeRoundedLamp' icon.
  static const IconData strokeRoundedLamp = HugeIconData(0x422c);

  /// IconData for the 'strokeRoundedLanguageCircle' icon.
  static const IconData strokeRoundedLanguageCircle = HugeIconData(0x422d);

  /// IconData for the 'strokeRoundedLanguageSkill' icon.
  static const IconData strokeRoundedLanguageSkill = HugeIconData(0x422e);

  /// IconData for the 'strokeRoundedLanguageSquare' icon.
  static const IconData strokeRoundedLanguageSquare = HugeIconData(0x422f);

  /// IconData for the 'strokeRoundedLantern' icon.
  static const IconData strokeRoundedLantern = HugeIconData(0x4230);

  /// IconData for the 'strokeRoundedLaptopAdd' icon.
  static const IconData strokeRoundedLaptopAdd = HugeIconData(0x4231);

  /// IconData for the 'strokeRoundedLaptopCharging' icon.
  static const IconData strokeRoundedLaptopCharging = HugeIconData(0x4232);

  /// IconData for the 'strokeRoundedLaptopCheck' icon.
  static const IconData strokeRoundedLaptopCheck = HugeIconData(0x4233);

  /// IconData for the 'strokeRoundedLaptopCloud' icon.
  static const IconData strokeRoundedLaptopCloud = HugeIconData(0x4234);

  /// IconData for the 'strokeRoundedLaptopIssue' icon.
  static const IconData strokeRoundedLaptopIssue = HugeIconData(0x4235);

  /// IconData for the 'strokeRoundedLaptopPerformance' icon.
  static const IconData strokeRoundedLaptopPerformance = HugeIconData(0x4236);

  /// IconData for the 'strokeRoundedLaptopPhoneSync' icon.
  static const IconData strokeRoundedLaptopPhoneSync = HugeIconData(0x4237);

  /// IconData for the 'strokeRoundedLaptopProgramming' icon.
  static const IconData strokeRoundedLaptopProgramming = HugeIconData(0x4238);

  /// IconData for the 'strokeRoundedLaptopRemove' icon.
  static const IconData strokeRoundedLaptopRemove = HugeIconData(0x4239);

  /// IconData for the 'strokeRoundedLaptopSettings' icon.
  static const IconData strokeRoundedLaptopSettings = HugeIconData(0x423a);

  /// IconData for the 'strokeRoundedLaptopVideo' icon.
  static const IconData strokeRoundedLaptopVideo = HugeIconData(0x423b);

  /// IconData for the 'strokeRoundedLaptop' icon.
  static const IconData strokeRoundedLaptop = HugeIconData(0x423c);

  /// IconData for the 'strokeRoundedLassoTool01' icon.
  static const IconData strokeRoundedLassoTool01 = HugeIconData(0x423d);

  /// IconData for the 'strokeRoundedLassoTool02' icon.
  static const IconData strokeRoundedLassoTool02 = HugeIconData(0x423e);

  /// IconData for the 'strokeRoundedLastFm' icon.
  static const IconData strokeRoundedLastFm = HugeIconData(0x423f);

  /// IconData for the 'strokeRoundedLatitude' icon.
  static const IconData strokeRoundedLatitude = HugeIconData(0x4240);

  /// IconData for the 'strokeRoundedLaughing' icon.
  static const IconData strokeRoundedLaughing = HugeIconData(0x4241);

  /// IconData for the 'strokeRoundedLaurelWreath01' icon.
  static const IconData strokeRoundedLaurelWreath01 = HugeIconData(0x4242);

  /// IconData for the 'strokeRoundedLaurelWreath02' icon.
  static const IconData strokeRoundedLaurelWreath02 = HugeIconData(0x4243);

  /// IconData for the 'strokeRoundedLaurelWreathFirst01' icon.
  static const IconData strokeRoundedLaurelWreathFirst01 = HugeIconData(0x4244);

  /// IconData for the 'strokeRoundedLaurelWreathFirst02' icon.
  static const IconData strokeRoundedLaurelWreathFirst02 = HugeIconData(0x4245);

  /// IconData for the 'strokeRoundedLaurelWreathLeft01' icon.
  static const IconData strokeRoundedLaurelWreathLeft01 = HugeIconData(0x4246);

  /// IconData for the 'strokeRoundedLaurelWreathLeft02' icon.
  static const IconData strokeRoundedLaurelWreathLeft02 = HugeIconData(0x4247);

  /// IconData for the 'strokeRoundedLaurelWreathLeft03' icon.
  static const IconData strokeRoundedLaurelWreathLeft03 = HugeIconData(0x4248);

  /// IconData for the 'strokeRoundedLaurelWreathRight01' icon.
  static const IconData strokeRoundedLaurelWreathRight01 = HugeIconData(0x4249);

  /// IconData for the 'strokeRoundedLaurelWreathRight02' icon.
  static const IconData strokeRoundedLaurelWreathRight02 = HugeIconData(0x424a);

  /// IconData for the 'strokeRoundedLaurelWreathRight03' icon.
  static const IconData strokeRoundedLaurelWreathRight03 = HugeIconData(0x424b);

  /// IconData for the 'strokeRoundedLayerAdd' icon.
  static const IconData strokeRoundedLayerAdd = HugeIconData(0x424c);

  /// IconData for the 'strokeRoundedLayerMask01' icon.
  static const IconData strokeRoundedLayerMask01 = HugeIconData(0x424d);

  /// IconData for the 'strokeRoundedLayerMask02' icon.
  static const IconData strokeRoundedLayerMask02 = HugeIconData(0x424e);

  /// IconData for the 'strokeRoundedLayers01' icon.
  static const IconData strokeRoundedLayers01 = HugeIconData(0x424f);

  /// IconData for the 'strokeRoundedLayers02' icon.
  static const IconData strokeRoundedLayers02 = HugeIconData(0x4250);

  /// IconData for the 'strokeRoundedLayersLogo' icon.
  static const IconData strokeRoundedLayersLogo = HugeIconData(0x4251);

  /// IconData for the 'strokeRoundedLayout01' icon.
  static const IconData strokeRoundedLayout01 = HugeIconData(0x4252);

  /// IconData for the 'strokeRoundedLayout02' icon.
  static const IconData strokeRoundedLayout02 = HugeIconData(0x4253);

  /// IconData for the 'strokeRoundedLayout03' icon.
  static const IconData strokeRoundedLayout03 = HugeIconData(0x4254);

  /// IconData for the 'strokeRoundedLayout04' icon.
  static const IconData strokeRoundedLayout04 = HugeIconData(0x4255);

  /// IconData for the 'strokeRoundedLayout05' icon.
  static const IconData strokeRoundedLayout05 = HugeIconData(0x4256);

  /// IconData for the 'strokeRoundedLayout06' icon.
  static const IconData strokeRoundedLayout06 = HugeIconData(0x4257);

  /// IconData for the 'strokeRoundedLayout07' icon.
  static const IconData strokeRoundedLayout07 = HugeIconData(0x4258);

  /// IconData for the 'strokeRoundedLayout2Column' icon.
  static const IconData strokeRoundedLayout2Column = HugeIconData(0x4259);

  /// IconData for the 'strokeRoundedLayout2Row' icon.
  static const IconData strokeRoundedLayout2Row = HugeIconData(0x425a);

  /// IconData for the 'strokeRoundedLayout3Column' icon.
  static const IconData strokeRoundedLayout3Column = HugeIconData(0x425b);

  /// IconData for the 'strokeRoundedLayout3Row' icon.
  static const IconData strokeRoundedLayout3Row = HugeIconData(0x425c);

  /// IconData for the 'strokeRoundedLayoutBottom' icon.
  static const IconData strokeRoundedLayoutBottom = HugeIconData(0x425d);

  /// IconData for the 'strokeRoundedLayoutGrid' icon.
  static const IconData strokeRoundedLayoutGrid = HugeIconData(0x425e);

  /// IconData for the 'strokeRoundedLayoutLeft' icon.
  static const IconData strokeRoundedLayoutLeft = HugeIconData(0x425f);

  /// IconData for the 'strokeRoundedLayoutRight' icon.
  static const IconData strokeRoundedLayoutRight = HugeIconData(0x4260);

  /// IconData for the 'strokeRoundedLayoutTable01' icon.
  static const IconData strokeRoundedLayoutTable01 = HugeIconData(0x4261);

  /// IconData for the 'strokeRoundedLayoutTable02' icon.
  static const IconData strokeRoundedLayoutTable02 = HugeIconData(0x4262);

  /// IconData for the 'strokeRoundedLayoutTop' icon.
  static const IconData strokeRoundedLayoutTop = HugeIconData(0x4263);

  /// IconData for the 'strokeRoundedLeaf01' icon.
  static const IconData strokeRoundedLeaf01 = HugeIconData(0x4264);

  /// IconData for the 'strokeRoundedLeaf02' icon.
  static const IconData strokeRoundedLeaf02 = HugeIconData(0x4265);

  /// IconData for the 'strokeRoundedLeaf03' icon.
  static const IconData strokeRoundedLeaf03 = HugeIconData(0x4266);

  /// IconData for the 'strokeRoundedLeaf04' icon.
  static const IconData strokeRoundedLeaf04 = HugeIconData(0x4267);

  /// IconData for the 'strokeRoundedLeavingGeoFence' icon.
  static const IconData strokeRoundedLeavingGeoFence = HugeIconData(0x4268);

  /// IconData for the 'strokeRoundedLeetcode' icon.
  static const IconData strokeRoundedLeetcode = HugeIconData(0x4269);

  /// IconData for the 'strokeRoundedLeftAngle' icon.
  static const IconData strokeRoundedLeftAngle = HugeIconData(0x426a);

  /// IconData for the 'strokeRoundedLeftToRightBlockQuote' icon.
  static const IconData strokeRoundedLeftToRightBlockQuote =
      HugeIconData(0x426b);

  /// IconData for the 'strokeRoundedLeftToRightListBullet' icon.
  static const IconData strokeRoundedLeftToRightListBullet =
      HugeIconData(0x426c);

  /// IconData for the 'strokeRoundedLeftToRightListDash' icon.
  static const IconData strokeRoundedLeftToRightListDash = HugeIconData(0x426d);

  /// IconData for the 'strokeRoundedLeftToRightListNumber' icon.
  static const IconData strokeRoundedLeftToRightListNumber =
      HugeIconData(0x426e);

  /// IconData for the 'strokeRoundedLeftToRightListStar01' icon.
  static const IconData strokeRoundedLeftToRightListStar01 =
      HugeIconData(0x426f);

  /// IconData for the 'strokeRoundedLeftToRightListStar' icon.
  static const IconData strokeRoundedLeftToRightListStar = HugeIconData(0x4270);

  /// IconData for the 'strokeRoundedLeftToRightListTriangle' icon.
  static const IconData strokeRoundedLeftToRightListTriangle =
      HugeIconData(0x4271);

  /// IconData for the 'strokeRoundedLeftTriangle' icon.
  static const IconData strokeRoundedLeftTriangle = HugeIconData(0x4272);

  /// IconData for the 'strokeRoundedLegal01' icon.
  static const IconData strokeRoundedLegal01 = HugeIconData(0x4273);

  /// IconData for the 'strokeRoundedLegal02' icon.
  static const IconData strokeRoundedLegal02 = HugeIconData(0x4274);

  /// IconData for the 'strokeRoundedLegalDocument01' icon.
  static const IconData strokeRoundedLegalDocument01 = HugeIconData(0x4275);

  /// IconData for the 'strokeRoundedLegalDocument02' icon.
  static const IconData strokeRoundedLegalDocument02 = HugeIconData(0x4276);

  /// IconData for the 'strokeRoundedLegalHammer' icon.
  static const IconData strokeRoundedLegalHammer = HugeIconData(0x4277);

  /// IconData for the 'strokeRoundedLessThanCircle' icon.
  static const IconData strokeRoundedLessThanCircle = HugeIconData(0x4278);

  /// IconData for the 'strokeRoundedLessThanSquare' icon.
  static const IconData strokeRoundedLessThanSquare = HugeIconData(0x4279);

  /// IconData for the 'strokeRoundedLessThan' icon.
  static const IconData strokeRoundedLessThan = HugeIconData(0x427a);

  /// IconData for the 'strokeRoundedLetterSpacing' icon.
  static const IconData strokeRoundedLetterSpacing = HugeIconData(0x427b);

  /// IconData for the 'strokeRoundedLibraries' icon.
  static const IconData strokeRoundedLibraries = HugeIconData(0x427c);

  /// IconData for the 'strokeRoundedLibrary' icon.
  static const IconData strokeRoundedLibrary = HugeIconData(0x427d);

  /// IconData for the 'strokeRoundedLicenseDraft' icon.
  static const IconData strokeRoundedLicenseDraft = HugeIconData(0x427e);

  /// IconData for the 'strokeRoundedLicenseMaintenance' icon.
  static const IconData strokeRoundedLicenseMaintenance = HugeIconData(0x427f);

  /// IconData for the 'strokeRoundedLicenseNo' icon.
  static const IconData strokeRoundedLicenseNo = HugeIconData(0x4280);

  /// IconData for the 'strokeRoundedLicensePin' icon.
  static const IconData strokeRoundedLicensePin = HugeIconData(0x4281);

  /// IconData for the 'strokeRoundedLicenseThirdParty' icon.
  static const IconData strokeRoundedLicenseThirdParty = HugeIconData(0x4282);

  /// IconData for the 'strokeRoundedLicense' icon.
  static const IconData strokeRoundedLicense = HugeIconData(0x4283);

  /// IconData for the 'strokeRoundedLiftTruck' icon.
  static const IconData strokeRoundedLiftTruck = HugeIconData(0x4284);

  /// IconData for the 'strokeRoundedLighthouse' icon.
  static const IconData strokeRoundedLighthouse = HugeIconData(0x4285);

  /// IconData for the 'strokeRoundedLimitation' icon.
  static const IconData strokeRoundedLimitation = HugeIconData(0x4286);

  /// IconData for the 'strokeRoundedLine' icon.
  static const IconData strokeRoundedLine = HugeIconData(0x4287);

  /// IconData for the 'strokeRoundedLiner' icon.
  static const IconData strokeRoundedLiner = HugeIconData(0x4288);

  /// IconData for the 'strokeRoundedLink01' icon.
  static const IconData strokeRoundedLink01 = HugeIconData(0x4289);

  /// IconData for the 'strokeRoundedLink02' icon.
  static const IconData strokeRoundedLink02 = HugeIconData(0x428a);

  /// IconData for the 'strokeRoundedLink03' icon.
  static const IconData strokeRoundedLink03 = HugeIconData(0x428b);

  /// IconData for the 'strokeRoundedLink04' icon.
  static const IconData strokeRoundedLink04 = HugeIconData(0x428c);

  /// IconData for the 'strokeRoundedLink05' icon.
  static const IconData strokeRoundedLink05 = HugeIconData(0x428d);

  /// IconData for the 'strokeRoundedLink06' icon.
  static const IconData strokeRoundedLink06 = HugeIconData(0x428e);

  /// IconData for the 'strokeRoundedLinkBackward' icon.
  static const IconData strokeRoundedLinkBackward = HugeIconData(0x428f);

  /// IconData for the 'strokeRoundedLinkCircle02' icon.
  static const IconData strokeRoundedLinkCircle02 = HugeIconData(0x4290);

  /// IconData for the 'strokeRoundedLinkCircle' icon.
  static const IconData strokeRoundedLinkCircle = HugeIconData(0x4291);

  /// IconData for the 'strokeRoundedLinkForward' icon.
  static const IconData strokeRoundedLinkForward = HugeIconData(0x4292);

  /// IconData for the 'strokeRoundedLinkSquare01' icon.
  static const IconData strokeRoundedLinkSquare01 = HugeIconData(0x4293);

  /// IconData for the 'strokeRoundedLinkSquare02' icon.
  static const IconData strokeRoundedLinkSquare02 = HugeIconData(0x4294);

  /// IconData for the 'strokeRoundedLinkedin01' icon.
  static const IconData strokeRoundedLinkedin01 = HugeIconData(0x4295);

  /// IconData for the 'strokeRoundedLinkedin02' icon.
  static const IconData strokeRoundedLinkedin02 = HugeIconData(0x4296);

  /// IconData for the 'strokeRoundedListSetting' icon.
  static const IconData strokeRoundedListSetting = HugeIconData(0x4297);

  /// IconData for the 'strokeRoundedListView' icon.
  static const IconData strokeRoundedListView = HugeIconData(0x4298);

  /// IconData for the 'strokeRoundedLitecoin' icon.
  static const IconData strokeRoundedLitecoin = HugeIconData(0x4299);

  /// IconData for the 'strokeRoundedLiver' icon.
  static const IconData strokeRoundedLiver = HugeIconData(0x429a);

  /// IconData for the 'strokeRoundedLoading01' icon.
  static const IconData strokeRoundedLoading01 = HugeIconData(0x429b);

  /// IconData for the 'strokeRoundedLoading02' icon.
  static const IconData strokeRoundedLoading02 = HugeIconData(0x429c);

  /// IconData for the 'strokeRoundedLoading03' icon.
  static const IconData strokeRoundedLoading03 = HugeIconData(0x429d);

  /// IconData for the 'strokeRoundedLoading04' icon.
  static const IconData strokeRoundedLoading04 = HugeIconData(0x429e);

  /// IconData for the 'strokeRoundedLocation01' icon.
  static const IconData strokeRoundedLocation01 = HugeIconData(0x429f);

  /// IconData for the 'strokeRoundedLocation02' icon.
  static const IconData strokeRoundedLocation02 = HugeIconData(0x42a0);

  /// IconData for the 'strokeRoundedLocation03' icon.
  static const IconData strokeRoundedLocation03 = HugeIconData(0x42a1);

  /// IconData for the 'strokeRoundedLocation04' icon.
  static const IconData strokeRoundedLocation04 = HugeIconData(0x42a2);

  /// IconData for the 'strokeRoundedLocation05' icon.
  static const IconData strokeRoundedLocation05 = HugeIconData(0x42a3);

  /// IconData for the 'strokeRoundedLocation06' icon.
  static const IconData strokeRoundedLocation06 = HugeIconData(0x42a4);

  /// IconData for the 'strokeRoundedLocation07' icon.
  static const IconData strokeRoundedLocation07 = HugeIconData(0x42a5);

  /// IconData for the 'strokeRoundedLocation08' icon.
  static const IconData strokeRoundedLocation08 = HugeIconData(0x42a6);

  /// IconData for the 'strokeRoundedLocation09' icon.
  static const IconData strokeRoundedLocation09 = HugeIconData(0x42a7);

  /// IconData for the 'strokeRoundedLocation10' icon.
  static const IconData strokeRoundedLocation10 = HugeIconData(0x42a8);

  /// IconData for the 'strokeRoundedLocationAdd01' icon.
  static const IconData strokeRoundedLocationAdd01 = HugeIconData(0x42a9);

  /// IconData for the 'strokeRoundedLocationAdd02' icon.
  static const IconData strokeRoundedLocationAdd02 = HugeIconData(0x42aa);

  /// IconData for the 'strokeRoundedLocationCheck01' icon.
  static const IconData strokeRoundedLocationCheck01 = HugeIconData(0x42ab);

  /// IconData for the 'strokeRoundedLocationCheck02' icon.
  static const IconData strokeRoundedLocationCheck02 = HugeIconData(0x42ac);

  /// IconData for the 'strokeRoundedLocationFavourite01' icon.
  static const IconData strokeRoundedLocationFavourite01 = HugeIconData(0x42ad);

  /// IconData for the 'strokeRoundedLocationFavourite02' icon.
  static const IconData strokeRoundedLocationFavourite02 = HugeIconData(0x42ae);

  /// IconData for the 'strokeRoundedLocationOffline01' icon.
  static const IconData strokeRoundedLocationOffline01 = HugeIconData(0x42af);

  /// IconData for the 'strokeRoundedLocationOffline02' icon.
  static const IconData strokeRoundedLocationOffline02 = HugeIconData(0x42b0);

  /// IconData for the 'strokeRoundedLocationOffline03' icon.
  static const IconData strokeRoundedLocationOffline03 = HugeIconData(0x42b1);

  /// IconData for the 'strokeRoundedLocationOffline04' icon.
  static const IconData strokeRoundedLocationOffline04 = HugeIconData(0x42b2);

  /// IconData for the 'strokeRoundedLocationRemove01' icon.
  static const IconData strokeRoundedLocationRemove01 = HugeIconData(0x42b3);

  /// IconData for the 'strokeRoundedLocationRemove02' icon.
  static const IconData strokeRoundedLocationRemove02 = HugeIconData(0x42b4);

  /// IconData for the 'strokeRoundedLocationShare01' icon.
  static const IconData strokeRoundedLocationShare01 = HugeIconData(0x42b5);

  /// IconData for the 'strokeRoundedLocationShare02' icon.
  static const IconData strokeRoundedLocationShare02 = HugeIconData(0x42b6);

  /// IconData for the 'strokeRoundedLocationStar01' icon.
  static const IconData strokeRoundedLocationStar01 = HugeIconData(0x42b7);

  /// IconData for the 'strokeRoundedLocationStar02' icon.
  static const IconData strokeRoundedLocationStar02 = HugeIconData(0x42b8);

  /// IconData for the 'strokeRoundedLocationUpdate01' icon.
  static const IconData strokeRoundedLocationUpdate01 = HugeIconData(0x42b9);

  /// IconData for the 'strokeRoundedLocationUpdate02' icon.
  static const IconData strokeRoundedLocationUpdate02 = HugeIconData(0x42ba);

  /// IconData for the 'strokeRoundedLocationUser01' icon.
  static const IconData strokeRoundedLocationUser01 = HugeIconData(0x42bb);

  /// IconData for the 'strokeRoundedLocationUser02' icon.
  static const IconData strokeRoundedLocationUser02 = HugeIconData(0x42bc);

  /// IconData for the 'strokeRoundedLocationUser03' icon.
  static const IconData strokeRoundedLocationUser03 = HugeIconData(0x42bd);

  /// IconData for the 'strokeRoundedLocationUser04' icon.
  static const IconData strokeRoundedLocationUser04 = HugeIconData(0x42be);

  /// IconData for the 'strokeRoundedLockComputer' icon.
  static const IconData strokeRoundedLockComputer = HugeIconData(0x42bf);

  /// IconData for the 'strokeRoundedLockKey' icon.
  static const IconData strokeRoundedLockKey = HugeIconData(0x42c0);

  /// IconData for the 'strokeRoundedLockPassword' icon.
  static const IconData strokeRoundedLockPassword = HugeIconData(0x42c1);

  /// IconData for the 'strokeRoundedLockSync01' icon.
  static const IconData strokeRoundedLockSync01 = HugeIconData(0x42c2);

  /// IconData for the 'strokeRoundedLockSync02' icon.
  static const IconData strokeRoundedLockSync02 = HugeIconData(0x42c3);

  /// IconData for the 'strokeRoundedLock' icon.
  static const IconData strokeRoundedLock = HugeIconData(0x42c4);

  /// IconData for the 'strokeRoundedLocked' icon.
  static const IconData strokeRoundedLocked = HugeIconData(0x42c5);

  /// IconData for the 'strokeRoundedLocker01' icon.
  static const IconData strokeRoundedLocker01 = HugeIconData(0x42c6);

  /// IconData for the 'strokeRoundedLocker' icon.
  static const IconData strokeRoundedLocker = HugeIconData(0x42c7);

  /// IconData for the 'strokeRoundedLogin01' icon.
  static const IconData strokeRoundedLogin01 = HugeIconData(0x42c8);

  /// IconData for the 'strokeRoundedLogin02' icon.
  static const IconData strokeRoundedLogin02 = HugeIconData(0x42c9);

  /// IconData for the 'strokeRoundedLogin03' icon.
  static const IconData strokeRoundedLogin03 = HugeIconData(0x42ca);

  /// IconData for the 'strokeRoundedLoginCircle01' icon.
  static const IconData strokeRoundedLoginCircle01 = HugeIconData(0x42cb);

  /// IconData for the 'strokeRoundedLoginCircle02' icon.
  static const IconData strokeRoundedLoginCircle02 = HugeIconData(0x42cc);

  /// IconData for the 'strokeRoundedLoginMethod' icon.
  static const IconData strokeRoundedLoginMethod = HugeIconData(0x42cd);

  /// IconData for the 'strokeRoundedLoginSquare01' icon.
  static const IconData strokeRoundedLoginSquare01 = HugeIconData(0x42ce);

  /// IconData for the 'strokeRoundedLoginSquare02' icon.
  static const IconData strokeRoundedLoginSquare02 = HugeIconData(0x42cf);

  /// IconData for the 'strokeRoundedLogout01' icon.
  static const IconData strokeRoundedLogout01 = HugeIconData(0x42d0);

  /// IconData for the 'strokeRoundedLogout02' icon.
  static const IconData strokeRoundedLogout02 = HugeIconData(0x42d1);

  /// IconData for the 'strokeRoundedLogout03' icon.
  static const IconData strokeRoundedLogout03 = HugeIconData(0x42d2);

  /// IconData for the 'strokeRoundedLogout04' icon.
  static const IconData strokeRoundedLogout04 = HugeIconData(0x42d3);

  /// IconData for the 'strokeRoundedLogout05' icon.
  static const IconData strokeRoundedLogout05 = HugeIconData(0x42d4);

  /// IconData for the 'strokeRoundedLogoutCircle01' icon.
  static const IconData strokeRoundedLogoutCircle01 = HugeIconData(0x42d5);

  /// IconData for the 'strokeRoundedLogoutCircle02' icon.
  static const IconData strokeRoundedLogoutCircle02 = HugeIconData(0x42d6);

  /// IconData for the 'strokeRoundedLogoutSquare01' icon.
  static const IconData strokeRoundedLogoutSquare01 = HugeIconData(0x42d7);

  /// IconData for the 'strokeRoundedLogoutSquare02' icon.
  static const IconData strokeRoundedLogoutSquare02 = HugeIconData(0x42d8);

  /// IconData for the 'strokeRoundedLollipop' icon.
  static const IconData strokeRoundedLollipop = HugeIconData(0x42d9);

  /// IconData for the 'strokeRoundedLongSleeveShirt' icon.
  static const IconData strokeRoundedLongSleeveShirt = HugeIconData(0x42da);

  /// IconData for the 'strokeRoundedLongitude' icon.
  static const IconData strokeRoundedLongitude = HugeIconData(0x42db);

  /// IconData for the 'strokeRoundedLookBottom' icon.
  static const IconData strokeRoundedLookBottom = HugeIconData(0x42dc);

  /// IconData for the 'strokeRoundedLookLeft' icon.
  static const IconData strokeRoundedLookLeft = HugeIconData(0x42dd);

  /// IconData for the 'strokeRoundedLookRight' icon.
  static const IconData strokeRoundedLookRight = HugeIconData(0x42de);

  /// IconData for the 'strokeRoundedLookTop' icon.
  static const IconData strokeRoundedLookTop = HugeIconData(0x42df);

  /// IconData for the 'strokeRoundedLoom' icon.
  static const IconData strokeRoundedLoom = HugeIconData(0x42e0);

  /// IconData for the 'strokeRoundedLottiefiles' icon.
  static const IconData strokeRoundedLottiefiles = HugeIconData(0x42e1);

  /// IconData for the 'strokeRoundedLoveKoreanFinger' icon.
  static const IconData strokeRoundedLoveKoreanFinger = HugeIconData(0x42e2);

  /// IconData for the 'strokeRoundedLoyaltyCard' icon.
  static const IconData strokeRoundedLoyaltyCard = HugeIconData(0x42e3);

  /// IconData for the 'strokeRoundedLuggage01' icon.
  static const IconData strokeRoundedLuggage01 = HugeIconData(0x42e4);

  /// IconData for the 'strokeRoundedLuggage02' icon.
  static const IconData strokeRoundedLuggage02 = HugeIconData(0x42e5);

  /// IconData for the 'strokeRoundedLungs' icon.
  static const IconData strokeRoundedLungs = HugeIconData(0x42e6);

  /// IconData for the 'strokeRoundedMachineRobot' icon.
  static const IconData strokeRoundedMachineRobot = HugeIconData(0x42e7);

  /// IconData for the 'strokeRoundedMagicWand01' icon.
  static const IconData strokeRoundedMagicWand01 = HugeIconData(0x42e8);

  /// IconData for the 'strokeRoundedMagicWand02' icon.
  static const IconData strokeRoundedMagicWand02 = HugeIconData(0x42e9);

  /// IconData for the 'strokeRoundedMagicWand03' icon.
  static const IconData strokeRoundedMagicWand03 = HugeIconData(0x42ea);

  /// IconData for the 'strokeRoundedMagnet01' icon.
  static const IconData strokeRoundedMagnet01 = HugeIconData(0x42eb);

  /// IconData for the 'strokeRoundedMagnet02' icon.
  static const IconData strokeRoundedMagnet02 = HugeIconData(0x42ec);

  /// IconData for the 'strokeRoundedMagnet' icon.
  static const IconData strokeRoundedMagnet = HugeIconData(0x42ed);

  /// IconData for the 'strokeRoundedMail01' icon.
  static const IconData strokeRoundedMail01 = HugeIconData(0x42ee);

  /// IconData for the 'strokeRoundedMail02' icon.
  static const IconData strokeRoundedMail02 = HugeIconData(0x42ef);

  /// IconData for the 'strokeRoundedMailAccount01' icon.
  static const IconData strokeRoundedMailAccount01 = HugeIconData(0x42f0);

  /// IconData for the 'strokeRoundedMailAccount02' icon.
  static const IconData strokeRoundedMailAccount02 = HugeIconData(0x42f1);

  /// IconData for the 'strokeRoundedMailAdd01' icon.
  static const IconData strokeRoundedMailAdd01 = HugeIconData(0x42f2);

  /// IconData for the 'strokeRoundedMailAdd02' icon.
  static const IconData strokeRoundedMailAdd02 = HugeIconData(0x42f3);

  /// IconData for the 'strokeRoundedMailAtSign01' icon.
  static const IconData strokeRoundedMailAtSign01 = HugeIconData(0x42f4);

  /// IconData for the 'strokeRoundedMailAtSign02' icon.
  static const IconData strokeRoundedMailAtSign02 = HugeIconData(0x42f5);

  /// IconData for the 'strokeRoundedMailBlock01' icon.
  static const IconData strokeRoundedMailBlock01 = HugeIconData(0x42f6);

  /// IconData for the 'strokeRoundedMailBlock02' icon.
  static const IconData strokeRoundedMailBlock02 = HugeIconData(0x42f7);

  /// IconData for the 'strokeRoundedMailDownload01' icon.
  static const IconData strokeRoundedMailDownload01 = HugeIconData(0x42f8);

  /// IconData for the 'strokeRoundedMailDownload02' icon.
  static const IconData strokeRoundedMailDownload02 = HugeIconData(0x42f9);

  /// IconData for the 'strokeRoundedMailEdit01' icon.
  static const IconData strokeRoundedMailEdit01 = HugeIconData(0x42fa);

  /// IconData for the 'strokeRoundedMailEdit02' icon.
  static const IconData strokeRoundedMailEdit02 = HugeIconData(0x42fb);

  /// IconData for the 'strokeRoundedMailLock01' icon.
  static const IconData strokeRoundedMailLock01 = HugeIconData(0x42fc);

  /// IconData for the 'strokeRoundedMailLock02' icon.
  static const IconData strokeRoundedMailLock02 = HugeIconData(0x42fd);

  /// IconData for the 'strokeRoundedMailLove01' icon.
  static const IconData strokeRoundedMailLove01 = HugeIconData(0x42fe);

  /// IconData for the 'strokeRoundedMailLove02' icon.
  static const IconData strokeRoundedMailLove02 = HugeIconData(0x42ff);

  /// IconData for the 'strokeRoundedMailMinus01' icon.
  static const IconData strokeRoundedMailMinus01 = HugeIconData(0x4300);

  /// IconData for the 'strokeRoundedMailMinus02' icon.
  static const IconData strokeRoundedMailMinus02 = HugeIconData(0x4301);

  /// IconData for the 'strokeRoundedMailOpen01' icon.
  static const IconData strokeRoundedMailOpen01 = HugeIconData(0x4302);

  /// IconData for the 'strokeRoundedMailOpen02' icon.
  static const IconData strokeRoundedMailOpen02 = HugeIconData(0x4303);

  /// IconData for the 'strokeRoundedMailOpenLove' icon.
  static const IconData strokeRoundedMailOpenLove = HugeIconData(0x4304);

  /// IconData for the 'strokeRoundedMailOpen' icon.
  static const IconData strokeRoundedMailOpen = HugeIconData(0x4305);

  /// IconData for the 'strokeRoundedMailReceive01' icon.
  static const IconData strokeRoundedMailReceive01 = HugeIconData(0x4306);

  /// IconData for the 'strokeRoundedMailReceive02' icon.
  static const IconData strokeRoundedMailReceive02 = HugeIconData(0x4307);

  /// IconData for the 'strokeRoundedMailRemove01' icon.
  static const IconData strokeRoundedMailRemove01 = HugeIconData(0x4308);

  /// IconData for the 'strokeRoundedMailRemove02' icon.
  static const IconData strokeRoundedMailRemove02 = HugeIconData(0x4309);

  /// IconData for the 'strokeRoundedMailReply01' icon.
  static const IconData strokeRoundedMailReply01 = HugeIconData(0x430a);

  /// IconData for the 'strokeRoundedMailReply02' icon.
  static const IconData strokeRoundedMailReply02 = HugeIconData(0x430b);

  /// IconData for the 'strokeRoundedMailReplyAll01' icon.
  static const IconData strokeRoundedMailReplyAll01 = HugeIconData(0x430c);

  /// IconData for the 'strokeRoundedMailReplyAll02' icon.
  static const IconData strokeRoundedMailReplyAll02 = HugeIconData(0x430d);

  /// IconData for the 'strokeRoundedMailSearch01' icon.
  static const IconData strokeRoundedMailSearch01 = HugeIconData(0x430e);

  /// IconData for the 'strokeRoundedMailSearch02' icon.
  static const IconData strokeRoundedMailSearch02 = HugeIconData(0x430f);

  /// IconData for the 'strokeRoundedMailSecure01' icon.
  static const IconData strokeRoundedMailSecure01 = HugeIconData(0x4310);

  /// IconData for the 'strokeRoundedMailSecure02' icon.
  static const IconData strokeRoundedMailSecure02 = HugeIconData(0x4311);

  /// IconData for the 'strokeRoundedMailSend01' icon.
  static const IconData strokeRoundedMailSend01 = HugeIconData(0x4312);

  /// IconData for the 'strokeRoundedMailSend02' icon.
  static const IconData strokeRoundedMailSend02 = HugeIconData(0x4313);

  /// IconData for the 'strokeRoundedMailSetting01' icon.
  static const IconData strokeRoundedMailSetting01 = HugeIconData(0x4314);

  /// IconData for the 'strokeRoundedMailSetting02' icon.
  static const IconData strokeRoundedMailSetting02 = HugeIconData(0x4315);

  /// IconData for the 'strokeRoundedMailUnlock01' icon.
  static const IconData strokeRoundedMailUnlock01 = HugeIconData(0x4316);

  /// IconData for the 'strokeRoundedMailUnlock02' icon.
  static const IconData strokeRoundedMailUnlock02 = HugeIconData(0x4317);

  /// IconData for the 'strokeRoundedMailUpload01' icon.
  static const IconData strokeRoundedMailUpload01 = HugeIconData(0x4318);

  /// IconData for the 'strokeRoundedMailUpload02' icon.
  static const IconData strokeRoundedMailUpload02 = HugeIconData(0x4319);

  /// IconData for the 'strokeRoundedMailValidation01' icon.
  static const IconData strokeRoundedMailValidation01 = HugeIconData(0x431a);

  /// IconData for the 'strokeRoundedMailValidation02' icon.
  static const IconData strokeRoundedMailValidation02 = HugeIconData(0x431b);

  /// IconData for the 'strokeRoundedMailVoice01' icon.
  static const IconData strokeRoundedMailVoice01 = HugeIconData(0x431c);

  /// IconData for the 'strokeRoundedMailVoice02' icon.
  static const IconData strokeRoundedMailVoice02 = HugeIconData(0x431d);

  /// IconData for the 'strokeRoundedMailbox01' icon.
  static const IconData strokeRoundedMailbox01 = HugeIconData(0x431e);

  /// IconData for the 'strokeRoundedMailbox' icon.
  static const IconData strokeRoundedMailbox = HugeIconData(0x431f);

  /// IconData for the 'strokeRoundedManager' icon.
  static const IconData strokeRoundedManager = HugeIconData(0x4320);

  /// IconData for the 'strokeRoundedMapPin' icon.
  static const IconData strokeRoundedMapPin = HugeIconData(0x4321);

  /// IconData for the 'strokeRoundedMapPinpoint01' icon.
  static const IconData strokeRoundedMapPinpoint01 = HugeIconData(0x4322);

  /// IconData for the 'strokeRoundedMapPinpoint02' icon.
  static const IconData strokeRoundedMapPinpoint02 = HugeIconData(0x4323);

  /// IconData for the 'strokeRoundedMaping' icon.
  static const IconData strokeRoundedMaping = HugeIconData(0x4324);

  /// IconData for the 'strokeRoundedMapsCircle01' icon.
  static const IconData strokeRoundedMapsCircle01 = HugeIconData(0x4325);

  /// IconData for the 'strokeRoundedMapsCircle02' icon.
  static const IconData strokeRoundedMapsCircle02 = HugeIconData(0x4326);

  /// IconData for the 'strokeRoundedMapsEditing' icon.
  static const IconData strokeRoundedMapsEditing = HugeIconData(0x4327);

  /// IconData for the 'strokeRoundedMapsGlobal01' icon.
  static const IconData strokeRoundedMapsGlobal01 = HugeIconData(0x4328);

  /// IconData for the 'strokeRoundedMapsGlobal02' icon.
  static const IconData strokeRoundedMapsGlobal02 = HugeIconData(0x4329);

  /// IconData for the 'strokeRoundedMapsLocation01' icon.
  static const IconData strokeRoundedMapsLocation01 = HugeIconData(0x432a);

  /// IconData for the 'strokeRoundedMapsLocation02' icon.
  static const IconData strokeRoundedMapsLocation02 = HugeIconData(0x432b);

  /// IconData for the 'strokeRoundedMapsOff' icon.
  static const IconData strokeRoundedMapsOff = HugeIconData(0x432c);

  /// IconData for the 'strokeRoundedMapsRefresh' icon.
  static const IconData strokeRoundedMapsRefresh = HugeIconData(0x432d);

  /// IconData for the 'strokeRoundedMapsSearch' icon.
  static const IconData strokeRoundedMapsSearch = HugeIconData(0x432e);

  /// IconData for the 'strokeRoundedMapsSquare01' icon.
  static const IconData strokeRoundedMapsSquare01 = HugeIconData(0x432f);

  /// IconData for the 'strokeRoundedMapsSquare02' icon.
  static const IconData strokeRoundedMapsSquare02 = HugeIconData(0x4330);

  /// IconData for the 'strokeRoundedMaps' icon.
  static const IconData strokeRoundedMaps = HugeIconData(0x4331);

  /// IconData for the 'strokeRoundedMarketAnalysis' icon.
  static const IconData strokeRoundedMarketAnalysis = HugeIconData(0x4332);

  /// IconData for the 'strokeRoundedMarketing' icon.
  static const IconData strokeRoundedMarketing = HugeIconData(0x4333);

  /// IconData for the 'strokeRoundedMaskLove' icon.
  static const IconData strokeRoundedMaskLove = HugeIconData(0x4334);

  /// IconData for the 'strokeRoundedMask' icon.
  static const IconData strokeRoundedMask = HugeIconData(0x4335);

  /// IconData for the 'strokeRoundedMasterCard' icon.
  static const IconData strokeRoundedMasterCard = HugeIconData(0x4336);

  /// IconData for the 'strokeRoundedMatches' icon.
  static const IconData strokeRoundedMatches = HugeIconData(0x4337);

  /// IconData for the 'strokeRoundedMath' icon.
  static const IconData strokeRoundedMath = HugeIconData(0x4338);

  /// IconData for the 'strokeRoundedMatrix' icon.
  static const IconData strokeRoundedMatrix = HugeIconData(0x4339);

  /// IconData for the 'strokeRoundedMaximize01' icon.
  static const IconData strokeRoundedMaximize01 = HugeIconData(0x433a);

  /// IconData for the 'strokeRoundedMaximize02' icon.
  static const IconData strokeRoundedMaximize02 = HugeIconData(0x433b);

  /// IconData for the 'strokeRoundedMaximize03' icon.
  static const IconData strokeRoundedMaximize03 = HugeIconData(0x433c);

  /// IconData for the 'strokeRoundedMaximize04' icon.
  static const IconData strokeRoundedMaximize04 = HugeIconData(0x433d);

  /// IconData for the 'strokeRoundedMaximizeScreen' icon.
  static const IconData strokeRoundedMaximizeScreen = HugeIconData(0x433e);

  /// IconData for the 'strokeRoundedMayanPyramid' icon.
  static const IconData strokeRoundedMayanPyramid = HugeIconData(0x433f);

  /// IconData for the 'strokeRoundedMaze' icon.
  static const IconData strokeRoundedMaze = HugeIconData(0x4340);

  /// IconData for the 'strokeRoundedMedal01' icon.
  static const IconData strokeRoundedMedal01 = HugeIconData(0x4341);

  /// IconData for the 'strokeRoundedMedal02' icon.
  static const IconData strokeRoundedMedal02 = HugeIconData(0x4342);

  /// IconData for the 'strokeRoundedMedal03' icon.
  static const IconData strokeRoundedMedal03 = HugeIconData(0x4343);

  /// IconData for the 'strokeRoundedMedal04' icon.
  static const IconData strokeRoundedMedal04 = HugeIconData(0x4344);

  /// IconData for the 'strokeRoundedMedal05' icon.
  static const IconData strokeRoundedMedal05 = HugeIconData(0x4345);

  /// IconData for the 'strokeRoundedMedal06' icon.
  static const IconData strokeRoundedMedal06 = HugeIconData(0x4346);

  /// IconData for the 'strokeRoundedMedal07' icon.
  static const IconData strokeRoundedMedal07 = HugeIconData(0x4347);

  /// IconData for the 'strokeRoundedMedalFirstPlace' icon.
  static const IconData strokeRoundedMedalFirstPlace = HugeIconData(0x4348);

  /// IconData for the 'strokeRoundedMedalSecondPlace' icon.
  static const IconData strokeRoundedMedalSecondPlace = HugeIconData(0x4349);

  /// IconData for the 'strokeRoundedMedalThirdPlace' icon.
  static const IconData strokeRoundedMedalThirdPlace = HugeIconData(0x434a);

  /// IconData for the 'strokeRoundedMedicalFile' icon.
  static const IconData strokeRoundedMedicalFile = HugeIconData(0x434b);

  /// IconData for the 'strokeRoundedMedicalMask' icon.
  static const IconData strokeRoundedMedicalMask = HugeIconData(0x434c);

  /// IconData for the 'strokeRoundedMedicine01' icon.
  static const IconData strokeRoundedMedicine01 = HugeIconData(0x434d);

  /// IconData for the 'strokeRoundedMedicine02' icon.
  static const IconData strokeRoundedMedicine02 = HugeIconData(0x434e);

  /// IconData for the 'strokeRoundedMedicineBottle01' icon.
  static const IconData strokeRoundedMedicineBottle01 = HugeIconData(0x434f);

  /// IconData for the 'strokeRoundedMedicineBottle02' icon.
  static const IconData strokeRoundedMedicineBottle02 = HugeIconData(0x4350);

  /// IconData for the 'strokeRoundedMedicineSyrup' icon.
  static const IconData strokeRoundedMedicineSyrup = HugeIconData(0x4351);

  /// IconData for the 'strokeRoundedMediumSquare' icon.
  static const IconData strokeRoundedMediumSquare = HugeIconData(0x4352);

  /// IconData for the 'strokeRoundedMedium' icon.
  static const IconData strokeRoundedMedium = HugeIconData(0x4353);

  /// IconData for the 'strokeRoundedMeetingRoom' icon.
  static const IconData strokeRoundedMeetingRoom = HugeIconData(0x4354);

  /// IconData for the 'strokeRoundedMegaphone01' icon.
  static const IconData strokeRoundedMegaphone01 = HugeIconData(0x4355);

  /// IconData for the 'strokeRoundedMegaphone02' icon.
  static const IconData strokeRoundedMegaphone02 = HugeIconData(0x4356);

  /// IconData for the 'strokeRoundedMeh' icon.
  static const IconData strokeRoundedMeh = HugeIconData(0x4357);

  /// IconData for the 'strokeRoundedMentor' icon.
  static const IconData strokeRoundedMentor = HugeIconData(0x4358);

  /// IconData for the 'strokeRoundedMentoring' icon.
  static const IconData strokeRoundedMentoring = HugeIconData(0x4359);

  /// IconData for the 'strokeRoundedMenu01' icon.
  static const IconData strokeRoundedMenu01 = HugeIconData(0x435a);

  /// IconData for the 'strokeRoundedMenu02' icon.
  static const IconData strokeRoundedMenu02 = HugeIconData(0x435b);

  /// IconData for the 'strokeRoundedMenu03' icon.
  static const IconData strokeRoundedMenu03 = HugeIconData(0x435c);

  /// IconData for the 'strokeRoundedMenu04' icon.
  static const IconData strokeRoundedMenu04 = HugeIconData(0x435d);

  /// IconData for the 'strokeRoundedMenu05' icon.
  static const IconData strokeRoundedMenu05 = HugeIconData(0x435e);

  /// IconData for the 'strokeRoundedMenu06' icon.
  static const IconData strokeRoundedMenu06 = HugeIconData(0x435f);

  /// IconData for the 'strokeRoundedMenu07' icon.
  static const IconData strokeRoundedMenu07 = HugeIconData(0x4360);

  /// IconData for the 'strokeRoundedMenu08' icon.
  static const IconData strokeRoundedMenu08 = HugeIconData(0x4361);

  /// IconData for the 'strokeRoundedMenu09' icon.
  static const IconData strokeRoundedMenu09 = HugeIconData(0x4362);

  /// IconData for the 'strokeRoundedMenu10' icon.
  static const IconData strokeRoundedMenu10 = HugeIconData(0x4363);

  /// IconData for the 'strokeRoundedMenu11' icon.
  static const IconData strokeRoundedMenu11 = HugeIconData(0x4364);

  /// IconData for the 'strokeRoundedMenuCircle' icon.
  static const IconData strokeRoundedMenuCircle = HugeIconData(0x4365);

  /// IconData for the 'strokeRoundedMenuRestaurant' icon.
  static const IconData strokeRoundedMenuRestaurant = HugeIconData(0x4366);

  /// IconData for the 'strokeRoundedMenuSquare' icon.
  static const IconData strokeRoundedMenuSquare = HugeIconData(0x4367);

  /// IconData for the 'strokeRoundedMessage01' icon.
  static const IconData strokeRoundedMessage01 = HugeIconData(0x4368);

  /// IconData for the 'strokeRoundedMessage02' icon.
  static const IconData strokeRoundedMessage02 = HugeIconData(0x4369);

  /// IconData for the 'strokeRoundedMessageAdd01' icon.
  static const IconData strokeRoundedMessageAdd01 = HugeIconData(0x436a);

  /// IconData for the 'strokeRoundedMessageAdd02' icon.
  static const IconData strokeRoundedMessageAdd02 = HugeIconData(0x436b);

  /// IconData for the 'strokeRoundedMessageBlocked' icon.
  static const IconData strokeRoundedMessageBlocked = HugeIconData(0x436c);

  /// IconData for the 'strokeRoundedMessageCancel01' icon.
  static const IconData strokeRoundedMessageCancel01 = HugeIconData(0x436d);

  /// IconData for the 'strokeRoundedMessageCancel02' icon.
  static const IconData strokeRoundedMessageCancel02 = HugeIconData(0x436e);

  /// IconData for the 'strokeRoundedMessageDelay01' icon.
  static const IconData strokeRoundedMessageDelay01 = HugeIconData(0x436f);

  /// IconData for the 'strokeRoundedMessageDelay02' icon.
  static const IconData strokeRoundedMessageDelay02 = HugeIconData(0x4370);

  /// IconData for the 'strokeRoundedMessageDone01' icon.
  static const IconData strokeRoundedMessageDone01 = HugeIconData(0x4371);

  /// IconData for the 'strokeRoundedMessageDone02' icon.
  static const IconData strokeRoundedMessageDone02 = HugeIconData(0x4372);

  /// IconData for the 'strokeRoundedMessageDownload01' icon.
  static const IconData strokeRoundedMessageDownload01 = HugeIconData(0x4373);

  /// IconData for the 'strokeRoundedMessageDownload02' icon.
  static const IconData strokeRoundedMessageDownload02 = HugeIconData(0x4374);

  /// IconData for the 'strokeRoundedMessageEdit01' icon.
  static const IconData strokeRoundedMessageEdit01 = HugeIconData(0x4375);

  /// IconData for the 'strokeRoundedMessageEdit02' icon.
  static const IconData strokeRoundedMessageEdit02 = HugeIconData(0x4376);

  /// IconData for the 'strokeRoundedMessageFavourite01' icon.
  static const IconData strokeRoundedMessageFavourite01 = HugeIconData(0x4377);

  /// IconData for the 'strokeRoundedMessageFavourite02' icon.
  static const IconData strokeRoundedMessageFavourite02 = HugeIconData(0x4378);

  /// IconData for the 'strokeRoundedMessageIncoming01' icon.
  static const IconData strokeRoundedMessageIncoming01 = HugeIconData(0x4379);

  /// IconData for the 'strokeRoundedMessageIncoming02' icon.
  static const IconData strokeRoundedMessageIncoming02 = HugeIconData(0x437a);

  /// IconData for the 'strokeRoundedMessageLock01' icon.
  static const IconData strokeRoundedMessageLock01 = HugeIconData(0x437b);

  /// IconData for the 'strokeRoundedMessageLock02' icon.
  static const IconData strokeRoundedMessageLock02 = HugeIconData(0x437c);

  /// IconData for the 'strokeRoundedMessageMultiple01' icon.
  static const IconData strokeRoundedMessageMultiple01 = HugeIconData(0x437d);

  /// IconData for the 'strokeRoundedMessageMultiple02' icon.
  static const IconData strokeRoundedMessageMultiple02 = HugeIconData(0x437e);

  /// IconData for the 'strokeRoundedMessageNotification01' icon.
  static const IconData strokeRoundedMessageNotification01 =
      HugeIconData(0x437f);

  /// IconData for the 'strokeRoundedMessageNotification02' icon.
  static const IconData strokeRoundedMessageNotification02 =
      HugeIconData(0x4380);

  /// IconData for the 'strokeRoundedMessageOutgoing01' icon.
  static const IconData strokeRoundedMessageOutgoing01 = HugeIconData(0x4381);

  /// IconData for the 'strokeRoundedMessageOutgoing02' icon.
  static const IconData strokeRoundedMessageOutgoing02 = HugeIconData(0x4382);

  /// IconData for the 'strokeRoundedMessagePreview01' icon.
  static const IconData strokeRoundedMessagePreview01 = HugeIconData(0x4383);

  /// IconData for the 'strokeRoundedMessagePreview02' icon.
  static const IconData strokeRoundedMessagePreview02 = HugeIconData(0x4384);

  /// IconData for the 'strokeRoundedMessageProgramming' icon.
  static const IconData strokeRoundedMessageProgramming = HugeIconData(0x4385);

  /// IconData for the 'strokeRoundedMessageQuestion' icon.
  static const IconData strokeRoundedMessageQuestion = HugeIconData(0x4386);

  /// IconData for the 'strokeRoundedMessageSearch01' icon.
  static const IconData strokeRoundedMessageSearch01 = HugeIconData(0x4387);

  /// IconData for the 'strokeRoundedMessageSearch02' icon.
  static const IconData strokeRoundedMessageSearch02 = HugeIconData(0x4388);

  /// IconData for the 'strokeRoundedMessageSecure01' icon.
  static const IconData strokeRoundedMessageSecure01 = HugeIconData(0x4389);

  /// IconData for the 'strokeRoundedMessageSecure02' icon.
  static const IconData strokeRoundedMessageSecure02 = HugeIconData(0x438a);

  /// IconData for the 'strokeRoundedMessageTranslate' icon.
  static const IconData strokeRoundedMessageTranslate = HugeIconData(0x438b);

  /// IconData for the 'strokeRoundedMessageUnlock01' icon.
  static const IconData strokeRoundedMessageUnlock01 = HugeIconData(0x438c);

  /// IconData for the 'strokeRoundedMessageUnlock02' icon.
  static const IconData strokeRoundedMessageUnlock02 = HugeIconData(0x438d);

  /// IconData for the 'strokeRoundedMessageUpload01' icon.
  static const IconData strokeRoundedMessageUpload01 = HugeIconData(0x438e);

  /// IconData for the 'strokeRoundedMessageUpload02' icon.
  static const IconData strokeRoundedMessageUpload02 = HugeIconData(0x438f);

  /// IconData for the 'strokeRoundedMessageUser01' icon.
  static const IconData strokeRoundedMessageUser01 = HugeIconData(0x4390);

  /// IconData for the 'strokeRoundedMessageUser02' icon.
  static const IconData strokeRoundedMessageUser02 = HugeIconData(0x4391);

  /// IconData for the 'strokeRoundedMessenger' icon.
  static const IconData strokeRoundedMessenger = HugeIconData(0x4392);

  /// IconData for the 'strokeRoundedMeta' icon.
  static const IconData strokeRoundedMeta = HugeIconData(0x4393);

  /// IconData for the 'strokeRoundedMetro' icon.
  static const IconData strokeRoundedMetro = HugeIconData(0x4394);

  /// IconData for the 'strokeRoundedMic01' icon.
  static const IconData strokeRoundedMic01 = HugeIconData(0x4395);

  /// IconData for the 'strokeRoundedMic02' icon.
  static const IconData strokeRoundedMic02 = HugeIconData(0x4396);

  /// IconData for the 'strokeRoundedMicOff01' icon.
  static const IconData strokeRoundedMicOff01 = HugeIconData(0x4397);

  /// IconData for the 'strokeRoundedMicOff02' icon.
  static const IconData strokeRoundedMicOff02 = HugeIconData(0x4398);

  /// IconData for the 'strokeRoundedMicrosoftAdmin' icon.
  static const IconData strokeRoundedMicrosoftAdmin = HugeIconData(0x4399);

  /// IconData for the 'strokeRoundedMicrosoft' icon.
  static const IconData strokeRoundedMicrosoft = HugeIconData(0x439a);

  /// IconData for the 'strokeRoundedMicrowave' icon.
  static const IconData strokeRoundedMicrowave = HugeIconData(0x439b);

  /// IconData for the 'strokeRoundedMilkBottle' icon.
  static const IconData strokeRoundedMilkBottle = HugeIconData(0x439c);

  /// IconData for the 'strokeRoundedMilkCarton' icon.
  static const IconData strokeRoundedMilkCarton = HugeIconData(0x439d);

  /// IconData for the 'strokeRoundedMilkCoconut' icon.
  static const IconData strokeRoundedMilkCoconut = HugeIconData(0x439e);

  /// IconData for the 'strokeRoundedMilkOat' icon.
  static const IconData strokeRoundedMilkOat = HugeIconData(0x439f);

  /// IconData for the 'strokeRoundedMinimize01' icon.
  static const IconData strokeRoundedMinimize01 = HugeIconData(0x43a0);

  /// IconData for the 'strokeRoundedMinimize02' icon.
  static const IconData strokeRoundedMinimize02 = HugeIconData(0x43a1);

  /// IconData for the 'strokeRoundedMinimize03' icon.
  static const IconData strokeRoundedMinimize03 = HugeIconData(0x43a2);

  /// IconData for the 'strokeRoundedMinimize04' icon.
  static const IconData strokeRoundedMinimize04 = HugeIconData(0x43a3);

  /// IconData for the 'strokeRoundedMinimizeScreen' icon.
  static const IconData strokeRoundedMinimizeScreen = HugeIconData(0x43a4);

  /// IconData for the 'strokeRoundedMining01' icon.
  static const IconData strokeRoundedMining01 = HugeIconData(0x43a5);

  /// IconData for the 'strokeRoundedMining02' icon.
  static const IconData strokeRoundedMining02 = HugeIconData(0x43a6);

  /// IconData for the 'strokeRoundedMining03' icon.
  static const IconData strokeRoundedMining03 = HugeIconData(0x43a7);

  /// IconData for the 'strokeRoundedMinusPlus01' icon.
  static const IconData strokeRoundedMinusPlus01 = HugeIconData(0x43a8);

  /// IconData for the 'strokeRoundedMinusPlus02' icon.
  static const IconData strokeRoundedMinusPlus02 = HugeIconData(0x43a9);

  /// IconData for the 'strokeRoundedMinusPlusCircle01' icon.
  static const IconData strokeRoundedMinusPlusCircle01 = HugeIconData(0x43aa);

  /// IconData for the 'strokeRoundedMinusPlusCircle02' icon.
  static const IconData strokeRoundedMinusPlusCircle02 = HugeIconData(0x43ab);

  /// IconData for the 'strokeRoundedMinusPlusSquare01' icon.
  static const IconData strokeRoundedMinusPlusSquare01 = HugeIconData(0x43ac);

  /// IconData for the 'strokeRoundedMinusPlusSquare02' icon.
  static const IconData strokeRoundedMinusPlusSquare02 = HugeIconData(0x43ad);

  /// IconData for the 'strokeRoundedMinusSignCircle' icon.
  static const IconData strokeRoundedMinusSignCircle = HugeIconData(0x43ae);

  /// IconData for the 'strokeRoundedMinusSignSquare' icon.
  static const IconData strokeRoundedMinusSignSquare = HugeIconData(0x43af);

  /// IconData for the 'strokeRoundedMinusSign' icon.
  static const IconData strokeRoundedMinusSign = HugeIconData(0x43b0);

  /// IconData for the 'strokeRoundedMirror' icon.
  static const IconData strokeRoundedMirror = HugeIconData(0x43b1);

  /// IconData for the 'strokeRoundedMirroringScreen' icon.
  static const IconData strokeRoundedMirroringScreen = HugeIconData(0x43b2);

  /// IconData for the 'strokeRoundedMixer' icon.
  static const IconData strokeRoundedMixer = HugeIconData(0x43b3);

  /// IconData for the 'strokeRoundedMobileNavigator01' icon.
  static const IconData strokeRoundedMobileNavigator01 = HugeIconData(0x43b4);

  /// IconData for the 'strokeRoundedMobileNavigator02' icon.
  static const IconData strokeRoundedMobileNavigator02 = HugeIconData(0x43b5);

  /// IconData for the 'strokeRoundedMobileProgramming01' icon.
  static const IconData strokeRoundedMobileProgramming01 = HugeIconData(0x43b6);

  /// IconData for the 'strokeRoundedMobileProgramming02' icon.
  static const IconData strokeRoundedMobileProgramming02 = HugeIconData(0x43b7);

  /// IconData for the 'strokeRoundedMobileProtection' icon.
  static const IconData strokeRoundedMobileProtection = HugeIconData(0x43b8);

  /// IconData for the 'strokeRoundedMobileSecurity' icon.
  static const IconData strokeRoundedMobileSecurity = HugeIconData(0x43b9);

  /// IconData for the 'strokeRoundedMochi' icon.
  static const IconData strokeRoundedMochi = HugeIconData(0x43ba);

  /// IconData for the 'strokeRoundedModernTvFourK' icon.
  static const IconData strokeRoundedModernTvFourK = HugeIconData(0x43bb);

  /// IconData for the 'strokeRoundedModernTvIssue' icon.
  static const IconData strokeRoundedModernTvIssue = HugeIconData(0x43bc);

  /// IconData for the 'strokeRoundedModernTv' icon.
  static const IconData strokeRoundedModernTv = HugeIconData(0x43bd);

  /// IconData for the 'strokeRoundedMolecules' icon.
  static const IconData strokeRoundedMolecules = HugeIconData(0x43be);

  /// IconData for the 'strokeRoundedMonas' icon.
  static const IconData strokeRoundedMonas = HugeIconData(0x43bf);

  /// IconData for the 'strokeRoundedMoney01' icon.
  static const IconData strokeRoundedMoney01 = HugeIconData(0x43c0);

  /// IconData for the 'strokeRoundedMoney02' icon.
  static const IconData strokeRoundedMoney02 = HugeIconData(0x43c1);

  /// IconData for the 'strokeRoundedMoney03' icon.
  static const IconData strokeRoundedMoney03 = HugeIconData(0x43c2);

  /// IconData for the 'strokeRoundedMoney04' icon.
  static const IconData strokeRoundedMoney04 = HugeIconData(0x43c3);

  /// IconData for the 'strokeRoundedMoneyAdd01' icon.
  static const IconData strokeRoundedMoneyAdd01 = HugeIconData(0x43c4);

  /// IconData for the 'strokeRoundedMoneyAdd02' icon.
  static const IconData strokeRoundedMoneyAdd02 = HugeIconData(0x43c5);

  /// IconData for the 'strokeRoundedMoneyBag01' icon.
  static const IconData strokeRoundedMoneyBag01 = HugeIconData(0x43c6);

  /// IconData for the 'strokeRoundedMoneyBag02' icon.
  static const IconData strokeRoundedMoneyBag02 = HugeIconData(0x43c7);

  /// IconData for the 'strokeRoundedMoneyExchange01' icon.
  static const IconData strokeRoundedMoneyExchange01 = HugeIconData(0x43c8);

  /// IconData for the 'strokeRoundedMoneyExchange02' icon.
  static const IconData strokeRoundedMoneyExchange02 = HugeIconData(0x43c9);

  /// IconData for the 'strokeRoundedMoneyExchange03' icon.
  static const IconData strokeRoundedMoneyExchange03 = HugeIconData(0x43ca);

  /// IconData for the 'strokeRoundedMoneyNotFound01' icon.
  static const IconData strokeRoundedMoneyNotFound01 = HugeIconData(0x43cb);

  /// IconData for the 'strokeRoundedMoneyNotFound02' icon.
  static const IconData strokeRoundedMoneyNotFound02 = HugeIconData(0x43cc);

  /// IconData for the 'strokeRoundedMoneyNotFound03' icon.
  static const IconData strokeRoundedMoneyNotFound03 = HugeIconData(0x43cd);

  /// IconData for the 'strokeRoundedMoneyNotFound04' icon.
  static const IconData strokeRoundedMoneyNotFound04 = HugeIconData(0x43ce);

  /// IconData for the 'strokeRoundedMoneyReceive01' icon.
  static const IconData strokeRoundedMoneyReceive01 = HugeIconData(0x43cf);

  /// IconData for the 'strokeRoundedMoneyReceive02' icon.
  static const IconData strokeRoundedMoneyReceive02 = HugeIconData(0x43d0);

  /// IconData for the 'strokeRoundedMoneyReceiveCircle' icon.
  static const IconData strokeRoundedMoneyReceiveCircle = HugeIconData(0x43d1);

  /// IconData for the 'strokeRoundedMoneyReceiveFlow01' icon.
  static const IconData strokeRoundedMoneyReceiveFlow01 = HugeIconData(0x43d2);

  /// IconData for the 'strokeRoundedMoneyReceiveFlow02' icon.
  static const IconData strokeRoundedMoneyReceiveFlow02 = HugeIconData(0x43d3);

  /// IconData for the 'strokeRoundedMoneyReceiveSquare' icon.
  static const IconData strokeRoundedMoneyReceiveSquare = HugeIconData(0x43d4);

  /// IconData for the 'strokeRoundedMoneyRemove01' icon.
  static const IconData strokeRoundedMoneyRemove01 = HugeIconData(0x43d5);

  /// IconData for the 'strokeRoundedMoneyRemove02' icon.
  static const IconData strokeRoundedMoneyRemove02 = HugeIconData(0x43d6);

  /// IconData for the 'strokeRoundedMoneySafe' icon.
  static const IconData strokeRoundedMoneySafe = HugeIconData(0x43d7);

  /// IconData for the 'strokeRoundedMoneySavingJar' icon.
  static const IconData strokeRoundedMoneySavingJar = HugeIconData(0x43d8);

  /// IconData for the 'strokeRoundedMoneySecurity' icon.
  static const IconData strokeRoundedMoneySecurity = HugeIconData(0x43d9);

  /// IconData for the 'strokeRoundedMoneySend01' icon.
  static const IconData strokeRoundedMoneySend01 = HugeIconData(0x43da);

  /// IconData for the 'strokeRoundedMoneySend02' icon.
  static const IconData strokeRoundedMoneySend02 = HugeIconData(0x43db);

  /// IconData for the 'strokeRoundedMoneySendCircle' icon.
  static const IconData strokeRoundedMoneySendCircle = HugeIconData(0x43dc);

  /// IconData for the 'strokeRoundedMoneySendFlow01' icon.
  static const IconData strokeRoundedMoneySendFlow01 = HugeIconData(0x43dd);

  /// IconData for the 'strokeRoundedMoneySendFlow02' icon.
  static const IconData strokeRoundedMoneySendFlow02 = HugeIconData(0x43de);

  /// IconData for the 'strokeRoundedMoneySendSquare' icon.
  static const IconData strokeRoundedMoneySendSquare = HugeIconData(0x43df);

  /// IconData for the 'strokeRoundedMonocle01' icon.
  static const IconData strokeRoundedMonocle01 = HugeIconData(0x43e0);

  /// IconData for the 'strokeRoundedMonocle' icon.
  static const IconData strokeRoundedMonocle = HugeIconData(0x43e1);

  /// IconData for the 'strokeRoundedMonster' icon.
  static const IconData strokeRoundedMonster = HugeIconData(0x43e2);

  /// IconData for the 'strokeRoundedMoon01' icon.
  static const IconData strokeRoundedMoon01 = HugeIconData(0x43e3);

  /// IconData for the 'strokeRoundedMoon02' icon.
  static const IconData strokeRoundedMoon02 = HugeIconData(0x43e4);

  /// IconData for the 'strokeRoundedMoonAngledRainZap' icon.
  static const IconData strokeRoundedMoonAngledRainZap = HugeIconData(0x43e5);

  /// IconData for the 'strokeRoundedMoonCloudAngledRain' icon.
  static const IconData strokeRoundedMoonCloudAngledRain = HugeIconData(0x43e6);

  /// IconData for the 'strokeRoundedMoonCloudAngledZap' icon.
  static const IconData strokeRoundedMoonCloudAngledZap = HugeIconData(0x43e7);

  /// IconData for the 'strokeRoundedMoonCloudBigRain' icon.
  static const IconData strokeRoundedMoonCloudBigRain = HugeIconData(0x43e8);

  /// IconData for the 'strokeRoundedMoonCloudFastWind' icon.
  static const IconData strokeRoundedMoonCloudFastWind = HugeIconData(0x43e9);

  /// IconData for the 'strokeRoundedMoonCloudHailstone' icon.
  static const IconData strokeRoundedMoonCloudHailstone = HugeIconData(0x43ea);

  /// IconData for the 'strokeRoundedMoonCloudLittleRain' icon.
  static const IconData strokeRoundedMoonCloudLittleRain = HugeIconData(0x43eb);

  /// IconData for the 'strokeRoundedMoonCloudLittleSnow' icon.
  static const IconData strokeRoundedMoonCloudLittleSnow = HugeIconData(0x43ec);

  /// IconData for the 'strokeRoundedMoonCloudMidRain' icon.
  static const IconData strokeRoundedMoonCloudMidRain = HugeIconData(0x43ed);

  /// IconData for the 'strokeRoundedMoonCloudMidSnow' icon.
  static const IconData strokeRoundedMoonCloudMidSnow = HugeIconData(0x43ee);

  /// IconData for the 'strokeRoundedMoonCloudSlowWind' icon.
  static const IconData strokeRoundedMoonCloudSlowWind = HugeIconData(0x43ef);

  /// IconData for the 'strokeRoundedMoonCloudSnow' icon.
  static const IconData strokeRoundedMoonCloudSnow = HugeIconData(0x43f0);

  /// IconData for the 'strokeRoundedMoonCloud' icon.
  static const IconData strokeRoundedMoonCloud = HugeIconData(0x43f1);

  /// IconData for the 'strokeRoundedMoonEclipse' icon.
  static const IconData strokeRoundedMoonEclipse = HugeIconData(0x43f2);

  /// IconData for the 'strokeRoundedMoonFastWind' icon.
  static const IconData strokeRoundedMoonFastWind = HugeIconData(0x43f3);

  /// IconData for the 'strokeRoundedMoonLanding' icon.
  static const IconData strokeRoundedMoonLanding = HugeIconData(0x43f4);

  /// IconData for the 'strokeRoundedMoonSlowWind' icon.
  static const IconData strokeRoundedMoonSlowWind = HugeIconData(0x43f5);

  /// IconData for the 'strokeRoundedMoon' icon.
  static const IconData strokeRoundedMoon = HugeIconData(0x43f6);

  /// IconData for the 'strokeRoundedMoonset' icon.
  static const IconData strokeRoundedMoonset = HugeIconData(0x43f7);

  /// IconData for the 'strokeRoundedMore01' icon.
  static const IconData strokeRoundedMore01 = HugeIconData(0x43f8);

  /// IconData for the 'strokeRoundedMore02' icon.
  static const IconData strokeRoundedMore02 = HugeIconData(0x43f9);

  /// IconData for the 'strokeRoundedMore03' icon.
  static const IconData strokeRoundedMore03 = HugeIconData(0x43fa);

  /// IconData for the 'strokeRoundedMoreHorizontalCircle01' icon.
  static const IconData strokeRoundedMoreHorizontalCircle01 =
      HugeIconData(0x43fb);

  /// IconData for the 'strokeRoundedMoreHorizontalCircle02' icon.
  static const IconData strokeRoundedMoreHorizontalCircle02 =
      HugeIconData(0x43fc);

  /// IconData for the 'strokeRoundedMoreHorizontalSquare01' icon.
  static const IconData strokeRoundedMoreHorizontalSquare01 =
      HugeIconData(0x43fd);

  /// IconData for the 'strokeRoundedMoreHorizontalSquare02' icon.
  static const IconData strokeRoundedMoreHorizontalSquare02 =
      HugeIconData(0x43fe);

  /// IconData for the 'strokeRoundedMoreHorizontal' icon.
  static const IconData strokeRoundedMoreHorizontal = HugeIconData(0x43ff);

  /// IconData for the 'strokeRoundedMoreOrLessCircle' icon.
  static const IconData strokeRoundedMoreOrLessCircle = HugeIconData(0x4400);

  /// IconData for the 'strokeRoundedMoreOrLessSquare' icon.
  static const IconData strokeRoundedMoreOrLessSquare = HugeIconData(0x4401);

  /// IconData for the 'strokeRoundedMoreOrLess' icon.
  static const IconData strokeRoundedMoreOrLess = HugeIconData(0x4402);

  /// IconData for the 'strokeRoundedMoreVerticalCircle01' icon.
  static const IconData strokeRoundedMoreVerticalCircle01 =
      HugeIconData(0x4403);

  /// IconData for the 'strokeRoundedMoreVerticalCircle02' icon.
  static const IconData strokeRoundedMoreVerticalCircle02 =
      HugeIconData(0x4404);

  /// IconData for the 'strokeRoundedMoreVerticalSquare01' icon.
  static const IconData strokeRoundedMoreVerticalSquare01 =
      HugeIconData(0x4405);

  /// IconData for the 'strokeRoundedMoreVerticalSquare02' icon.
  static const IconData strokeRoundedMoreVerticalSquare02 =
      HugeIconData(0x4406);

  /// IconData for the 'strokeRoundedMoreVertical' icon.
  static const IconData strokeRoundedMoreVertical = HugeIconData(0x4407);

  /// IconData for the 'strokeRoundedMore' icon.
  static const IconData strokeRoundedMore = HugeIconData(0x4408);

  /// IconData for the 'strokeRoundedMortar' icon.
  static const IconData strokeRoundedMortar = HugeIconData(0x4409);

  /// IconData for the 'strokeRoundedMortarboard01' icon.
  static const IconData strokeRoundedMortarboard01 = HugeIconData(0x440a);

  /// IconData for the 'strokeRoundedMortarboard02' icon.
  static const IconData strokeRoundedMortarboard02 = HugeIconData(0x440b);

  /// IconData for the 'strokeRoundedMosque01' icon.
  static const IconData strokeRoundedMosque01 = HugeIconData(0x440c);

  /// IconData for the 'strokeRoundedMosque02' icon.
  static const IconData strokeRoundedMosque02 = HugeIconData(0x440d);

  /// IconData for the 'strokeRoundedMosque03' icon.
  static const IconData strokeRoundedMosque03 = HugeIconData(0x440e);

  /// IconData for the 'strokeRoundedMosque04' icon.
  static const IconData strokeRoundedMosque04 = HugeIconData(0x440f);

  /// IconData for the 'strokeRoundedMosque05' icon.
  static const IconData strokeRoundedMosque05 = HugeIconData(0x4410);

  /// IconData for the 'strokeRoundedMosqueLocation' icon.
  static const IconData strokeRoundedMosqueLocation = HugeIconData(0x4411);

  /// IconData for the 'strokeRoundedMotion01' icon.
  static const IconData strokeRoundedMotion01 = HugeIconData(0x4412);

  /// IconData for the 'strokeRoundedMotion02' icon.
  static const IconData strokeRoundedMotion02 = HugeIconData(0x4413);

  /// IconData for the 'strokeRoundedMotorbike01' icon.
  static const IconData strokeRoundedMotorbike01 = HugeIconData(0x4414);

  /// IconData for the 'strokeRoundedMotorbike02' icon.
  static const IconData strokeRoundedMotorbike02 = HugeIconData(0x4415);

  /// IconData for the 'strokeRoundedMountain' icon.
  static const IconData strokeRoundedMountain = HugeIconData(0x4416);

  /// IconData for the 'strokeRoundedMouse01' icon.
  static const IconData strokeRoundedMouse01 = HugeIconData(0x4417);

  /// IconData for the 'strokeRoundedMouse02' icon.
  static const IconData strokeRoundedMouse02 = HugeIconData(0x4418);

  /// IconData for the 'strokeRoundedMouse03' icon.
  static const IconData strokeRoundedMouse03 = HugeIconData(0x4419);

  /// IconData for the 'strokeRoundedMouse04' icon.
  static const IconData strokeRoundedMouse04 = HugeIconData(0x441a);

  /// IconData for the 'strokeRoundedMouse05' icon.
  static const IconData strokeRoundedMouse05 = HugeIconData(0x441b);

  /// IconData for the 'strokeRoundedMouse06' icon.
  static const IconData strokeRoundedMouse06 = HugeIconData(0x441c);

  /// IconData for the 'strokeRoundedMouse07' icon.
  static const IconData strokeRoundedMouse07 = HugeIconData(0x441d);

  /// IconData for the 'strokeRoundedMouse08' icon.
  static const IconData strokeRoundedMouse08 = HugeIconData(0x441e);

  /// IconData for the 'strokeRoundedMouse09' icon.
  static const IconData strokeRoundedMouse09 = HugeIconData(0x441f);

  /// IconData for the 'strokeRoundedMouse10' icon.
  static const IconData strokeRoundedMouse10 = HugeIconData(0x4420);

  /// IconData for the 'strokeRoundedMouse11' icon.
  static const IconData strokeRoundedMouse11 = HugeIconData(0x4421);

  /// IconData for the 'strokeRoundedMouse12' icon.
  static const IconData strokeRoundedMouse12 = HugeIconData(0x4422);

  /// IconData for the 'strokeRoundedMouse13' icon.
  static const IconData strokeRoundedMouse13 = HugeIconData(0x4423);

  /// IconData for the 'strokeRoundedMouse14' icon.
  static const IconData strokeRoundedMouse14 = HugeIconData(0x4424);

  /// IconData for the 'strokeRoundedMouse15' icon.
  static const IconData strokeRoundedMouse15 = HugeIconData(0x4425);

  /// IconData for the 'strokeRoundedMouse16' icon.
  static const IconData strokeRoundedMouse16 = HugeIconData(0x4426);

  /// IconData for the 'strokeRoundedMouse17' icon.
  static const IconData strokeRoundedMouse17 = HugeIconData(0x4427);

  /// IconData for the 'strokeRoundedMouse18' icon.
  static const IconData strokeRoundedMouse18 = HugeIconData(0x4428);

  /// IconData for the 'strokeRoundedMouse19' icon.
  static const IconData strokeRoundedMouse19 = HugeIconData(0x4429);

  /// IconData for the 'strokeRoundedMouse20' icon.
  static const IconData strokeRoundedMouse20 = HugeIconData(0x442a);

  /// IconData for the 'strokeRoundedMouse21' icon.
  static const IconData strokeRoundedMouse21 = HugeIconData(0x442b);

  /// IconData for the 'strokeRoundedMouse22' icon.
  static const IconData strokeRoundedMouse22 = HugeIconData(0x442c);

  /// IconData for the 'strokeRoundedMouse23' icon.
  static const IconData strokeRoundedMouse23 = HugeIconData(0x442d);

  /// IconData for the 'strokeRoundedMouseLeftClick01' icon.
  static const IconData strokeRoundedMouseLeftClick01 = HugeIconData(0x442e);

  /// IconData for the 'strokeRoundedMouseLeftClick02' icon.
  static const IconData strokeRoundedMouseLeftClick02 = HugeIconData(0x442f);

  /// IconData for the 'strokeRoundedMouseLeftClick03' icon.
  static const IconData strokeRoundedMouseLeftClick03 = HugeIconData(0x4430);

  /// IconData for the 'strokeRoundedMouseLeftClick04' icon.
  static const IconData strokeRoundedMouseLeftClick04 = HugeIconData(0x4431);

  /// IconData for the 'strokeRoundedMouseLeftClick05' icon.
  static const IconData strokeRoundedMouseLeftClick05 = HugeIconData(0x4432);

  /// IconData for the 'strokeRoundedMouseLeftClick06' icon.
  static const IconData strokeRoundedMouseLeftClick06 = HugeIconData(0x4433);

  /// IconData for the 'strokeRoundedMouseRightClick01' icon.
  static const IconData strokeRoundedMouseRightClick01 = HugeIconData(0x4434);

  /// IconData for the 'strokeRoundedMouseRightClick02' icon.
  static const IconData strokeRoundedMouseRightClick02 = HugeIconData(0x4435);

  /// IconData for the 'strokeRoundedMouseRightClick03' icon.
  static const IconData strokeRoundedMouseRightClick03 = HugeIconData(0x4436);

  /// IconData for the 'strokeRoundedMouseRightClick04' icon.
  static const IconData strokeRoundedMouseRightClick04 = HugeIconData(0x4437);

  /// IconData for the 'strokeRoundedMouseRightClick05' icon.
  static const IconData strokeRoundedMouseRightClick05 = HugeIconData(0x4438);

  /// IconData for the 'strokeRoundedMouseRightClick06' icon.
  static const IconData strokeRoundedMouseRightClick06 = HugeIconData(0x4439);

  /// IconData for the 'strokeRoundedMouseScroll01' icon.
  static const IconData strokeRoundedMouseScroll01 = HugeIconData(0x443a);

  /// IconData for the 'strokeRoundedMouseScroll02' icon.
  static const IconData strokeRoundedMouseScroll02 = HugeIconData(0x443b);

  /// IconData for the 'strokeRoundedMove01' icon.
  static const IconData strokeRoundedMove01 = HugeIconData(0x443c);

  /// IconData for the 'strokeRoundedMove02' icon.
  static const IconData strokeRoundedMove02 = HugeIconData(0x443d);

  /// IconData for the 'strokeRoundedMoveBottom' icon.
  static const IconData strokeRoundedMoveBottom = HugeIconData(0x443e);

  /// IconData for the 'strokeRoundedMoveLeft' icon.
  static const IconData strokeRoundedMoveLeft = HugeIconData(0x443f);

  /// IconData for the 'strokeRoundedMoveRight' icon.
  static const IconData strokeRoundedMoveRight = HugeIconData(0x4440);

  /// IconData for the 'strokeRoundedMoveTo' icon.
  static const IconData strokeRoundedMoveTo = HugeIconData(0x4441);

  /// IconData for the 'strokeRoundedMoveTop' icon.
  static const IconData strokeRoundedMoveTop = HugeIconData(0x4442);

  /// IconData for the 'strokeRoundedMove' icon.
  static const IconData strokeRoundedMove = HugeIconData(0x4443);

  /// IconData for the 'strokeRoundedMp301' icon.
  static const IconData strokeRoundedMp301 = HugeIconData(0x4444);

  /// IconData for the 'strokeRoundedMp302' icon.
  static const IconData strokeRoundedMp302 = HugeIconData(0x4445);

  /// IconData for the 'strokeRoundedMp401' icon.
  static const IconData strokeRoundedMp401 = HugeIconData(0x4446);

  /// IconData for the 'strokeRoundedMp402' icon.
  static const IconData strokeRoundedMp402 = HugeIconData(0x4447);

  /// IconData for the 'strokeRoundedMuhammad' icon.
  static const IconData strokeRoundedMuhammad = HugeIconData(0x4448);

  /// IconData for the 'strokeRoundedMultiplicationSignCircle' icon.
  static const IconData strokeRoundedMultiplicationSignCircle =
      HugeIconData(0x4449);

  /// IconData for the 'strokeRoundedMultiplicationSignSquare' icon.
  static const IconData strokeRoundedMultiplicationSignSquare =
      HugeIconData(0x444a);

  /// IconData for the 'strokeRoundedMultiplicationSign' icon.
  static const IconData strokeRoundedMultiplicationSign = HugeIconData(0x444b);

  /// IconData for the 'strokeRoundedMushroom01' icon.
  static const IconData strokeRoundedMushroom01 = HugeIconData(0x444c);

  /// IconData for the 'strokeRoundedMushroom' icon.
  static const IconData strokeRoundedMushroom = HugeIconData(0x444d);

  /// IconData for the 'strokeRoundedMusicNote01' icon.
  static const IconData strokeRoundedMusicNote01 = HugeIconData(0x444e);

  /// IconData for the 'strokeRoundedMusicNote02' icon.
  static const IconData strokeRoundedMusicNote02 = HugeIconData(0x444f);

  /// IconData for the 'strokeRoundedMusicNote03' icon.
  static const IconData strokeRoundedMusicNote03 = HugeIconData(0x4450);

  /// IconData for the 'strokeRoundedMusicNote04' icon.
  static const IconData strokeRoundedMusicNote04 = HugeIconData(0x4451);

  /// IconData for the 'strokeRoundedMusicNoteSquare01' icon.
  static const IconData strokeRoundedMusicNoteSquare01 = HugeIconData(0x4452);

  /// IconData for the 'strokeRoundedMusicNoteSquare02' icon.
  static const IconData strokeRoundedMusicNoteSquare02 = HugeIconData(0x4453);

  /// IconData for the 'strokeRoundedMuslim' icon.
  static const IconData strokeRoundedMuslim = HugeIconData(0x4454);

  /// IconData for the 'strokeRoundedMute' icon.
  static const IconData strokeRoundedMute = HugeIconData(0x4455);

  /// IconData for the 'strokeRoundedMymind' icon.
  static const IconData strokeRoundedMymind = HugeIconData(0x4456);

  /// IconData for the 'strokeRoundedNThRootCircle' icon.
  static const IconData strokeRoundedNThRootCircle = HugeIconData(0x4457);

  /// IconData for the 'strokeRoundedNThRootSquare' icon.
  static const IconData strokeRoundedNThRootSquare = HugeIconData(0x4458);

  /// IconData for the 'strokeRoundedNThRoot' icon.
  static const IconData strokeRoundedNThRoot = HugeIconData(0x4459);

  /// IconData for the 'strokeRoundedNanoTechnology' icon.
  static const IconData strokeRoundedNanoTechnology = HugeIconData(0x445a);

  /// IconData for the 'strokeRoundedNaturalFood' icon.
  static const IconData strokeRoundedNaturalFood = HugeIconData(0x445b);

  /// IconData for the 'strokeRoundedNavigation01' icon.
  static const IconData strokeRoundedNavigation01 = HugeIconData(0x445c);

  /// IconData for the 'strokeRoundedNavigation02' icon.
  static const IconData strokeRoundedNavigation02 = HugeIconData(0x445d);

  /// IconData for the 'strokeRoundedNavigation03' icon.
  static const IconData strokeRoundedNavigation03 = HugeIconData(0x445e);

  /// IconData for the 'strokeRoundedNavigation04' icon.
  static const IconData strokeRoundedNavigation04 = HugeIconData(0x445f);

  /// IconData for the 'strokeRoundedNavigator01' icon.
  static const IconData strokeRoundedNavigator01 = HugeIconData(0x4460);

  /// IconData for the 'strokeRoundedNavigator02' icon.
  static const IconData strokeRoundedNavigator02 = HugeIconData(0x4461);

  /// IconData for the 'strokeRoundedNecklace' icon.
  static const IconData strokeRoundedNecklace = HugeIconData(0x4462);

  /// IconData for the 'strokeRoundedNerd' icon.
  static const IconData strokeRoundedNerd = HugeIconData(0x4463);

  /// IconData for the 'strokeRoundedNeuralNetwork' icon.
  static const IconData strokeRoundedNeuralNetwork = HugeIconData(0x4464);

  /// IconData for the 'strokeRoundedNeutral' icon.
  static const IconData strokeRoundedNeutral = HugeIconData(0x4465);

  /// IconData for the 'strokeRoundedNewJob' icon.
  static const IconData strokeRoundedNewJob = HugeIconData(0x4466);

  /// IconData for the 'strokeRoundedNewOffice' icon.
  static const IconData strokeRoundedNewOffice = HugeIconData(0x4467);

  /// IconData for the 'strokeRoundedNewReleases' icon.
  static const IconData strokeRoundedNewReleases = HugeIconData(0x4468);

  /// IconData for the 'strokeRoundedNewTwitterEllipse' icon.
  static const IconData strokeRoundedNewTwitterEllipse = HugeIconData(0x4469);

  /// IconData for the 'strokeRoundedNewTwitterRectangle' icon.
  static const IconData strokeRoundedNewTwitterRectangle = HugeIconData(0x446a);

  /// IconData for the 'strokeRoundedNewTwitter' icon.
  static const IconData strokeRoundedNewTwitter = HugeIconData(0x446b);

  /// IconData for the 'strokeRoundedNews01' icon.
  static const IconData strokeRoundedNews01 = HugeIconData(0x446c);

  /// IconData for the 'strokeRoundedNews' icon.
  static const IconData strokeRoundedNews = HugeIconData(0x446d);

  /// IconData for the 'strokeRoundedNext' icon.
  static const IconData strokeRoundedNext = HugeIconData(0x446e);

  /// IconData for the 'strokeRoundedNike' icon.
  static const IconData strokeRoundedNike = HugeIconData(0x446f);

  /// IconData for the 'strokeRoundedNintendoSwitch' icon.
  static const IconData strokeRoundedNintendoSwitch = HugeIconData(0x4470);

  /// IconData for the 'strokeRoundedNintendo' icon.
  static const IconData strokeRoundedNintendo = HugeIconData(0x4471);

  /// IconData for the 'strokeRoundedNiqab' icon.
  static const IconData strokeRoundedNiqab = HugeIconData(0x4472);

  /// IconData for the 'strokeRoundedNoInternet' icon.
  static const IconData strokeRoundedNoInternet = HugeIconData(0x4473);

  /// IconData for the 'strokeRoundedNoMeetingRoom' icon.
  static const IconData strokeRoundedNoMeetingRoom = HugeIconData(0x4474);

  /// IconData for the 'strokeRoundedNodeAdd' icon.
  static const IconData strokeRoundedNodeAdd = HugeIconData(0x4475);

  /// IconData for the 'strokeRoundedNodeEdit' icon.
  static const IconData strokeRoundedNodeEdit = HugeIconData(0x4476);

  /// IconData for the 'strokeRoundedNodeMoveDown' icon.
  static const IconData strokeRoundedNodeMoveDown = HugeIconData(0x4477);

  /// IconData for the 'strokeRoundedNodeMoveUp' icon.
  static const IconData strokeRoundedNodeMoveUp = HugeIconData(0x4478);

  /// IconData for the 'strokeRoundedNodeRemove' icon.
  static const IconData strokeRoundedNodeRemove = HugeIconData(0x4479);

  /// IconData for the 'strokeRoundedNoodles' icon.
  static const IconData strokeRoundedNoodles = HugeIconData(0x447a);

  /// IconData for the 'strokeRoundedNose' icon.
  static const IconData strokeRoundedNose = HugeIconData(0x447b);

  /// IconData for the 'strokeRoundedNotEqualSignCircle' icon.
  static const IconData strokeRoundedNotEqualSignCircle = HugeIconData(0x447c);

  /// IconData for the 'strokeRoundedNotEqualSignSquare' icon.
  static const IconData strokeRoundedNotEqualSignSquare = HugeIconData(0x447d);

  /// IconData for the 'strokeRoundedNotEqualSign' icon.
  static const IconData strokeRoundedNotEqualSign = HugeIconData(0x447e);

  /// IconData for the 'strokeRoundedNote01' icon.
  static const IconData strokeRoundedNote01 = HugeIconData(0x447f);

  /// IconData for the 'strokeRoundedNote02' icon.
  static const IconData strokeRoundedNote02 = HugeIconData(0x4480);

  /// IconData for the 'strokeRoundedNote03' icon.
  static const IconData strokeRoundedNote03 = HugeIconData(0x4481);

  /// IconData for the 'strokeRoundedNote04' icon.
  static const IconData strokeRoundedNote04 = HugeIconData(0x4482);

  /// IconData for the 'strokeRoundedNote05' icon.
  static const IconData strokeRoundedNote05 = HugeIconData(0x4483);

  /// IconData for the 'strokeRoundedNoteAdd' icon.
  static const IconData strokeRoundedNoteAdd = HugeIconData(0x4484);

  /// IconData for the 'strokeRoundedNoteDone' icon.
  static const IconData strokeRoundedNoteDone = HugeIconData(0x4485);

  /// IconData for the 'strokeRoundedNoteEdit' icon.
  static const IconData strokeRoundedNoteEdit = HugeIconData(0x4486);

  /// IconData for the 'strokeRoundedNoteRemove' icon.
  static const IconData strokeRoundedNoteRemove = HugeIconData(0x4487);

  /// IconData for the 'strokeRoundedNote' icon.
  static const IconData strokeRoundedNote = HugeIconData(0x4488);

  /// IconData for the 'strokeRoundedNotebook01' icon.
  static const IconData strokeRoundedNotebook01 = HugeIconData(0x4489);

  /// IconData for the 'strokeRoundedNotebook02' icon.
  static const IconData strokeRoundedNotebook02 = HugeIconData(0x448a);

  /// IconData for the 'strokeRoundedNotebook' icon.
  static const IconData strokeRoundedNotebook = HugeIconData(0x448b);

  /// IconData for the 'strokeRoundedNotification01' icon.
  static const IconData strokeRoundedNotification01 = HugeIconData(0x448c);

  /// IconData for the 'strokeRoundedNotification02' icon.
  static const IconData strokeRoundedNotification02 = HugeIconData(0x448d);

  /// IconData for the 'strokeRoundedNotification03' icon.
  static const IconData strokeRoundedNotification03 = HugeIconData(0x448e);

  /// IconData for the 'strokeRoundedNotificationBlock01' icon.
  static const IconData strokeRoundedNotificationBlock01 = HugeIconData(0x448f);

  /// IconData for the 'strokeRoundedNotificationBlock02' icon.
  static const IconData strokeRoundedNotificationBlock02 = HugeIconData(0x4490);

  /// IconData for the 'strokeRoundedNotificationBlock03' icon.
  static const IconData strokeRoundedNotificationBlock03 = HugeIconData(0x4491);

  /// IconData for the 'strokeRoundedNotificationBubble' icon.
  static const IconData strokeRoundedNotificationBubble = HugeIconData(0x4492);

  /// IconData for the 'strokeRoundedNotificationCircle' icon.
  static const IconData strokeRoundedNotificationCircle = HugeIconData(0x4493);

  /// IconData for the 'strokeRoundedNotificationOff01' icon.
  static const IconData strokeRoundedNotificationOff01 = HugeIconData(0x4494);

  /// IconData for the 'strokeRoundedNotificationOff02' icon.
  static const IconData strokeRoundedNotificationOff02 = HugeIconData(0x4495);

  /// IconData for the 'strokeRoundedNotificationOff03' icon.
  static const IconData strokeRoundedNotificationOff03 = HugeIconData(0x4496);

  /// IconData for the 'strokeRoundedNotificationSnooze01' icon.
  static const IconData strokeRoundedNotificationSnooze01 =
      HugeIconData(0x4497);

  /// IconData for the 'strokeRoundedNotificationSnooze02' icon.
  static const IconData strokeRoundedNotificationSnooze02 =
      HugeIconData(0x4498);

  /// IconData for the 'strokeRoundedNotificationSnooze03' icon.
  static const IconData strokeRoundedNotificationSnooze03 =
      HugeIconData(0x4499);

  /// IconData for the 'strokeRoundedNotificationSquare' icon.
  static const IconData strokeRoundedNotificationSquare = HugeIconData(0x449a);

  /// IconData for the 'strokeRoundedNotion01' icon.
  static const IconData strokeRoundedNotion01 = HugeIconData(0x449b);

  /// IconData for the 'strokeRoundedNotion02' icon.
  static const IconData strokeRoundedNotion02 = HugeIconData(0x449c);

  /// IconData for the 'strokeRoundedNpm' icon.
  static const IconData strokeRoundedNpm = HugeIconData(0x449d);

  /// IconData for the 'strokeRoundedNuclearPower' icon.
  static const IconData strokeRoundedNuclearPower = HugeIconData(0x449e);

  /// IconData for the 'strokeRoundedNut' icon.
  static const IconData strokeRoundedNut = HugeIconData(0x449f);

  /// IconData for the 'strokeRoundedObtuse' icon.
  static const IconData strokeRoundedObtuse = HugeIconData(0x44a0);

  /// IconData for the 'strokeRoundedOctagon' icon.
  static const IconData strokeRoundedOctagon = HugeIconData(0x44a1);

  /// IconData for the 'strokeRoundedOctopus' icon.
  static const IconData strokeRoundedOctopus = HugeIconData(0x44a2);

  /// IconData for the 'strokeRoundedOffice365' icon.
  static const IconData strokeRoundedOffice365 = HugeIconData(0x44a3);

  /// IconData for the 'strokeRoundedOfficeChair' icon.
  static const IconData strokeRoundedOfficeChair = HugeIconData(0x44a4);

  /// IconData for the 'strokeRoundedOffice' icon.
  static const IconData strokeRoundedOffice = HugeIconData(0x44a5);

  /// IconData for the 'strokeRoundedOilBarrel' icon.
  static const IconData strokeRoundedOilBarrel = HugeIconData(0x44a6);

  /// IconData for the 'strokeRoundedOkFinger' icon.
  static const IconData strokeRoundedOkFinger = HugeIconData(0x44a7);

  /// IconData for the 'strokeRoundedOlympicTorch' icon.
  static const IconData strokeRoundedOlympicTorch = HugeIconData(0x44a8);

  /// IconData for the 'strokeRoundedOnlineLearning01' icon.
  static const IconData strokeRoundedOnlineLearning01 = HugeIconData(0x44a9);

  /// IconData for the 'strokeRoundedOnlineLearning02' icon.
  static const IconData strokeRoundedOnlineLearning02 = HugeIconData(0x44aa);

  /// IconData for the 'strokeRoundedOnlineLearning03' icon.
  static const IconData strokeRoundedOnlineLearning03 = HugeIconData(0x44ab);

  /// IconData for the 'strokeRoundedOnlineLearning04' icon.
  static const IconData strokeRoundedOnlineLearning04 = HugeIconData(0x44ac);

  /// IconData for the 'strokeRoundedOpenCaption' icon.
  static const IconData strokeRoundedOpenCaption = HugeIconData(0x44ad);

  /// IconData for the 'strokeRoundedOption' icon.
  static const IconData strokeRoundedOption = HugeIconData(0x44ae);

  /// IconData for the 'strokeRoundedOrange' icon.
  static const IconData strokeRoundedOrange = HugeIconData(0x44af);

  /// IconData for the 'strokeRoundedOrbit01' icon.
  static const IconData strokeRoundedOrbit01 = HugeIconData(0x44b0);

  /// IconData for the 'strokeRoundedOrbit02' icon.
  static const IconData strokeRoundedOrbit02 = HugeIconData(0x44b1);

  /// IconData for the 'strokeRoundedOrganicFood' icon.
  static const IconData strokeRoundedOrganicFood = HugeIconData(0x44b2);

  /// IconData for the 'strokeRoundedOrthogonalEdge' icon.
  static const IconData strokeRoundedOrthogonalEdge = HugeIconData(0x44b3);

  /// IconData for the 'strokeRoundedOval' icon.
  static const IconData strokeRoundedOval = HugeIconData(0x44b4);

  /// IconData for the 'strokeRoundedOven' icon.
  static const IconData strokeRoundedOven = HugeIconData(0x44b5);

  /// IconData for the 'strokeRoundedPackageAdd' icon.
  static const IconData strokeRoundedPackageAdd = HugeIconData(0x44b6);

  /// IconData for the 'strokeRoundedPackageDelivered' icon.
  static const IconData strokeRoundedPackageDelivered = HugeIconData(0x44b7);

  /// IconData for the 'strokeRoundedPackageMoving' icon.
  static const IconData strokeRoundedPackageMoving = HugeIconData(0x44b8);

  /// IconData for the 'strokeRoundedPackageOpen' icon.
  static const IconData strokeRoundedPackageOpen = HugeIconData(0x44b9);

  /// IconData for the 'strokeRoundedPackageOutOfStock' icon.
  static const IconData strokeRoundedPackageOutOfStock = HugeIconData(0x44ba);

  /// IconData for the 'strokeRoundedPackageProcess' icon.
  static const IconData strokeRoundedPackageProcess = HugeIconData(0x44bb);

  /// IconData for the 'strokeRoundedPackageReceive' icon.
  static const IconData strokeRoundedPackageReceive = HugeIconData(0x44bc);

  /// IconData for the 'strokeRoundedPackageRemove' icon.
  static const IconData strokeRoundedPackageRemove = HugeIconData(0x44bd);

  /// IconData for the 'strokeRoundedPackageSearch' icon.
  static const IconData strokeRoundedPackageSearch = HugeIconData(0x44be);

  /// IconData for the 'strokeRoundedPackageSent' icon.
  static const IconData strokeRoundedPackageSent = HugeIconData(0x44bf);

  /// IconData for the 'strokeRoundedPackage' icon.
  static const IconData strokeRoundedPackage = HugeIconData(0x44c0);

  /// IconData for the 'strokeRoundedPacman01' icon.
  static const IconData strokeRoundedPacman01 = HugeIconData(0x44c1);

  /// IconData for the 'strokeRoundedPacman02' icon.
  static const IconData strokeRoundedPacman02 = HugeIconData(0x44c2);

  /// IconData for the 'strokeRoundedPaintBoard' icon.
  static const IconData strokeRoundedPaintBoard = HugeIconData(0x44c3);

  /// IconData for the 'strokeRoundedPaintBrush01' icon.
  static const IconData strokeRoundedPaintBrush01 = HugeIconData(0x44c4);

  /// IconData for the 'strokeRoundedPaintBrush02' icon.
  static const IconData strokeRoundedPaintBrush02 = HugeIconData(0x44c5);

  /// IconData for the 'strokeRoundedPaintBrush03' icon.
  static const IconData strokeRoundedPaintBrush03 = HugeIconData(0x44c6);

  /// IconData for the 'strokeRoundedPaintBrush04' icon.
  static const IconData strokeRoundedPaintBrush04 = HugeIconData(0x44c7);

  /// IconData for the 'strokeRoundedPaintBucket' icon.
  static const IconData strokeRoundedPaintBucket = HugeIconData(0x44c8);

  /// IconData for the 'strokeRoundedPan01' icon.
  static const IconData strokeRoundedPan01 = HugeIconData(0x44c9);

  /// IconData for the 'strokeRoundedPan02' icon.
  static const IconData strokeRoundedPan02 = HugeIconData(0x44ca);

  /// IconData for the 'strokeRoundedPan03' icon.
  static const IconData strokeRoundedPan03 = HugeIconData(0x44cb);

  /// IconData for the 'strokeRoundedParabola01' icon.
  static const IconData strokeRoundedParabola01 = HugeIconData(0x44cc);

  /// IconData for the 'strokeRoundedParabola02' icon.
  static const IconData strokeRoundedParabola02 = HugeIconData(0x44cd);

  /// IconData for the 'strokeRoundedParabola03' icon.
  static const IconData strokeRoundedParabola03 = HugeIconData(0x44ce);

  /// IconData for the 'strokeRoundedParagliding' icon.
  static const IconData strokeRoundedParagliding = HugeIconData(0x44cf);

  /// IconData for the 'strokeRoundedParagraphBulletsPoint01' icon.
  static const IconData strokeRoundedParagraphBulletsPoint01 =
      HugeIconData(0x44d0);

  /// IconData for the 'strokeRoundedParagraphBulletsPoint02' icon.
  static const IconData strokeRoundedParagraphBulletsPoint02 =
      HugeIconData(0x44d1);

  /// IconData for the 'strokeRoundedParagraphSpacing' icon.
  static const IconData strokeRoundedParagraphSpacing = HugeIconData(0x44d2);

  /// IconData for the 'strokeRoundedParagraph' icon.
  static const IconData strokeRoundedParagraph = HugeIconData(0x44d3);

  /// IconData for the 'strokeRoundedParallelogram' icon.
  static const IconData strokeRoundedParallelogram = HugeIconData(0x44d4);

  /// IconData for the 'strokeRoundedParkingAreaCircle' icon.
  static const IconData strokeRoundedParkingAreaCircle = HugeIconData(0x44d5);

  /// IconData for the 'strokeRoundedParkingAreaSquare' icon.
  static const IconData strokeRoundedParkingAreaSquare = HugeIconData(0x44d6);

  /// IconData for the 'strokeRoundedPassport01' icon.
  static const IconData strokeRoundedPassport01 = HugeIconData(0x44d7);

  /// IconData for the 'strokeRoundedPassportExpired' icon.
  static const IconData strokeRoundedPassportExpired = HugeIconData(0x44d8);

  /// IconData for the 'strokeRoundedPassportValid' icon.
  static const IconData strokeRoundedPassportValid = HugeIconData(0x44d9);

  /// IconData for the 'strokeRoundedPassport' icon.
  static const IconData strokeRoundedPassport = HugeIconData(0x44da);

  /// IconData for the 'strokeRoundedPasswordValidation' icon.
  static const IconData strokeRoundedPasswordValidation = HugeIconData(0x44db);

  /// IconData for the 'strokeRoundedPath' icon.
  static const IconData strokeRoundedPath = HugeIconData(0x44dc);

  /// IconData for the 'strokeRoundedPathfinderCrop' icon.
  static const IconData strokeRoundedPathfinderCrop = HugeIconData(0x44dd);

  /// IconData for the 'strokeRoundedPathfinderDivide' icon.
  static const IconData strokeRoundedPathfinderDivide = HugeIconData(0x44de);

  /// IconData for the 'strokeRoundedPathfinderExclude' icon.
  static const IconData strokeRoundedPathfinderExclude = HugeIconData(0x44df);

  /// IconData for the 'strokeRoundedPathfinderIntersect' icon.
  static const IconData strokeRoundedPathfinderIntersect = HugeIconData(0x44e0);

  /// IconData for the 'strokeRoundedPathfinderMerge' icon.
  static const IconData strokeRoundedPathfinderMerge = HugeIconData(0x44e1);

  /// IconData for the 'strokeRoundedPathfinderMinusBack' icon.
  static const IconData strokeRoundedPathfinderMinusBack = HugeIconData(0x44e2);

  /// IconData for the 'strokeRoundedPathfinderMinusFront' icon.
  static const IconData strokeRoundedPathfinderMinusFront =
      HugeIconData(0x44e3);

  /// IconData for the 'strokeRoundedPathfinderOutline' icon.
  static const IconData strokeRoundedPathfinderOutline = HugeIconData(0x44e4);

  /// IconData for the 'strokeRoundedPathfinderTrim' icon.
  static const IconData strokeRoundedPathfinderTrim = HugeIconData(0x44e5);

  /// IconData for the 'strokeRoundedPathfinderUnite' icon.
  static const IconData strokeRoundedPathfinderUnite = HugeIconData(0x44e6);

  /// IconData for the 'strokeRoundedPatient' icon.
  static const IconData strokeRoundedPatient = HugeIconData(0x44e7);

  /// IconData for the 'strokeRoundedPatio' icon.
  static const IconData strokeRoundedPatio = HugeIconData(0x44e8);

  /// IconData for the 'strokeRoundedPause' icon.
  static const IconData strokeRoundedPause = HugeIconData(0x44e9);

  /// IconData for the 'strokeRoundedPavilon' icon.
  static const IconData strokeRoundedPavilon = HugeIconData(0x44ea);

  /// IconData for the 'strokeRoundedPayByCheck' icon.
  static const IconData strokeRoundedPayByCheck = HugeIconData(0x44eb);

  /// IconData for the 'strokeRoundedPayment01' icon.
  static const IconData strokeRoundedPayment01 = HugeIconData(0x44ec);

  /// IconData for the 'strokeRoundedPayment02' icon.
  static const IconData strokeRoundedPayment02 = HugeIconData(0x44ed);

  /// IconData for the 'strokeRoundedPaymentSuccess01' icon.
  static const IconData strokeRoundedPaymentSuccess01 = HugeIconData(0x44ee);

  /// IconData for the 'strokeRoundedPaymentSuccess02' icon.
  static const IconData strokeRoundedPaymentSuccess02 = HugeIconData(0x44ef);

  /// IconData for the 'strokeRoundedPayoneer' icon.
  static const IconData strokeRoundedPayoneer = HugeIconData(0x44f0);

  /// IconData for the 'strokeRoundedPaypal' icon.
  static const IconData strokeRoundedPaypal = HugeIconData(0x44f1);

  /// IconData for the 'strokeRoundedPdf01' icon.
  static const IconData strokeRoundedPdf01 = HugeIconData(0x44f2);

  /// IconData for the 'strokeRoundedPdf02' icon.
  static const IconData strokeRoundedPdf02 = HugeIconData(0x44f3);

  /// IconData for the 'strokeRoundedPeerToPeer01' icon.
  static const IconData strokeRoundedPeerToPeer01 = HugeIconData(0x44f4);

  /// IconData for the 'strokeRoundedPeerToPeer02' icon.
  static const IconData strokeRoundedPeerToPeer02 = HugeIconData(0x44f5);

  /// IconData for the 'strokeRoundedPeerToPeer03' icon.
  static const IconData strokeRoundedPeerToPeer03 = HugeIconData(0x44f6);

  /// IconData for the 'strokeRoundedPenConnectBluetooth' icon.
  static const IconData strokeRoundedPenConnectBluetooth = HugeIconData(0x44f7);

  /// IconData for the 'strokeRoundedPenConnectUsb' icon.
  static const IconData strokeRoundedPenConnectUsb = HugeIconData(0x44f8);

  /// IconData for the 'strokeRoundedPenConnectWifi' icon.
  static const IconData strokeRoundedPenConnectWifi = HugeIconData(0x44f9);

  /// IconData for the 'strokeRoundedPenTool01' icon.
  static const IconData strokeRoundedPenTool01 = HugeIconData(0x44fa);

  /// IconData for the 'strokeRoundedPenTool02' icon.
  static const IconData strokeRoundedPenTool02 = HugeIconData(0x44fb);

  /// IconData for the 'strokeRoundedPenTool03' icon.
  static const IconData strokeRoundedPenTool03 = HugeIconData(0x44fc);

  /// IconData for the 'strokeRoundedPenToolAdd' icon.
  static const IconData strokeRoundedPenToolAdd = HugeIconData(0x44fd);

  /// IconData for the 'strokeRoundedPenToolMinus' icon.
  static const IconData strokeRoundedPenToolMinus = HugeIconData(0x44fe);

  /// IconData for the 'strokeRoundedPencilEdit01' icon.
  static const IconData strokeRoundedPencilEdit01 = HugeIconData(0x44ff);

  /// IconData for the 'strokeRoundedPencilEdit02' icon.
  static const IconData strokeRoundedPencilEdit02 = HugeIconData(0x4500);

  /// IconData for the 'strokeRoundedPencil' icon.
  static const IconData strokeRoundedPencil = HugeIconData(0x4501);

  /// IconData for the 'strokeRoundedPendulum' icon.
  static const IconData strokeRoundedPendulum = HugeIconData(0x4502);

  /// IconData for the 'strokeRoundedPensive' icon.
  static const IconData strokeRoundedPensive = HugeIconData(0x4503);

  /// IconData for the 'strokeRoundedPentagon01' icon.
  static const IconData strokeRoundedPentagon01 = HugeIconData(0x4504);

  /// IconData for the 'strokeRoundedPentagon' icon.
  static const IconData strokeRoundedPentagon = HugeIconData(0x4505);

  /// IconData for the 'strokeRoundedPercentCircle' icon.
  static const IconData strokeRoundedPercentCircle = HugeIconData(0x4506);

  /// IconData for the 'strokeRoundedPercentSquare' icon.
  static const IconData strokeRoundedPercentSquare = HugeIconData(0x4507);

  /// IconData for the 'strokeRoundedPercent' icon.
  static const IconData strokeRoundedPercent = HugeIconData(0x4508);

  /// IconData for the 'strokeRoundedPerfume' icon.
  static const IconData strokeRoundedPerfume = HugeIconData(0x4509);

  /// IconData for the 'strokeRoundedPeriscope' icon.
  static const IconData strokeRoundedPeriscope = HugeIconData(0x450a);

  /// IconData for the 'strokeRoundedPermanentJob' icon.
  static const IconData strokeRoundedPermanentJob = HugeIconData(0x450b);

  /// IconData for the 'strokeRoundedPerspective' icon.
  static const IconData strokeRoundedPerspective = HugeIconData(0x450c);

  /// IconData for the 'strokeRoundedPexels' icon.
  static const IconData strokeRoundedPexels = HugeIconData(0x450d);

  /// IconData for the 'strokeRoundedPhoneOff01' icon.
  static const IconData strokeRoundedPhoneOff01 = HugeIconData(0x450e);

  /// IconData for the 'strokeRoundedPhoneOff02' icon.
  static const IconData strokeRoundedPhoneOff02 = HugeIconData(0x450f);

  /// IconData for the 'strokeRoundedPhp' icon.
  static const IconData strokeRoundedPhp = HugeIconData(0x4510);

  /// IconData for the 'strokeRoundedPhysics' icon.
  static const IconData strokeRoundedPhysics = HugeIconData(0x4511);

  /// IconData for the 'strokeRoundedPiCircle' icon.
  static const IconData strokeRoundedPiCircle = HugeIconData(0x4512);

  /// IconData for the 'strokeRoundedPiSquare' icon.
  static const IconData strokeRoundedPiSquare = HugeIconData(0x4513);

  /// IconData for the 'strokeRoundedPi' icon.
  static const IconData strokeRoundedPi = HugeIconData(0x4514);

  /// IconData for the 'strokeRoundedPicasa' icon.
  static const IconData strokeRoundedPicasa = HugeIconData(0x4515);

  /// IconData for the 'strokeRoundedPickup01' icon.
  static const IconData strokeRoundedPickup01 = HugeIconData(0x4516);

  /// IconData for the 'strokeRoundedPickup02' icon.
  static const IconData strokeRoundedPickup02 = HugeIconData(0x4517);

  /// IconData for the 'strokeRoundedPictureInPictureExit' icon.
  static const IconData strokeRoundedPictureInPictureExit =
      HugeIconData(0x4518);

  /// IconData for the 'strokeRoundedPictureInPictureOn' icon.
  static const IconData strokeRoundedPictureInPictureOn = HugeIconData(0x4519);

  /// IconData for the 'strokeRoundedPieChartSquare' icon.
  static const IconData strokeRoundedPieChartSquare = HugeIconData(0x451a);

  /// IconData for the 'strokeRoundedPieChart' icon.
  static const IconData strokeRoundedPieChart = HugeIconData(0x451b);

  /// IconData for the 'strokeRoundedPie' icon.
  static const IconData strokeRoundedPie = HugeIconData(0x451c);

  /// IconData for the 'strokeRoundedPiggyBank' icon.
  static const IconData strokeRoundedPiggyBank = HugeIconData(0x451d);

  /// IconData for the 'strokeRoundedPinCode' icon.
  static const IconData strokeRoundedPinCode = HugeIconData(0x451e);

  /// IconData for the 'strokeRoundedPinLocation01' icon.
  static const IconData strokeRoundedPinLocation01 = HugeIconData(0x451f);

  /// IconData for the 'strokeRoundedPinLocation02' icon.
  static const IconData strokeRoundedPinLocation02 = HugeIconData(0x4520);

  /// IconData for the 'strokeRoundedPinLocation03' icon.
  static const IconData strokeRoundedPinLocation03 = HugeIconData(0x4521);

  /// IconData for the 'strokeRoundedPinOff' icon.
  static const IconData strokeRoundedPinOff = HugeIconData(0x4522);

  /// IconData for the 'strokeRoundedPin' icon.
  static const IconData strokeRoundedPin = HugeIconData(0x4523);

  /// IconData for the 'strokeRoundedPinterest' icon.
  static const IconData strokeRoundedPinterest = HugeIconData(0x4524);

  /// IconData for the 'strokeRoundedPipeline' icon.
  static const IconData strokeRoundedPipeline = HugeIconData(0x4525);

  /// IconData for the 'strokeRoundedPisaTower' icon.
  static const IconData strokeRoundedPisaTower = HugeIconData(0x4526);

  /// IconData for the 'strokeRoundedPizza01' icon.
  static const IconData strokeRoundedPizza01 = HugeIconData(0x4527);

  /// IconData for the 'strokeRoundedPizza02' icon.
  static const IconData strokeRoundedPizza02 = HugeIconData(0x4528);

  /// IconData for the 'strokeRoundedPizzaCutter' icon.
  static const IconData strokeRoundedPizzaCutter = HugeIconData(0x4529);

  /// IconData for the 'strokeRoundedPlane' icon.
  static const IconData strokeRoundedPlane = HugeIconData(0x452a);

  /// IconData for the 'strokeRoundedPlant01' icon.
  static const IconData strokeRoundedPlant01 = HugeIconData(0x452b);

  /// IconData for the 'strokeRoundedPlant02' icon.
  static const IconData strokeRoundedPlant02 = HugeIconData(0x452c);

  /// IconData for the 'strokeRoundedPlant03' icon.
  static const IconData strokeRoundedPlant03 = HugeIconData(0x452d);

  /// IconData for the 'strokeRoundedPlant04' icon.
  static const IconData strokeRoundedPlant04 = HugeIconData(0x452e);

  /// IconData for the 'strokeRoundedPlate' icon.
  static const IconData strokeRoundedPlate = HugeIconData(0x452f);

  /// IconData for the 'strokeRoundedPlaxo' icon.
  static const IconData strokeRoundedPlaxo = HugeIconData(0x4530);

  /// IconData for the 'strokeRoundedPlayCircle02' icon.
  static const IconData strokeRoundedPlayCircle02 = HugeIconData(0x4531);

  /// IconData for the 'strokeRoundedPlayCircle' icon.
  static const IconData strokeRoundedPlayCircle = HugeIconData(0x4532);

  /// IconData for the 'strokeRoundedPlayListAdd' icon.
  static const IconData strokeRoundedPlayListAdd = HugeIconData(0x4533);

  /// IconData for the 'strokeRoundedPlayListFavourite01' icon.
  static const IconData strokeRoundedPlayListFavourite01 = HugeIconData(0x4534);

  /// IconData for the 'strokeRoundedPlayListFavourite02' icon.
  static const IconData strokeRoundedPlayListFavourite02 = HugeIconData(0x4535);

  /// IconData for the 'strokeRoundedPlayListMinus' icon.
  static const IconData strokeRoundedPlayListMinus = HugeIconData(0x4536);

  /// IconData for the 'strokeRoundedPlayListRemove' icon.
  static const IconData strokeRoundedPlayListRemove = HugeIconData(0x4537);

  /// IconData for the 'strokeRoundedPlayList' icon.
  static const IconData strokeRoundedPlayList = HugeIconData(0x4538);

  /// IconData for the 'strokeRoundedPlaySquare' icon.
  static const IconData strokeRoundedPlaySquare = HugeIconData(0x4539);

  /// IconData for the 'strokeRoundedPlayStore' icon.
  static const IconData strokeRoundedPlayStore = HugeIconData(0x453a);

  /// IconData for the 'strokeRoundedPlay' icon.
  static const IconData strokeRoundedPlay = HugeIconData(0x453b);

  /// IconData for the 'strokeRoundedPlaylist01' icon.
  static const IconData strokeRoundedPlaylist01 = HugeIconData(0x453c);

  /// IconData for the 'strokeRoundedPlaylist02' icon.
  static const IconData strokeRoundedPlaylist02 = HugeIconData(0x453d);

  /// IconData for the 'strokeRoundedPlaylist03' icon.
  static const IconData strokeRoundedPlaylist03 = HugeIconData(0x453e);

  /// IconData for the 'strokeRoundedPlaza' icon.
  static const IconData strokeRoundedPlaza = HugeIconData(0x453f);

  /// IconData for the 'strokeRoundedPlug01' icon.
  static const IconData strokeRoundedPlug01 = HugeIconData(0x4540);

  /// IconData for the 'strokeRoundedPlug02' icon.
  static const IconData strokeRoundedPlug02 = HugeIconData(0x4541);

  /// IconData for the 'strokeRoundedPlugSocket' icon.
  static const IconData strokeRoundedPlugSocket = HugeIconData(0x4542);

  /// IconData for the 'strokeRoundedPlusMinus01' icon.
  static const IconData strokeRoundedPlusMinus01 = HugeIconData(0x4543);

  /// IconData for the 'strokeRoundedPlusMinus02' icon.
  static const IconData strokeRoundedPlusMinus02 = HugeIconData(0x4544);

  /// IconData for the 'strokeRoundedPlusMinusCircle01' icon.
  static const IconData strokeRoundedPlusMinusCircle01 = HugeIconData(0x4545);

  /// IconData for the 'strokeRoundedPlusMinusCircle02' icon.
  static const IconData strokeRoundedPlusMinusCircle02 = HugeIconData(0x4546);

  /// IconData for the 'strokeRoundedPlusMinusSquare01' icon.
  static const IconData strokeRoundedPlusMinusSquare01 = HugeIconData(0x4547);

  /// IconData for the 'strokeRoundedPlusMinusSquare02' icon.
  static const IconData strokeRoundedPlusMinusSquare02 = HugeIconData(0x4548);

  /// IconData for the 'strokeRoundedPlusMinus' icon.
  static const IconData strokeRoundedPlusMinus = HugeIconData(0x4549);

  /// IconData for the 'strokeRoundedPlusSignCircle' icon.
  static const IconData strokeRoundedPlusSignCircle = HugeIconData(0x454a);

  /// IconData for the 'strokeRoundedPlusSignSquare' icon.
  static const IconData strokeRoundedPlusSignSquare = HugeIconData(0x454b);

  /// IconData for the 'strokeRoundedPlusSign' icon.
  static const IconData strokeRoundedPlusSign = HugeIconData(0x454c);

  /// IconData for the 'strokeRoundedPng01' icon.
  static const IconData strokeRoundedPng01 = HugeIconData(0x454d);

  /// IconData for the 'strokeRoundedPng02' icon.
  static const IconData strokeRoundedPng02 = HugeIconData(0x454e);

  /// IconData for the 'strokeRoundedPodium' icon.
  static const IconData strokeRoundedPodium = HugeIconData(0x454f);

  /// IconData for the 'strokeRoundedPointingLeft01' icon.
  static const IconData strokeRoundedPointingLeft01 = HugeIconData(0x4550);

  /// IconData for the 'strokeRoundedPointingLeft02' icon.
  static const IconData strokeRoundedPointingLeft02 = HugeIconData(0x4551);

  /// IconData for the 'strokeRoundedPointingLeft03' icon.
  static const IconData strokeRoundedPointingLeft03 = HugeIconData(0x4552);

  /// IconData for the 'strokeRoundedPointingLeft04' icon.
  static const IconData strokeRoundedPointingLeft04 = HugeIconData(0x4553);

  /// IconData for the 'strokeRoundedPointingLeft05' icon.
  static const IconData strokeRoundedPointingLeft05 = HugeIconData(0x4554);

  /// IconData for the 'strokeRoundedPointingLeft06' icon.
  static const IconData strokeRoundedPointingLeft06 = HugeIconData(0x4555);

  /// IconData for the 'strokeRoundedPointingLeft07' icon.
  static const IconData strokeRoundedPointingLeft07 = HugeIconData(0x4556);

  /// IconData for the 'strokeRoundedPointingLeft08' icon.
  static const IconData strokeRoundedPointingLeft08 = HugeIconData(0x4557);

  /// IconData for the 'strokeRoundedPointingRight01' icon.
  static const IconData strokeRoundedPointingRight01 = HugeIconData(0x4558);

  /// IconData for the 'strokeRoundedPointingRight02' icon.
  static const IconData strokeRoundedPointingRight02 = HugeIconData(0x4559);

  /// IconData for the 'strokeRoundedPointingRight03' icon.
  static const IconData strokeRoundedPointingRight03 = HugeIconData(0x455a);

  /// IconData for the 'strokeRoundedPointingRight04' icon.
  static const IconData strokeRoundedPointingRight04 = HugeIconData(0x455b);

  /// IconData for the 'strokeRoundedPointingRight05' icon.
  static const IconData strokeRoundedPointingRight05 = HugeIconData(0x455c);

  /// IconData for the 'strokeRoundedPointingRight06' icon.
  static const IconData strokeRoundedPointingRight06 = HugeIconData(0x455d);

  /// IconData for the 'strokeRoundedPointingRight07' icon.
  static const IconData strokeRoundedPointingRight07 = HugeIconData(0x455e);

  /// IconData for the 'strokeRoundedPointingRight08' icon.
  static const IconData strokeRoundedPointingRight08 = HugeIconData(0x455f);

  /// IconData for the 'strokeRoundedPokeball' icon.
  static const IconData strokeRoundedPokeball = HugeIconData(0x4560);

  /// IconData for the 'strokeRoundedPokemon' icon.
  static const IconData strokeRoundedPokemon = HugeIconData(0x4561);

  /// IconData for the 'strokeRoundedPoliceBadge' icon.
  static const IconData strokeRoundedPoliceBadge = HugeIconData(0x4562);

  /// IconData for the 'strokeRoundedPoliceCap' icon.
  static const IconData strokeRoundedPoliceCap = HugeIconData(0x4563);

  /// IconData for the 'strokeRoundedPoliceCar' icon.
  static const IconData strokeRoundedPoliceCar = HugeIconData(0x4564);

  /// IconData for the 'strokeRoundedPoliceStation' icon.
  static const IconData strokeRoundedPoliceStation = HugeIconData(0x4565);

  /// IconData for the 'strokeRoundedPolicy' icon.
  static const IconData strokeRoundedPolicy = HugeIconData(0x4566);

  /// IconData for the 'strokeRoundedPolygon' icon.
  static const IconData strokeRoundedPolygon = HugeIconData(0x4567);

  /// IconData for the 'strokeRoundedPoolTable' icon.
  static const IconData strokeRoundedPoolTable = HugeIconData(0x4568);

  /// IconData for the 'strokeRoundedPool' icon.
  static const IconData strokeRoundedPool = HugeIconData(0x4569);

  /// IconData for the 'strokeRoundedPoop' icon.
  static const IconData strokeRoundedPoop = HugeIconData(0x456a);

  /// IconData for the 'strokeRoundedPopcorn' icon.
  static const IconData strokeRoundedPopcorn = HugeIconData(0x456b);

  /// IconData for the 'strokeRoundedPot01' icon.
  static const IconData strokeRoundedPot01 = HugeIconData(0x456c);

  /// IconData for the 'strokeRoundedPot02' icon.
  static const IconData strokeRoundedPot02 = HugeIconData(0x456d);

  /// IconData for the 'strokeRoundedPotion' icon.
  static const IconData strokeRoundedPotion = HugeIconData(0x456e);

  /// IconData for the 'strokeRoundedPoundCircle' icon.
  static const IconData strokeRoundedPoundCircle = HugeIconData(0x456f);

  /// IconData for the 'strokeRoundedPoundReceive' icon.
  static const IconData strokeRoundedPoundReceive = HugeIconData(0x4570);

  /// IconData for the 'strokeRoundedPoundSend' icon.
  static const IconData strokeRoundedPoundSend = HugeIconData(0x4571);

  /// IconData for the 'strokeRoundedPoundSquare' icon.
  static const IconData strokeRoundedPoundSquare = HugeIconData(0x4572);

  /// IconData for the 'strokeRoundedPound' icon.
  static const IconData strokeRoundedPound = HugeIconData(0x4573);

  /// IconData for the 'strokeRoundedPowerService' icon.
  static const IconData strokeRoundedPowerService = HugeIconData(0x4574);

  /// IconData for the 'strokeRoundedPowerSocket01' icon.
  static const IconData strokeRoundedPowerSocket01 = HugeIconData(0x4575);

  /// IconData for the 'strokeRoundedPowerSocket02' icon.
  static const IconData strokeRoundedPowerSocket02 = HugeIconData(0x4576);

  /// IconData for the 'strokeRoundedPpt01' icon.
  static const IconData strokeRoundedPpt01 = HugeIconData(0x4577);

  /// IconData for the 'strokeRoundedPpt02' icon.
  static const IconData strokeRoundedPpt02 = HugeIconData(0x4578);

  /// IconData for the 'strokeRoundedPrawn' icon.
  static const IconData strokeRoundedPrawn = HugeIconData(0x4579);

  /// IconData for the 'strokeRoundedPrayerRug01' icon.
  static const IconData strokeRoundedPrayerRug01 = HugeIconData(0x457a);

  /// IconData for the 'strokeRoundedPrayerRug02' icon.
  static const IconData strokeRoundedPrayerRug02 = HugeIconData(0x457b);

  /// IconData for the 'strokeRoundedPreferenceHorizontal' icon.
  static const IconData strokeRoundedPreferenceHorizontal =
      HugeIconData(0x457c);

  /// IconData for the 'strokeRoundedPreferenceVertical' icon.
  static const IconData strokeRoundedPreferenceVertical = HugeIconData(0x457d);

  /// IconData for the 'strokeRoundedPrescription' icon.
  static const IconData strokeRoundedPrescription = HugeIconData(0x457e);

  /// IconData for the 'strokeRoundedPresentation01' icon.
  static const IconData strokeRoundedPresentation01 = HugeIconData(0x457f);

  /// IconData for the 'strokeRoundedPresentation02' icon.
  static const IconData strokeRoundedPresentation02 = HugeIconData(0x4580);

  /// IconData for the 'strokeRoundedPresentation03' icon.
  static const IconData strokeRoundedPresentation03 = HugeIconData(0x4581);

  /// IconData for the 'strokeRoundedPresentation04' icon.
  static const IconData strokeRoundedPresentation04 = HugeIconData(0x4582);

  /// IconData for the 'strokeRoundedPresentation05' icon.
  static const IconData strokeRoundedPresentation05 = HugeIconData(0x4583);

  /// IconData for the 'strokeRoundedPresentation06' icon.
  static const IconData strokeRoundedPresentation06 = HugeIconData(0x4584);

  /// IconData for the 'strokeRoundedPresentation07' icon.
  static const IconData strokeRoundedPresentation07 = HugeIconData(0x4585);

  /// IconData for the 'strokeRoundedPresentationBarChart01' icon.
  static const IconData strokeRoundedPresentationBarChart01 =
      HugeIconData(0x4586);

  /// IconData for the 'strokeRoundedPresentationBarChart02' icon.
  static const IconData strokeRoundedPresentationBarChart02 =
      HugeIconData(0x4587);

  /// IconData for the 'strokeRoundedPresentationLineChart01' icon.
  static const IconData strokeRoundedPresentationLineChart01 =
      HugeIconData(0x4588);

  /// IconData for the 'strokeRoundedPresentationLineChart02' icon.
  static const IconData strokeRoundedPresentationLineChart02 =
      HugeIconData(0x4589);

  /// IconData for the 'strokeRoundedPresentationOnline' icon.
  static const IconData strokeRoundedPresentationOnline = HugeIconData(0x458a);

  /// IconData for the 'strokeRoundedPresentationPodium' icon.
  static const IconData strokeRoundedPresentationPodium = HugeIconData(0x458b);

  /// IconData for the 'strokeRoundedPrevious' icon.
  static const IconData strokeRoundedPrevious = HugeIconData(0x458c);

  /// IconData for the 'strokeRoundedPrinterOff' icon.
  static const IconData strokeRoundedPrinterOff = HugeIconData(0x458d);

  /// IconData for the 'strokeRoundedPrinter' icon.
  static const IconData strokeRoundedPrinter = HugeIconData(0x458e);

  /// IconData for the 'strokeRoundedPrism01' icon.
  static const IconData strokeRoundedPrism01 = HugeIconData(0x458f);

  /// IconData for the 'strokeRoundedPrism' icon.
  static const IconData strokeRoundedPrism = HugeIconData(0x4590);

  /// IconData for the 'strokeRoundedPrisonGuard' icon.
  static const IconData strokeRoundedPrisonGuard = HugeIconData(0x4591);

  /// IconData for the 'strokeRoundedPrison' icon.
  static const IconData strokeRoundedPrison = HugeIconData(0x4592);

  /// IconData for the 'strokeRoundedPrisoner' icon.
  static const IconData strokeRoundedPrisoner = HugeIconData(0x4593);

  /// IconData for the 'strokeRoundedProductLoading' icon.
  static const IconData strokeRoundedProductLoading = HugeIconData(0x4594);

  /// IconData for the 'strokeRoundedProfile02' icon.
  static const IconData strokeRoundedProfile02 = HugeIconData(0x4595);

  /// IconData for the 'strokeRoundedProfile' icon.
  static const IconData strokeRoundedProfile = HugeIconData(0x4596);

  /// IconData for the 'strokeRoundedProfit' icon.
  static const IconData strokeRoundedProfit = HugeIconData(0x4597);

  /// IconData for the 'strokeRoundedProgrammingFlag' icon.
  static const IconData strokeRoundedProgrammingFlag = HugeIconData(0x4598);

  /// IconData for the 'strokeRoundedProjector01' icon.
  static const IconData strokeRoundedProjector01 = HugeIconData(0x4599);

  /// IconData for the 'strokeRoundedProjector' icon.
  static const IconData strokeRoundedProjector = HugeIconData(0x459a);

  /// IconData for the 'strokeRoundedPromotion' icon.
  static const IconData strokeRoundedPromotion = HugeIconData(0x459b);

  /// IconData for the 'strokeRoundedPropertyAdd' icon.
  static const IconData strokeRoundedPropertyAdd = HugeIconData(0x459c);

  /// IconData for the 'strokeRoundedPropertyDelete' icon.
  static const IconData strokeRoundedPropertyDelete = HugeIconData(0x459d);

  /// IconData for the 'strokeRoundedPropertyEdit' icon.
  static const IconData strokeRoundedPropertyEdit = HugeIconData(0x459e);

  /// IconData for the 'strokeRoundedPropertyNew' icon.
  static const IconData strokeRoundedPropertyNew = HugeIconData(0x459f);

  /// IconData for the 'strokeRoundedPropertySearch' icon.
  static const IconData strokeRoundedPropertySearch = HugeIconData(0x45a0);

  /// IconData for the 'strokeRoundedPropertyView' icon.
  static const IconData strokeRoundedPropertyView = HugeIconData(0x45a1);

  /// IconData for the 'strokeRoundedProtectionMask' icon.
  static const IconData strokeRoundedProtectionMask = HugeIconData(0x45a2);

  /// IconData for the 'strokeRoundedPulley' icon.
  static const IconData strokeRoundedPulley = HugeIconData(0x45a3);

  /// IconData for the 'strokeRoundedPulse01' icon.
  static const IconData strokeRoundedPulse01 = HugeIconData(0x45a4);

  /// IconData for the 'strokeRoundedPulse02' icon.
  static const IconData strokeRoundedPulse02 = HugeIconData(0x45a5);

  /// IconData for the 'strokeRoundedPulseRectangle01' icon.
  static const IconData strokeRoundedPulseRectangle01 = HugeIconData(0x45a6);

  /// IconData for the 'strokeRoundedPulseRectangle02' icon.
  static const IconData strokeRoundedPulseRectangle02 = HugeIconData(0x45a7);

  /// IconData for the 'strokeRoundedPumpkin' icon.
  static const IconData strokeRoundedPumpkin = HugeIconData(0x45a8);

  /// IconData for the 'strokeRoundedPunch' icon.
  static const IconData strokeRoundedPunch = HugeIconData(0x45a9);

  /// IconData for the 'strokeRoundedPunchingBall01' icon.
  static const IconData strokeRoundedPunchingBall01 = HugeIconData(0x45aa);

  /// IconData for the 'strokeRoundedPunchingBall02' icon.
  static const IconData strokeRoundedPunchingBall02 = HugeIconData(0x45ab);

  /// IconData for the 'strokeRoundedPurse01' icon.
  static const IconData strokeRoundedPurse01 = HugeIconData(0x45ac);

  /// IconData for the 'strokeRoundedPurse' icon.
  static const IconData strokeRoundedPurse = HugeIconData(0x45ad);

  /// IconData for the 'strokeRoundedPushUpBar' icon.
  static const IconData strokeRoundedPushUpBar = HugeIconData(0x45ae);

  /// IconData for the 'strokeRoundedPuzzle' icon.
  static const IconData strokeRoundedPuzzle = HugeIconData(0x45af);

  /// IconData for the 'strokeRoundedPyramidMaslowo' icon.
  static const IconData strokeRoundedPyramidMaslowo = HugeIconData(0x45b0);

  /// IconData for the 'strokeRoundedPyramidStructure01' icon.
  static const IconData strokeRoundedPyramidStructure01 = HugeIconData(0x45b1);

  /// IconData for the 'strokeRoundedPyramidStructure02' icon.
  static const IconData strokeRoundedPyramidStructure02 = HugeIconData(0x45b2);

  /// IconData for the 'strokeRoundedPyramid' icon.
  static const IconData strokeRoundedPyramid = HugeIconData(0x45b3);

  /// IconData for the 'strokeRoundedQqPlot' icon.
  static const IconData strokeRoundedQqPlot = HugeIconData(0x45b4);

  /// IconData for the 'strokeRoundedQrCode01' icon.
  static const IconData strokeRoundedQrCode01 = HugeIconData(0x45b5);

  /// IconData for the 'strokeRoundedQrCode' icon.
  static const IconData strokeRoundedQrCode = HugeIconData(0x45b6);

  /// IconData for the 'strokeRoundedQuestion' icon.
  static const IconData strokeRoundedQuestion = HugeIconData(0x45b7);

  /// IconData for the 'strokeRoundedQueue01' icon.
  static const IconData strokeRoundedQueue01 = HugeIconData(0x45b8);

  /// IconData for the 'strokeRoundedQueue02' icon.
  static const IconData strokeRoundedQueue02 = HugeIconData(0x45b9);

  /// IconData for the 'strokeRoundedQuillWrite01' icon.
  static const IconData strokeRoundedQuillWrite01 = HugeIconData(0x45ba);

  /// IconData for the 'strokeRoundedQuillWrite02' icon.
  static const IconData strokeRoundedQuillWrite02 = HugeIconData(0x45bb);

  /// IconData for the 'strokeRoundedQuiz01' icon.
  static const IconData strokeRoundedQuiz01 = HugeIconData(0x45bc);

  /// IconData for the 'strokeRoundedQuiz02' icon.
  static const IconData strokeRoundedQuiz02 = HugeIconData(0x45bd);

  /// IconData for the 'strokeRoundedQuiz03' icon.
  static const IconData strokeRoundedQuiz03 = HugeIconData(0x45be);

  /// IconData for the 'strokeRoundedQuiz04' icon.
  static const IconData strokeRoundedQuiz04 = HugeIconData(0x45bf);

  /// IconData for the 'strokeRoundedQuiz05' icon.
  static const IconData strokeRoundedQuiz05 = HugeIconData(0x45c0);

  /// IconData for the 'strokeRoundedQuora' icon.
  static const IconData strokeRoundedQuora = HugeIconData(0x45c1);

  /// IconData for the 'strokeRoundedQuoteDownCircle' icon.
  static const IconData strokeRoundedQuoteDownCircle = HugeIconData(0x45c2);

  /// IconData for the 'strokeRoundedQuoteDownSquare' icon.
  static const IconData strokeRoundedQuoteDownSquare = HugeIconData(0x45c3);

  /// IconData for the 'strokeRoundedQuoteDown' icon.
  static const IconData strokeRoundedQuoteDown = HugeIconData(0x45c4);

  /// IconData for the 'strokeRoundedQuoteUpCircle' icon.
  static const IconData strokeRoundedQuoteUpCircle = HugeIconData(0x45c5);

  /// IconData for the 'strokeRoundedQuoteUpSquare' icon.
  static const IconData strokeRoundedQuoteUpSquare = HugeIconData(0x45c6);

  /// IconData for the 'strokeRoundedQuoteUp' icon.
  static const IconData strokeRoundedQuoteUp = HugeIconData(0x45c7);

  /// IconData for the 'strokeRoundedQuotes' icon.
  static const IconData strokeRoundedQuotes = HugeIconData(0x45c8);

  /// IconData for the 'strokeRoundedQuran01' icon.
  static const IconData strokeRoundedQuran01 = HugeIconData(0x45c9);

  /// IconData for the 'strokeRoundedQuran02' icon.
  static const IconData strokeRoundedQuran02 = HugeIconData(0x45ca);

  /// IconData for the 'strokeRoundedQuran03' icon.
  static const IconData strokeRoundedQuran03 = HugeIconData(0x45cb);

  /// IconData for the 'strokeRoundedRacingFlag' icon.
  static const IconData strokeRoundedRacingFlag = HugeIconData(0x45cc);

  /// IconData for the 'strokeRoundedRadar01' icon.
  static const IconData strokeRoundedRadar01 = HugeIconData(0x45cd);

  /// IconData for the 'strokeRoundedRadar02' icon.
  static const IconData strokeRoundedRadar02 = HugeIconData(0x45ce);

  /// IconData for the 'strokeRoundedRadial' icon.
  static const IconData strokeRoundedRadial = HugeIconData(0x45cf);

  /// IconData for the 'strokeRoundedRadio01' icon.
  static const IconData strokeRoundedRadio01 = HugeIconData(0x45d0);

  /// IconData for the 'strokeRoundedRadio02' icon.
  static const IconData strokeRoundedRadio02 = HugeIconData(0x45d1);

  /// IconData for the 'strokeRoundedRadio' icon.
  static const IconData strokeRoundedRadio = HugeIconData(0x45d2);

  /// IconData for the 'strokeRoundedRadioactiveAlert' icon.
  static const IconData strokeRoundedRadioactiveAlert = HugeIconData(0x45d3);

  /// IconData for the 'strokeRoundedRadius' icon.
  static const IconData strokeRoundedRadius = HugeIconData(0x45d4);

  /// IconData for the 'strokeRoundedRainDoubleDrop' icon.
  static const IconData strokeRoundedRainDoubleDrop = HugeIconData(0x45d5);

  /// IconData for the 'strokeRoundedRainDrop' icon.
  static const IconData strokeRoundedRainDrop = HugeIconData(0x45d6);

  /// IconData for the 'strokeRoundedRain' icon.
  static const IconData strokeRoundedRain = HugeIconData(0x45d7);

  /// IconData for the 'strokeRoundedRainbow' icon.
  static const IconData strokeRoundedRainbow = HugeIconData(0x45d8);

  /// IconData for the 'strokeRoundedRamadhan01' icon.
  static const IconData strokeRoundedRamadhan01 = HugeIconData(0x45d9);

  /// IconData for the 'strokeRoundedRamadhan02' icon.
  static const IconData strokeRoundedRamadhan02 = HugeIconData(0x45da);

  /// IconData for the 'strokeRoundedRamadhanMonth' icon.
  static const IconData strokeRoundedRamadhanMonth = HugeIconData(0x45db);

  /// IconData for the 'strokeRoundedRanking' icon.
  static const IconData strokeRoundedRanking = HugeIconData(0x45dc);

  /// IconData for the 'strokeRoundedRaw01' icon.
  static const IconData strokeRoundedRaw01 = HugeIconData(0x45dd);

  /// IconData for the 'strokeRoundedRaw02' icon.
  static const IconData strokeRoundedRaw02 = HugeIconData(0x45de);

  /// IconData for the 'strokeRoundedReact' icon.
  static const IconData strokeRoundedReact = HugeIconData(0x45e0);

  /// IconData for the 'strokeRoundedRealEstate01' icon.
  static const IconData strokeRoundedRealEstate01 = HugeIconData(0x45e1);

  /// IconData for the 'strokeRoundedRealEstate02' icon.
  static const IconData strokeRoundedRealEstate02 = HugeIconData(0x45e2);

  /// IconData for the 'strokeRoundedRecord' icon.
  static const IconData strokeRoundedRecord = HugeIconData(0x45e3);

  /// IconData for the 'strokeRoundedRecoveryMail' icon.
  static const IconData strokeRoundedRecoveryMail = HugeIconData(0x45e4);

  /// IconData for the 'strokeRoundedRectangular01' icon.
  static const IconData strokeRoundedRectangular01 = HugeIconData(0x45e5);

  /// IconData for the 'strokeRoundedRectangular' icon.
  static const IconData strokeRoundedRectangular = HugeIconData(0x45e6);

  /// IconData for the 'strokeRoundedRecycle01' icon.
  static const IconData strokeRoundedRecycle01 = HugeIconData(0x45e7);

  /// IconData for the 'strokeRoundedRecycle02' icon.
  static const IconData strokeRoundedRecycle02 = HugeIconData(0x45e8);

  /// IconData for the 'strokeRoundedRecycle03' icon.
  static const IconData strokeRoundedRecycle03 = HugeIconData(0x45e9);

  /// IconData for the 'strokeRoundedReddit' icon.
  static const IconData strokeRoundedReddit = HugeIconData(0x45ea);

  /// IconData for the 'strokeRoundedReflex' icon.
  static const IconData strokeRoundedReflex = HugeIconData(0x45eb);

  /// IconData for the 'strokeRoundedRefresh' icon.
  static const IconData strokeRoundedRefresh = HugeIconData(0x45ec);

  /// IconData for the 'strokeRoundedRefrigerator' icon.
  static const IconData strokeRoundedRefrigerator = HugeIconData(0x45ed);

  /// IconData for the 'strokeRoundedRegister' icon.
  static const IconData strokeRoundedRegister = HugeIconData(0x45ee);

  /// IconData for the 'strokeRoundedRegistered' icon.
  static const IconData strokeRoundedRegistered = HugeIconData(0x45ef);

  /// IconData for the 'strokeRoundedRelieved01' icon.
  static const IconData strokeRoundedRelieved01 = HugeIconData(0x45f0);

  /// IconData for the 'strokeRoundedRelieved02' icon.
  static const IconData strokeRoundedRelieved02 = HugeIconData(0x45f1);

  /// IconData for the 'strokeRoundedReload' icon.
  static const IconData strokeRoundedReload = HugeIconData(0x45f2);

  /// IconData for the 'strokeRoundedReminder' icon.
  static const IconData strokeRoundedReminder = HugeIconData(0x45f3);

  /// IconData for the 'strokeRoundedRemoteControl' icon.
  static const IconData strokeRoundedRemoteControl = HugeIconData(0x45f4);

  /// IconData for the 'strokeRoundedRemove01' icon.
  static const IconData strokeRoundedRemove01 = HugeIconData(0x45f5);

  /// IconData for the 'strokeRoundedRemove02' icon.
  static const IconData strokeRoundedRemove02 = HugeIconData(0x45f6);

  /// IconData for the 'strokeRoundedRemoveCircleHalfDot' icon.
  static const IconData strokeRoundedRemoveCircleHalfDot = HugeIconData(0x45f7);

  /// IconData for the 'strokeRoundedRemoveCircle' icon.
  static const IconData strokeRoundedRemoveCircle = HugeIconData(0x45f8);

  /// IconData for the 'strokeRoundedRemovePi' icon.
  static const IconData strokeRoundedRemovePi = HugeIconData(0x45f9);

  /// IconData for the 'strokeRoundedRemoveSquare' icon.
  static const IconData strokeRoundedRemoveSquare = HugeIconData(0x45fa);

  /// IconData for the 'strokeRoundedRenewableEnergy01' icon.
  static const IconData strokeRoundedRenewableEnergy01 = HugeIconData(0x45fb);

  /// IconData for the 'strokeRoundedRenewableEnergy' icon.
  static const IconData strokeRoundedRenewableEnergy = HugeIconData(0x45fc);

  /// IconData for the 'strokeRoundedRepair' icon.
  static const IconData strokeRoundedRepair = HugeIconData(0x45fd);

  /// IconData for the 'strokeRoundedRepeatOff' icon.
  static const IconData strokeRoundedRepeatOff = HugeIconData(0x45fe);

  /// IconData for the 'strokeRoundedRepeatOne01' icon.
  static const IconData strokeRoundedRepeatOne01 = HugeIconData(0x45ff);

  /// IconData for the 'strokeRoundedRepeatOne02' icon.
  static const IconData strokeRoundedRepeatOne02 = HugeIconData(0x4600);

  /// IconData for the 'strokeRoundedRepeat' icon.
  static const IconData strokeRoundedRepeat = HugeIconData(0x4601);

  /// IconData for the 'strokeRoundedReplay' icon.
  static const IconData strokeRoundedReplay = HugeIconData(0x4602);

  /// IconData for the 'strokeRoundedRepository' icon.
  static const IconData strokeRoundedRepository = HugeIconData(0x4603);

  /// IconData for the 'strokeRoundedResetPassword' icon.
  static const IconData strokeRoundedResetPassword = HugeIconData(0x4604);

  /// IconData for the 'strokeRoundedResize01' icon.
  static const IconData strokeRoundedResize01 = HugeIconData(0x4605);

  /// IconData for the 'strokeRoundedResize02' icon.
  static const IconData strokeRoundedResize02 = HugeIconData(0x4606);

  /// IconData for the 'strokeRoundedResourcesAdd' icon.
  static const IconData strokeRoundedResourcesAdd = HugeIconData(0x4607);

  /// IconData for the 'strokeRoundedResourcesRemove' icon.
  static const IconData strokeRoundedResourcesRemove = HugeIconData(0x4608);

  /// IconData for the 'strokeRoundedRestaurant01' icon.
  static const IconData strokeRoundedRestaurant01 = HugeIconData(0x4609);

  /// IconData for the 'strokeRoundedRestaurant02' icon.
  static const IconData strokeRoundedRestaurant02 = HugeIconData(0x460a);

  /// IconData for the 'strokeRoundedRestaurant03' icon.
  static const IconData strokeRoundedRestaurant03 = HugeIconData(0x460b);

  /// IconData for the 'strokeRoundedRestaurantTable' icon.
  static const IconData strokeRoundedRestaurantTable = HugeIconData(0x460c);

  /// IconData for the 'strokeRoundedRestoreBin' icon.
  static const IconData strokeRoundedRestoreBin = HugeIconData(0x460d);

  /// IconData for the 'strokeRoundedReturnRequest' icon.
  static const IconData strokeRoundedReturnRequest = HugeIconData(0x460e);

  /// IconData for the 'strokeRoundedReverseWithdrawal01' icon.
  static const IconData strokeRoundedReverseWithdrawal01 = HugeIconData(0x460f);

  /// IconData for the 'strokeRoundedReverseWithdrawal02' icon.
  static const IconData strokeRoundedReverseWithdrawal02 = HugeIconData(0x4610);

  /// IconData for the 'strokeRoundedRhombus01' icon.
  static const IconData strokeRoundedRhombus01 = HugeIconData(0x4611);

  /// IconData for the 'strokeRoundedRhombus' icon.
  static const IconData strokeRoundedRhombus = HugeIconData(0x4612);

  /// IconData for the 'strokeRoundedRiceBowl01' icon.
  static const IconData strokeRoundedRiceBowl01 = HugeIconData(0x4613);

  /// IconData for the 'strokeRoundedRiceBowl02' icon.
  static const IconData strokeRoundedRiceBowl02 = HugeIconData(0x4614);

  /// IconData for the 'strokeRoundedRightAngle' icon.
  static const IconData strokeRoundedRightAngle = HugeIconData(0x4615);

  /// IconData for the 'strokeRoundedRightToLeftBlockQuote' icon.
  static const IconData strokeRoundedRightToLeftBlockQuote =
      HugeIconData(0x4616);

  /// IconData for the 'strokeRoundedRightToLeftListBullet' icon.
  static const IconData strokeRoundedRightToLeftListBullet =
      HugeIconData(0x4617);

  /// IconData for the 'strokeRoundedRightToLeftListDash' icon.
  static const IconData strokeRoundedRightToLeftListDash = HugeIconData(0x4618);

  /// IconData for the 'strokeRoundedRightToLeftListNumber' icon.
  static const IconData strokeRoundedRightToLeftListNumber =
      HugeIconData(0x4619);

  /// IconData for the 'strokeRoundedRightToLeftListTriangle' icon.
  static const IconData strokeRoundedRightToLeftListTriangle =
      HugeIconData(0x461a);

  /// IconData for the 'strokeRoundedRightTriangle' icon.
  static const IconData strokeRoundedRightTriangle = HugeIconData(0x461b);

  /// IconData for the 'strokeRoundedRipple' icon.
  static const IconData strokeRoundedRipple = HugeIconData(0x461c);

  /// IconData for the 'strokeRoundedRiyalRectangle' icon.
  static const IconData strokeRoundedRiyalRectangle = HugeIconData(0x461d);

  /// IconData for the 'strokeRoundedRiyal' icon.
  static const IconData strokeRoundedRiyal = HugeIconData(0x461e);

  /// IconData for the 'strokeRoundedRoad01' icon.
  static const IconData strokeRoundedRoad01 = HugeIconData(0x461f);

  /// IconData for the 'strokeRoundedRoad02' icon.
  static const IconData strokeRoundedRoad02 = HugeIconData(0x4620);

  /// IconData for the 'strokeRoundedRoadLocation01' icon.
  static const IconData strokeRoundedRoadLocation01 = HugeIconData(0x4621);

  /// IconData for the 'strokeRoundedRoadLocation02' icon.
  static const IconData strokeRoundedRoadLocation02 = HugeIconData(0x4622);

  /// IconData for the 'strokeRoundedRoadWayside' icon.
  static const IconData strokeRoundedRoadWayside = HugeIconData(0x4623);

  /// IconData for the 'strokeRoundedRoad' icon.
  static const IconData strokeRoundedRoad = HugeIconData(0x4624);

  /// IconData for the 'strokeRoundedRobotic' icon.
  static const IconData strokeRoundedRobotic = HugeIconData(0x4625);

  /// IconData for the 'strokeRoundedRocket01' icon.
  static const IconData strokeRoundedRocket01 = HugeIconData(0x4626);

  /// IconData for the 'strokeRoundedRocket02' icon.
  static const IconData strokeRoundedRocket02 = HugeIconData(0x4627);

  /// IconData for the 'strokeRoundedRocket' icon.
  static const IconData strokeRoundedRocket = HugeIconData(0x4628);

  /// IconData for the 'strokeRoundedRockingChair' icon.
  static const IconData strokeRoundedRockingChair = HugeIconData(0x4629);

  /// IconData for the 'strokeRoundedRollerSkate' icon.
  static const IconData strokeRoundedRollerSkate = HugeIconData(0x462a);

  /// IconData for the 'strokeRoundedRollingPin' icon.
  static const IconData strokeRoundedRollingPin = HugeIconData(0x462b);

  /// IconData for the 'strokeRoundedRoot01' icon.
  static const IconData strokeRoundedRoot01 = HugeIconData(0x462c);

  /// IconData for the 'strokeRoundedRoot02' icon.
  static const IconData strokeRoundedRoot02 = HugeIconData(0x462d);

  /// IconData for the 'strokeRoundedRootCircle' icon.
  static const IconData strokeRoundedRootCircle = HugeIconData(0x462e);

  /// IconData for the 'strokeRoundedRootFirstBracket' icon.
  static const IconData strokeRoundedRootFirstBracket = HugeIconData(0x462f);

  /// IconData for the 'strokeRoundedRootSecondBracket' icon.
  static const IconData strokeRoundedRootSecondBracket = HugeIconData(0x4630);

  /// IconData for the 'strokeRoundedRootThirdBracket' icon.
  static const IconData strokeRoundedRootThirdBracket = HugeIconData(0x4631);

  /// IconData for the 'strokeRoundedRotate01' icon.
  static const IconData strokeRoundedRotate01 = HugeIconData(0x4632);

  /// IconData for the 'strokeRoundedRotate02' icon.
  static const IconData strokeRoundedRotate02 = HugeIconData(0x4633);

  /// IconData for the 'strokeRoundedRotate360' icon.
  static const IconData strokeRoundedRotate360 = HugeIconData(0x4634);

  /// IconData for the 'strokeRoundedRotateBottomLeft' icon.
  static const IconData strokeRoundedRotateBottomLeft = HugeIconData(0x4635);

  /// IconData for the 'strokeRoundedRotateBottomRight' icon.
  static const IconData strokeRoundedRotateBottomRight = HugeIconData(0x4636);

  /// IconData for the 'strokeRoundedRotateClockwise' icon.
  static const IconData strokeRoundedRotateClockwise = HugeIconData(0x4637);

  /// IconData for the 'strokeRoundedRotateCrop' icon.
  static const IconData strokeRoundedRotateCrop = HugeIconData(0x4638);

  /// IconData for the 'strokeRoundedRotateLeft01' icon.
  static const IconData strokeRoundedRotateLeft01 = HugeIconData(0x4639);

  /// IconData for the 'strokeRoundedRotateLeft02' icon.
  static const IconData strokeRoundedRotateLeft02 = HugeIconData(0x463a);

  /// IconData for the 'strokeRoundedRotateLeft03' icon.
  static const IconData strokeRoundedRotateLeft03 = HugeIconData(0x463b);

  /// IconData for the 'strokeRoundedRotateLeft04' icon.
  static const IconData strokeRoundedRotateLeft04 = HugeIconData(0x463c);

  /// IconData for the 'strokeRoundedRotateLeft05' icon.
  static const IconData strokeRoundedRotateLeft05 = HugeIconData(0x463d);

  /// IconData for the 'strokeRoundedRotateLeft06' icon.
  static const IconData strokeRoundedRotateLeft06 = HugeIconData(0x463e);

  /// IconData for the 'strokeRoundedRotateRight01' icon.
  static const IconData strokeRoundedRotateRight01 = HugeIconData(0x463f);

  /// IconData for the 'strokeRoundedRotateRight02' icon.
  static const IconData strokeRoundedRotateRight02 = HugeIconData(0x4640);

  /// IconData for the 'strokeRoundedRotateRight03' icon.
  static const IconData strokeRoundedRotateRight03 = HugeIconData(0x4641);

  /// IconData for the 'strokeRoundedRotateRight04' icon.
  static const IconData strokeRoundedRotateRight04 = HugeIconData(0x4642);

  /// IconData for the 'strokeRoundedRotateRight05' icon.
  static const IconData strokeRoundedRotateRight05 = HugeIconData(0x4643);

  /// IconData for the 'strokeRoundedRotateRight06' icon.
  static const IconData strokeRoundedRotateRight06 = HugeIconData(0x4644);

  /// IconData for the 'strokeRoundedRotateSquare' icon.
  static const IconData strokeRoundedRotateSquare = HugeIconData(0x4645);

  /// IconData for the 'strokeRoundedRotateTopLeft' icon.
  static const IconData strokeRoundedRotateTopLeft = HugeIconData(0x4646);

  /// IconData for the 'strokeRoundedRotateTopRight' icon.
  static const IconData strokeRoundedRotateTopRight = HugeIconData(0x4647);

  /// IconData for the 'strokeRoundedRoute01' icon.
  static const IconData strokeRoundedRoute01 = HugeIconData(0x4648);

  /// IconData for the 'strokeRoundedRoute02' icon.
  static const IconData strokeRoundedRoute02 = HugeIconData(0x4649);

  /// IconData for the 'strokeRoundedRoute03' icon.
  static const IconData strokeRoundedRoute03 = HugeIconData(0x464a);

  /// IconData for the 'strokeRoundedRouteBlock' icon.
  static const IconData strokeRoundedRouteBlock = HugeIconData(0x464b);

  /// IconData for the 'strokeRoundedRouter01' icon.
  static const IconData strokeRoundedRouter01 = HugeIconData(0x464c);

  /// IconData for the 'strokeRoundedRouter02' icon.
  static const IconData strokeRoundedRouter02 = HugeIconData(0x464d);

  /// IconData for the 'strokeRoundedRouter' icon.
  static const IconData strokeRoundedRouter = HugeIconData(0x464e);

  /// IconData for the 'strokeRoundedRowDelete' icon.
  static const IconData strokeRoundedRowDelete = HugeIconData(0x464f);

  /// IconData for the 'strokeRoundedRowInsert' icon.
  static const IconData strokeRoundedRowInsert = HugeIconData(0x4650);

  /// IconData for the 'strokeRoundedRssConnected01' icon.
  static const IconData strokeRoundedRssConnected01 = HugeIconData(0x4651);

  /// IconData for the 'strokeRoundedRssConnected02' icon.
  static const IconData strokeRoundedRssConnected02 = HugeIconData(0x4652);

  /// IconData for the 'strokeRoundedRssError' icon.
  static const IconData strokeRoundedRssError = HugeIconData(0x4653);

  /// IconData for the 'strokeRoundedRssLocked' icon.
  static const IconData strokeRoundedRssLocked = HugeIconData(0x4654);

  /// IconData for the 'strokeRoundedRssUnlocked' icon.
  static const IconData strokeRoundedRssUnlocked = HugeIconData(0x4655);

  /// IconData for the 'strokeRoundedRss' icon.
  static const IconData strokeRoundedRss = HugeIconData(0x4656);

  /// IconData for the 'strokeRoundedRubElHizb' icon.
  static const IconData strokeRoundedRubElHizb = HugeIconData(0x4657);

  /// IconData for the 'strokeRoundedRuku' icon.
  static const IconData strokeRoundedRuku = HugeIconData(0x4658);

  /// IconData for the 'strokeRoundedRuler' icon.
  static const IconData strokeRoundedRuler = HugeIconData(0x4659);

  /// IconData for the 'strokeRoundedRunningShoes' icon.
  static const IconData strokeRoundedRunningShoes = HugeIconData(0x465a);

  /// IconData for the 'strokeRoundedSad01' icon.
  static const IconData strokeRoundedSad01 = HugeIconData(0x465b);

  /// IconData for the 'strokeRoundedSad02' icon.
  static const IconData strokeRoundedSad02 = HugeIconData(0x465c);

  /// IconData for the 'strokeRoundedSadDizzy' icon.
  static const IconData strokeRoundedSadDizzy = HugeIconData(0x465d);

  /// IconData for the 'strokeRoundedSafari' icon.
  static const IconData strokeRoundedSafari = HugeIconData(0x465e);

  /// IconData for the 'strokeRoundedSafeDelivery01' icon.
  static const IconData strokeRoundedSafeDelivery01 = HugeIconData(0x465f);

  /// IconData for the 'strokeRoundedSafeDelivery02' icon.
  static const IconData strokeRoundedSafeDelivery02 = HugeIconData(0x4660);

  /// IconData for the 'strokeRoundedSafe' icon.
  static const IconData strokeRoundedSafe = HugeIconData(0x4661);

  /// IconData for the 'strokeRoundedSafetyPin01' icon.
  static const IconData strokeRoundedSafetyPin01 = HugeIconData(0x4662);

  /// IconData for the 'strokeRoundedSafetyPin02' icon.
  static const IconData strokeRoundedSafetyPin02 = HugeIconData(0x4663);

  /// IconData for the 'strokeRoundedSailboatCoastal' icon.
  static const IconData strokeRoundedSailboatCoastal = HugeIconData(0x4664);

  /// IconData for the 'strokeRoundedSailboatOffshore' icon.
  static const IconData strokeRoundedSailboatOffshore = HugeIconData(0x4665);

  /// IconData for the 'strokeRoundedSakura' icon.
  static const IconData strokeRoundedSakura = HugeIconData(0x4666);

  /// IconData for the 'strokeRoundedSalahTime' icon.
  static const IconData strokeRoundedSalahTime = HugeIconData(0x4667);

  /// IconData for the 'strokeRoundedSalah' icon.
  static const IconData strokeRoundedSalah = HugeIconData(0x4668);

  /// IconData for the 'strokeRoundedSaleTag01' icon.
  static const IconData strokeRoundedSaleTag01 = HugeIconData(0x4669);

  /// IconData for the 'strokeRoundedSaleTag02' icon.
  static const IconData strokeRoundedSaleTag02 = HugeIconData(0x466a);

  /// IconData for the 'strokeRoundedSandals' icon.
  static const IconData strokeRoundedSandals = HugeIconData(0x466b);

  /// IconData for the 'strokeRoundedSatellite01' icon.
  static const IconData strokeRoundedSatellite01 = HugeIconData(0x466c);

  /// IconData for the 'strokeRoundedSatellite02' icon.
  static const IconData strokeRoundedSatellite02 = HugeIconData(0x466d);

  /// IconData for the 'strokeRoundedSatellite03' icon.
  static const IconData strokeRoundedSatellite03 = HugeIconData(0x466e);

  /// IconData for the 'strokeRoundedSatellite' icon.
  static const IconData strokeRoundedSatellite = HugeIconData(0x466f);

  /// IconData for the 'strokeRoundedSaturn01' icon.
  static const IconData strokeRoundedSaturn01 = HugeIconData(0x4670);

  /// IconData for the 'strokeRoundedSaturn02' icon.
  static const IconData strokeRoundedSaturn02 = HugeIconData(0x4671);

  /// IconData for the 'strokeRoundedSaturn' icon.
  static const IconData strokeRoundedSaturn = HugeIconData(0x4672);

  /// IconData for the 'strokeRoundedSausage' icon.
  static const IconData strokeRoundedSausage = HugeIconData(0x4673);

  /// IconData for the 'strokeRoundedSaveEnergy01' icon.
  static const IconData strokeRoundedSaveEnergy01 = HugeIconData(0x4674);

  /// IconData for the 'strokeRoundedSaveEnergy02' icon.
  static const IconData strokeRoundedSaveEnergy02 = HugeIconData(0x4675);

  /// IconData for the 'strokeRoundedSaveMoneyDollar' icon.
  static const IconData strokeRoundedSaveMoneyDollar = HugeIconData(0x4676);

  /// IconData for the 'strokeRoundedSaveMoneyEuro' icon.
  static const IconData strokeRoundedSaveMoneyEuro = HugeIconData(0x4677);

  /// IconData for the 'strokeRoundedSaveMoneyPound' icon.
  static const IconData strokeRoundedSaveMoneyPound = HugeIconData(0x4678);

  /// IconData for the 'strokeRoundedSaveMoneyYen' icon.
  static const IconData strokeRoundedSaveMoneyYen = HugeIconData(0x4679);

  /// IconData for the 'strokeRoundedSavings' icon.
  static const IconData strokeRoundedSavings = HugeIconData(0x467a);

  /// IconData for the 'strokeRoundedScheme' icon.
  static const IconData strokeRoundedScheme = HugeIconData(0x467b);

  /// IconData for the 'strokeRoundedSchool01' icon.
  static const IconData strokeRoundedSchool01 = HugeIconData(0x467c);

  /// IconData for the 'strokeRoundedSchoolBell01' icon.
  static const IconData strokeRoundedSchoolBell01 = HugeIconData(0x467d);

  /// IconData for the 'strokeRoundedSchoolBell02' icon.
  static const IconData strokeRoundedSchoolBell02 = HugeIconData(0x467e);

  /// IconData for the 'strokeRoundedSchoolBus' icon.
  static const IconData strokeRoundedSchoolBus = HugeIconData(0x467f);

  /// IconData for the 'strokeRoundedSchoolReportCard' icon.
  static const IconData strokeRoundedSchoolReportCard = HugeIconData(0x4680);

  /// IconData for the 'strokeRoundedSchoolTie' icon.
  static const IconData strokeRoundedSchoolTie = HugeIconData(0x4681);

  /// IconData for the 'strokeRoundedSchool' icon.
  static const IconData strokeRoundedSchool = HugeIconData(0x4682);

  /// IconData for the 'strokeRoundedScissor01' icon.
  static const IconData strokeRoundedScissor01 = HugeIconData(0x4683);

  /// IconData for the 'strokeRoundedScissorRectangle' icon.
  static const IconData strokeRoundedScissorRectangle = HugeIconData(0x4684);

  /// IconData for the 'strokeRoundedScissor' icon.
  static const IconData strokeRoundedScissor = HugeIconData(0x4685);

  /// IconData for the 'strokeRoundedScooter01' icon.
  static const IconData strokeRoundedScooter01 = HugeIconData(0x4686);

  /// IconData for the 'strokeRoundedScooter02' icon.
  static const IconData strokeRoundedScooter02 = HugeIconData(0x4687);

  /// IconData for the 'strokeRoundedScooter03' icon.
  static const IconData strokeRoundedScooter03 = HugeIconData(0x4688);

  /// IconData for the 'strokeRoundedScooter04' icon.
  static const IconData strokeRoundedScooter04 = HugeIconData(0x4689);

  /// IconData for the 'strokeRoundedScooterElectric' icon.
  static const IconData strokeRoundedScooterElectric = HugeIconData(0x468a);

  /// IconData for the 'strokeRoundedScratchCard' icon.
  static const IconData strokeRoundedScratchCard = HugeIconData(0x468b);

  /// IconData for the 'strokeRoundedScreenAddToHome' icon.
  static const IconData strokeRoundedScreenAddToHome = HugeIconData(0x468c);

  /// IconData for the 'strokeRoundedScreenLockRotation' icon.
  static const IconData strokeRoundedScreenLockRotation = HugeIconData(0x468d);

  /// IconData for the 'strokeRoundedScreenRotation' icon.
  static const IconData strokeRoundedScreenRotation = HugeIconData(0x468e);

  /// IconData for the 'strokeRoundedScribd' icon.
  static const IconData strokeRoundedScribd = HugeIconData(0x468f);

  /// IconData for the 'strokeRoundedScrollHorizontal' icon.
  static const IconData strokeRoundedScrollHorizontal = HugeIconData(0x4690);

  /// IconData for the 'strokeRoundedScrollVertical' icon.
  static const IconData strokeRoundedScrollVertical = HugeIconData(0x4691);

  /// IconData for the 'strokeRoundedScroll' icon.
  static const IconData strokeRoundedScroll = HugeIconData(0x4692);

  /// IconData for the 'strokeRoundedSdCard' icon.
  static const IconData strokeRoundedSdCard = HugeIconData(0x4693);

  /// IconData for the 'strokeRoundedSeal' icon.
  static const IconData strokeRoundedSeal = HugeIconData(0x4694);

  /// IconData for the 'strokeRoundedSearch01' icon.
  static const IconData strokeRoundedSearch01 = HugeIconData(0x4695);

  /// IconData for the 'strokeRoundedSearch02' icon.
  static const IconData strokeRoundedSearch02 = HugeIconData(0x4696);

  /// IconData for the 'strokeRoundedSearchAdd' icon.
  static const IconData strokeRoundedSearchAdd = HugeIconData(0x4697);

  /// IconData for the 'strokeRoundedSearchArea' icon.
  static const IconData strokeRoundedSearchArea = HugeIconData(0x4698);

  /// IconData for the 'strokeRoundedSearchCircle' icon.
  static const IconData strokeRoundedSearchCircle = HugeIconData(0x4699);

  /// IconData for the 'strokeRoundedSearchDollar' icon.
  static const IconData strokeRoundedSearchDollar = HugeIconData(0x469a);

  /// IconData for the 'strokeRoundedSearchFocus' icon.
  static const IconData strokeRoundedSearchFocus = HugeIconData(0x469b);

  /// IconData for the 'strokeRoundedSearchList01' icon.
  static const IconData strokeRoundedSearchList01 = HugeIconData(0x469c);

  /// IconData for the 'strokeRoundedSearchList02' icon.
  static const IconData strokeRoundedSearchList02 = HugeIconData(0x469d);

  /// IconData for the 'strokeRoundedSearchMinus' icon.
  static const IconData strokeRoundedSearchMinus = HugeIconData(0x469e);

  /// IconData for the 'strokeRoundedSearchRemove' icon.
  static const IconData strokeRoundedSearchRemove = HugeIconData(0x469f);

  /// IconData for the 'strokeRoundedSearchReplace' icon.
  static const IconData strokeRoundedSearchReplace = HugeIconData(0x46a0);

  /// IconData for the 'strokeRoundedSearchSquare' icon.
  static const IconData strokeRoundedSearchSquare = HugeIconData(0x46a1);

  /// IconData for the 'strokeRoundedSearchVisual' icon.
  static const IconData strokeRoundedSearchVisual = HugeIconData(0x46a2);

  /// IconData for the 'strokeRoundedSearching' icon.
  static const IconData strokeRoundedSearching = HugeIconData(0x46a3);

  /// IconData for the 'strokeRoundedSeatSelector' icon.
  static const IconData strokeRoundedSeatSelector = HugeIconData(0x46a4);

  /// IconData for the 'strokeRoundedSecondBracketCircle' icon.
  static const IconData strokeRoundedSecondBracketCircle = HugeIconData(0x46a5);

  /// IconData for the 'strokeRoundedSecondBracketSquare' icon.
  static const IconData strokeRoundedSecondBracketSquare = HugeIconData(0x46a6);

  /// IconData for the 'strokeRoundedSecondBracket' icon.
  static const IconData strokeRoundedSecondBracket = HugeIconData(0x46a7);

  /// IconData for the 'strokeRoundedSecuredNetwork' icon.
  static const IconData strokeRoundedSecuredNetwork = HugeIconData(0x46a8);

  /// IconData for the 'strokeRoundedSecurityBlock' icon.
  static const IconData strokeRoundedSecurityBlock = HugeIconData(0x46a9);

  /// IconData for the 'strokeRoundedSecurityCheck' icon.
  static const IconData strokeRoundedSecurityCheck = HugeIconData(0x46aa);

  /// IconData for the 'strokeRoundedSecurityKeyUsb' icon.
  static const IconData strokeRoundedSecurityKeyUsb = HugeIconData(0x46ab);

  /// IconData for the 'strokeRoundedSecurityLock' icon.
  static const IconData strokeRoundedSecurityLock = HugeIconData(0x46ac);

  /// IconData for the 'strokeRoundedSecurityPassword' icon.
  static const IconData strokeRoundedSecurityPassword = HugeIconData(0x46ad);

  /// IconData for the 'strokeRoundedSecurityValidation' icon.
  static const IconData strokeRoundedSecurityValidation = HugeIconData(0x46ae);

  /// IconData for the 'strokeRoundedSecurityWifi' icon.
  static const IconData strokeRoundedSecurityWifi = HugeIconData(0x46af);

  /// IconData for the 'strokeRoundedSecurity' icon.
  static const IconData strokeRoundedSecurity = HugeIconData(0x46b0);

  /// IconData for the 'strokeRoundedSegment' icon.
  static const IconData strokeRoundedSegment = HugeIconData(0x46b1);

  /// IconData for the 'strokeRoundedSelect01' icon.
  static const IconData strokeRoundedSelect01 = HugeIconData(0x46b2);

  /// IconData for the 'strokeRoundedSelect02' icon.
  static const IconData strokeRoundedSelect02 = HugeIconData(0x46b3);

  /// IconData for the 'strokeRoundedSendToMobile' icon.
  static const IconData strokeRoundedSendToMobile = HugeIconData(0x46b4);

  /// IconData for the 'strokeRoundedSenseless' icon.
  static const IconData strokeRoundedSenseless = HugeIconData(0x46b5);

  /// IconData for the 'strokeRoundedSent' icon.
  static const IconData strokeRoundedSent = HugeIconData(0x46b6);

  /// IconData for the 'strokeRoundedSeo' icon.
  static const IconData strokeRoundedSeo = HugeIconData(0x46b7);

  /// IconData for the 'strokeRoundedService' icon.
  static const IconData strokeRoundedService = HugeIconData(0x46b8);

  /// IconData for the 'strokeRoundedSetting06' icon.
  static const IconData strokeRoundedSetting06 = HugeIconData(0x46b9);

  /// IconData for the 'strokeRoundedSetting07' icon.
  static const IconData strokeRoundedSetting07 = HugeIconData(0x46ba);

  /// IconData for the 'strokeRoundedSettingDone01' icon.
  static const IconData strokeRoundedSettingDone01 = HugeIconData(0x46bb);

  /// IconData for the 'strokeRoundedSettingDone02' icon.
  static const IconData strokeRoundedSettingDone02 = HugeIconData(0x46bc);

  /// IconData for the 'strokeRoundedSettingDone03' icon.
  static const IconData strokeRoundedSettingDone03 = HugeIconData(0x46bd);

  /// IconData for the 'strokeRoundedSettingDone04' icon.
  static const IconData strokeRoundedSettingDone04 = HugeIconData(0x46be);

  /// IconData for the 'strokeRoundedSettingError03' icon.
  static const IconData strokeRoundedSettingError03 = HugeIconData(0x46bf);

  /// IconData for the 'strokeRoundedSettingError04' icon.
  static const IconData strokeRoundedSettingError04 = HugeIconData(0x46c0);

  /// IconData for the 'strokeRoundedSettings01' icon.
  static const IconData strokeRoundedSettings01 = HugeIconData(0x46c1);

  /// IconData for the 'strokeRoundedSettings02' icon.
  static const IconData strokeRoundedSettings02 = HugeIconData(0x46c2);

  /// IconData for the 'strokeRoundedSettings03' icon.
  static const IconData strokeRoundedSettings03 = HugeIconData(0x46c3);

  /// IconData for the 'strokeRoundedSettings04' icon.
  static const IconData strokeRoundedSettings04 = HugeIconData(0x46c4);

  /// IconData for the 'strokeRoundedSettings05' icon.
  static const IconData strokeRoundedSettings05 = HugeIconData(0x46c5);

  /// IconData for the 'strokeRoundedSettingsError01' icon.
  static const IconData strokeRoundedSettingsError01 = HugeIconData(0x46c6);

  /// IconData for the 'strokeRoundedSettingsError02' icon.
  static const IconData strokeRoundedSettingsError02 = HugeIconData(0x46c7);

  /// IconData for the 'strokeRoundedSetup01' icon.
  static const IconData strokeRoundedSetup01 = HugeIconData(0x46c8);

  /// IconData for the 'strokeRoundedSetup02' icon.
  static const IconData strokeRoundedSetup02 = HugeIconData(0x46c9);

  /// IconData for the 'strokeRoundedShaka01' icon.
  static const IconData strokeRoundedShaka01 = HugeIconData(0x46ca);

  /// IconData for the 'strokeRoundedShaka02' icon.
  static const IconData strokeRoundedShaka02 = HugeIconData(0x46cb);

  /// IconData for the 'strokeRoundedShaka03' icon.
  static const IconData strokeRoundedShaka03 = HugeIconData(0x46cc);

  /// IconData for the 'strokeRoundedShaka04' icon.
  static const IconData strokeRoundedShaka04 = HugeIconData(0x46cd);

  /// IconData for the 'strokeRoundedShampoo' icon.
  static const IconData strokeRoundedShampoo = HugeIconData(0x46ce);

  /// IconData for the 'strokeRoundedShapes' icon.
  static const IconData strokeRoundedShapes = HugeIconData(0x46cf);

  /// IconData for the 'strokeRoundedShare01' icon.
  static const IconData strokeRoundedShare01 = HugeIconData(0x46d0);

  /// IconData for the 'strokeRoundedShare02' icon.
  static const IconData strokeRoundedShare02 = HugeIconData(0x46d1);

  /// IconData for the 'strokeRoundedShare03' icon.
  static const IconData strokeRoundedShare03 = HugeIconData(0x46d2);

  /// IconData for the 'strokeRoundedShare04' icon.
  static const IconData strokeRoundedShare04 = HugeIconData(0x46d3);

  /// IconData for the 'strokeRoundedShare05' icon.
  static const IconData strokeRoundedShare05 = HugeIconData(0x46d4);

  /// IconData for the 'strokeRoundedShare06' icon.
  static const IconData strokeRoundedShare06 = HugeIconData(0x46d5);

  /// IconData for the 'strokeRoundedShare07' icon.
  static const IconData strokeRoundedShare07 = HugeIconData(0x46d6);

  /// IconData for the 'strokeRoundedShare08' icon.
  static const IconData strokeRoundedShare08 = HugeIconData(0x46d7);

  /// IconData for the 'strokeRoundedShareKnowledge' icon.
  static const IconData strokeRoundedShareKnowledge = HugeIconData(0x46d8);

  /// IconData for the 'strokeRoundedShareLocation01' icon.
  static const IconData strokeRoundedShareLocation01 = HugeIconData(0x46d9);

  /// IconData for the 'strokeRoundedShareLocation02' icon.
  static const IconData strokeRoundedShareLocation02 = HugeIconData(0x46da);

  /// IconData for the 'strokeRoundedSharedWifi' icon.
  static const IconData strokeRoundedSharedWifi = HugeIconData(0x46db);

  /// IconData for the 'strokeRoundedSharing' icon.
  static const IconData strokeRoundedSharing = HugeIconData(0x46dc);

  /// IconData for the 'strokeRoundedShellfish' icon.
  static const IconData strokeRoundedShellfish = HugeIconData(0x46dd);

  /// IconData for the 'strokeRoundedSheriff01' icon.
  static const IconData strokeRoundedSheriff01 = HugeIconData(0x46de);

  /// IconData for the 'strokeRoundedSheriff02' icon.
  static const IconData strokeRoundedSheriff02 = HugeIconData(0x46df);

  /// IconData for the 'strokeRoundedShield01' icon.
  static const IconData strokeRoundedShield01 = HugeIconData(0x46e0);

  /// IconData for the 'strokeRoundedShield02' icon.
  static const IconData strokeRoundedShield02 = HugeIconData(0x46e1);

  /// IconData for the 'strokeRoundedShieldBlockchain' icon.
  static const IconData strokeRoundedShieldBlockchain = HugeIconData(0x46e2);

  /// IconData for the 'strokeRoundedShieldEnergy' icon.
  static const IconData strokeRoundedShieldEnergy = HugeIconData(0x46e3);

  /// IconData for the 'strokeRoundedShieldKey' icon.
  static const IconData strokeRoundedShieldKey = HugeIconData(0x46e4);

  /// IconData for the 'strokeRoundedShieldUser' icon.
  static const IconData strokeRoundedShieldUser = HugeIconData(0x46e5);

  /// IconData for the 'strokeRoundedShipmentTracking' icon.
  static const IconData strokeRoundedShipmentTracking = HugeIconData(0x46e6);

  /// IconData for the 'strokeRoundedShippingCenter' icon.
  static const IconData strokeRoundedShippingCenter = HugeIconData(0x46e7);

  /// IconData for the 'strokeRoundedShippingLoading' icon.
  static const IconData strokeRoundedShippingLoading = HugeIconData(0x46e8);

  /// IconData for the 'strokeRoundedShippingTruck01' icon.
  static const IconData strokeRoundedShippingTruck01 = HugeIconData(0x46e9);

  /// IconData for the 'strokeRoundedShippingTruck02' icon.
  static const IconData strokeRoundedShippingTruck02 = HugeIconData(0x46ea);

  /// IconData for the 'strokeRoundedShirt01' icon.
  static const IconData strokeRoundedShirt01 = HugeIconData(0x46eb);

  /// IconData for the 'strokeRoundedShocked' icon.
  static const IconData strokeRoundedShocked = HugeIconData(0x46ec);

  /// IconData for the 'strokeRoundedShopSign' icon.
  static const IconData strokeRoundedShopSign = HugeIconData(0x46ed);

  /// IconData for the 'strokeRoundedShoppingBag01' icon.
  static const IconData strokeRoundedShoppingBag01 = HugeIconData(0x46ee);

  /// IconData for the 'strokeRoundedShoppingBag02' icon.
  static const IconData strokeRoundedShoppingBag02 = HugeIconData(0x46ef);

  /// IconData for the 'strokeRoundedShoppingBag03' icon.
  static const IconData strokeRoundedShoppingBag03 = HugeIconData(0x46f0);

  /// IconData for the 'strokeRoundedShoppingBagAdd' icon.
  static const IconData strokeRoundedShoppingBagAdd = HugeIconData(0x46f1);

  /// IconData for the 'strokeRoundedShoppingBagCheck' icon.
  static const IconData strokeRoundedShoppingBagCheck = HugeIconData(0x46f2);

  /// IconData for the 'strokeRoundedShoppingBagFavorite' icon.
  static const IconData strokeRoundedShoppingBagFavorite = HugeIconData(0x46f3);

  /// IconData for the 'strokeRoundedShoppingBagRemove' icon.
  static const IconData strokeRoundedShoppingBagRemove = HugeIconData(0x46f4);

  /// IconData for the 'strokeRoundedShoppingBasket01' icon.
  static const IconData strokeRoundedShoppingBasket01 = HugeIconData(0x46f5);

  /// IconData for the 'strokeRoundedShoppingBasket02' icon.
  static const IconData strokeRoundedShoppingBasket02 = HugeIconData(0x46f6);

  /// IconData for the 'strokeRoundedShoppingBasket03' icon.
  static const IconData strokeRoundedShoppingBasket03 = HugeIconData(0x46f7);

  /// IconData for the 'strokeRoundedShoppingBasketAdd01' icon.
  static const IconData strokeRoundedShoppingBasketAdd01 = HugeIconData(0x46f8);

  /// IconData for the 'strokeRoundedShoppingBasketAdd02' icon.
  static const IconData strokeRoundedShoppingBasketAdd02 = HugeIconData(0x46f9);

  /// IconData for the 'strokeRoundedShoppingBasketAdd03' icon.
  static const IconData strokeRoundedShoppingBasketAdd03 = HugeIconData(0x46fa);

  /// IconData for the 'strokeRoundedShoppingBasketCheckIn01' icon.
  static const IconData strokeRoundedShoppingBasketCheckIn01 =
      HugeIconData(0x46fb);

  /// IconData for the 'strokeRoundedShoppingBasketCheckIn02' icon.
  static const IconData strokeRoundedShoppingBasketCheckIn02 =
      HugeIconData(0x46fc);

  /// IconData for the 'strokeRoundedShoppingBasketCheckIn03' icon.
  static const IconData strokeRoundedShoppingBasketCheckIn03 =
      HugeIconData(0x46fd);

  /// IconData for the 'strokeRoundedShoppingBasketCheckOut01' icon.
  static const IconData strokeRoundedShoppingBasketCheckOut01 =
      HugeIconData(0x46fe);

  /// IconData for the 'strokeRoundedShoppingBasketCheckOut02' icon.
  static const IconData strokeRoundedShoppingBasketCheckOut02 =
      HugeIconData(0x46ff);

  /// IconData for the 'strokeRoundedShoppingBasketCheckOut03' icon.
  static const IconData strokeRoundedShoppingBasketCheckOut03 =
      HugeIconData(0x4700);

  /// IconData for the 'strokeRoundedShoppingBasketDone01' icon.
  static const IconData strokeRoundedShoppingBasketDone01 =
      HugeIconData(0x4701);

  /// IconData for the 'strokeRoundedShoppingBasketDone02' icon.
  static const IconData strokeRoundedShoppingBasketDone02 =
      HugeIconData(0x4702);

  /// IconData for the 'strokeRoundedShoppingBasketDone03' icon.
  static const IconData strokeRoundedShoppingBasketDone03 =
      HugeIconData(0x4703);

  /// IconData for the 'strokeRoundedShoppingBasketFavorite01' icon.
  static const IconData strokeRoundedShoppingBasketFavorite01 =
      HugeIconData(0x4704);

  /// IconData for the 'strokeRoundedShoppingBasketFavorite02' icon.
  static const IconData strokeRoundedShoppingBasketFavorite02 =
      HugeIconData(0x4705);

  /// IconData for the 'strokeRoundedShoppingBasketFavorite03' icon.
  static const IconData strokeRoundedShoppingBasketFavorite03 =
      HugeIconData(0x4706);

  /// IconData for the 'strokeRoundedShoppingBasketRemove01' icon.
  static const IconData strokeRoundedShoppingBasketRemove01 =
      HugeIconData(0x4707);

  /// IconData for the 'strokeRoundedShoppingBasketRemove02' icon.
  static const IconData strokeRoundedShoppingBasketRemove02 =
      HugeIconData(0x4708);

  /// IconData for the 'strokeRoundedShoppingBasketRemove03' icon.
  static const IconData strokeRoundedShoppingBasketRemove03 =
      HugeIconData(0x4709);

  /// IconData for the 'strokeRoundedShoppingBasketSecure01' icon.
  static const IconData strokeRoundedShoppingBasketSecure01 =
      HugeIconData(0x470a);

  /// IconData for the 'strokeRoundedShoppingBasketSecure02' icon.
  static const IconData strokeRoundedShoppingBasketSecure02 =
      HugeIconData(0x470b);

  /// IconData for the 'strokeRoundedShoppingBasketSecure03' icon.
  static const IconData strokeRoundedShoppingBasketSecure03 =
      HugeIconData(0x470c);

  /// IconData for the 'strokeRoundedShoppingCart01' icon.
  static const IconData strokeRoundedShoppingCart01 = HugeIconData(0x470d);

  /// IconData for the 'strokeRoundedShoppingCart02' icon.
  static const IconData strokeRoundedShoppingCart02 = HugeIconData(0x470e);

  /// IconData for the 'strokeRoundedShoppingCartAdd01' icon.
  static const IconData strokeRoundedShoppingCartAdd01 = HugeIconData(0x470f);

  /// IconData for the 'strokeRoundedShoppingCartAdd02' icon.
  static const IconData strokeRoundedShoppingCartAdd02 = HugeIconData(0x4710);

  /// IconData for the 'strokeRoundedShoppingCartCheck01' icon.
  static const IconData strokeRoundedShoppingCartCheck01 = HugeIconData(0x4711);

  /// IconData for the 'strokeRoundedShoppingCartCheck02' icon.
  static const IconData strokeRoundedShoppingCartCheck02 = HugeIconData(0x4712);

  /// IconData for the 'strokeRoundedShoppingCartCheckIn01' icon.
  static const IconData strokeRoundedShoppingCartCheckIn01 =
      HugeIconData(0x4713);

  /// IconData for the 'strokeRoundedShoppingCartCheckIn02' icon.
  static const IconData strokeRoundedShoppingCartCheckIn02 =
      HugeIconData(0x4714);

  /// IconData for the 'strokeRoundedShoppingCartCheckOut01' icon.
  static const IconData strokeRoundedShoppingCartCheckOut01 =
      HugeIconData(0x4715);

  /// IconData for the 'strokeRoundedShoppingCartCheckOut02' icon.
  static const IconData strokeRoundedShoppingCartCheckOut02 =
      HugeIconData(0x4716);

  /// IconData for the 'strokeRoundedShoppingCartFavorite01' icon.
  static const IconData strokeRoundedShoppingCartFavorite01 =
      HugeIconData(0x4717);

  /// IconData for the 'strokeRoundedShoppingCartFavorite02' icon.
  static const IconData strokeRoundedShoppingCartFavorite02 =
      HugeIconData(0x4718);

  /// IconData for the 'strokeRoundedShoppingCartRemove01' icon.
  static const IconData strokeRoundedShoppingCartRemove01 =
      HugeIconData(0x4719);

  /// IconData for the 'strokeRoundedShoppingCartRemove02' icon.
  static const IconData strokeRoundedShoppingCartRemove02 =
      HugeIconData(0x471a);

  /// IconData for the 'strokeRoundedShortsPants' icon.
  static const IconData strokeRoundedShortsPants = HugeIconData(0x471b);

  /// IconData for the 'strokeRoundedShuffleSquare' icon.
  static const IconData strokeRoundedShuffleSquare = HugeIconData(0x471c);

  /// IconData for the 'strokeRoundedShuffle' icon.
  static const IconData strokeRoundedShuffle = HugeIconData(0x471d);

  /// IconData for the 'strokeRoundedShutterstock' icon.
  static const IconData strokeRoundedShutterstock = HugeIconData(0x471e);

  /// IconData for the 'strokeRoundedSidebarBottom' icon.
  static const IconData strokeRoundedSidebarBottom = HugeIconData(0x471f);

  /// IconData for the 'strokeRoundedSidebarLeft01' icon.
  static const IconData strokeRoundedSidebarLeft01 = HugeIconData(0x4720);

  /// IconData for the 'strokeRoundedSidebarLeft' icon.
  static const IconData strokeRoundedSidebarLeft = HugeIconData(0x4721);

  /// IconData for the 'strokeRoundedSidebarRight01' icon.
  static const IconData strokeRoundedSidebarRight01 = HugeIconData(0x4722);

  /// IconData for the 'strokeRoundedSidebarRight' icon.
  static const IconData strokeRoundedSidebarRight = HugeIconData(0x4723);

  /// IconData for the 'strokeRoundedSidebarTop' icon.
  static const IconData strokeRoundedSidebarTop = HugeIconData(0x4724);

  /// IconData for the 'strokeRoundedSignLanguageC' icon.
  static const IconData strokeRoundedSignLanguageC = HugeIconData(0x4725);

  /// IconData for the 'strokeRoundedSignalFull01' icon.
  static const IconData strokeRoundedSignalFull01 = HugeIconData(0x4726);

  /// IconData for the 'strokeRoundedSignalFull02' icon.
  static const IconData strokeRoundedSignalFull02 = HugeIconData(0x4727);

  /// IconData for the 'strokeRoundedSignalLow01' icon.
  static const IconData strokeRoundedSignalLow01 = HugeIconData(0x4728);

  /// IconData for the 'strokeRoundedSignalLow02' icon.
  static const IconData strokeRoundedSignalLow02 = HugeIconData(0x4729);

  /// IconData for the 'strokeRoundedSignalLowMedium' icon.
  static const IconData strokeRoundedSignalLowMedium = HugeIconData(0x472a);

  /// IconData for the 'strokeRoundedSignalMedium01' icon.
  static const IconData strokeRoundedSignalMedium01 = HugeIconData(0x472b);

  /// IconData for the 'strokeRoundedSignalMedium02' icon.
  static const IconData strokeRoundedSignalMedium02 = HugeIconData(0x472c);

  /// IconData for the 'strokeRoundedSignalNo01' icon.
  static const IconData strokeRoundedSignalNo01 = HugeIconData(0x472d);

  /// IconData for the 'strokeRoundedSignalNo02' icon.
  static const IconData strokeRoundedSignalNo02 = HugeIconData(0x472e);

  /// IconData for the 'strokeRoundedSignal' icon.
  static const IconData strokeRoundedSignal = HugeIconData(0x472f);

  /// IconData for the 'strokeRoundedSignature' icon.
  static const IconData strokeRoundedSignature = HugeIconData(0x4730);

  /// IconData for the 'strokeRoundedSilence' icon.
  static const IconData strokeRoundedSilence = HugeIconData(0x4731);

  /// IconData for the 'strokeRoundedSimcard01' icon.
  static const IconData strokeRoundedSimcard01 = HugeIconData(0x4732);

  /// IconData for the 'strokeRoundedSimcard02' icon.
  static const IconData strokeRoundedSimcard02 = HugeIconData(0x4733);

  /// IconData for the 'strokeRoundedSimcardDual' icon.
  static const IconData strokeRoundedSimcardDual = HugeIconData(0x4734);

  /// IconData for the 'strokeRoundedSin' icon.
  static const IconData strokeRoundedSin = HugeIconData(0x4735);

  /// IconData for the 'strokeRoundedSine01' icon.
  static const IconData strokeRoundedSine01 = HugeIconData(0x4736);

  /// IconData for the 'strokeRoundedSine02' icon.
  static const IconData strokeRoundedSine02 = HugeIconData(0x4737);

  /// IconData for the 'strokeRoundedSingLeft' icon.
  static const IconData strokeRoundedSingLeft = HugeIconData(0x4738);

  /// IconData for the 'strokeRoundedSingRight' icon.
  static const IconData strokeRoundedSingRight = HugeIconData(0x4739);

  /// IconData for the 'strokeRoundedSink01' icon.
  static const IconData strokeRoundedSink01 = HugeIconData(0x473a);

  /// IconData for the 'strokeRoundedSink02' icon.
  static const IconData strokeRoundedSink02 = HugeIconData(0x473b);

  /// IconData for the 'strokeRoundedSiri' icon.
  static const IconData strokeRoundedSiri = HugeIconData(0x473c);

  /// IconData for the 'strokeRoundedSketch' icon.
  static const IconData strokeRoundedSketch = HugeIconData(0x473d);

  /// IconData for the 'strokeRoundedSkew' icon.
  static const IconData strokeRoundedSkew = HugeIconData(0x473e);

  /// IconData for the 'strokeRoundedSkiDiceFaces01' icon.
  static const IconData strokeRoundedSkiDiceFaces01 = HugeIconData(0x473f);

  /// IconData for the 'strokeRoundedSkippingRope' icon.
  static const IconData strokeRoundedSkippingRope = HugeIconData(0x4740);

  /// IconData for the 'strokeRoundedSkull' icon.
  static const IconData strokeRoundedSkull = HugeIconData(0x4741);

  /// IconData for the 'strokeRoundedSkype' icon.
  static const IconData strokeRoundedSkype = HugeIconData(0x4742);

  /// IconData for the 'strokeRoundedSlack' icon.
  static const IconData strokeRoundedSlack = HugeIconData(0x4743);

  /// IconData for the 'strokeRoundedSleeping' icon.
  static const IconData strokeRoundedSleeping = HugeIconData(0x4744);

  /// IconData for the 'strokeRoundedSleeveless' icon.
  static const IconData strokeRoundedSleeveless = HugeIconData(0x4745);

  /// IconData for the 'strokeRoundedSlidersHorizontal' icon.
  static const IconData strokeRoundedSlidersHorizontal = HugeIconData(0x4746);

  /// IconData for the 'strokeRoundedSlidersVertical' icon.
  static const IconData strokeRoundedSlidersVertical = HugeIconData(0x4747);

  /// IconData for the 'strokeRoundedSlideshare' icon.
  static const IconData strokeRoundedSlideshare = HugeIconData(0x4748);

  /// IconData for the 'strokeRoundedSlowWinds' icon.
  static const IconData strokeRoundedSlowWinds = HugeIconData(0x4749);

  /// IconData for the 'strokeRoundedSmartAc' icon.
  static const IconData strokeRoundedSmartAc = HugeIconData(0x474a);

  /// IconData for the 'strokeRoundedSmartPhone01' icon.
  static const IconData strokeRoundedSmartPhone01 = HugeIconData(0x474b);

  /// IconData for the 'strokeRoundedSmartPhone02' icon.
  static const IconData strokeRoundedSmartPhone02 = HugeIconData(0x474c);

  /// IconData for the 'strokeRoundedSmartPhone03' icon.
  static const IconData strokeRoundedSmartPhone03 = HugeIconData(0x474d);

  /// IconData for the 'strokeRoundedSmartPhone04' icon.
  static const IconData strokeRoundedSmartPhone04 = HugeIconData(0x474e);

  /// IconData for the 'strokeRoundedSmartPhoneLandscape' icon.
  static const IconData strokeRoundedSmartPhoneLandscape = HugeIconData(0x474f);

  /// IconData for the 'strokeRoundedSmartWatch01' icon.
  static const IconData strokeRoundedSmartWatch01 = HugeIconData(0x4750);

  /// IconData for the 'strokeRoundedSmartWatch02' icon.
  static const IconData strokeRoundedSmartWatch02 = HugeIconData(0x4751);

  /// IconData for the 'strokeRoundedSmartWatch03' icon.
  static const IconData strokeRoundedSmartWatch03 = HugeIconData(0x4752);

  /// IconData for the 'strokeRoundedSmartWatch04' icon.
  static const IconData strokeRoundedSmartWatch04 = HugeIconData(0x4753);

  /// IconData for the 'strokeRoundedSmart' icon.
  static const IconData strokeRoundedSmart = HugeIconData(0x4754);

  /// IconData for the 'strokeRoundedSmartphoneLostWifi' icon.
  static const IconData strokeRoundedSmartphoneLostWifi = HugeIconData(0x4755);

  /// IconData for the 'strokeRoundedSmartphoneWifi' icon.
  static const IconData strokeRoundedSmartphoneWifi = HugeIconData(0x4756);

  /// IconData for the 'strokeRoundedSmileDizzy' icon.
  static const IconData strokeRoundedSmileDizzy = HugeIconData(0x4757);

  /// IconData for the 'strokeRoundedSmile' icon.
  static const IconData strokeRoundedSmile = HugeIconData(0x4758);

  /// IconData for the 'strokeRoundedSmsCode' icon.
  static const IconData strokeRoundedSmsCode = HugeIconData(0x4759);

  /// IconData for the 'strokeRoundedSnail' icon.
  static const IconData strokeRoundedSnail = HugeIconData(0x475a);

  /// IconData for the 'strokeRoundedSnapchat' icon.
  static const IconData strokeRoundedSnapchat = HugeIconData(0x475b);

  /// IconData for the 'strokeRoundedSnow' icon.
  static const IconData strokeRoundedSnow = HugeIconData(0x475c);

  /// IconData for the 'strokeRoundedSodaCan' icon.
  static const IconData strokeRoundedSodaCan = HugeIconData(0x475d);

  /// IconData for the 'strokeRoundedSofa01' icon.
  static const IconData strokeRoundedSofa01 = HugeIconData(0x475e);

  /// IconData for the 'strokeRoundedSofa02' icon.
  static const IconData strokeRoundedSofa02 = HugeIconData(0x475f);

  /// IconData for the 'strokeRoundedSofa03' icon.
  static const IconData strokeRoundedSofa03 = HugeIconData(0x4760);

  /// IconData for the 'strokeRoundedSofaSingle' icon.
  static const IconData strokeRoundedSofaSingle = HugeIconData(0x4761);

  /// IconData for the 'strokeRoundedSoftDrink01' icon.
  static const IconData strokeRoundedSoftDrink01 = HugeIconData(0x4762);

  /// IconData for the 'strokeRoundedSoftDrink02' icon.
  static const IconData strokeRoundedSoftDrink02 = HugeIconData(0x4763);

  /// IconData for the 'strokeRoundedSoftwareLicense' icon.
  static const IconData strokeRoundedSoftwareLicense = HugeIconData(0x4764);

  /// IconData for the 'strokeRoundedSoftwareUninstall' icon.
  static const IconData strokeRoundedSoftwareUninstall = HugeIconData(0x4765);

  /// IconData for the 'strokeRoundedSoftware' icon.
  static const IconData strokeRoundedSoftware = HugeIconData(0x4766);

  /// IconData for the 'strokeRoundedSoilMoistureField' icon.
  static const IconData strokeRoundedSoilMoistureField = HugeIconData(0x4767);

  /// IconData for the 'strokeRoundedSoilMoistureGlobal' icon.
  static const IconData strokeRoundedSoilMoistureGlobal = HugeIconData(0x4768);

  /// IconData for the 'strokeRoundedSoilTemperatureField' icon.
  static const IconData strokeRoundedSoilTemperatureField =
      HugeIconData(0x4769);

  /// IconData for the 'strokeRoundedSoilTemperatureGlobal' icon.
  static const IconData strokeRoundedSoilTemperatureGlobal =
      HugeIconData(0x476a);

  /// IconData for the 'strokeRoundedSolarEnergy' icon.
  static const IconData strokeRoundedSolarEnergy = HugeIconData(0x476b);

  /// IconData for the 'strokeRoundedSolarPanel01' icon.
  static const IconData strokeRoundedSolarPanel01 = HugeIconData(0x476c);

  /// IconData for the 'strokeRoundedSolarPanel02' icon.
  static const IconData strokeRoundedSolarPanel02 = HugeIconData(0x476d);

  /// IconData for the 'strokeRoundedSolarPanel03' icon.
  static const IconData strokeRoundedSolarPanel03 = HugeIconData(0x476e);

  /// IconData for the 'strokeRoundedSolarPanel04' icon.
  static const IconData strokeRoundedSolarPanel04 = HugeIconData(0x476f);

  /// IconData for the 'strokeRoundedSolarPanel05' icon.
  static const IconData strokeRoundedSolarPanel05 = HugeIconData(0x4770);

  /// IconData for the 'strokeRoundedSolarPower' icon.
  static const IconData strokeRoundedSolarPower = HugeIconData(0x4771);

  /// IconData for the 'strokeRoundedSolarSystem01' icon.
  static const IconData strokeRoundedSolarSystem01 = HugeIconData(0x4772);

  /// IconData for the 'strokeRoundedSolarSystem' icon.
  static const IconData strokeRoundedSolarSystem = HugeIconData(0x4773);

  /// IconData for the 'strokeRoundedSolidLine01' icon.
  static const IconData strokeRoundedSolidLine01 = HugeIconData(0x4774);

  /// IconData for the 'strokeRoundedSolidLine02' icon.
  static const IconData strokeRoundedSolidLine02 = HugeIconData(0x4775);

  /// IconData for the 'strokeRoundedSortByDown01' icon.
  static const IconData strokeRoundedSortByDown01 = HugeIconData(0x4776);

  /// IconData for the 'strokeRoundedSortByDown02' icon.
  static const IconData strokeRoundedSortByDown02 = HugeIconData(0x4777);

  /// IconData for the 'strokeRoundedSortByUp01' icon.
  static const IconData strokeRoundedSortByUp01 = HugeIconData(0x4778);

  /// IconData for the 'strokeRoundedSortByUp02' icon.
  static const IconData strokeRoundedSortByUp02 = HugeIconData(0x4779);

  /// IconData for the 'strokeRoundedSorting01' icon.
  static const IconData strokeRoundedSorting01 = HugeIconData(0x477a);

  /// IconData for the 'strokeRoundedSorting02' icon.
  static const IconData strokeRoundedSorting02 = HugeIconData(0x477b);

  /// IconData for the 'strokeRoundedSorting03' icon.
  static const IconData strokeRoundedSorting03 = HugeIconData(0x477c);

  /// IconData for the 'strokeRoundedSorting04' icon.
  static const IconData strokeRoundedSorting04 = HugeIconData(0x477d);

  /// IconData for the 'strokeRoundedSorting05' icon.
  static const IconData strokeRoundedSorting05 = HugeIconData(0x477e);

  /// IconData for the 'strokeRoundedSorting19' icon.
  static const IconData strokeRoundedSorting19 = HugeIconData(0x477f);

  /// IconData for the 'strokeRoundedSorting91' icon.
  static const IconData strokeRoundedSorting91 = HugeIconData(0x4780);

  /// IconData for the 'strokeRoundedSortingAZ01' icon.
  static const IconData strokeRoundedSortingAZ01 = HugeIconData(0x4781);

  /// IconData for the 'strokeRoundedSortingAZ02' icon.
  static const IconData strokeRoundedSortingAZ02 = HugeIconData(0x4782);

  /// IconData for the 'strokeRoundedSortingDown' icon.
  static const IconData strokeRoundedSortingDown = HugeIconData(0x4783);

  /// IconData for the 'strokeRoundedSortingUp' icon.
  static const IconData strokeRoundedSortingUp = HugeIconData(0x4784);

  /// IconData for the 'strokeRoundedSortingZA01' icon.
  static const IconData strokeRoundedSortingZA01 = HugeIconData(0x4785);

  /// IconData for the 'strokeRoundedSoundcloud' icon.
  static const IconData strokeRoundedSoundcloud = HugeIconData(0x4786);

  /// IconData for the 'strokeRoundedSourceCodeCircle' icon.
  static const IconData strokeRoundedSourceCodeCircle = HugeIconData(0x4787);

  /// IconData for the 'strokeRoundedSourceCodeSquare' icon.
  static const IconData strokeRoundedSourceCodeSquare = HugeIconData(0x4788);

  /// IconData for the 'strokeRoundedSourceCode' icon.
  static const IconData strokeRoundedSourceCode = HugeIconData(0x4789);

  /// IconData for the 'strokeRoundedSpaceship' icon.
  static const IconData strokeRoundedSpaceship = HugeIconData(0x478a);

  /// IconData for the 'strokeRoundedSpades' icon.
  static const IconData strokeRoundedSpades = HugeIconData(0x478b);

  /// IconData for the 'strokeRoundedSpaghetti' icon.
  static const IconData strokeRoundedSpaghetti = HugeIconData(0x478c);

  /// IconData for the 'strokeRoundedSpam' icon.
  static const IconData strokeRoundedSpam = HugeIconData(0x478d);

  /// IconData for the 'strokeRoundedSparkles' icon.
  static const IconData strokeRoundedSparkles = HugeIconData(0x478e);

  /// IconData for the 'strokeRoundedSpartanHelmet' icon.
  static const IconData strokeRoundedSpartanHelmet = HugeIconData(0x478f);

  /// IconData for the 'strokeRoundedSpatula' icon.
  static const IconData strokeRoundedSpatula = HugeIconData(0x4790);

  /// IconData for the 'strokeRoundedSpeaker01' icon.
  static const IconData strokeRoundedSpeaker01 = HugeIconData(0x4791);

  /// IconData for the 'strokeRoundedSpeaker' icon.
  static const IconData strokeRoundedSpeaker = HugeIconData(0x4792);

  /// IconData for the 'strokeRoundedSpeechToText' icon.
  static const IconData strokeRoundedSpeechToText = HugeIconData(0x4793);

  /// IconData for the 'strokeRoundedSpeedTrain01' icon.
  static const IconData strokeRoundedSpeedTrain01 = HugeIconData(0x4794);

  /// IconData for the 'strokeRoundedSpeedTrain02' icon.
  static const IconData strokeRoundedSpeedTrain02 = HugeIconData(0x4795);

  /// IconData for the 'strokeRoundedSperm' icon.
  static const IconData strokeRoundedSperm = HugeIconData(0x4796);

  /// IconData for the 'strokeRoundedSphere' icon.
  static const IconData strokeRoundedSphere = HugeIconData(0x4797);

  /// IconData for the 'strokeRoundedSpirals' icon.
  static const IconData strokeRoundedSpirals = HugeIconData(0x4798);

  /// IconData for the 'strokeRoundedSpoonAndFork' icon.
  static const IconData strokeRoundedSpoonAndFork = HugeIconData(0x4799);

  /// IconData for the 'strokeRoundedSpoonAndKnife' icon.
  static const IconData strokeRoundedSpoonAndKnife = HugeIconData(0x479a);

  /// IconData for the 'strokeRoundedSpoon' icon.
  static const IconData strokeRoundedSpoon = HugeIconData(0x479b);

  /// IconData for the 'strokeRoundedSpotify' icon.
  static const IconData strokeRoundedSpotify = HugeIconData(0x479c);

  /// IconData for the 'strokeRoundedSql' icon.
  static const IconData strokeRoundedSql = HugeIconData(0x479d);

  /// IconData for the 'strokeRoundedSquare01' icon.
  static const IconData strokeRoundedSquare01 = HugeIconData(0x479e);

  /// IconData for the 'strokeRoundedSquareArrowDataTransferDiagonal' icon.
  static const IconData strokeRoundedSquareArrowDataTransferDiagonal =
      HugeIconData(0x479f);

  /// IconData for the 'strokeRoundedSquareArrowDataTransferHorizontal' icon.
  static const IconData strokeRoundedSquareArrowDataTransferHorizontal =
      HugeIconData(0x47a0);

  /// IconData for the 'strokeRoundedSquareArrowDataTransferVertical' icon.
  static const IconData strokeRoundedSquareArrowDataTransferVertical =
      HugeIconData(0x47a1);

  /// IconData for the 'strokeRoundedSquareArrowDiagonal01' icon.
  static const IconData strokeRoundedSquareArrowDiagonal01 =
      HugeIconData(0x47a2);

  /// IconData for the 'strokeRoundedSquareArrowDiagonal02' icon.
  static const IconData strokeRoundedSquareArrowDiagonal02 =
      HugeIconData(0x47a3);

  /// IconData for the 'strokeRoundedSquareArrowDown01' icon.
  static const IconData strokeRoundedSquareArrowDown01 = HugeIconData(0x47a4);

  /// IconData for the 'strokeRoundedSquareArrowDown02' icon.
  static const IconData strokeRoundedSquareArrowDown02 = HugeIconData(0x47a5);

  /// IconData for the 'strokeRoundedSquareArrowDown03' icon.
  static const IconData strokeRoundedSquareArrowDown03 = HugeIconData(0x47a6);

  /// IconData for the 'strokeRoundedSquareArrowDownDouble' icon.
  static const IconData strokeRoundedSquareArrowDownDouble =
      HugeIconData(0x47a7);

  /// IconData for the 'strokeRoundedSquareArrowDownLeft' icon.
  static const IconData strokeRoundedSquareArrowDownLeft = HugeIconData(0x47a8);

  /// IconData for the 'strokeRoundedSquareArrowDownRight' icon.
  static const IconData strokeRoundedSquareArrowDownRight =
      HugeIconData(0x47a9);

  /// IconData for the 'strokeRoundedSquareArrowExpand01' icon.
  static const IconData strokeRoundedSquareArrowExpand01 = HugeIconData(0x47aa);

  /// IconData for the 'strokeRoundedSquareArrowExpand02' icon.
  static const IconData strokeRoundedSquareArrowExpand02 = HugeIconData(0x47ab);

  /// IconData for the 'strokeRoundedSquareArrowHorizontal' icon.
  static const IconData strokeRoundedSquareArrowHorizontal =
      HugeIconData(0x47ac);

  /// IconData for the 'strokeRoundedSquareArrowLeft01' icon.
  static const IconData strokeRoundedSquareArrowLeft01 = HugeIconData(0x47ad);

  /// IconData for the 'strokeRoundedSquareArrowLeft02' icon.
  static const IconData strokeRoundedSquareArrowLeft02 = HugeIconData(0x47ae);

  /// IconData for the 'strokeRoundedSquareArrowLeft03' icon.
  static const IconData strokeRoundedSquareArrowLeft03 = HugeIconData(0x47af);

  /// IconData for the 'strokeRoundedSquareArrowLeftDouble' icon.
  static const IconData strokeRoundedSquareArrowLeftDouble =
      HugeIconData(0x47b0);

  /// IconData for the 'strokeRoundedSquareArrowLeftRight' icon.
  static const IconData strokeRoundedSquareArrowLeftRight =
      HugeIconData(0x47b1);

  /// IconData for the 'strokeRoundedSquareArrowMoveDownLeft' icon.
  static const IconData strokeRoundedSquareArrowMoveDownLeft =
      HugeIconData(0x47b2);

  /// IconData for the 'strokeRoundedSquareArrowMoveDownRight' icon.
  static const IconData strokeRoundedSquareArrowMoveDownRight =
      HugeIconData(0x47b3);

  /// IconData for the 'strokeRoundedSquareArrowMoveLeftDown' icon.
  static const IconData strokeRoundedSquareArrowMoveLeftDown =
      HugeIconData(0x47b4);

  /// IconData for the 'strokeRoundedSquareArrowMoveLeftUp' icon.
  static const IconData strokeRoundedSquareArrowMoveLeftUp =
      HugeIconData(0x47b5);

  /// IconData for the 'strokeRoundedSquareArrowMoveRightDown' icon.
  static const IconData strokeRoundedSquareArrowMoveRightDown =
      HugeIconData(0x47b6);

  /// IconData for the 'strokeRoundedSquareArrowMoveRightUp' icon.
  static const IconData strokeRoundedSquareArrowMoveRightUp =
      HugeIconData(0x47b7);

  /// IconData for the 'strokeRoundedSquareArrowReload01' icon.
  static const IconData strokeRoundedSquareArrowReload01 = HugeIconData(0x47b8);

  /// IconData for the 'strokeRoundedSquareArrowReload02' icon.
  static const IconData strokeRoundedSquareArrowReload02 = HugeIconData(0x47b9);

  /// IconData for the 'strokeRoundedSquareArrowRight01' icon.
  static const IconData strokeRoundedSquareArrowRight01 = HugeIconData(0x47ba);

  /// IconData for the 'strokeRoundedSquareArrowRight02' icon.
  static const IconData strokeRoundedSquareArrowRight02 = HugeIconData(0x47bb);

  /// IconData for the 'strokeRoundedSquareArrowRight03' icon.
  static const IconData strokeRoundedSquareArrowRight03 = HugeIconData(0x47bc);

  /// IconData for the 'strokeRoundedSquareArrowRightDouble' icon.
  static const IconData strokeRoundedSquareArrowRightDouble =
      HugeIconData(0x47bd);

  /// IconData for the 'strokeRoundedSquareArrowShrink01' icon.
  static const IconData strokeRoundedSquareArrowShrink01 = HugeIconData(0x47be);

  /// IconData for the 'strokeRoundedSquareArrowShrink02' icon.
  static const IconData strokeRoundedSquareArrowShrink02 = HugeIconData(0x47bf);

  /// IconData for the 'strokeRoundedSquareArrowUp01' icon.
  static const IconData strokeRoundedSquareArrowUp01 = HugeIconData(0x47c0);

  /// IconData for the 'strokeRoundedSquareArrowUp02' icon.
  static const IconData strokeRoundedSquareArrowUp02 = HugeIconData(0x47c1);

  /// IconData for the 'strokeRoundedSquareArrowUp03' icon.
  static const IconData strokeRoundedSquareArrowUp03 = HugeIconData(0x47c2);

  /// IconData for the 'strokeRoundedSquareArrowUpDouble' icon.
  static const IconData strokeRoundedSquareArrowUpDouble = HugeIconData(0x47c3);

  /// IconData for the 'strokeRoundedSquareArrowUpDown' icon.
  static const IconData strokeRoundedSquareArrowUpDown = HugeIconData(0x47c4);

  /// IconData for the 'strokeRoundedSquareArrowUpLeft' icon.
  static const IconData strokeRoundedSquareArrowUpLeft = HugeIconData(0x47c5);

  /// IconData for the 'strokeRoundedSquareArrowUpRight' icon.
  static const IconData strokeRoundedSquareArrowUpRight = HugeIconData(0x47c6);

  /// IconData for the 'strokeRoundedSquareArrowVertical' icon.
  static const IconData strokeRoundedSquareArrowVertical = HugeIconData(0x47c7);

  /// IconData for the 'strokeRoundedSquareCircle' icon.
  static const IconData strokeRoundedSquareCircle = HugeIconData(0x47c8);

  /// IconData for the 'strokeRoundedSquareLock01' icon.
  static const IconData strokeRoundedSquareLock01 = HugeIconData(0x47c9);

  /// IconData for the 'strokeRoundedSquareLock02' icon.
  static const IconData strokeRoundedSquareLock02 = HugeIconData(0x47ca);

  /// IconData for the 'strokeRoundedSquareLockAdd01' icon.
  static const IconData strokeRoundedSquareLockAdd01 = HugeIconData(0x47cb);

  /// IconData for the 'strokeRoundedSquareLockAdd02' icon.
  static const IconData strokeRoundedSquareLockAdd02 = HugeIconData(0x47cc);

  /// IconData for the 'strokeRoundedSquareLockCheck01' icon.
  static const IconData strokeRoundedSquareLockCheck01 = HugeIconData(0x47cd);

  /// IconData for the 'strokeRoundedSquareLockCheck02' icon.
  static const IconData strokeRoundedSquareLockCheck02 = HugeIconData(0x47ce);

  /// IconData for the 'strokeRoundedSquareLockMinus01' icon.
  static const IconData strokeRoundedSquareLockMinus01 = HugeIconData(0x47cf);

  /// IconData for the 'strokeRoundedSquareLockMinus02' icon.
  static const IconData strokeRoundedSquareLockMinus02 = HugeIconData(0x47d0);

  /// IconData for the 'strokeRoundedSquareLockPassword' icon.
  static const IconData strokeRoundedSquareLockPassword = HugeIconData(0x47d1);

  /// IconData for the 'strokeRoundedSquareLockRemove01' icon.
  static const IconData strokeRoundedSquareLockRemove01 = HugeIconData(0x47d2);

  /// IconData for the 'strokeRoundedSquareLockRemove02' icon.
  static const IconData strokeRoundedSquareLockRemove02 = HugeIconData(0x47d3);

  /// IconData for the 'strokeRoundedSquareRootSquare' icon.
  static const IconData strokeRoundedSquareRootSquare = HugeIconData(0x47d4);

  /// IconData for the 'strokeRoundedSquareSquare' icon.
  static const IconData strokeRoundedSquareSquare = HugeIconData(0x47d5);

  /// IconData for the 'strokeRoundedSquareUnlock01' icon.
  static const IconData strokeRoundedSquareUnlock01 = HugeIconData(0x47d6);

  /// IconData for the 'strokeRoundedSquareUnlock02' icon.
  static const IconData strokeRoundedSquareUnlock02 = HugeIconData(0x47d7);

  /// IconData for the 'strokeRoundedSquare' icon.
  static const IconData strokeRoundedSquare = HugeIconData(0x47d8);

  /// IconData for the 'strokeRoundedStackStar' icon.
  static const IconData strokeRoundedStackStar = HugeIconData(0x47d9);

  /// IconData for the 'strokeRoundedStake' icon.
  static const IconData strokeRoundedStake = HugeIconData(0x47da);

  /// IconData for the 'strokeRoundedStamp01' icon.
  static const IconData strokeRoundedStamp01 = HugeIconData(0x47db);

  /// IconData for the 'strokeRoundedStamp02' icon.
  static const IconData strokeRoundedStamp02 = HugeIconData(0x47dc);

  /// IconData for the 'strokeRoundedStamp' icon.
  static const IconData strokeRoundedStamp = HugeIconData(0x47dd);

  /// IconData for the 'strokeRoundedStarCircle' icon.
  static const IconData strokeRoundedStarCircle = HugeIconData(0x47de);

  /// IconData for the 'strokeRoundedStarFace' icon.
  static const IconData strokeRoundedStarFace = HugeIconData(0x47df);

  /// IconData for the 'strokeRoundedStarHalf' icon.
  static const IconData strokeRoundedStarHalf = HugeIconData(0x47e0);

  /// IconData for the 'strokeRoundedStarOff' icon.
  static const IconData strokeRoundedStarOff = HugeIconData(0x47e1);

  /// IconData for the 'strokeRoundedStarSquare' icon.
  static const IconData strokeRoundedStarSquare = HugeIconData(0x47e2);

  /// IconData for the 'strokeRoundedStar' icon.
  static const IconData strokeRoundedStar = HugeIconData(0x47e3);

  /// IconData for the 'strokeRoundedStars' icon.
  static const IconData strokeRoundedStars = HugeIconData(0x47e4);

  /// IconData for the 'strokeRoundedStartUp01' icon.
  static const IconData strokeRoundedStartUp01 = HugeIconData(0x47e5);

  /// IconData for the 'strokeRoundedStartUp02' icon.
  static const IconData strokeRoundedStartUp02 = HugeIconData(0x47e6);

  /// IconData for the 'strokeRoundedStationery' icon.
  static const IconData strokeRoundedStationery = HugeIconData(0x47e7);

  /// IconData for the 'strokeRoundedSteak' icon.
  static const IconData strokeRoundedSteak = HugeIconData(0x47e8);

  /// IconData for the 'strokeRoundedSteering' icon.
  static const IconData strokeRoundedSteering = HugeIconData(0x47e9);

  /// IconData for the 'strokeRoundedStepInto' icon.
  static const IconData strokeRoundedStepInto = HugeIconData(0x47ea);

  /// IconData for the 'strokeRoundedStepOut' icon.
  static const IconData strokeRoundedStepOut = HugeIconData(0x47eb);

  /// IconData for the 'strokeRoundedStepOver' icon.
  static const IconData strokeRoundedStepOver = HugeIconData(0x47ec);

  /// IconData for the 'strokeRoundedStethoscope02' icon.
  static const IconData strokeRoundedStethoscope02 = HugeIconData(0x47ed);

  /// IconData for the 'strokeRoundedStethoscope' icon.
  static const IconData strokeRoundedStethoscope = HugeIconData(0x47ee);

  /// IconData for the 'strokeRoundedStickyNote01' icon.
  static const IconData strokeRoundedStickyNote01 = HugeIconData(0x47ef);

  /// IconData for the 'strokeRoundedStickyNote02' icon.
  static const IconData strokeRoundedStickyNote02 = HugeIconData(0x47f0);

  /// IconData for the 'strokeRoundedStopWatch' icon.
  static const IconData strokeRoundedStopWatch = HugeIconData(0x47f1);

  /// IconData for the 'strokeRoundedStop' icon.
  static const IconData strokeRoundedStop = HugeIconData(0x47f2);

  /// IconData for the 'strokeRoundedStore01' icon.
  static const IconData strokeRoundedStore01 = HugeIconData(0x47f3);

  /// IconData for the 'strokeRoundedStore02' icon.
  static const IconData strokeRoundedStore02 = HugeIconData(0x47f4);

  /// IconData for the 'strokeRoundedStore03' icon.
  static const IconData strokeRoundedStore03 = HugeIconData(0x47f5);

  /// IconData for the 'strokeRoundedStore04' icon.
  static const IconData strokeRoundedStore04 = HugeIconData(0x47f6);

  /// IconData for the 'strokeRoundedStoreAdd01' icon.
  static const IconData strokeRoundedStoreAdd01 = HugeIconData(0x47f7);

  /// IconData for the 'strokeRoundedStoreAdd02' icon.
  static const IconData strokeRoundedStoreAdd02 = HugeIconData(0x47f8);

  /// IconData for the 'strokeRoundedStoreLocation01' icon.
  static const IconData strokeRoundedStoreLocation01 = HugeIconData(0x47f9);

  /// IconData for the 'strokeRoundedStoreLocation02' icon.
  static const IconData strokeRoundedStoreLocation02 = HugeIconData(0x47fa);

  /// IconData for the 'strokeRoundedStoreRemove01' icon.
  static const IconData strokeRoundedStoreRemove01 = HugeIconData(0x47fb);

  /// IconData for the 'strokeRoundedStoreRemove02' icon.
  static const IconData strokeRoundedStoreRemove02 = HugeIconData(0x47fc);

  /// IconData for the 'strokeRoundedStoreVerified01' icon.
  static const IconData strokeRoundedStoreVerified01 = HugeIconData(0x47fd);

  /// IconData for the 'strokeRoundedStoreVerified02' icon.
  static const IconData strokeRoundedStoreVerified02 = HugeIconData(0x47fe);

  /// IconData for the 'strokeRoundedStraightEdge' icon.
  static const IconData strokeRoundedStraightEdge = HugeIconData(0x47ff);

  /// IconData for the 'strokeRoundedStrategy' icon.
  static const IconData strokeRoundedStrategy = HugeIconData(0x4800);

  /// IconData for the 'strokeRoundedStrokeBottom' icon.
  static const IconData strokeRoundedStrokeBottom = HugeIconData(0x4801);

  /// IconData for the 'strokeRoundedStrokeCenter' icon.
  static const IconData strokeRoundedStrokeCenter = HugeIconData(0x4802);

  /// IconData for the 'strokeRoundedStrokeInside' icon.
  static const IconData strokeRoundedStrokeInside = HugeIconData(0x4803);

  /// IconData for the 'strokeRoundedStrokeLeft' icon.
  static const IconData strokeRoundedStrokeLeft = HugeIconData(0x4804);

  /// IconData for the 'strokeRoundedStrokeOutside' icon.
  static const IconData strokeRoundedStrokeOutside = HugeIconData(0x4805);

  /// IconData for the 'strokeRoundedStrokeRight' icon.
  static const IconData strokeRoundedStrokeRight = HugeIconData(0x4806);

  /// IconData for the 'strokeRoundedStrokeTop' icon.
  static const IconData strokeRoundedStrokeTop = HugeIconData(0x4807);

  /// IconData for the 'strokeRoundedStructure01' icon.
  static const IconData strokeRoundedStructure01 = HugeIconData(0x4808);

  /// IconData for the 'strokeRoundedStructure02' icon.
  static const IconData strokeRoundedStructure02 = HugeIconData(0x4809);

  /// IconData for the 'strokeRoundedStructure03' icon.
  static const IconData strokeRoundedStructure03 = HugeIconData(0x480a);

  /// IconData for the 'strokeRoundedStructure04' icon.
  static const IconData strokeRoundedStructure04 = HugeIconData(0x480b);

  /// IconData for the 'strokeRoundedStructure05' icon.
  static const IconData strokeRoundedStructure05 = HugeIconData(0x480c);

  /// IconData for the 'strokeRoundedStructureAdd' icon.
  static const IconData strokeRoundedStructureAdd = HugeIconData(0x480d);

  /// IconData for the 'strokeRoundedStructureCheck' icon.
  static const IconData strokeRoundedStructureCheck = HugeIconData(0x480e);

  /// IconData for the 'strokeRoundedStructureFail' icon.
  static const IconData strokeRoundedStructureFail = HugeIconData(0x480f);

  /// IconData for the 'strokeRoundedStructureFolderCircle' icon.
  static const IconData strokeRoundedStructureFolderCircle =
      HugeIconData(0x4810);

  /// IconData for the 'strokeRoundedStructureFolder' icon.
  static const IconData strokeRoundedStructureFolder = HugeIconData(0x4811);

  /// IconData for the 'strokeRoundedStudentCard' icon.
  static const IconData strokeRoundedStudentCard = HugeIconData(0x4812);

  /// IconData for the 'strokeRoundedStudent' icon.
  static const IconData strokeRoundedStudent = HugeIconData(0x4813);

  /// IconData for the 'strokeRoundedStudents' icon.
  static const IconData strokeRoundedStudents = HugeIconData(0x4814);

  /// IconData for the 'strokeRoundedStudyDesk' icon.
  static const IconData strokeRoundedStudyDesk = HugeIconData(0x4815);

  /// IconData for the 'strokeRoundedStudyLamp' icon.
  static const IconData strokeRoundedStudyLamp = HugeIconData(0x4816);

  /// IconData for the 'strokeRoundedStumbleupon' icon.
  static const IconData strokeRoundedStumbleupon = HugeIconData(0x4817);

  /// IconData for the 'strokeRoundedSubmarine' icon.
  static const IconData strokeRoundedSubmarine = HugeIconData(0x4818);

  /// IconData for the 'strokeRoundedSubmerge' icon.
  static const IconData strokeRoundedSubmerge = HugeIconData(0x4819);

  /// IconData for the 'strokeRoundedSubnodeAdd' icon.
  static const IconData strokeRoundedSubnodeAdd = HugeIconData(0x481a);

  /// IconData for the 'strokeRoundedSubnodeDelete' icon.
  static const IconData strokeRoundedSubnodeDelete = HugeIconData(0x481b);

  /// IconData for the 'strokeRoundedSubpoena' icon.
  static const IconData strokeRoundedSubpoena = HugeIconData(0x481c);

  /// IconData for the 'strokeRoundedSubtitle' icon.
  static const IconData strokeRoundedSubtitle = HugeIconData(0x481d);

  /// IconData for the 'strokeRoundedSuit01' icon.
  static const IconData strokeRoundedSuit01 = HugeIconData(0x481e);

  /// IconData for the 'strokeRoundedSuit02' icon.
  static const IconData strokeRoundedSuit02 = HugeIconData(0x481f);

  /// IconData for the 'strokeRoundedSujood' icon.
  static const IconData strokeRoundedSujood = HugeIconData(0x4820);

  /// IconData for the 'strokeRoundedSummation01' icon.
  static const IconData strokeRoundedSummation01 = HugeIconData(0x4821);

  /// IconData for the 'strokeRoundedSummation02' icon.
  static const IconData strokeRoundedSummation02 = HugeIconData(0x4822);

  /// IconData for the 'strokeRoundedSummationCircle' icon.
  static const IconData strokeRoundedSummationCircle = HugeIconData(0x4823);

  /// IconData for the 'strokeRoundedSummationSquare' icon.
  static const IconData strokeRoundedSummationSquare = HugeIconData(0x4824);

  /// IconData for the 'strokeRoundedSun01' icon.
  static const IconData strokeRoundedSun01 = HugeIconData(0x4825);

  /// IconData for the 'strokeRoundedSun02' icon.
  static const IconData strokeRoundedSun02 = HugeIconData(0x4826);

  /// IconData for the 'strokeRoundedSun03' icon.
  static const IconData strokeRoundedSun03 = HugeIconData(0x4827);

  /// IconData for the 'strokeRoundedSunCloud01' icon.
  static const IconData strokeRoundedSunCloud01 = HugeIconData(0x4828);

  /// IconData for the 'strokeRoundedSunCloud02' icon.
  static const IconData strokeRoundedSunCloud02 = HugeIconData(0x4829);

  /// IconData for the 'strokeRoundedSunCloudAngledRain01' icon.
  static const IconData strokeRoundedSunCloudAngledRain01 =
      HugeIconData(0x482a);

  /// IconData for the 'strokeRoundedSunCloudAngledRain02' icon.
  static const IconData strokeRoundedSunCloudAngledRain02 =
      HugeIconData(0x482b);

  /// IconData for the 'strokeRoundedSunCloudAngledRainZap01' icon.
  static const IconData strokeRoundedSunCloudAngledRainZap01 =
      HugeIconData(0x482c);

  /// IconData for the 'strokeRoundedSunCloudAngledRainZap02' icon.
  static const IconData strokeRoundedSunCloudAngledRainZap02 =
      HugeIconData(0x482d);

  /// IconData for the 'strokeRoundedSunCloudAngledZap01' icon.
  static const IconData strokeRoundedSunCloudAngledZap01 = HugeIconData(0x482e);

  /// IconData for the 'strokeRoundedSunCloudAngledZap02' icon.
  static const IconData strokeRoundedSunCloudAngledZap02 = HugeIconData(0x482f);

  /// IconData for the 'strokeRoundedSunCloudBigRain01' icon.
  static const IconData strokeRoundedSunCloudBigRain01 = HugeIconData(0x4830);

  /// IconData for the 'strokeRoundedSunCloudBigRain02' icon.
  static const IconData strokeRoundedSunCloudBigRain02 = HugeIconData(0x4831);

  /// IconData for the 'strokeRoundedSunCloudFastWind01' icon.
  static const IconData strokeRoundedSunCloudFastWind01 = HugeIconData(0x4832);

  /// IconData for the 'strokeRoundedSunCloudFastWind02' icon.
  static const IconData strokeRoundedSunCloudFastWind02 = HugeIconData(0x4833);

  /// IconData for the 'strokeRoundedSunCloudHailstone01' icon.
  static const IconData strokeRoundedSunCloudHailstone01 = HugeIconData(0x4834);

  /// IconData for the 'strokeRoundedSunCloudHailstone02' icon.
  static const IconData strokeRoundedSunCloudHailstone02 = HugeIconData(0x4835);

  /// IconData for the 'strokeRoundedSunCloudLittleRain01' icon.
  static const IconData strokeRoundedSunCloudLittleRain01 =
      HugeIconData(0x4836);

  /// IconData for the 'strokeRoundedSunCloudLittleRain02' icon.
  static const IconData strokeRoundedSunCloudLittleRain02 =
      HugeIconData(0x4837);

  /// IconData for the 'strokeRoundedSunCloudLittleSnow01' icon.
  static const IconData strokeRoundedSunCloudLittleSnow01 =
      HugeIconData(0x4838);

  /// IconData for the 'strokeRoundedSunCloudLittleSnow02' icon.
  static const IconData strokeRoundedSunCloudLittleSnow02 =
      HugeIconData(0x4839);

  /// IconData for the 'strokeRoundedSunCloudMidRain01' icon.
  static const IconData strokeRoundedSunCloudMidRain01 = HugeIconData(0x483a);

  /// IconData for the 'strokeRoundedSunCloudMidRain02' icon.
  static const IconData strokeRoundedSunCloudMidRain02 = HugeIconData(0x483b);

  /// IconData for the 'strokeRoundedSunCloudMidSnow01' icon.
  static const IconData strokeRoundedSunCloudMidSnow01 = HugeIconData(0x483c);

  /// IconData for the 'strokeRoundedSunCloudMidSnow02' icon.
  static const IconData strokeRoundedSunCloudMidSnow02 = HugeIconData(0x483d);

  /// IconData for the 'strokeRoundedSunCloudSlowWind01' icon.
  static const IconData strokeRoundedSunCloudSlowWind01 = HugeIconData(0x483e);

  /// IconData for the 'strokeRoundedSunCloudSlowWind02' icon.
  static const IconData strokeRoundedSunCloudSlowWind02 = HugeIconData(0x483f);

  /// IconData for the 'strokeRoundedSunCloudSnow01' icon.
  static const IconData strokeRoundedSunCloudSnow01 = HugeIconData(0x4840);

  /// IconData for the 'strokeRoundedSunCloudSnow02' icon.
  static const IconData strokeRoundedSunCloudSnow02 = HugeIconData(0x4841);

  /// IconData for the 'strokeRoundedSunglasses' icon.
  static const IconData strokeRoundedSunglasses = HugeIconData(0x4842);

  /// IconData for the 'strokeRoundedSunrise' icon.
  static const IconData strokeRoundedSunrise = HugeIconData(0x4843);

  /// IconData for the 'strokeRoundedSunset' icon.
  static const IconData strokeRoundedSunset = HugeIconData(0x4844);

  /// IconData for the 'strokeRoundedSuperMarioToad' icon.
  static const IconData strokeRoundedSuperMarioToad = HugeIconData(0x4845);

  /// IconData for the 'strokeRoundedSuperMario' icon.
  static const IconData strokeRoundedSuperMario = HugeIconData(0x4846);

  /// IconData for the 'strokeRoundedSurfboard' icon.
  static const IconData strokeRoundedSurfboard = HugeIconData(0x4847);

  /// IconData for the 'strokeRoundedSurprise' icon.
  static const IconData strokeRoundedSurprise = HugeIconData(0x4848);

  /// IconData for the 'strokeRoundedSushi01' icon.
  static const IconData strokeRoundedSushi01 = HugeIconData(0x4849);

  /// IconData for the 'strokeRoundedSushi02' icon.
  static const IconData strokeRoundedSushi02 = HugeIconData(0x484a);

  /// IconData for the 'strokeRoundedSushi03' icon.
  static const IconData strokeRoundedSushi03 = HugeIconData(0x484b);

  /// IconData for the 'strokeRoundedSuspicious' icon.
  static const IconData strokeRoundedSuspicious = HugeIconData(0x484c);

  /// IconData for the 'strokeRoundedSustainableEnergy' icon.
  static const IconData strokeRoundedSustainableEnergy = HugeIconData(0x484d);

  /// IconData for the 'strokeRoundedSvg01' icon.
  static const IconData strokeRoundedSvg01 = HugeIconData(0x484e);

  /// IconData for the 'strokeRoundedSvg02' icon.
  static const IconData strokeRoundedSvg02 = HugeIconData(0x484f);

  /// IconData for the 'strokeRoundedSwarm' icon.
  static const IconData strokeRoundedSwarm = HugeIconData(0x4850);

  /// IconData for the 'strokeRoundedSwatch' icon.
  static const IconData strokeRoundedSwatch = HugeIconData(0x4851);

  /// IconData for the 'strokeRoundedSwimmingCap' icon.
  static const IconData strokeRoundedSwimmingCap = HugeIconData(0x4852);

  /// IconData for the 'strokeRoundedSwimming' icon.
  static const IconData strokeRoundedSwimming = HugeIconData(0x4853);

  /// IconData for the 'strokeRoundedSwipeDown01' icon.
  static const IconData strokeRoundedSwipeDown01 = HugeIconData(0x4854);

  /// IconData for the 'strokeRoundedSwipeDown02' icon.
  static const IconData strokeRoundedSwipeDown02 = HugeIconData(0x4855);

  /// IconData for the 'strokeRoundedSwipeDown03' icon.
  static const IconData strokeRoundedSwipeDown03 = HugeIconData(0x4856);

  /// IconData for the 'strokeRoundedSwipeDown04' icon.
  static const IconData strokeRoundedSwipeDown04 = HugeIconData(0x4857);

  /// IconData for the 'strokeRoundedSwipeDown05' icon.
  static const IconData strokeRoundedSwipeDown05 = HugeIconData(0x4858);

  /// IconData for the 'strokeRoundedSwipeDown06' icon.
  static const IconData strokeRoundedSwipeDown06 = HugeIconData(0x4859);

  /// IconData for the 'strokeRoundedSwipeDown07' icon.
  static const IconData strokeRoundedSwipeDown07 = HugeIconData(0x485a);

  /// IconData for the 'strokeRoundedSwipeDown08' icon.
  static const IconData strokeRoundedSwipeDown08 = HugeIconData(0x485b);

  /// IconData for the 'strokeRoundedSwipeLeft01' icon.
  static const IconData strokeRoundedSwipeLeft01 = HugeIconData(0x485c);

  /// IconData for the 'strokeRoundedSwipeLeft02' icon.
  static const IconData strokeRoundedSwipeLeft02 = HugeIconData(0x485d);

  /// IconData for the 'strokeRoundedSwipeLeft03' icon.
  static const IconData strokeRoundedSwipeLeft03 = HugeIconData(0x485e);

  /// IconData for the 'strokeRoundedSwipeLeft04' icon.
  static const IconData strokeRoundedSwipeLeft04 = HugeIconData(0x485f);

  /// IconData for the 'strokeRoundedSwipeLeft05' icon.
  static const IconData strokeRoundedSwipeLeft05 = HugeIconData(0x4860);

  /// IconData for the 'strokeRoundedSwipeLeft06' icon.
  static const IconData strokeRoundedSwipeLeft06 = HugeIconData(0x4861);

  /// IconData for the 'strokeRoundedSwipeLeft07' icon.
  static const IconData strokeRoundedSwipeLeft07 = HugeIconData(0x4862);

  /// IconData for the 'strokeRoundedSwipeLeft08' icon.
  static const IconData strokeRoundedSwipeLeft08 = HugeIconData(0x4863);

  /// IconData for the 'strokeRoundedSwipeLeft09' icon.
  static const IconData strokeRoundedSwipeLeft09 = HugeIconData(0x4864);

  /// IconData for the 'strokeRoundedSwipeRight01' icon.
  static const IconData strokeRoundedSwipeRight01 = HugeIconData(0x4865);

  /// IconData for the 'strokeRoundedSwipeRight02' icon.
  static const IconData strokeRoundedSwipeRight02 = HugeIconData(0x4866);

  /// IconData for the 'strokeRoundedSwipeRight03' icon.
  static const IconData strokeRoundedSwipeRight03 = HugeIconData(0x4867);

  /// IconData for the 'strokeRoundedSwipeRight04' icon.
  static const IconData strokeRoundedSwipeRight04 = HugeIconData(0x4868);

  /// IconData for the 'strokeRoundedSwipeRight05' icon.
  static const IconData strokeRoundedSwipeRight05 = HugeIconData(0x4869);

  /// IconData for the 'strokeRoundedSwipeRight06' icon.
  static const IconData strokeRoundedSwipeRight06 = HugeIconData(0x486a);

  /// IconData for the 'strokeRoundedSwipeRight07' icon.
  static const IconData strokeRoundedSwipeRight07 = HugeIconData(0x486b);

  /// IconData for the 'strokeRoundedSwipeRight08' icon.
  static const IconData strokeRoundedSwipeRight08 = HugeIconData(0x486c);

  /// IconData for the 'strokeRoundedSwipeRight09' icon.
  static const IconData strokeRoundedSwipeRight09 = HugeIconData(0x486d);

  /// IconData for the 'strokeRoundedSwipeUp01' icon.
  static const IconData strokeRoundedSwipeUp01 = HugeIconData(0x486e);

  /// IconData for the 'strokeRoundedSwipeUp02' icon.
  static const IconData strokeRoundedSwipeUp02 = HugeIconData(0x486f);

  /// IconData for the 'strokeRoundedSwipeUp03' icon.
  static const IconData strokeRoundedSwipeUp03 = HugeIconData(0x4870);

  /// IconData for the 'strokeRoundedSwipeUp04' icon.
  static const IconData strokeRoundedSwipeUp04 = HugeIconData(0x4871);

  /// IconData for the 'strokeRoundedSwipeUp05' icon.
  static const IconData strokeRoundedSwipeUp05 = HugeIconData(0x4872);

  /// IconData for the 'strokeRoundedSwipeUp06' icon.
  static const IconData strokeRoundedSwipeUp06 = HugeIconData(0x4873);

  /// IconData for the 'strokeRoundedSwipeUp07' icon.
  static const IconData strokeRoundedSwipeUp07 = HugeIconData(0x4874);

  /// IconData for the 'strokeRoundedSwipeUp08' icon.
  static const IconData strokeRoundedSwipeUp08 = HugeIconData(0x4875);

  /// IconData for the 'strokeRoundedSword01' icon.
  static const IconData strokeRoundedSword01 = HugeIconData(0x4876);

  /// IconData for the 'strokeRoundedSword02' icon.
  static const IconData strokeRoundedSword02 = HugeIconData(0x4877);

  /// IconData for the 'strokeRoundedSword03' icon.
  static const IconData strokeRoundedSword03 = HugeIconData(0x4878);

  /// IconData for the 'strokeRoundedSystemUpdate01' icon.
  static const IconData strokeRoundedSystemUpdate01 = HugeIconData(0x4879);

  /// IconData for the 'strokeRoundedSystemUpdate02' icon.
  static const IconData strokeRoundedSystemUpdate02 = HugeIconData(0x487a);

  /// IconData for the 'strokeRoundedTShirt' icon.
  static const IconData strokeRoundedTShirt = HugeIconData(0x487b);

  /// IconData for the 'strokeRoundedTable01' icon.
  static const IconData strokeRoundedTable01 = HugeIconData(0x487c);

  /// IconData for the 'strokeRoundedTable02' icon.
  static const IconData strokeRoundedTable02 = HugeIconData(0x487d);

  /// IconData for the 'strokeRoundedTable03' icon.
  static const IconData strokeRoundedTable03 = HugeIconData(0x487e);

  /// IconData for the 'strokeRoundedTableLamp01' icon.
  static const IconData strokeRoundedTableLamp01 = HugeIconData(0x487f);

  /// IconData for the 'strokeRoundedTableLamp02' icon.
  static const IconData strokeRoundedTableLamp02 = HugeIconData(0x4880);

  /// IconData for the 'strokeRoundedTableRound' icon.
  static const IconData strokeRoundedTableRound = HugeIconData(0x4881);

  /// IconData for the 'strokeRoundedTableTennisBat' icon.
  static const IconData strokeRoundedTableTennisBat = HugeIconData(0x4882);

  /// IconData for the 'strokeRoundedTable' icon.
  static const IconData strokeRoundedTable = HugeIconData(0x4883);

  /// IconData for the 'strokeRoundedTablet01' icon.
  static const IconData strokeRoundedTablet01 = HugeIconData(0x4884);

  /// IconData for the 'strokeRoundedTablet02' icon.
  static const IconData strokeRoundedTablet02 = HugeIconData(0x4885);

  /// IconData for the 'strokeRoundedTabletConnectedBluetooth' icon.
  static const IconData strokeRoundedTabletConnectedBluetooth =
      HugeIconData(0x4886);

  /// IconData for the 'strokeRoundedTabletConnectedUsb' icon.
  static const IconData strokeRoundedTabletConnectedUsb = HugeIconData(0x4887);

  /// IconData for the 'strokeRoundedTabletConnectedWifi' icon.
  static const IconData strokeRoundedTabletConnectedWifi = HugeIconData(0x4888);

  /// IconData for the 'strokeRoundedTabletPen' icon.
  static const IconData strokeRoundedTabletPen = HugeIconData(0x4889);

  /// IconData for the 'strokeRoundedTaco01' icon.
  static const IconData strokeRoundedTaco01 = HugeIconData(0x488a);

  /// IconData for the 'strokeRoundedTaco02' icon.
  static const IconData strokeRoundedTaco02 = HugeIconData(0x488b);

  /// IconData for the 'strokeRoundedTag01' icon.
  static const IconData strokeRoundedTag01 = HugeIconData(0x488c);

  /// IconData for the 'strokeRoundedTag02' icon.
  static const IconData strokeRoundedTag02 = HugeIconData(0x488d);

  /// IconData for the 'strokeRoundedTags' icon.
  static const IconData strokeRoundedTags = HugeIconData(0x488e);

  /// IconData for the 'strokeRoundedTajMahal' icon.
  static const IconData strokeRoundedTajMahal = HugeIconData(0x488f);

  /// IconData for the 'strokeRoundedTan' icon.
  static const IconData strokeRoundedTan = HugeIconData(0x4890);

  /// IconData for the 'strokeRoundedTankTop' icon.
  static const IconData strokeRoundedTankTop = HugeIconData(0x4891);

  /// IconData for the 'strokeRoundedTap01' icon.
  static const IconData strokeRoundedTap01 = HugeIconData(0x4892);

  /// IconData for the 'strokeRoundedTap02' icon.
  static const IconData strokeRoundedTap02 = HugeIconData(0x4893);

  /// IconData for the 'strokeRoundedTap03' icon.
  static const IconData strokeRoundedTap03 = HugeIconData(0x4894);

  /// IconData for the 'strokeRoundedTap04' icon.
  static const IconData strokeRoundedTap04 = HugeIconData(0x4895);

  /// IconData for the 'strokeRoundedTap05' icon.
  static const IconData strokeRoundedTap05 = HugeIconData(0x4896);

  /// IconData for the 'strokeRoundedTap06' icon.
  static const IconData strokeRoundedTap06 = HugeIconData(0x4897);

  /// IconData for the 'strokeRoundedTap07' icon.
  static const IconData strokeRoundedTap07 = HugeIconData(0x4898);

  /// IconData for the 'strokeRoundedTap08' icon.
  static const IconData strokeRoundedTap08 = HugeIconData(0x4899);

  /// IconData for the 'strokeRoundedTapeMeasure' icon.
  static const IconData strokeRoundedTapeMeasure = HugeIconData(0x489a);

  /// IconData for the 'strokeRoundedTarget01' icon.
  static const IconData strokeRoundedTarget01 = HugeIconData(0x489b);

  /// IconData for the 'strokeRoundedTarget02' icon.
  static const IconData strokeRoundedTarget02 = HugeIconData(0x489c);

  /// IconData for the 'strokeRoundedTarget03' icon.
  static const IconData strokeRoundedTarget03 = HugeIconData(0x489d);

  /// IconData for the 'strokeRoundedTargetDollar' icon.
  static const IconData strokeRoundedTargetDollar = HugeIconData(0x489e);

  /// IconData for the 'strokeRoundedTasbih' icon.
  static const IconData strokeRoundedTasbih = HugeIconData(0x489f);

  /// IconData for the 'strokeRoundedTask01' icon.
  static const IconData strokeRoundedTask01 = HugeIconData(0x48a0);

  /// IconData for the 'strokeRoundedTask02' icon.
  static const IconData strokeRoundedTask02 = HugeIconData(0x48a1);

  /// IconData for the 'strokeRoundedTaskAdd01' icon.
  static const IconData strokeRoundedTaskAdd01 = HugeIconData(0x48a2);

  /// IconData for the 'strokeRoundedTaskAdd02' icon.
  static const IconData strokeRoundedTaskAdd02 = HugeIconData(0x48a3);

  /// IconData for the 'strokeRoundedTaskDaily01' icon.
  static const IconData strokeRoundedTaskDaily01 = HugeIconData(0x48a4);

  /// IconData for the 'strokeRoundedTaskDaily02' icon.
  static const IconData strokeRoundedTaskDaily02 = HugeIconData(0x48a5);

  /// IconData for the 'strokeRoundedTaskDone01' icon.
  static const IconData strokeRoundedTaskDone01 = HugeIconData(0x48a6);

  /// IconData for the 'strokeRoundedTaskDone02' icon.
  static const IconData strokeRoundedTaskDone02 = HugeIconData(0x48a7);

  /// IconData for the 'strokeRoundedTaskEdit01' icon.
  static const IconData strokeRoundedTaskEdit01 = HugeIconData(0x48a8);

  /// IconData for the 'strokeRoundedTaskEdit02' icon.
  static const IconData strokeRoundedTaskEdit02 = HugeIconData(0x48a9);

  /// IconData for the 'strokeRoundedTaskRemove01' icon.
  static const IconData strokeRoundedTaskRemove01 = HugeIconData(0x48aa);

  /// IconData for the 'strokeRoundedTaskRemove02' icon.
  static const IconData strokeRoundedTaskRemove02 = HugeIconData(0x48ab);

  /// IconData for the 'strokeRoundedTaxes' icon.
  static const IconData strokeRoundedTaxes = HugeIconData(0x48ac);

  /// IconData for the 'strokeRoundedTaxi' icon.
  static const IconData strokeRoundedTaxi = HugeIconData(0x48ad);

  /// IconData for the 'strokeRoundedTeaPod' icon.
  static const IconData strokeRoundedTeaPod = HugeIconData(0x48ae);

  /// IconData for the 'strokeRoundedTea' icon.
  static const IconData strokeRoundedTea = HugeIconData(0x48af);

  /// IconData for the 'strokeRoundedTeacher' icon.
  static const IconData strokeRoundedTeacher = HugeIconData(0x48b0);

  /// IconData for the 'strokeRoundedTeaching' icon.
  static const IconData strokeRoundedTeaching = HugeIconData(0x48b1);

  /// IconData for the 'strokeRoundedTeamviewer' icon.
  static const IconData strokeRoundedTeamviewer = HugeIconData(0x48b2);

  /// IconData for the 'strokeRoundedTelegram' icon.
  static const IconData strokeRoundedTelegram = HugeIconData(0x48b3);

  /// IconData for the 'strokeRoundedTelephone' icon.
  static const IconData strokeRoundedTelephone = HugeIconData(0x48b4);

  /// IconData for the 'strokeRoundedTelescope01' icon.
  static const IconData strokeRoundedTelescope01 = HugeIconData(0x48b5);

  /// IconData for the 'strokeRoundedTelescope02' icon.
  static const IconData strokeRoundedTelescope02 = HugeIconData(0x48b6);

  /// IconData for the 'strokeRoundedTelevisionTable' icon.
  static const IconData strokeRoundedTelevisionTable = HugeIconData(0x48b7);

  /// IconData for the 'strokeRoundedTemperature' icon.
  static const IconData strokeRoundedTemperature = HugeIconData(0x48b8);

  /// IconData for the 'strokeRoundedTennisBall' icon.
  static const IconData strokeRoundedTennisBall = HugeIconData(0x48b9);

  /// IconData for the 'strokeRoundedTerrace' icon.
  static const IconData strokeRoundedTerrace = HugeIconData(0x48ba);

  /// IconData for the 'strokeRoundedTestTube01' icon.
  static const IconData strokeRoundedTestTube01 = HugeIconData(0x48bb);

  /// IconData for the 'strokeRoundedTestTube02' icon.
  static const IconData strokeRoundedTestTube02 = HugeIconData(0x48bc);

  /// IconData for the 'strokeRoundedTestTube03' icon.
  static const IconData strokeRoundedTestTube03 = HugeIconData(0x48bd);

  /// IconData for the 'strokeRoundedTestTube' icon.
  static const IconData strokeRoundedTestTube = HugeIconData(0x48be);

  /// IconData for the 'strokeRoundedTetris' icon.
  static const IconData strokeRoundedTetris = HugeIconData(0x48bf);

  /// IconData for the 'strokeRoundedTextAlignCenter' icon.
  static const IconData strokeRoundedTextAlignCenter = HugeIconData(0x48c0);

  /// IconData for the 'strokeRoundedTextAlignJustifyCenter' icon.
  static const IconData strokeRoundedTextAlignJustifyCenter =
      HugeIconData(0x48c1);

  /// IconData for the 'strokeRoundedTextAlignJustifyLeft' icon.
  static const IconData strokeRoundedTextAlignJustifyLeft =
      HugeIconData(0x48c2);

  /// IconData for the 'strokeRoundedTextAlignJustifyRight' icon.
  static const IconData strokeRoundedTextAlignJustifyRight =
      HugeIconData(0x48c3);

  /// IconData for the 'strokeRoundedTextAlignLeft01' icon.
  static const IconData strokeRoundedTextAlignLeft01 = HugeIconData(0x48c4);

  /// IconData for the 'strokeRoundedTextAlignLeft' icon.
  static const IconData strokeRoundedTextAlignLeft = HugeIconData(0x48c5);

  /// IconData for the 'strokeRoundedTextAlignRight01' icon.
  static const IconData strokeRoundedTextAlignRight01 = HugeIconData(0x48c6);

  /// IconData for the 'strokeRoundedTextAlignRight' icon.
  static const IconData strokeRoundedTextAlignRight = HugeIconData(0x48c7);

  /// IconData for the 'strokeRoundedTextAllCaps' icon.
  static const IconData strokeRoundedTextAllCaps = HugeIconData(0x48c8);

  /// IconData for the 'strokeRoundedTextBold' icon.
  static const IconData strokeRoundedTextBold = HugeIconData(0x48c9);

  /// IconData for the 'strokeRoundedTextCenterlineCenterTop' icon.
  static const IconData strokeRoundedTextCenterlineCenterTop =
      HugeIconData(0x48ca);

  /// IconData for the 'strokeRoundedTextCenterlineLeft' icon.
  static const IconData strokeRoundedTextCenterlineLeft = HugeIconData(0x48cb);

  /// IconData for the 'strokeRoundedTextCenterlineMiddle' icon.
  static const IconData strokeRoundedTextCenterlineMiddle =
      HugeIconData(0x48cc);

  /// IconData for the 'strokeRoundedTextCenterlineRight' icon.
  static const IconData strokeRoundedTextCenterlineRight = HugeIconData(0x48cd);

  /// IconData for the 'strokeRoundedTextCheck' icon.
  static const IconData strokeRoundedTextCheck = HugeIconData(0x48ce);

  /// IconData for the 'strokeRoundedTextCircle' icon.
  static const IconData strokeRoundedTextCircle = HugeIconData(0x48cf);

  /// IconData for the 'strokeRoundedTextClear' icon.
  static const IconData strokeRoundedTextClear = HugeIconData(0x48d0);

  /// IconData for the 'strokeRoundedTextColor' icon.
  static const IconData strokeRoundedTextColor = HugeIconData(0x48d1);

  /// IconData for the 'strokeRoundedTextCreation' icon.
  static const IconData strokeRoundedTextCreation = HugeIconData(0x48d2);

  /// IconData for the 'strokeRoundedTextFirstlineLeft' icon.
  static const IconData strokeRoundedTextFirstlineLeft = HugeIconData(0x48d3);

  /// IconData for the 'strokeRoundedTextFirstlineRight' icon.
  static const IconData strokeRoundedTextFirstlineRight = HugeIconData(0x48d4);

  /// IconData for the 'strokeRoundedTextFont' icon.
  static const IconData strokeRoundedTextFont = HugeIconData(0x48d5);

  /// IconData for the 'strokeRoundedTextFootnote' icon.
  static const IconData strokeRoundedTextFootnote = HugeIconData(0x48d6);

  /// IconData for the 'strokeRoundedTextIndent01' icon.
  static const IconData strokeRoundedTextIndent01 = HugeIconData(0x48d7);

  /// IconData for the 'strokeRoundedTextIndentLess' icon.
  static const IconData strokeRoundedTextIndentLess = HugeIconData(0x48d8);

  /// IconData for the 'strokeRoundedTextIndentMore' icon.
  static const IconData strokeRoundedTextIndentMore = HugeIconData(0x48d9);

  /// IconData for the 'strokeRoundedTextIndent' icon.
  static const IconData strokeRoundedTextIndent = HugeIconData(0x48da);

  /// IconData for the 'strokeRoundedTextItalicSlash' icon.
  static const IconData strokeRoundedTextItalicSlash = HugeIconData(0x48db);

  /// IconData for the 'strokeRoundedTextItalic' icon.
  static const IconData strokeRoundedTextItalic = HugeIconData(0x48dc);

  /// IconData for the 'strokeRoundedTextKerning' icon.
  static const IconData strokeRoundedTextKerning = HugeIconData(0x48dd);

  /// IconData for the 'strokeRoundedTextNumberSign' icon.
  static const IconData strokeRoundedTextNumberSign = HugeIconData(0x48de);

  /// IconData for the 'strokeRoundedTextSelection' icon.
  static const IconData strokeRoundedTextSelection = HugeIconData(0x48df);

  /// IconData for the 'strokeRoundedTextSmallcaps' icon.
  static const IconData strokeRoundedTextSmallcaps = HugeIconData(0x48e0);

  /// IconData for the 'strokeRoundedTextSquare' icon.
  static const IconData strokeRoundedTextSquare = HugeIconData(0x48e1);

  /// IconData for the 'strokeRoundedTextStrikethrough' icon.
  static const IconData strokeRoundedTextStrikethrough = HugeIconData(0x48e2);

  /// IconData for the 'strokeRoundedTextSubscript' icon.
  static const IconData strokeRoundedTextSubscript = HugeIconData(0x48e3);

  /// IconData for the 'strokeRoundedTextSuperscript' icon.
  static const IconData strokeRoundedTextSuperscript = HugeIconData(0x48e4);

  /// IconData for the 'strokeRoundedTextTracking' icon.
  static const IconData strokeRoundedTextTracking = HugeIconData(0x48e5);

  /// IconData for the 'strokeRoundedTextUnderline' icon.
  static const IconData strokeRoundedTextUnderline = HugeIconData(0x48e6);

  /// IconData for the 'strokeRoundedTextVariableFront' icon.
  static const IconData strokeRoundedTextVariableFront = HugeIconData(0x48e7);

  /// IconData for the 'strokeRoundedTextVerticalAlignment' icon.
  static const IconData strokeRoundedTextVerticalAlignment =
      HugeIconData(0x48e8);

  /// IconData for the 'strokeRoundedTextWrap' icon.
  static const IconData strokeRoundedTextWrap = HugeIconData(0x48e9);

  /// IconData for the 'strokeRoundedText' icon.
  static const IconData strokeRoundedText = HugeIconData(0x48ea);

  /// IconData for the 'strokeRoundedTheProphetsMosque' icon.
  static const IconData strokeRoundedTheProphetsMosque = HugeIconData(0x48eb);

  /// IconData for the 'strokeRoundedThermometerCold' icon.
  static const IconData strokeRoundedThermometerCold = HugeIconData(0x48ec);

  /// IconData for the 'strokeRoundedThermometerWarm' icon.
  static const IconData strokeRoundedThermometerWarm = HugeIconData(0x48ed);

  /// IconData for the 'strokeRoundedThermometer' icon.
  static const IconData strokeRoundedThermometer = HugeIconData(0x48ee);

  /// IconData for the 'strokeRoundedThirdBracketCircle' icon.
  static const IconData strokeRoundedThirdBracketCircle = HugeIconData(0x48ef);

  /// IconData for the 'strokeRoundedThirdBracketSquare' icon.
  static const IconData strokeRoundedThirdBracketSquare = HugeIconData(0x48f0);

  /// IconData for the 'strokeRoundedThirdBracket' icon.
  static const IconData strokeRoundedThirdBracket = HugeIconData(0x48f1);

  /// IconData for the 'strokeRoundedThread' icon.
  static const IconData strokeRoundedThread = HugeIconData(0x48f2);

  /// IconData for the 'strokeRoundedThreadsEllipse' icon.
  static const IconData strokeRoundedThreadsEllipse = HugeIconData(0x48f3);

  /// IconData for the 'strokeRoundedThreadsRectangle' icon.
  static const IconData strokeRoundedThreadsRectangle = HugeIconData(0x48f4);

  /// IconData for the 'strokeRoundedThreads' icon.
  static const IconData strokeRoundedThreads = HugeIconData(0x48f5);

  /// IconData for the 'strokeRoundedThreeDMove' icon.
  static const IconData strokeRoundedThreeDMove = HugeIconData(0x48f6);

  /// IconData for the 'strokeRoundedThreeDRotate' icon.
  static const IconData strokeRoundedThreeDRotate = HugeIconData(0x48f7);

  /// IconData for the 'strokeRoundedThreeDScale' icon.
  static const IconData strokeRoundedThreeDScale = HugeIconData(0x48f8);

  /// IconData for the 'strokeRoundedThreeDView' icon.
  static const IconData strokeRoundedThreeDView = HugeIconData(0x48f9);

  /// IconData for the 'strokeRoundedThreeFinger01' icon.
  static const IconData strokeRoundedThreeFinger01 = HugeIconData(0x48fa);

  /// IconData for the 'strokeRoundedThreeFinger02' icon.
  static const IconData strokeRoundedThreeFinger02 = HugeIconData(0x48fb);

  /// IconData for the 'strokeRoundedThreeFinger03' icon.
  static const IconData strokeRoundedThreeFinger03 = HugeIconData(0x48fc);

  /// IconData for the 'strokeRoundedThreeFinger04' icon.
  static const IconData strokeRoundedThreeFinger04 = HugeIconData(0x48fd);

  /// IconData for the 'strokeRoundedThreeFinger05' icon.
  static const IconData strokeRoundedThreeFinger05 = HugeIconData(0x48fe);

  /// IconData for the 'strokeRoundedThumbsDownEllipse' icon.
  static const IconData strokeRoundedThumbsDownEllipse = HugeIconData(0x48ff);

  /// IconData for the 'strokeRoundedThumbsDownRectangle' icon.
  static const IconData strokeRoundedThumbsDownRectangle = HugeIconData(0x4900);

  /// IconData for the 'strokeRoundedThumbsDown' icon.
  static const IconData strokeRoundedThumbsDown = HugeIconData(0x4901);

  /// IconData for the 'strokeRoundedThumbsUpDown' icon.
  static const IconData strokeRoundedThumbsUpDown = HugeIconData(0x4902);

  /// IconData for the 'strokeRoundedThumbsUpEllipse' icon.
  static const IconData strokeRoundedThumbsUpEllipse = HugeIconData(0x4903);

  /// IconData for the 'strokeRoundedThumbsUpRectangle' icon.
  static const IconData strokeRoundedThumbsUpRectangle = HugeIconData(0x4904);

  /// IconData for the 'strokeRoundedThumbsUp' icon.
  static const IconData strokeRoundedThumbsUp = HugeIconData(0x4905);

  /// IconData for the 'strokeRoundedTicTacToe' icon.
  static const IconData strokeRoundedTicTacToe = HugeIconData(0x4906);

  /// IconData for the 'strokeRoundedTick01' icon.
  static const IconData strokeRoundedTick01 = HugeIconData(0x4907);

  /// IconData for the 'strokeRoundedTick02' icon.
  static const IconData strokeRoundedTick02 = HugeIconData(0x4908);

  /// IconData for the 'strokeRoundedTick03' icon.
  static const IconData strokeRoundedTick03 = HugeIconData(0x4909);

  /// IconData for the 'strokeRoundedTick04' icon.
  static const IconData strokeRoundedTick04 = HugeIconData(0x490a);

  /// IconData for the 'strokeRoundedTickDouble01' icon.
  static const IconData strokeRoundedTickDouble01 = HugeIconData(0x490b);

  /// IconData for the 'strokeRoundedTickDouble02' icon.
  static const IconData strokeRoundedTickDouble02 = HugeIconData(0x490c);

  /// IconData for the 'strokeRoundedTickDouble03' icon.
  static const IconData strokeRoundedTickDouble03 = HugeIconData(0x490d);

  /// IconData for the 'strokeRoundedTickDouble04' icon.
  static const IconData strokeRoundedTickDouble04 = HugeIconData(0x490e);

  /// IconData for the 'strokeRoundedTicket01' icon.
  static const IconData strokeRoundedTicket01 = HugeIconData(0x490f);

  /// IconData for the 'strokeRoundedTicket02' icon.
  static const IconData strokeRoundedTicket02 = HugeIconData(0x4910);

  /// IconData for the 'strokeRoundedTicket03' icon.
  static const IconData strokeRoundedTicket03 = HugeIconData(0x4911);

  /// IconData for the 'strokeRoundedTicketStar' icon.
  static const IconData strokeRoundedTicketStar = HugeIconData(0x4912);

  /// IconData for the 'strokeRoundedTie' icon.
  static const IconData strokeRoundedTie = HugeIconData(0x4913);

  /// IconData for the 'strokeRoundedTiktok' icon.
  static const IconData strokeRoundedTiktok = HugeIconData(0x4914);

  /// IconData for the 'strokeRoundedTime01' icon.
  static const IconData strokeRoundedTime01 = HugeIconData(0x4915);

  /// IconData for the 'strokeRoundedTime02' icon.
  static const IconData strokeRoundedTime02 = HugeIconData(0x4916);

  /// IconData for the 'strokeRoundedTime03' icon.
  static const IconData strokeRoundedTime03 = HugeIconData(0x4917);

  /// IconData for the 'strokeRoundedTime04' icon.
  static const IconData strokeRoundedTime04 = HugeIconData(0x4918);

  /// IconData for the 'strokeRoundedTimeHalfPass' icon.
  static const IconData strokeRoundedTimeHalfPass = HugeIconData(0x4919);

  /// IconData for the 'strokeRoundedTimeManagementCircle' icon.
  static const IconData strokeRoundedTimeManagementCircle =
      HugeIconData(0x491a);

  /// IconData for the 'strokeRoundedTimeManagement' icon.
  static const IconData strokeRoundedTimeManagement = HugeIconData(0x491b);

  /// IconData for the 'strokeRoundedTimeQuarterPass' icon.
  static const IconData strokeRoundedTimeQuarterPass = HugeIconData(0x491c);

  /// IconData for the 'strokeRoundedTimeQuarter' icon.
  static const IconData strokeRoundedTimeQuarter = HugeIconData(0x491d);

  /// IconData for the 'strokeRoundedTimeSchedule' icon.
  static const IconData strokeRoundedTimeSchedule = HugeIconData(0x491e);

  /// IconData for the 'strokeRoundedTimeSetting01' icon.
  static const IconData strokeRoundedTimeSetting01 = HugeIconData(0x491f);

  /// IconData for the 'strokeRoundedTimeSetting02' icon.
  static const IconData strokeRoundedTimeSetting02 = HugeIconData(0x4920);

  /// IconData for the 'strokeRoundedTimeSetting03' icon.
  static const IconData strokeRoundedTimeSetting03 = HugeIconData(0x4921);

  /// IconData for the 'strokeRoundedTimer01' icon.
  static const IconData strokeRoundedTimer01 = HugeIconData(0x4922);

  /// IconData for the 'strokeRoundedTimer02' icon.
  static const IconData strokeRoundedTimer02 = HugeIconData(0x4923);

  /// IconData for the 'strokeRoundedTips' icon.
  static const IconData strokeRoundedTips = HugeIconData(0x4924);

  /// IconData for the 'strokeRoundedTired01' icon.
  static const IconData strokeRoundedTired01 = HugeIconData(0x4925);

  /// IconData for the 'strokeRoundedTired02' icon.
  static const IconData strokeRoundedTired02 = HugeIconData(0x4926);

  /// IconData for the 'strokeRoundedTissuePaper' icon.
  static const IconData strokeRoundedTissuePaper = HugeIconData(0x4927);

  /// IconData for the 'strokeRoundedToggleOff' icon.
  static const IconData strokeRoundedToggleOff = HugeIconData(0x4928);

  /// IconData for the 'strokeRoundedToggleOn' icon.
  static const IconData strokeRoundedToggleOn = HugeIconData(0x4929);

  /// IconData for the 'strokeRoundedToilet01' icon.
  static const IconData strokeRoundedToilet01 = HugeIconData(0x492a);

  /// IconData for the 'strokeRoundedToilet02' icon.
  static const IconData strokeRoundedToilet02 = HugeIconData(0x492b);

  /// IconData for the 'strokeRoundedTongue01' icon.
  static const IconData strokeRoundedTongue01 = HugeIconData(0x492c);

  /// IconData for the 'strokeRoundedTongueWinkLeft' icon.
  static const IconData strokeRoundedTongueWinkLeft = HugeIconData(0x492d);

  /// IconData for the 'strokeRoundedTongueWinkRight' icon.
  static const IconData strokeRoundedTongueWinkRight = HugeIconData(0x492e);

  /// IconData for the 'strokeRoundedTongue' icon.
  static const IconData strokeRoundedTongue = HugeIconData(0x492f);

  /// IconData for the 'strokeRoundedTools' icon.
  static const IconData strokeRoundedTools = HugeIconData(0x4930);

  /// IconData for the 'strokeRoundedTornado01' icon.
  static const IconData strokeRoundedTornado01 = HugeIconData(0x4931);

  /// IconData for the 'strokeRoundedTornado02' icon.
  static const IconData strokeRoundedTornado02 = HugeIconData(0x4932);

  /// IconData for the 'strokeRoundedTorriGate' icon.
  static const IconData strokeRoundedTorriGate = HugeIconData(0x4933);

  /// IconData for the 'strokeRoundedTouch01' icon.
  static const IconData strokeRoundedTouch01 = HugeIconData(0x4934);

  /// IconData for the 'strokeRoundedTouch02' icon.
  static const IconData strokeRoundedTouch02 = HugeIconData(0x4935);

  /// IconData for the 'strokeRoundedTouch03' icon.
  static const IconData strokeRoundedTouch03 = HugeIconData(0x4936);

  /// IconData for the 'strokeRoundedTouch04' icon.
  static const IconData strokeRoundedTouch04 = HugeIconData(0x4937);

  /// IconData for the 'strokeRoundedTouch05' icon.
  static const IconData strokeRoundedTouch05 = HugeIconData(0x4938);

  /// IconData for the 'strokeRoundedTouch06' icon.
  static const IconData strokeRoundedTouch06 = HugeIconData(0x4939);

  /// IconData for the 'strokeRoundedTouch07' icon.
  static const IconData strokeRoundedTouch07 = HugeIconData(0x493a);

  /// IconData for the 'strokeRoundedTouch08' icon.
  static const IconData strokeRoundedTouch08 = HugeIconData(0x493b);

  /// IconData for the 'strokeRoundedTouch09' icon.
  static const IconData strokeRoundedTouch09 = HugeIconData(0x493c);

  /// IconData for the 'strokeRoundedTouch10' icon.
  static const IconData strokeRoundedTouch10 = HugeIconData(0x493d);

  /// IconData for the 'strokeRoundedTouchInteraction01' icon.
  static const IconData strokeRoundedTouchInteraction01 = HugeIconData(0x493e);

  /// IconData for the 'strokeRoundedTouchInteraction02' icon.
  static const IconData strokeRoundedTouchInteraction02 = HugeIconData(0x493f);

  /// IconData for the 'strokeRoundedTouchInteraction03' icon.
  static const IconData strokeRoundedTouchInteraction03 = HugeIconData(0x4940);

  /// IconData for the 'strokeRoundedTouchInteraction04' icon.
  static const IconData strokeRoundedTouchInteraction04 = HugeIconData(0x4941);

  /// IconData for the 'strokeRoundedTouchLocked01' icon.
  static const IconData strokeRoundedTouchLocked01 = HugeIconData(0x4942);

  /// IconData for the 'strokeRoundedTouchLocked02' icon.
  static const IconData strokeRoundedTouchLocked02 = HugeIconData(0x4943);

  /// IconData for the 'strokeRoundedTouchLocked03' icon.
  static const IconData strokeRoundedTouchLocked03 = HugeIconData(0x4944);

  /// IconData for the 'strokeRoundedTouchLocked04' icon.
  static const IconData strokeRoundedTouchLocked04 = HugeIconData(0x4945);

  /// IconData for the 'strokeRoundedTouchpad01' icon.
  static const IconData strokeRoundedTouchpad01 = HugeIconData(0x4946);

  /// IconData for the 'strokeRoundedTouchpad02' icon.
  static const IconData strokeRoundedTouchpad02 = HugeIconData(0x4947);

  /// IconData for the 'strokeRoundedTouchpad03' icon.
  static const IconData strokeRoundedTouchpad03 = HugeIconData(0x4948);

  /// IconData for the 'strokeRoundedTouchpad04' icon.
  static const IconData strokeRoundedTouchpad04 = HugeIconData(0x4949);

  /// IconData for the 'strokeRoundedTowTruck' icon.
  static const IconData strokeRoundedTowTruck = HugeIconData(0x494a);

  /// IconData for the 'strokeRoundedTowels' icon.
  static const IconData strokeRoundedTowels = HugeIconData(0x494b);

  /// IconData for the 'strokeRoundedToyTrain' icon.
  static const IconData strokeRoundedToyTrain = HugeIconData(0x494c);

  /// IconData for the 'strokeRoundedTractor' icon.
  static const IconData strokeRoundedTractor = HugeIconData(0x494d);

  /// IconData for the 'strokeRoundedTradeDown' icon.
  static const IconData strokeRoundedTradeDown = HugeIconData(0x494e);

  /// IconData for the 'strokeRoundedTradeMark' icon.
  static const IconData strokeRoundedTradeMark = HugeIconData(0x494f);

  /// IconData for the 'strokeRoundedTradeUp' icon.
  static const IconData strokeRoundedTradeUp = HugeIconData(0x4950);

  /// IconData for the 'strokeRoundedTrademark' icon.
  static const IconData strokeRoundedTrademark = HugeIconData(0x4951);

  /// IconData for the 'strokeRoundedTrafficIncident' icon.
  static const IconData strokeRoundedTrafficIncident = HugeIconData(0x4952);

  /// IconData for the 'strokeRoundedTrafficLight' icon.
  static const IconData strokeRoundedTrafficLight = HugeIconData(0x4953);

  /// IconData for the 'strokeRoundedTrain01' icon.
  static const IconData strokeRoundedTrain01 = HugeIconData(0x4954);

  /// IconData for the 'strokeRoundedTrain02' icon.
  static const IconData strokeRoundedTrain02 = HugeIconData(0x4955);

  /// IconData for the 'strokeRoundedTram' icon.
  static const IconData strokeRoundedTram = HugeIconData(0x4956);

  /// IconData for the 'strokeRoundedTrampoline' icon.
  static const IconData strokeRoundedTrampoline = HugeIconData(0x4957);

  /// IconData for the 'strokeRoundedTransaction' icon.
  static const IconData strokeRoundedTransaction = HugeIconData(0x4958);

  /// IconData for the 'strokeRoundedTransitionBottom' icon.
  static const IconData strokeRoundedTransitionBottom = HugeIconData(0x4959);

  /// IconData for the 'strokeRoundedTransitionLeft' icon.
  static const IconData strokeRoundedTransitionLeft = HugeIconData(0x495a);

  /// IconData for the 'strokeRoundedTransitionRight' icon.
  static const IconData strokeRoundedTransitionRight = HugeIconData(0x495b);

  /// IconData for the 'strokeRoundedTransitionTop' icon.
  static const IconData strokeRoundedTransitionTop = HugeIconData(0x495c);

  /// IconData for the 'strokeRoundedTranslate' icon.
  static const IconData strokeRoundedTranslate = HugeIconData(0x495d);

  /// IconData for the 'strokeRoundedTranslation' icon.
  static const IconData strokeRoundedTranslation = HugeIconData(0x495e);

  /// IconData for the 'strokeRoundedTransmission' icon.
  static const IconData strokeRoundedTransmission = HugeIconData(0x495f);

  /// IconData for the 'strokeRoundedTransparency' icon.
  static const IconData strokeRoundedTransparency = HugeIconData(0x4960);

  /// IconData for the 'strokeRoundedTrapezoidLineHorizontal' icon.
  static const IconData strokeRoundedTrapezoidLineHorizontal =
      HugeIconData(0x4961);

  /// IconData for the 'strokeRoundedTrapezoidLineVertical' icon.
  static const IconData strokeRoundedTrapezoidLineVertical =
      HugeIconData(0x4962);

  /// IconData for the 'strokeRoundedTravelBag' icon.
  static const IconData strokeRoundedTravelBag = HugeIconData(0x4963);

  /// IconData for the 'strokeRoundedTreadmill01' icon.
  static const IconData strokeRoundedTreadmill01 = HugeIconData(0x4964);

  /// IconData for the 'strokeRoundedTreadmill02' icon.
  static const IconData strokeRoundedTreadmill02 = HugeIconData(0x4965);

  /// IconData for the 'strokeRoundedTreatment' icon.
  static const IconData strokeRoundedTreatment = HugeIconData(0x4966);

  /// IconData for the 'strokeRoundedTree01' icon.
  static const IconData strokeRoundedTree01 = HugeIconData(0x4967);

  /// IconData for the 'strokeRoundedTree02' icon.
  static const IconData strokeRoundedTree02 = HugeIconData(0x4968);

  /// IconData for the 'strokeRoundedTree03' icon.
  static const IconData strokeRoundedTree03 = HugeIconData(0x4969);

  /// IconData for the 'strokeRoundedTree04' icon.
  static const IconData strokeRoundedTree04 = HugeIconData(0x496a);

  /// IconData for the 'strokeRoundedTree05' icon.
  static const IconData strokeRoundedTree05 = HugeIconData(0x496b);

  /// IconData for the 'strokeRoundedTree06' icon.
  static const IconData strokeRoundedTree06 = HugeIconData(0x496c);

  /// IconData for the 'strokeRoundedTree07' icon.
  static const IconData strokeRoundedTree07 = HugeIconData(0x496d);

  /// IconData for the 'strokeRoundedTrello' icon.
  static const IconData strokeRoundedTrello = HugeIconData(0x496e);

  /// IconData for the 'strokeRoundedTriangle01' icon.
  static const IconData strokeRoundedTriangle01 = HugeIconData(0x496f);

  /// IconData for the 'strokeRoundedTriangle02' icon.
  static const IconData strokeRoundedTriangle02 = HugeIconData(0x4970);

  /// IconData for the 'strokeRoundedTriangle03' icon.
  static const IconData strokeRoundedTriangle03 = HugeIconData(0x4971);

  /// IconData for the 'strokeRoundedTriangle' icon.
  static const IconData strokeRoundedTriangle = HugeIconData(0x4972);

  /// IconData for the 'strokeRoundedTrolley01' icon.
  static const IconData strokeRoundedTrolley01 = HugeIconData(0x4973);

  /// IconData for the 'strokeRoundedTrolley02' icon.
  static const IconData strokeRoundedTrolley02 = HugeIconData(0x4974);

  /// IconData for the 'strokeRoundedTropicalStormTracks01' icon.
  static const IconData strokeRoundedTropicalStormTracks01 =
      HugeIconData(0x4975);

  /// IconData for the 'strokeRoundedTropicalStormTracks02' icon.
  static const IconData strokeRoundedTropicalStormTracks02 =
      HugeIconData(0x4976);

  /// IconData for the 'strokeRoundedTropicalStorm' icon.
  static const IconData strokeRoundedTropicalStorm = HugeIconData(0x4977);

  /// IconData for the 'strokeRoundedTruckDelivery' icon.
  static const IconData strokeRoundedTruckDelivery = HugeIconData(0x4978);

  /// IconData for the 'strokeRoundedTruckMonster' icon.
  static const IconData strokeRoundedTruckMonster = HugeIconData(0x4979);

  /// IconData for the 'strokeRoundedTruckReturn' icon.
  static const IconData strokeRoundedTruckReturn = HugeIconData(0x497a);

  /// IconData for the 'strokeRoundedTruck' icon.
  static const IconData strokeRoundedTruck = HugeIconData(0x497b);

  /// IconData for the 'strokeRoundedTrulli' icon.
  static const IconData strokeRoundedTrulli = HugeIconData(0x497c);

  /// IconData for the 'strokeRoundedTsunami' icon.
  static const IconData strokeRoundedTsunami = HugeIconData(0x497d);

  /// IconData for the 'strokeRoundedTulip' icon.
  static const IconData strokeRoundedTulip = HugeIconData(0x497e);

  /// IconData for the 'strokeRoundedTumblr' icon.
  static const IconData strokeRoundedTumblr = HugeIconData(0x497f);

  /// IconData for the 'strokeRoundedTurtleNeck' icon.
  static const IconData strokeRoundedTurtleNeck = HugeIconData(0x4980);

  /// IconData for the 'strokeRoundedTv01' icon.
  static const IconData strokeRoundedTv01 = HugeIconData(0x4981);

  /// IconData for the 'strokeRoundedTv02' icon.
  static const IconData strokeRoundedTv02 = HugeIconData(0x4982);

  /// IconData for the 'strokeRoundedTvFix' icon.
  static const IconData strokeRoundedTvFix = HugeIconData(0x4983);

  /// IconData for the 'strokeRoundedTvIssue' icon.
  static const IconData strokeRoundedTvIssue = HugeIconData(0x4984);

  /// IconData for the 'strokeRoundedTvSmart' icon.
  static const IconData strokeRoundedTvSmart = HugeIconData(0x4985);

  /// IconData for the 'strokeRoundedTwinTower' icon.
  static const IconData strokeRoundedTwinTower = HugeIconData(0x4986);

  /// IconData for the 'strokeRoundedTwitch' icon.
  static const IconData strokeRoundedTwitch = HugeIconData(0x4987);

  /// IconData for the 'strokeRoundedTwitterSquare' icon.
  static const IconData strokeRoundedTwitterSquare = HugeIconData(0x4988);

  /// IconData for the 'strokeRoundedTwitter' icon.
  static const IconData strokeRoundedTwitter = HugeIconData(0x4989);

  /// IconData for the 'strokeRoundedTwoFactorAccess' icon.
  static const IconData strokeRoundedTwoFactorAccess = HugeIconData(0x498a);

  /// IconData for the 'strokeRoundedTwoFinger01' icon.
  static const IconData strokeRoundedTwoFinger01 = HugeIconData(0x498b);

  /// IconData for the 'strokeRoundedTwoFinger02' icon.
  static const IconData strokeRoundedTwoFinger02 = HugeIconData(0x498c);

  /// IconData for the 'strokeRoundedTwoFinger03' icon.
  static const IconData strokeRoundedTwoFinger03 = HugeIconData(0x498d);

  /// IconData for the 'strokeRoundedTwoFinger04' icon.
  static const IconData strokeRoundedTwoFinger04 = HugeIconData(0x498e);

  /// IconData for the 'strokeRoundedTwoFinger05' icon.
  static const IconData strokeRoundedTwoFinger05 = HugeIconData(0x498f);

  /// IconData for the 'strokeRoundedTxt01' icon.
  static const IconData strokeRoundedTxt01 = HugeIconData(0x4990);

  /// IconData for the 'strokeRoundedTxt02' icon.
  static const IconData strokeRoundedTxt02 = HugeIconData(0x4991);

  /// IconData for the 'strokeRoundedTypeCursor' icon.
  static const IconData strokeRoundedTypeCursor = HugeIconData(0x4992);

  /// IconData for the 'strokeRoundedTypescript01' icon.
  static const IconData strokeRoundedTypescript01 = HugeIconData(0x4993);

  /// IconData for the 'strokeRoundedTypescript02' icon.
  static const IconData strokeRoundedTypescript02 = HugeIconData(0x4994);

  /// IconData for the 'strokeRoundedTypescript03' icon.
  static const IconData strokeRoundedTypescript03 = HugeIconData(0x4995);

  /// IconData for the 'strokeRoundedUber' icon.
  static const IconData strokeRoundedUber = HugeIconData(0x4996);

  /// IconData for the 'strokeRoundedUfo01' icon.
  static const IconData strokeRoundedUfo01 = HugeIconData(0x4997);

  /// IconData for the 'strokeRoundedUfo' icon.
  static const IconData strokeRoundedUfo = HugeIconData(0x4998);

  /// IconData for the 'strokeRoundedUmbrellaDollar' icon.
  static const IconData strokeRoundedUmbrellaDollar = HugeIconData(0x4999);

  /// IconData for the 'strokeRoundedUmbrella' icon.
  static const IconData strokeRoundedUmbrella = HugeIconData(0x499a);

  /// IconData for the 'strokeRoundedUnamused' icon.
  static const IconData strokeRoundedUnamused = HugeIconData(0x499b);

  /// IconData for the 'strokeRoundedUnavailable' icon.
  static const IconData strokeRoundedUnavailable = HugeIconData(0x499c);

  /// IconData for the 'strokeRoundedUnderpants01' icon.
  static const IconData strokeRoundedUnderpants01 = HugeIconData(0x499d);

  /// IconData for the 'strokeRoundedUnderpants02' icon.
  static const IconData strokeRoundedUnderpants02 = HugeIconData(0x499e);

  /// IconData for the 'strokeRoundedUnderpants03' icon.
  static const IconData strokeRoundedUnderpants03 = HugeIconData(0x499f);

  /// IconData for the 'strokeRoundedUnfoldLess' icon.
  static const IconData strokeRoundedUnfoldLess = HugeIconData(0x49a0);

  /// IconData for the 'strokeRoundedUnfoldMore' icon.
  static const IconData strokeRoundedUnfoldMore = HugeIconData(0x49a1);

  /// IconData for the 'strokeRoundedUngroupItems' icon.
  static const IconData strokeRoundedUngroupItems = HugeIconData(0x49a2);

  /// IconData for the 'strokeRoundedUngroupLayers' icon.
  static const IconData strokeRoundedUngroupLayers = HugeIconData(0x49a3);

  /// IconData for the 'strokeRoundedUnhappy' icon.
  static const IconData strokeRoundedUnhappy = HugeIconData(0x49a4);

  /// IconData for the 'strokeRoundedUniversity' icon.
  static const IconData strokeRoundedUniversity = HugeIconData(0x49a5);

  /// IconData for the 'strokeRoundedUnlink01' icon.
  static const IconData strokeRoundedUnlink01 = HugeIconData(0x49a6);

  /// IconData for the 'strokeRoundedUnlink02' icon.
  static const IconData strokeRoundedUnlink02 = HugeIconData(0x49a7);

  /// IconData for the 'strokeRoundedUnlink03' icon.
  static const IconData strokeRoundedUnlink03 = HugeIconData(0x49a8);

  /// IconData for the 'strokeRoundedUnlink04' icon.
  static const IconData strokeRoundedUnlink04 = HugeIconData(0x49a9);

  /// IconData for the 'strokeRoundedUnlink05' icon.
  static const IconData strokeRoundedUnlink05 = HugeIconData(0x49aa);

  /// IconData for the 'strokeRoundedUnlink06' icon.
  static const IconData strokeRoundedUnlink06 = HugeIconData(0x49ab);

  /// IconData for the 'strokeRoundedUnsplash' icon.
  static const IconData strokeRoundedUnsplash = HugeIconData(0x49ac);

  /// IconData for the 'strokeRoundedUpload01' icon.
  static const IconData strokeRoundedUpload01 = HugeIconData(0x49ad);

  /// IconData for the 'strokeRoundedUpload02' icon.
  static const IconData strokeRoundedUpload02 = HugeIconData(0x49ae);

  /// IconData for the 'strokeRoundedUpload03' icon.
  static const IconData strokeRoundedUpload03 = HugeIconData(0x49af);

  /// IconData for the 'strokeRoundedUpload04' icon.
  static const IconData strokeRoundedUpload04 = HugeIconData(0x49b0);

  /// IconData for the 'strokeRoundedUpload05' icon.
  static const IconData strokeRoundedUpload05 = HugeIconData(0x49b1);

  /// IconData for the 'strokeRoundedUploadCircle01' icon.
  static const IconData strokeRoundedUploadCircle01 = HugeIconData(0x49b2);

  /// IconData for the 'strokeRoundedUploadCircle02' icon.
  static const IconData strokeRoundedUploadCircle02 = HugeIconData(0x49b3);

  /// IconData for the 'strokeRoundedUploadSquare01' icon.
  static const IconData strokeRoundedUploadSquare01 = HugeIconData(0x49b4);

  /// IconData for the 'strokeRoundedUploadSquare02' icon.
  static const IconData strokeRoundedUploadSquare02 = HugeIconData(0x49b5);

  /// IconData for the 'strokeRoundedUpwork' icon.
  static const IconData strokeRoundedUpwork = HugeIconData(0x49b6);

  /// IconData for the 'strokeRoundedUsbBugs' icon.
  static const IconData strokeRoundedUsbBugs = HugeIconData(0x49b7);

  /// IconData for the 'strokeRoundedUsbConnected01' icon.
  static const IconData strokeRoundedUsbConnected01 = HugeIconData(0x49b8);

  /// IconData for the 'strokeRoundedUsbConnected02' icon.
  static const IconData strokeRoundedUsbConnected02 = HugeIconData(0x49b9);

  /// IconData for the 'strokeRoundedUsbConnected03' icon.
  static const IconData strokeRoundedUsbConnected03 = HugeIconData(0x49ba);

  /// IconData for the 'strokeRoundedUsbError' icon.
  static const IconData strokeRoundedUsbError = HugeIconData(0x49bb);

  /// IconData for the 'strokeRoundedUsbMemory01' icon.
  static const IconData strokeRoundedUsbMemory01 = HugeIconData(0x49bc);

  /// IconData for the 'strokeRoundedUsbMemory02' icon.
  static const IconData strokeRoundedUsbMemory02 = HugeIconData(0x49bd);

  /// IconData for the 'strokeRoundedUsbNotConnected01' icon.
  static const IconData strokeRoundedUsbNotConnected01 = HugeIconData(0x49be);

  /// IconData for the 'strokeRoundedUsbNotConnected02' icon.
  static const IconData strokeRoundedUsbNotConnected02 = HugeIconData(0x49bf);

  /// IconData for the 'strokeRoundedUsb' icon.
  static const IconData strokeRoundedUsb = HugeIconData(0x49c0);

  /// IconData for the 'strokeRoundedUserAccount' icon.
  static const IconData strokeRoundedUserAccount = HugeIconData(0x49c1);

  /// IconData for the 'strokeRoundedUserAdd01' icon.
  static const IconData strokeRoundedUserAdd01 = HugeIconData(0x49c2);

  /// IconData for the 'strokeRoundedUserAdd02' icon.
  static const IconData strokeRoundedUserAdd02 = HugeIconData(0x49c3);

  /// IconData for the 'strokeRoundedUserArrowLeftRight' icon.
  static const IconData strokeRoundedUserArrowLeftRight = HugeIconData(0x49c4);

  /// IconData for the 'strokeRoundedUserBlock01' icon.
  static const IconData strokeRoundedUserBlock01 = HugeIconData(0x49c5);

  /// IconData for the 'strokeRoundedUserBlock02' icon.
  static const IconData strokeRoundedUserBlock02 = HugeIconData(0x49c6);

  /// IconData for the 'strokeRoundedUserCheck01' icon.
  static const IconData strokeRoundedUserCheck01 = HugeIconData(0x49c7);

  /// IconData for the 'strokeRoundedUserCheck02' icon.
  static const IconData strokeRoundedUserCheck02 = HugeIconData(0x49c8);

  /// IconData for the 'strokeRoundedUserCircle02' icon.
  static const IconData strokeRoundedUserCircle02 = HugeIconData(0x49c9);

  /// IconData for the 'strokeRoundedUserCircle' icon.
  static const IconData strokeRoundedUserCircle = HugeIconData(0x49ca);

  /// IconData for the 'strokeRoundedUserEdit01' icon.
  static const IconData strokeRoundedUserEdit01 = HugeIconData(0x49cb);

  /// IconData for the 'strokeRoundedUserFullView' icon.
  static const IconData strokeRoundedUserFullView = HugeIconData(0x49cc);

  /// IconData for the 'strokeRoundedUserGroup' icon.
  static const IconData strokeRoundedUserGroup = HugeIconData(0x49cd);

  /// IconData for the 'strokeRoundedUserIdVerification' icon.
  static const IconData strokeRoundedUserIdVerification = HugeIconData(0x49ce);

  /// IconData for the 'strokeRoundedUserList' icon.
  static const IconData strokeRoundedUserList = HugeIconData(0x49cf);

  /// IconData for the 'strokeRoundedUserLock01' icon.
  static const IconData strokeRoundedUserLock01 = HugeIconData(0x49d0);

  /// IconData for the 'strokeRoundedUserLock02' icon.
  static const IconData strokeRoundedUserLock02 = HugeIconData(0x49d1);

  /// IconData for the 'strokeRoundedUserLove01' icon.
  static const IconData strokeRoundedUserLove01 = HugeIconData(0x49d2);

  /// IconData for the 'strokeRoundedUserLove02' icon.
  static const IconData strokeRoundedUserLove02 = HugeIconData(0x49d3);

  /// IconData for the 'strokeRoundedUserMinus01' icon.
  static const IconData strokeRoundedUserMinus01 = HugeIconData(0x49d4);

  /// IconData for the 'strokeRoundedUserMinus02' icon.
  static const IconData strokeRoundedUserMinus02 = HugeIconData(0x49d5);

  /// IconData for the 'strokeRoundedUserMultiple02' icon.
  static const IconData strokeRoundedUserMultiple02 = HugeIconData(0x49d6);

  /// IconData for the 'strokeRoundedUserMultiple' icon.
  static const IconData strokeRoundedUserMultiple = HugeIconData(0x49d7);

  /// IconData for the 'strokeRoundedUserQuestion01' icon.
  static const IconData strokeRoundedUserQuestion01 = HugeIconData(0x49d8);

  /// IconData for the 'strokeRoundedUserQuestion02' icon.
  static const IconData strokeRoundedUserQuestion02 = HugeIconData(0x49d9);

  /// IconData for the 'strokeRoundedUserRemove01' icon.
  static const IconData strokeRoundedUserRemove01 = HugeIconData(0x49da);

  /// IconData for the 'strokeRoundedUserRemove02' icon.
  static const IconData strokeRoundedUserRemove02 = HugeIconData(0x49db);

  /// IconData for the 'strokeRoundedUserRoadside' icon.
  static const IconData strokeRoundedUserRoadside = HugeIconData(0x49dc);

  /// IconData for the 'strokeRoundedUserSearch01' icon.
  static const IconData strokeRoundedUserSearch01 = HugeIconData(0x49dd);

  /// IconData for the 'strokeRoundedUserSearch02' icon.
  static const IconData strokeRoundedUserSearch02 = HugeIconData(0x49de);

  /// IconData for the 'strokeRoundedUserSettings01' icon.
  static const IconData strokeRoundedUserSettings01 = HugeIconData(0x49df);

  /// IconData for the 'strokeRoundedUserSettings02' icon.
  static const IconData strokeRoundedUserSettings02 = HugeIconData(0x49e0);

  /// IconData for the 'strokeRoundedUserSharing' icon.
  static const IconData strokeRoundedUserSharing = HugeIconData(0x49e1);

  /// IconData for the 'strokeRoundedUserShield01' icon.
  static const IconData strokeRoundedUserShield01 = HugeIconData(0x49e2);

  /// IconData for the 'strokeRoundedUserShield02' icon.
  static const IconData strokeRoundedUserShield02 = HugeIconData(0x49e3);

  /// IconData for the 'strokeRoundedUserSquare' icon.
  static const IconData strokeRoundedUserSquare = HugeIconData(0x49e4);

  /// IconData for the 'strokeRoundedUserStar01' icon.
  static const IconData strokeRoundedUserStar01 = HugeIconData(0x49e5);

  /// IconData for the 'strokeRoundedUserStar02' icon.
  static const IconData strokeRoundedUserStar02 = HugeIconData(0x49e6);

  /// IconData for the 'strokeRoundedUserStatus' icon.
  static const IconData strokeRoundedUserStatus = HugeIconData(0x49e7);

  /// IconData for the 'strokeRoundedUserStory' icon.
  static const IconData strokeRoundedUserStory = HugeIconData(0x49e8);

  /// IconData for the 'strokeRoundedUserSwitch' icon.
  static const IconData strokeRoundedUserSwitch = HugeIconData(0x49e9);

  /// IconData for the 'strokeRoundedUserUnlock01' icon.
  static const IconData strokeRoundedUserUnlock01 = HugeIconData(0x49ea);

  /// IconData for the 'strokeRoundedUserUnlock02' icon.
  static const IconData strokeRoundedUserUnlock02 = HugeIconData(0x49eb);

  /// IconData for the 'strokeRoundedUser' icon.
  static const IconData strokeRoundedUser = HugeIconData(0x49ec);

  /// IconData for the 'strokeRoundedUv01' icon.
  static const IconData strokeRoundedUv01 = HugeIconData(0x49ed);

  /// IconData for the 'strokeRoundedUv02' icon.
  static const IconData strokeRoundedUv02 = HugeIconData(0x49ee);

  /// IconData for the 'strokeRoundedUv03' icon.
  static const IconData strokeRoundedUv03 = HugeIconData(0x49ef);

  /// IconData for the 'strokeRoundedVaccine' icon.
  static const IconData strokeRoundedVaccine = HugeIconData(0x49f0);

  /// IconData for the 'strokeRoundedValidationApproval' icon.
  static const IconData strokeRoundedValidationApproval = HugeIconData(0x49f1);

  /// IconData for the 'strokeRoundedValidation' icon.
  static const IconData strokeRoundedValidation = HugeIconData(0x49f2);

  /// IconData for the 'strokeRoundedVan' icon.
  static const IconData strokeRoundedVan = HugeIconData(0x49f3);

  /// IconData for the 'strokeRoundedVariable' icon.
  static const IconData strokeRoundedVariable = HugeIconData(0x49f4);

  /// IconData for the 'strokeRoundedVegetarianFood' icon.
  static const IconData strokeRoundedVegetarianFood = HugeIconData(0x49f5);

  /// IconData for the 'strokeRoundedVerticalResize' icon.
  static const IconData strokeRoundedVerticalResize = HugeIconData(0x49f6);

  /// IconData for the 'strokeRoundedVerticalScrollPoint' icon.
  static const IconData strokeRoundedVerticalScrollPoint = HugeIconData(0x49f7);

  /// IconData for the 'strokeRoundedVest' icon.
  static const IconData strokeRoundedVest = HugeIconData(0x49f8);

  /// IconData for the 'strokeRoundedVictoryFinger01' icon.
  static const IconData strokeRoundedVictoryFinger01 = HugeIconData(0x49f9);

  /// IconData for the 'strokeRoundedVictoryFinger02' icon.
  static const IconData strokeRoundedVictoryFinger02 = HugeIconData(0x49fa);

  /// IconData for the 'strokeRoundedVictoryFinger03' icon.
  static const IconData strokeRoundedVictoryFinger03 = HugeIconData(0x49fb);

  /// IconData for the 'strokeRoundedVideo01' icon.
  static const IconData strokeRoundedVideo01 = HugeIconData(0x49fc);

  /// IconData for the 'strokeRoundedVideo02' icon.
  static const IconData strokeRoundedVideo02 = HugeIconData(0x49fd);

  /// IconData for the 'strokeRoundedVideoConsole' icon.
  static const IconData strokeRoundedVideoConsole = HugeIconData(0x49fe);

  /// IconData for the 'strokeRoundedVideoOff' icon.
  static const IconData strokeRoundedVideoOff = HugeIconData(0x49ff);

  /// IconData for the 'strokeRoundedVideoReplay' icon.
  static const IconData strokeRoundedVideoReplay = HugeIconData(0x4a00);

  /// IconData for the 'strokeRoundedViewOffSlash' icon.
  static const IconData strokeRoundedViewOffSlash = HugeIconData(0x4a01);

  /// IconData for the 'strokeRoundedViewOff' icon.
  static const IconData strokeRoundedViewOff = HugeIconData(0x4a02);

  /// IconData for the 'strokeRoundedView' icon.
  static const IconData strokeRoundedView = HugeIconData(0x4a03);

  /// IconData for the 'strokeRoundedVimeo' icon.
  static const IconData strokeRoundedVimeo = HugeIconData(0x4a04);

  /// IconData for the 'strokeRoundedVineSquare' icon.
  static const IconData strokeRoundedVineSquare = HugeIconData(0x4a05);

  /// IconData for the 'strokeRoundedVine' icon.
  static const IconData strokeRoundedVine = HugeIconData(0x4a06);

  /// IconData for the 'strokeRoundedVintageClock' icon.
  static const IconData strokeRoundedVintageClock = HugeIconData(0x4a07);

  /// IconData for the 'strokeRoundedVirtualRealityVr01' icon.
  static const IconData strokeRoundedVirtualRealityVr01 = HugeIconData(0x4a08);

  /// IconData for the 'strokeRoundedVirtualRealityVr02' icon.
  static const IconData strokeRoundedVirtualRealityVr02 = HugeIconData(0x4a09);

  /// IconData for the 'strokeRoundedVision' icon.
  static const IconData strokeRoundedVision = HugeIconData(0x4a0a);

  /// IconData for the 'strokeRoundedVkSquare' icon.
  static const IconData strokeRoundedVkSquare = HugeIconData(0x4a0b);

  /// IconData for the 'strokeRoundedVk' icon.
  static const IconData strokeRoundedVk = HugeIconData(0x4a0c);

  /// IconData for the 'strokeRoundedVoiceId' icon.
  static const IconData strokeRoundedVoiceId = HugeIconData(0x4a0d);

  /// IconData for the 'strokeRoundedVoice' icon.
  static const IconData strokeRoundedVoice = HugeIconData(0x4a0e);

  /// IconData for the 'strokeRoundedVolleyball' icon.
  static const IconData strokeRoundedVolleyball = HugeIconData(0x4a0f);

  /// IconData for the 'strokeRoundedVolumeHigh' icon.
  static const IconData strokeRoundedVolumeHigh = HugeIconData(0x4a10);

  /// IconData for the 'strokeRoundedVolumeLow' icon.
  static const IconData strokeRoundedVolumeLow = HugeIconData(0x4a11);

  /// IconData for the 'strokeRoundedVolumeMinus' icon.
  static const IconData strokeRoundedVolumeMinus = HugeIconData(0x4a12);

  /// IconData for the 'strokeRoundedVolumeMute01' icon.
  static const IconData strokeRoundedVolumeMute01 = HugeIconData(0x4a13);

  /// IconData for the 'strokeRoundedVolumeMute02' icon.
  static const IconData strokeRoundedVolumeMute02 = HugeIconData(0x4a14);

  /// IconData for the 'strokeRoundedVolumeOff' icon.
  static const IconData strokeRoundedVolumeOff = HugeIconData(0x4a15);

  /// IconData for the 'strokeRoundedVolumeUp' icon.
  static const IconData strokeRoundedVolumeUp = HugeIconData(0x4a16);

  /// IconData for the 'strokeRoundedVomiting' icon.
  static const IconData strokeRoundedVomiting = HugeIconData(0x4a17);

  /// IconData for the 'strokeRoundedVoucher' icon.
  static const IconData strokeRoundedVoucher = HugeIconData(0x4a18);

  /// IconData for the 'strokeRoundedVrGlasses' icon.
  static const IconData strokeRoundedVrGlasses = HugeIconData(0x4a19);

  /// IconData for the 'strokeRoundedVr' icon.
  static const IconData strokeRoundedVr = HugeIconData(0x4a1a);

  /// IconData for the 'strokeRoundedVynil01' icon.
  static const IconData strokeRoundedVynil01 = HugeIconData(0x4a1b);

  /// IconData for the 'strokeRoundedVynil02' icon.
  static const IconData strokeRoundedVynil02 = HugeIconData(0x4a1c);

  /// IconData for the 'strokeRoundedVynil03' icon.
  static const IconData strokeRoundedVynil03 = HugeIconData(0x4a1d);

  /// IconData for the 'strokeRoundedWaiter' icon.
  static const IconData strokeRoundedWaiter = HugeIconData(0x4a1e);

  /// IconData for the 'strokeRoundedWaiters' icon.
  static const IconData strokeRoundedWaiters = HugeIconData(0x4a1f);

  /// IconData for the 'strokeRoundedWallLamp' icon.
  static const IconData strokeRoundedWallLamp = HugeIconData(0x4a20);

  /// IconData for the 'strokeRoundedWallet01' icon.
  static const IconData strokeRoundedWallet01 = HugeIconData(0x4a21);

  /// IconData for the 'strokeRoundedWallet02' icon.
  static const IconData strokeRoundedWallet02 = HugeIconData(0x4a22);

  /// IconData for the 'strokeRoundedWallet03' icon.
  static const IconData strokeRoundedWallet03 = HugeIconData(0x4a23);

  /// IconData for the 'strokeRoundedWalletAdd01' icon.
  static const IconData strokeRoundedWalletAdd01 = HugeIconData(0x4a24);

  /// IconData for the 'strokeRoundedWalletAdd02' icon.
  static const IconData strokeRoundedWalletAdd02 = HugeIconData(0x4a25);

  /// IconData for the 'strokeRoundedWalletDone01' icon.
  static const IconData strokeRoundedWalletDone01 = HugeIconData(0x4a26);

  /// IconData for the 'strokeRoundedWalletDone02' icon.
  static const IconData strokeRoundedWalletDone02 = HugeIconData(0x4a27);

  /// IconData for the 'strokeRoundedWalletNotFound01' icon.
  static const IconData strokeRoundedWalletNotFound01 = HugeIconData(0x4a28);

  /// IconData for the 'strokeRoundedWalletNotFound02' icon.
  static const IconData strokeRoundedWalletNotFound02 = HugeIconData(0x4a29);

  /// IconData for the 'strokeRoundedWalletRemove01' icon.
  static const IconData strokeRoundedWalletRemove01 = HugeIconData(0x4a2a);

  /// IconData for the 'strokeRoundedWalletRemove02' icon.
  static const IconData strokeRoundedWalletRemove02 = HugeIconData(0x4a2b);

  /// IconData for the 'strokeRoundedWanted' icon.
  static const IconData strokeRoundedWanted = HugeIconData(0x4a2c);

  /// IconData for the 'strokeRoundedWardrobe01' icon.
  static const IconData strokeRoundedWardrobe01 = HugeIconData(0x4a2d);

  /// IconData for the 'strokeRoundedWardrobe02' icon.
  static const IconData strokeRoundedWardrobe02 = HugeIconData(0x4a2e);

  /// IconData for the 'strokeRoundedWardrobe03' icon.
  static const IconData strokeRoundedWardrobe03 = HugeIconData(0x4a2f);

  /// IconData for the 'strokeRoundedWardrobe04' icon.
  static const IconData strokeRoundedWardrobe04 = HugeIconData(0x4a30);

  /// IconData for the 'strokeRoundedWarehouse' icon.
  static const IconData strokeRoundedWarehouse = HugeIconData(0x4a31);

  /// IconData for the 'strokeRoundedWashingtonMonument' icon.
  static const IconData strokeRoundedWashingtonMonument = HugeIconData(0x4a32);

  /// IconData for the 'strokeRoundedWasteRestore' icon.
  static const IconData strokeRoundedWasteRestore = HugeIconData(0x4a33);

  /// IconData for the 'strokeRoundedWaste' icon.
  static const IconData strokeRoundedWaste = HugeIconData(0x4a34);

  /// IconData for the 'strokeRoundedWatch01' icon.
  static const IconData strokeRoundedWatch01 = HugeIconData(0x4a35);

  /// IconData for the 'strokeRoundedWatch02' icon.
  static const IconData strokeRoundedWatch02 = HugeIconData(0x4a36);

  /// IconData for the 'strokeRoundedWaterEnergy' icon.
  static const IconData strokeRoundedWaterEnergy = HugeIconData(0x4a37);

  /// IconData for the 'strokeRoundedWaterPolo' icon.
  static const IconData strokeRoundedWaterPolo = HugeIconData(0x4a38);

  /// IconData for the 'strokeRoundedWaterPump' icon.
  static const IconData strokeRoundedWaterPump = HugeIconData(0x4a39);

  /// IconData for the 'strokeRoundedWaterfallDown01' icon.
  static const IconData strokeRoundedWaterfallDown01 = HugeIconData(0x4a3a);

  /// IconData for the 'strokeRoundedWaterfallDown03' icon.
  static const IconData strokeRoundedWaterfallDown03 = HugeIconData(0x4a3b);

  /// IconData for the 'strokeRoundedWaterfallUp01' icon.
  static const IconData strokeRoundedWaterfallUp01 = HugeIconData(0x4a3c);

  /// IconData for the 'strokeRoundedWaterfallUp02' icon.
  static const IconData strokeRoundedWaterfallUp02 = HugeIconData(0x4a3d);

  /// IconData for the 'strokeRoundedWatermelon' icon.
  static const IconData strokeRoundedWatermelon = HugeIconData(0x4a3e);

  /// IconData for the 'strokeRoundedWattpadSquare' icon.
  static const IconData strokeRoundedWattpadSquare = HugeIconData(0x4a3f);

  /// IconData for the 'strokeRoundedWattpad' icon.
  static const IconData strokeRoundedWattpad = HugeIconData(0x4a40);

  /// IconData for the 'strokeRoundedWavingHand01' icon.
  static const IconData strokeRoundedWavingHand01 = HugeIconData(0x4a41);

  /// IconData for the 'strokeRoundedWavingHand02' icon.
  static const IconData strokeRoundedWavingHand02 = HugeIconData(0x4a42);

  /// IconData for the 'strokeRoundedWaze' icon.
  static const IconData strokeRoundedWaze = HugeIconData(0x4a43);

  /// IconData for the 'strokeRoundedWebDesign01' icon.
  static const IconData strokeRoundedWebDesign01 = HugeIconData(0x4a44);

  /// IconData for the 'strokeRoundedWebDesign02' icon.
  static const IconData strokeRoundedWebDesign02 = HugeIconData(0x4a45);

  /// IconData for the 'strokeRoundedWebProgramming' icon.
  static const IconData strokeRoundedWebProgramming = HugeIconData(0x4a46);

  /// IconData for the 'strokeRoundedWebProtection' icon.
  static const IconData strokeRoundedWebProtection = HugeIconData(0x4a47);

  /// IconData for the 'strokeRoundedWebSecurity' icon.
  static const IconData strokeRoundedWebSecurity = HugeIconData(0x4a48);

  /// IconData for the 'strokeRoundedWebValidation' icon.
  static const IconData strokeRoundedWebValidation = HugeIconData(0x4a49);

  /// IconData for the 'strokeRoundedWebflow' icon.
  static const IconData strokeRoundedWebflow = HugeIconData(0x4a4a);

  /// IconData for the 'strokeRoundedWechat' icon.
  static const IconData strokeRoundedWechat = HugeIconData(0x4a4b);

  /// IconData for the 'strokeRoundedWeightScale01' icon.
  static const IconData strokeRoundedWeightScale01 = HugeIconData(0x4a4c);

  /// IconData for the 'strokeRoundedWeightScale' icon.
  static const IconData strokeRoundedWeightScale = HugeIconData(0x4a4d);

  /// IconData for the 'strokeRoundedWellness' icon.
  static const IconData strokeRoundedWellness = HugeIconData(0x4a4e);

  /// IconData for the 'strokeRoundedWhatsappBusiness' icon.
  static const IconData strokeRoundedWhatsappBusiness = HugeIconData(0x4a4f);

  /// IconData for the 'strokeRoundedWhatsapp' icon.
  static const IconData strokeRoundedWhatsapp = HugeIconData(0x4a50);

  /// IconData for the 'strokeRoundedWheelchair' icon.
  static const IconData strokeRoundedWheelchair = HugeIconData(0x4a51);

  /// IconData for the 'strokeRoundedWhisk' icon.
  static const IconData strokeRoundedWhisk = HugeIconData(0x4a52);

  /// IconData for the 'strokeRoundedWhistle' icon.
  static const IconData strokeRoundedWhistle = HugeIconData(0x4a53);

  /// IconData for the 'strokeRoundedWifi01' icon.
  static const IconData strokeRoundedWifi01 = HugeIconData(0x4a54);

  /// IconData for the 'strokeRoundedWifi02' icon.
  static const IconData strokeRoundedWifi02 = HugeIconData(0x4a55);

  /// IconData for the 'strokeRoundedWifiCircle' icon.
  static const IconData strokeRoundedWifiCircle = HugeIconData(0x4a56);

  /// IconData for the 'strokeRoundedWifiConnected01' icon.
  static const IconData strokeRoundedWifiConnected01 = HugeIconData(0x4a57);

  /// IconData for the 'strokeRoundedWifiConnected02' icon.
  static const IconData strokeRoundedWifiConnected02 = HugeIconData(0x4a58);

  /// IconData for the 'strokeRoundedWifiConnected03' icon.
  static const IconData strokeRoundedWifiConnected03 = HugeIconData(0x4a59);

  /// IconData for the 'strokeRoundedWifiDisconnected01' icon.
  static const IconData strokeRoundedWifiDisconnected01 = HugeIconData(0x4a5a);

  /// IconData for the 'strokeRoundedWifiDisconnected02' icon.
  static const IconData strokeRoundedWifiDisconnected02 = HugeIconData(0x4a5b);

  /// IconData for the 'strokeRoundedWifiDisconnected03' icon.
  static const IconData strokeRoundedWifiDisconnected03 = HugeIconData(0x4a5c);

  /// IconData for the 'strokeRoundedWifiDisconnected04' icon.
  static const IconData strokeRoundedWifiDisconnected04 = HugeIconData(0x4a5d);

  /// IconData for the 'strokeRoundedWifiError01' icon.
  static const IconData strokeRoundedWifiError01 = HugeIconData(0x4a5e);

  /// IconData for the 'strokeRoundedWifiError02' icon.
  static const IconData strokeRoundedWifiError02 = HugeIconData(0x4a5f);

  /// IconData for the 'strokeRoundedWifiFullSignal' icon.
  static const IconData strokeRoundedWifiFullSignal = HugeIconData(0x4a60);

  /// IconData for the 'strokeRoundedWifiLocation' icon.
  static const IconData strokeRoundedWifiLocation = HugeIconData(0x4a61);

  /// IconData for the 'strokeRoundedWifiLock' icon.
  static const IconData strokeRoundedWifiLock = HugeIconData(0x4a62);

  /// IconData for the 'strokeRoundedWifiLowSignal' icon.
  static const IconData strokeRoundedWifiLowSignal = HugeIconData(0x4a63);

  /// IconData for the 'strokeRoundedWifiMediumSignal' icon.
  static const IconData strokeRoundedWifiMediumSignal = HugeIconData(0x4a64);

  /// IconData for the 'strokeRoundedWifiNoSignal' icon.
  static const IconData strokeRoundedWifiNoSignal = HugeIconData(0x4a65);

  /// IconData for the 'strokeRoundedWifiOff01' icon.
  static const IconData strokeRoundedWifiOff01 = HugeIconData(0x4a66);

  /// IconData for the 'strokeRoundedWifiOff02' icon.
  static const IconData strokeRoundedWifiOff02 = HugeIconData(0x4a67);

  /// IconData for the 'strokeRoundedWifiSquare' icon.
  static const IconData strokeRoundedWifiSquare = HugeIconData(0x4a68);

  /// IconData for the 'strokeRoundedWifiUnlock' icon.
  static const IconData strokeRoundedWifiUnlock = HugeIconData(0x4a69);

  /// IconData for the 'strokeRoundedWikipedia' icon.
  static const IconData strokeRoundedWikipedia = HugeIconData(0x4a6a);

  /// IconData for the 'strokeRoundedWindPower01' icon.
  static const IconData strokeRoundedWindPower01 = HugeIconData(0x4a6b);

  /// IconData for the 'strokeRoundedWindPower02' icon.
  static const IconData strokeRoundedWindPower02 = HugeIconData(0x4a6c);

  /// IconData for the 'strokeRoundedWindPower03' icon.
  static const IconData strokeRoundedWindPower03 = HugeIconData(0x4a6d);

  /// IconData for the 'strokeRoundedWindPower' icon.
  static const IconData strokeRoundedWindPower = HugeIconData(0x4a6e);

  /// IconData for the 'strokeRoundedWindSurf' icon.
  static const IconData strokeRoundedWindSurf = HugeIconData(0x4a6f);

  /// IconData for the 'strokeRoundedWindTurbine' icon.
  static const IconData strokeRoundedWindTurbine = HugeIconData(0x4a70);

  /// IconData for the 'strokeRoundedWink' icon.
  static const IconData strokeRoundedWink = HugeIconData(0x4a71);

  /// IconData for the 'strokeRoundedWinking' icon.
  static const IconData strokeRoundedWinking = HugeIconData(0x4a72);

  /// IconData for the 'strokeRoundedWirelessCloudAccess' icon.
  static const IconData strokeRoundedWirelessCloudAccess = HugeIconData(0x4a73);

  /// IconData for the 'strokeRoundedWireless' icon.
  static const IconData strokeRoundedWireless = HugeIconData(0x4a74);

  /// IconData for the 'strokeRoundedWise' icon.
  static const IconData strokeRoundedWise = HugeIconData(0x4a75);

  /// IconData for the 'strokeRoundedWordpress' icon.
  static const IconData strokeRoundedWordpress = HugeIconData(0x4a76);

  /// IconData for the 'strokeRoundedWorkAlert' icon.
  static const IconData strokeRoundedWorkAlert = HugeIconData(0x4a77);

  /// IconData for the 'strokeRoundedWorkHistory' icon.
  static const IconData strokeRoundedWorkHistory = HugeIconData(0x4a78);

  /// IconData for the 'strokeRoundedWorkUpdate' icon.
  static const IconData strokeRoundedWorkUpdate = HugeIconData(0x4a79);

  /// IconData for the 'strokeRoundedWorkflowCircle01' icon.
  static const IconData strokeRoundedWorkflowCircle01 = HugeIconData(0x4a7a);

  /// IconData for the 'strokeRoundedWorkflowCircle02' icon.
  static const IconData strokeRoundedWorkflowCircle02 = HugeIconData(0x4a7b);

  /// IconData for the 'strokeRoundedWorkflowCircle03' icon.
  static const IconData strokeRoundedWorkflowCircle03 = HugeIconData(0x4a7c);

  /// IconData for the 'strokeRoundedWorkflowCircle04' icon.
  static const IconData strokeRoundedWorkflowCircle04 = HugeIconData(0x4a7d);

  /// IconData for the 'strokeRoundedWorkflowCircle05' icon.
  static const IconData strokeRoundedWorkflowCircle05 = HugeIconData(0x4a7e);

  /// IconData for the 'strokeRoundedWorkflowCircle06' icon.
  static const IconData strokeRoundedWorkflowCircle06 = HugeIconData(0x4a7f);

  /// IconData for the 'strokeRoundedWorkflowSquare01' icon.
  static const IconData strokeRoundedWorkflowSquare01 = HugeIconData(0x4a80);

  /// IconData for the 'strokeRoundedWorkflowSquare02' icon.
  static const IconData strokeRoundedWorkflowSquare02 = HugeIconData(0x4a81);

  /// IconData for the 'strokeRoundedWorkflowSquare03' icon.
  static const IconData strokeRoundedWorkflowSquare03 = HugeIconData(0x4a82);

  /// IconData for the 'strokeRoundedWorkflowSquare04' icon.
  static const IconData strokeRoundedWorkflowSquare04 = HugeIconData(0x4a83);

  /// IconData for the 'strokeRoundedWorkflowSquare05' icon.
  static const IconData strokeRoundedWorkflowSquare05 = HugeIconData(0x4a84);

  /// IconData for the 'strokeRoundedWorkflowSquare06' icon.
  static const IconData strokeRoundedWorkflowSquare06 = HugeIconData(0x4a85);

  /// IconData for the 'strokeRoundedWorkflowSquare07' icon.
  static const IconData strokeRoundedWorkflowSquare07 = HugeIconData(0x4a86);

  /// IconData for the 'strokeRoundedWorkflowSquare08' icon.
  static const IconData strokeRoundedWorkflowSquare08 = HugeIconData(0x4a87);

  /// IconData for the 'strokeRoundedWorkflowSquare09' icon.
  static const IconData strokeRoundedWorkflowSquare09 = HugeIconData(0x4a88);

  /// IconData for the 'strokeRoundedWorkflowSquare10' icon.
  static const IconData strokeRoundedWorkflowSquare10 = HugeIconData(0x4a89);

  /// IconData for the 'strokeRoundedWorkoutBattleRopes' icon.
  static const IconData strokeRoundedWorkoutBattleRopes = HugeIconData(0x4a8a);

  /// IconData for the 'strokeRoundedWorkoutGymnastics' icon.
  static const IconData strokeRoundedWorkoutGymnastics = HugeIconData(0x4a8b);

  /// IconData for the 'strokeRoundedWorkoutKicking' icon.
  static const IconData strokeRoundedWorkoutKicking = HugeIconData(0x4a8c);

  /// IconData for the 'strokeRoundedWorkoutRun' icon.
  static const IconData strokeRoundedWorkoutRun = HugeIconData(0x4a8d);

  /// IconData for the 'strokeRoundedWorkoutSport' icon.
  static const IconData strokeRoundedWorkoutSport = HugeIconData(0x4a8e);

  /// IconData for the 'strokeRoundedWorkoutSquats' icon.
  static const IconData strokeRoundedWorkoutSquats = HugeIconData(0x4a8f);

  /// IconData for the 'strokeRoundedWorkoutStretching' icon.
  static const IconData strokeRoundedWorkoutStretching = HugeIconData(0x4a90);

  /// IconData for the 'strokeRoundedWorkoutWarmUp' icon.
  static const IconData strokeRoundedWorkoutWarmUp = HugeIconData(0x4a91);

  /// IconData for the 'strokeRoundedWorry' icon.
  static const IconData strokeRoundedWorry = HugeIconData(0x4a92);

  /// IconData for the 'strokeRoundedWpsOfficeRectangle' icon.
  static const IconData strokeRoundedWpsOfficeRectangle = HugeIconData(0x4a93);

  /// IconData for the 'strokeRoundedWpsOffice' icon.
  static const IconData strokeRoundedWpsOffice = HugeIconData(0x4a94);

  /// IconData for the 'strokeRoundedWrench01' icon.
  static const IconData strokeRoundedWrench01 = HugeIconData(0x4a95);

  /// IconData for the 'strokeRoundedWrench02' icon.
  static const IconData strokeRoundedWrench02 = HugeIconData(0x4a96);

  /// IconData for the 'strokeRoundedWudu' icon.
  static const IconData strokeRoundedWudu = HugeIconData(0x4a97);

  /// IconData for the 'strokeRoundedXRay' icon.
  static const IconData strokeRoundedXRay = HugeIconData(0x4a98);

  /// IconData for the 'strokeRoundedXVariableCircle' icon.
  static const IconData strokeRoundedXVariableCircle = HugeIconData(0x4a99);

  /// IconData for the 'strokeRoundedXVariableSquare' icon.
  static const IconData strokeRoundedXVariableSquare = HugeIconData(0x4a9a);

  /// IconData for the 'strokeRoundedXVariable' icon.
  static const IconData strokeRoundedXVariable = HugeIconData(0x4a9b);

  /// IconData for the 'strokeRoundedXing' icon.
  static const IconData strokeRoundedXing = HugeIconData(0x4a9c);

  /// IconData for the 'strokeRoundedXls01' icon.
  static const IconData strokeRoundedXls01 = HugeIconData(0x4a9d);

  /// IconData for the 'strokeRoundedXls02' icon.
  static const IconData strokeRoundedXls02 = HugeIconData(0x4a9e);

  /// IconData for the 'strokeRoundedXml01' icon.
  static const IconData strokeRoundedXml01 = HugeIconData(0x4a9f);

  /// IconData for the 'strokeRoundedXml02' icon.
  static const IconData strokeRoundedXml02 = HugeIconData(0x4aa0);

  /// IconData for the 'strokeRoundedXsl01' icon.
  static const IconData strokeRoundedXsl01 = HugeIconData(0x4aa1);

  /// IconData for the 'strokeRoundedXsl02' icon.
  static const IconData strokeRoundedXsl02 = HugeIconData(0x4aa2);

  /// IconData for the 'strokeRoundedYelp' icon.
  static const IconData strokeRoundedYelp = HugeIconData(0x4aa3);

  /// IconData for the 'strokeRoundedYenCircle' icon.
  static const IconData strokeRoundedYenCircle = HugeIconData(0x4aa4);

  /// IconData for the 'strokeRoundedYenReceive' icon.
  static const IconData strokeRoundedYenReceive = HugeIconData(0x4aa5);

  /// IconData for the 'strokeRoundedYenSend' icon.
  static const IconData strokeRoundedYenSend = HugeIconData(0x4aa6);

  /// IconData for the 'strokeRoundedYenSquare' icon.
  static const IconData strokeRoundedYenSquare = HugeIconData(0x4aa7);

  /// IconData for the 'strokeRoundedYen' icon.
  static const IconData strokeRoundedYen = HugeIconData(0x4aa8);

  /// IconData for the 'strokeRoundedYoga01' icon.
  static const IconData strokeRoundedYoga01 = HugeIconData(0x4aa9);

  /// IconData for the 'strokeRoundedYoga02' icon.
  static const IconData strokeRoundedYoga02 = HugeIconData(0x4aaa);

  /// IconData for the 'strokeRoundedYoga03' icon.
  static const IconData strokeRoundedYoga03 = HugeIconData(0x4aab);

  /// IconData for the 'strokeRoundedYogaBall' icon.
  static const IconData strokeRoundedYogaBall = HugeIconData(0x4aac);

  /// IconData for the 'strokeRoundedYogaMat' icon.
  static const IconData strokeRoundedYogaMat = HugeIconData(0x4aad);

  /// IconData for the 'strokeRoundedYogurt' icon.
  static const IconData strokeRoundedYogurt = HugeIconData(0x4aae);

  /// IconData for the 'strokeRoundedYoutube' icon.
  static const IconData strokeRoundedYoutube = HugeIconData(0x4aaf);

  /// IconData for the 'strokeRoundedYurt' icon.
  static const IconData strokeRoundedYurt = HugeIconData(0x4ab0);

  /// IconData for the 'strokeRoundedZakat' icon.
  static const IconData strokeRoundedZakat = HugeIconData(0x4ab1);

  /// IconData for the 'strokeRoundedZap' icon.
  static const IconData strokeRoundedZap = HugeIconData(0x4ab2);

  /// IconData for the 'strokeRoundedZeppelin' icon.
  static const IconData strokeRoundedZeppelin = HugeIconData(0x4ab3);

  /// IconData for the 'strokeRoundedZip01' icon.
  static const IconData strokeRoundedZip01 = HugeIconData(0x4ab4);

  /// IconData for the 'strokeRoundedZip02' icon.
  static const IconData strokeRoundedZip02 = HugeIconData(0x4ab5);

  /// IconData for the 'strokeRoundedZoomCircle' icon.
  static const IconData strokeRoundedZoomCircle = HugeIconData(0x4ab6);

  /// IconData for the 'strokeRoundedZoomInArea' icon.
  static const IconData strokeRoundedZoomInArea = HugeIconData(0x4ab7);

  /// IconData for the 'strokeRoundedZoomOutArea' icon.
  static const IconData strokeRoundedZoomOutArea = HugeIconData(0x4ab8);

  /// IconData for the 'strokeRoundedZoomSquare' icon.
  static const IconData strokeRoundedZoomSquare = HugeIconData(0x4ab9);

  /// IconData for the 'strokeRoundedZoom' icon.
  static const IconData strokeRoundedZoom = HugeIconData(0x4aba);
}

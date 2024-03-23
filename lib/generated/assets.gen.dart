/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/ic_internet.png
  AssetGenImage get icInternet =>
      const AssetGenImage('assets/icons/ic_internet.png');

  /// File path: assets/icons/icon_back.png
  AssetGenImage get iconBack =>
      const AssetGenImage('assets/icons/icon_back.png');

  /// File path: assets/icons/icon_laze.png
  AssetGenImage get iconLaze =>
      const AssetGenImage('assets/icons/icon_laze.png');

  /// File path: assets/icons/icon_menu.png
  AssetGenImage get iconMenu =>
      const AssetGenImage('assets/icons/icon_menu.png');

  /// File path: assets/icons/icon_question.png
  AssetGenImage get iconQuestion =>
      const AssetGenImage('assets/icons/icon_question.png');

  /// File path: assets/icons/icon_success.png
  AssetGenImage get iconSuccess =>
      const AssetGenImage('assets/icons/icon_success.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [icInternet, iconBack, iconLaze, iconMenu, iconQuestion, iconSuccess];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/image_1.png
  AssetGenImage get image1 => const AssetGenImage('assets/images/image_1.png');

  /// File path: assets/images/image_2.png
  AssetGenImage get image2 => const AssetGenImage('assets/images/image_2.png');

  /// File path: assets/images/image_splash.jpg
  AssetGenImage get imageSplash =>
      const AssetGenImage('assets/images/image_splash.jpg');

  /// File path: assets/images/img_onboarding.png
  AssetGenImage get imgOnboarding =>
      const AssetGenImage('assets/images/img_onboarding.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [image1, image2, imageSplash, imgOnboarding];
}

class $AssetsLocalesGen {
  const $AssetsLocalesGen();

  /// File path: assets/locales/en.json
  String get en => 'assets/locales/en.json';

  /// File path: assets/locales/vi.json
  String get vi => 'assets/locales/vi.json';

  /// List of all assets
  List<String> get values => [en, vi];
}

class $AssetsVideoGen {
  const $AssetsVideoGen();

  /// File path: assets/video/video_1.mp4
  String get video1 => 'assets/video/video_1.mp4';

  /// File path: assets/video/video_2.mp4
  String get video2 => 'assets/video/video_2.mp4';

  /// List of all assets
  List<String> get values => [video1, video2];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLocalesGen locales = $AssetsLocalesGen();
  static const $AssetsVideoGen video = $AssetsVideoGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

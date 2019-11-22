import 'package:flutter/material.dart';
import 'package:proektoria/ui/styles/AppColors.dart';

class AppStyles {
  static const DEFAULT_BACKGROUND_DECORATION = const BoxDecoration(
    gradient: const LinearGradient(
      colors: const [
        AppColors.ALMOST_WHITE,
        AppColors.GENTLE_WHITE,
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      tileMode: TileMode.clamp,
      stops: const [
        0.0,
        1.0,
      ],
    ),
  );

  static const DIR_SELECTOR_BACKGROUND_DECORATION = const BoxDecoration(
      gradient: const LinearGradient(
        colors: const [
          AppColors.ACCENT,
          AppColors.ACCENT_LIGHT,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    tileMode: TileMode.clamp,
    stops: const [
      0.0,
      1.0,
    ],
  ));

  static const CARD_TITLE_SIZE = 20.0;

  static const CARD_BORDER_RADIUS = const BorderRadius.all(Radius.circular(8));
  static final CARD_DECORATION = BoxDecoration(
    border: Border.all(
      color: Color(0x11333333),
      width: 1.2,
    ),
    borderRadius: CARD_BORDER_RADIUS,
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        color: Color(0x05888888),
        offset: Offset(0.0, 1.0),
        blurRadius: 1.0,
      )
    ],
  );
  static const CARD_PADDING = EdgeInsets.symmetric(
    vertical: 12,
    horizontal: 10,
  );

  static const TEXT_TITLE_SIZE = 32.0;
}

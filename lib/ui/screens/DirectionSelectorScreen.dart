import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:proektoria/data/DirectionType.dart';
import 'package:proektoria/data/Profile.dart';
import 'package:proektoria/navigation/NavigationHelper.dart';
import 'package:proektoria/ui/controls/PButton.dart';
import 'package:proektoria/ui/styles/AppColors.dart';
import 'package:proektoria/ui/styles/AppStyles.dart';

/// Экран выбора направления для участников форума
class DirectionSelectorScreen extends StatelessWidget {
  /// Сохраняет профиль наставника и перенаправляет на главный экран
  void _mentorNext(BuildContext context) async {
    await Profile.saveProfile(DirectionType.MENTORING);
    NavigationHelper.finalNamedNavigation(context, '/main');
  }

  @override
  Widget build(BuildContext context) {
    var header = _buildHeader();
    var subHeader = _buildSubHeader();

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: AppColors.ACCENT_LIGHT,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: Container(
          decoration: AppStyles.DIR_SELECTOR_BACKGROUND_DECORATION,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(child: header),
                subHeader,
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: IntrinsicWidth(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [_buildNextButton(context)],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SvgPicture.asset(
          'assets/i_logo.svg',
          semanticsLabel: 'ПроеКТОриЯ',
          height: 77,
          width: 305,
        ),
      ],
    );
  }

  Widget _buildSubHeader() {
    return Column(
      children: <Widget>[
        const Text(
          'Добро пожаловать!',
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const Text(
          'Гид-приложение по форуму',
          style: const TextStyle(fontSize: 20.0),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildNextButton(BuildContext context) {
    return PButton(
      text: 'Продолжить',
      onPressed: () =>
          Navigator.of(context).pushNamed('/student_direction_selector'),
    );
  }
}

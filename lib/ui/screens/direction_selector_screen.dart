import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:proektoria/data/direction_type.dart';
import 'package:proektoria/data/profile.dart';
import 'package:proektoria/ui/styles/AppStyles.dart';

class DirectionSelectorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          decoration: AppStyles.BACKGROUND_DECORATION,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(child: _buildHeader()),
                _buildSubHeader(),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: IntrinsicWidth(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        _buildStudentButton(context),
                        _buildTeacherButton(context),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );

  Widget _buildHeader() => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(
            'assets/i_logo.svg',
            semanticsLabel: 'ПроеКТОриЯ',
            height: 29,
            width: 332,
          ),
        ],
      );

  Widget _buildSubHeader() => const Text(
    'Выберите направление',
        style: const TextStyle(
          fontSize: 18.0,
        ),
      );

  Widget _buildStudentButton(BuildContext context) =>
      OutlineButton(
        child: Text(
          'Ученик'.toUpperCase(),
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        onPressed: () =>
            Navigator.of(context).pushNamed('/student_direction_selector'),
      );

  void _saveProfileAndNavigateToMainScreen(BuildContext context) async {
    await Profile.saveProfile(DirectionType.MENTORING);

    Navigator.of(context).pushNamedAndRemoveUntil(
      '/main',
          (Route<dynamic> route) => false,
    );
  }

  Widget _buildTeacherButton(BuildContext context) =>
      OutlineButton(
        child: Text(
          'Наставник'.toUpperCase(),
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        onPressed: () => _saveProfileAndNavigateToMainScreen(context),
      );
}

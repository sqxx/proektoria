import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:proektoria/data/ForumData.dart';
import 'package:proektoria/navigation/NavigationHelper.dart';
import 'package:proektoria/ui/controls/PButton.dart';
import 'package:proektoria/ui/styles/AppColors.dart';
import 'package:proektoria/ui/styles/AppStyles.dart';

class NoForumScreen extends StatelessWidget {
  void _startForum(BuildContext context) {
    ForumData.today = DateTime.now();

    if (ForumData.isForumDay(ForumData.today)) {
      Fluttertoast.showToast(msg: 'Добро пожаловать!');
      NavigationHelper.finalNamedNavigation(context, '/main');
    } else {
      Fluttertoast.showToast(msg: 'В ожидании форума...');
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: AppColors.GENTLE_WHITE,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: Container(
          decoration: AppStyles.DEFAULT_BACKGROUND_DECORATION,
          padding: EdgeInsets.all(18),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    _buildIllustration(),
                    SizedBox(height: 24),
                    _buildTitle(),
                    SizedBox(height: 24),
                    _buildDescription(),
                    SizedBox(height: 12),
                    _buildProektoriaHashTag()
                  ],
                ),
              ),
              _buildRefreshButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIllustration() {
    return SvgPicture.asset(
      'assets/i_wait_forum.svg',
      width: 302,
      height: 250,
      semanticsLabel: 'Ожидание форума',
    );
  }

  Widget _buildTitle() {
    return const Text(
      'В ожидании форума...',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 28,
      ),
    );
  }

  Widget _buildDescription() {
    return const Text(
      'Следите за новостями в социальных сетях и делитесь впечатлениями с хештегом',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 16),
    );
  }

  Widget _buildProektoriaHashTag() {
    return const Text(
      '#ПроеКТОриЯ',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 20),
    );
  }

  Widget _buildRefreshButton(BuildContext context) {
    return PButton(
      text: 'Обновить',
      icon: OMIcons.refresh,
      onPressed: () => _startForum(context),
    );
  }
}

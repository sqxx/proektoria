import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:proektoria/ui/styles/AppStyles.dart';

class InvitationToNextForum extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18),
      decoration: AppStyles.CARD_DECORATION,
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
    );
  }

  Widget _buildIllustration() {
    return SvgPicture.asset(
      'assets/i_social.svg',
      width: 318,
      height: 224,
      semanticsLabel: 'Социальные сети',
    );
  }

  Widget _buildTitle() {
    return Text(
      "Увидимся на следующем форуме",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 28,
      ),
    );
  }

  Widget _buildDescription() {
    return Text(
      "Делитесь впечатлениями о форуме в социальных сетях с хештегом",
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 16),
    );
  }

  Widget _buildProektoriaHashTag() {
    return Text(
      "#ПроеКТОриЯ",
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 20),
    );
  }
}

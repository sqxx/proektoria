import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DirectionSelectorScreen extends StatelessWidget {
  static const _logoSize = 92.0;
  static const _decoration = const BoxDecoration(
    gradient: LinearGradient(
        colors: [
          const Color(0xfffbfcfd),
          const Color(0xfff2f3f8),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        tileMode: TileMode.clamp,
        stops: [
          0.0,
          1.0,
        ]),
  );

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          decoration: _decoration,
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
                        _buildStudentButton(),
                        _buildTeacherButton(),
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
          SvgPicture.asset("assets/logo.svg",
              width: _logoSize,
              height: _logoSize,
              semanticsLabel: "ПроеКТОриЯ"),
          const Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: const Text(
              "ПроеКТОриЯ",
              style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
            ),
          )
        ],
      );

  Widget _buildSubHeader() => const Text(
        "Выберите направление",
        style: const TextStyle(
          fontSize: 18.0,
        ),
      );

  Widget _buildStudentButton() => OutlineButton(
        child: Text(
          "Ученик".toUpperCase(),
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        onPressed: () => {},
      );

  Widget _buildTeacherButton() => OutlineButton(
        child: Text(
          "Наставник".toUpperCase(),
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        onPressed: () => {},
      );
}
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:proektoria/data/ForumData.dart';
import 'package:proektoria/data/Profile.dart';
import 'package:proektoria/navigation/NavigationHelper.dart';
import 'package:proektoria/ui/behaviors/NoScrollGlowBehavior.dart';
import 'package:proektoria/ui/controls/libs/circle_wheel.dart';

class StudentDirectionSelectorScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StudentDirectionSelectorScreenState();
}

class _StudentDirectionSelectorScreenState
    extends State<StudentDirectionSelectorScreen> {
  static const _ITEM_SIZE = 80.0;

  var _selectedItem = 0;

  /// Сохраняет выбранный профиль и перенаправляет на главный экран
  void _start() async {
    await Profile.saveProfile(
        ForumData.directions[_selectedItem].directionType);

    NavigationHelper.finalNamedNavigation(context, '/main');
  }

  @override
  Widget build(BuildContext context) {
    var title = Align(
      alignment: Alignment.centerLeft,
      child: _buildTitle(),
    );

    var dirCarousel = Padding(
      padding: EdgeInsets.only(
        left: MediaQuery
            .of(context)
            .size
            .width / 2.70,
      ),
      child: _buildCircularListView(),
    );

    var controls = Align(
      alignment: Alignment.bottomRight,
      child: _buildNavigationControls(),
    );

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Colors.black,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage('assets/directions/$_selectedItem.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 50.0, sigmaY: 50.0),
            child: SafeArea(
              child: Stack(children: <Widget>[
                title,
                dirCarousel,
                controls,
              ]),
            ),
          ),
        ),
      ),
      //),
    );
  }

  Widget _buildTitle() {
    var directionName = ForumData.directions[_selectedItem].name;
    var title = directionName.replaceAll(' ', '\n');

    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildCircularListView() {
    var items = List.generate(ForumData.directions.length, _buildItem);

    return ScrollConfiguration(
      behavior: NoScrollGlowBehavior(),
      child: CircleListScrollView(
        physics: CircleFixedExtentScrollPhysics(),
        clipToSize: false,
        renderChildrenOutsideViewport: true,
        axis: Axis.vertical,
        itemExtent: _ITEM_SIZE,
        radius: MediaQuery
            .of(context)
            .size
            .width,
        children: items,
        onSelectedItemChanged: (i) => setState(() => _selectedItem = i),
      ),
    );
  }

  Widget _buildItem(int i) {
    final direction = ForumData.directions[i];

    final primaryColor = direction.primaryColor;

    var itemDecoration = BoxDecoration(
      color: Color.fromARGB(
        100,
        primaryColor.red,
        primaryColor.green,
        primaryColor.blue,
      ),
      backgroundBlendMode: BlendMode.hardLight,
      borderRadius: BorderRadius.circular(_ITEM_SIZE / 2),
    );

    var icon = SvgPicture.asset(
      direction.pathToIcon,
      width: 32,
      height: 32,
    );

    return Center(
      child: Container(
        decoration: itemDecoration,
        width: _ITEM_SIZE,
        height: _ITEM_SIZE,
        padding: const EdgeInsets.all(20),
        child: Center(child: icon),
      ),
    );
  }

  Widget _button(String text, Function onPressed) {
    return MaterialButton(
      child: Text(
        text.toUpperCase(),
        style: const TextStyle(color: Colors.white),
      ),
      onPressed: () => onPressed(),
    );
  }

  Widget _buildNextBtn() => _button('Далее', _start);

  Widget _buildPrevBtn() =>
      _button('Назад', Navigator
          .of(context)
          .pop);

  Widget _buildNavigationControls() {
    return IntrinsicWidth(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: <Widget>[
            _buildPrevBtn(),
            SizedBox(width: 2),
            _buildNextBtn(),
          ],
        ),
      ),
    );
  }
}

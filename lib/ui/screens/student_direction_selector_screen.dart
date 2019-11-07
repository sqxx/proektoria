import 'package:flutter/material.dart';
import 'package:proektoria/data/forum_data.dart';
import 'package:proektoria/data/profile.dart';
import 'package:proektoria/ui/behaviors/no_scroll_glow_behavior.dart';
import 'package:proektoria/ui/controls/circle_wheel.dart';
import 'package:proektoria/ui/styles/AppStyles.dart';

class StudentDirectionSelectorScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StudentDirectionSelectorScreenState();
}

class _StudentDirectionSelectorScreenState
    extends State<StudentDirectionSelectorScreen> {
  static const _ITEM_SIZE = 80.0;

  var _selectedItem = 0;

  void _start() async {
    await Profile.saveProfile(
        ForumData.directions[_selectedItem].directionType);

    Navigator.of(context).pushNamedAndRemoveUntil(
      '/main',
          (Route<dynamic> route) => false,
    );
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
            .width / 3.75,
      ),
      child: _buildCircularListView(),
    );

    var controls = Align(
      alignment: Alignment.bottomRight,
      child: _buildNavigationControls(),
    );

    return Scaffold(
      body: Container(
        decoration: AppStyles.BACKGROUND_DECORATION,
        child: SafeArea(
          child: Stack(children: <Widget>[title, dirCarousel, controls]),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    var directionName = ForumData.directions[_selectedItem].name;
    var title = directionName.replaceAll(' ', '\n');

    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 28.0, color: Colors.black),
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
    var itemDecoration = BoxDecoration(
      color: ForumData.directions[i].primaryColor,
      boxShadow: [
        const BoxShadow(
          color: Colors.black12,
          blurRadius: 6.0,
          spreadRadius: 4.0,
        ),
      ],
      borderRadius: BorderRadius.circular(_ITEM_SIZE / 2),
    );

    //todo
    const icon = const Placeholder(
      color: Colors.white,
      fallbackHeight: _ITEM_SIZE,
      fallbackWidth: _ITEM_SIZE,
    );

    return Center(
      child: Container(
        decoration: itemDecoration,
        width: _ITEM_SIZE,
        padding: const EdgeInsets.all(20),
        child: const Center(child: icon),
      ),
    );
  }

  Widget _button(String text, Function onPressed) {
    return MaterialButton(
      child: Text(
        text.toUpperCase(),
        style: const TextStyle(color: Colors.black),
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

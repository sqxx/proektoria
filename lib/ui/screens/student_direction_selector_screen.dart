import 'package:flutter/material.dart';
import 'package:proektoria/data/colors.dart';
import 'package:proektoria/data/forum_data.dart';
import 'package:proektoria/ui/behaviors/no_scroll_glow_behavior.dart';
import 'package:proektoria/ui/controls/circle_wheel.dart';

class StudentDirectionSelectorScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StudentDirectionSelectorScreenState();
}

class _StudentDirectionSelectorScreenState
    extends State<StudentDirectionSelectorScreen> {
  static const _itemSize = 80.0;
  var _selectedItem = 0;

  static const _decoration = const BoxDecoration(
    gradient: LinearGradient(
      colors: [
        AppColors.ALMOST_WHITE,
        AppColors.GENTLE_WHITE,
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      tileMode: TileMode.clamp,
      stops: [
        0.0,
        1.0,
      ],
    ),
  );

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          decoration: _decoration,
          child: SafeArea(
            child: Stack(
              children: <Widget>[
                Align(alignment: Alignment.centerLeft, child: _buildTitle()),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width / 3.75,
                  ),
                  child: _buildCircularListView(),
                ),
                Align(alignment: Alignment.bottomRight, child: _buildNextBtn()),
              ],
            ),
          ),
        ),
      );

  Widget _buildTitle() => Padding(
        padding: const EdgeInsets.all(18.0),
        child: Text(
          ForumData.forumDirections[_selectedItem].name.replaceAll(' ', '\n'),
          style: const TextStyle(
            fontSize: 28.0,
            color: Colors.black,
          ),
        ),
      );

  Widget _buildCircularListView() => ScrollConfiguration(
        behavior: NoScrollGlowBehavior(),
        child: CircleListScrollView(
          physics: CircleFixedExtentScrollPhysics(),
          clipToSize: false,
          renderChildrenOutsideViewport: true,
          axis: Axis.vertical,
          itemExtent: _itemSize,
          children: List.generate(ForumData.forumDirections.length, _buildItem),
          radius: MediaQuery.of(context).size.width,
          onSelectedItemChanged: (i) => _itemSelected(i),
        ),
      );

  Widget _buildItem(int i) => Center(
        child: Container(
          decoration: BoxDecoration(
            color: ForumData.forumDirections[i].primaryColor,
            boxShadow: [
              const BoxShadow(
                color: Colors.black12,
                blurRadius: 6.0,
                spreadRadius: 4.0,
              ),
            ],
            borderRadius: BorderRadius.circular(_itemSize / 2),
          ),
          width: _itemSize,
          padding: const EdgeInsets.all(20),
          child: Center(
            child: const Placeholder(
              color: Colors.white,
              fallbackHeight: _itemSize,
              fallbackWidth: _itemSize,
            ),
          ),
        ),
      );

  void _itemSelected(int i) => setState(() {
        _selectedItem = i;
      });

  Widget _buildNextBtn() => Padding(
        padding: EdgeInsets.all(12.0),
        child: MaterialButton(
          child: Text(
            'Далее'.toUpperCase(),
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
          onPressed: () =>
              Navigator.of(context).pushNamedAndRemoveUntil(
                '/main',
                    (Route<dynamic> route) => false,
              ),
        ),
      );
}

import 'package:flutter/material.dart';
import 'package:proektoria/controls/navbar/beautiful_navigation_item.dart';
import 'package:proektoria/navigation/tab.dart';

class BeautifulNavigationBar extends StatefulWidget {
  final int currentIndex;
  final double iconSize;
  final Color backgroundColor;
  final List<NavigationTab> items;
  final ValueChanged<int> onItemSelected;

  BeautifulNavigationBar(
      {Key key,
      this.currentIndex = 0,
      this.iconSize = 24,
      this.backgroundColor,
      @required this.items,
      @required this.onItemSelected}) {
    assert(items != null);
    assert(items.length >= 2 || items.length >= 5);
    assert(onItemSelected != null);
  }

  @override
  _BeautifulNavigationBarState createState() {
    return _BeautifulNavigationBarState(
        items: items,
        backgroundColor: backgroundColor,
        currentIndex: currentIndex,
        iconSize: iconSize,
        onItemSelected: onItemSelected);
  }
}

class _BeautifulNavigationBarState extends State<BeautifulNavigationBar> {
  final int currentIndex;
  final double iconSize;
  Color backgroundColor;
  List<NavigationTab> items;
  int _selectedIndex;
  ValueChanged<int> onItemSelected;

  final double expandedItemWidth = 160.0;
  final double defaultItemWidth = 50.0;

  _BeautifulNavigationBarState(
      {@required this.items,
      this.currentIndex,
      this.backgroundColor,
      this.iconSize,
      @required this.onItemSelected});

  Widget _buildItem(BeautifulNavigationItem item, bool isSelected) {
    return AnimatedContainer(
      width: isSelected ? expandedItemWidth : defaultItemWidth,
      height: double.maxFinite,
      duration: Duration(milliseconds: 220),
      padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.all(0),
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: IconTheme(
                  data: IconThemeData(
                      size: iconSize,
                      color:
                      isSelected ? Color(0xff191919) : Color(0xff7f7f7f)),
                  child: item.icon,
                ),
              ),
              isSelected
                  ? SizedBox(
                      width: expandedItemWidth - defaultItemWidth,
                      child: DefaultTextStyle.merge(
                          style: TextStyle(
                              color: Color(0xff191919),
                              fontWeight: FontWeight.bold),
                          child: item.title,
                          textAlign: TextAlign.center))
                  : SizedBox.shrink()
            ],
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    _selectedIndex = currentIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    backgroundColor = (backgroundColor == null)
        ? Theme.of(context).bottomAppBarColor
        : backgroundColor;

    return Container(
      width: MediaQuery.of(context).size.width,
      height: 56,
      padding: EdgeInsets.only(left: 8, right: 8, top: 6, bottom: 6),
      decoration: BoxDecoration(
          color: backgroundColor,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 2)]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: items.map((item) {
          var index = items.indexOf(item);
          return GestureDetector(
            onTap: () {
              onItemSelected(index);

              setState(() {
                _selectedIndex = index;
              });
            },
            child: _buildItem(
                BeautifulNavigationItem(
                    icon: Icon(item.icon), title: Text(item.description)),
                _selectedIndex == index),
          );
        }).toList(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:proektoria/navigation/NavigationTab.dart';
import 'package:proektoria/ui/controls/libs/navbar/BeautifulNavigationItem.dart';
import 'package:proektoria/ui/styles/AppColors.dart';

class BeautifulNavigationBar extends StatefulWidget {
  final int currentIndex;
  final double iconSize;
  final Color backgroundColor;
  final List<NavigationTab> items;
  final ValueChanged<int> onItemSelected;

  BeautifulNavigationBar({
    Key key,
    this.currentIndex = 0,
    this.iconSize = 24,
    this.backgroundColor,
    @required this.items,
    @required this.onItemSelected,
  }) {
    assert(items != null);
    assert(items.length >= 2 || items.length >= 5);
    assert(onItemSelected != null);
  }

  @override
  _BeautifulNavigationBarState createState() {
    return _BeautifulNavigationBarState(
      items: items,
      onItemSelected: onItemSelected,
      currentIndex: currentIndex,
      backgroundColor: backgroundColor,
      iconSize: iconSize,
    );
  }
}

class _BeautifulNavigationBarState extends State<BeautifulNavigationBar> {
  List<NavigationTab> items;
  ValueChanged<int> onItemSelected;
  final int currentIndex;
  Color backgroundColor;
  final double iconSize;

  int _selectedIndex;

  final double expandedItemWidth = 160.0;
  final double defaultItemWidth = 50.0;
  final int expandItemDuration = 220;

  _BeautifulNavigationBarState({
    @required this.items,
    @required this.onItemSelected,
    this.currentIndex,
    this.backgroundColor,
    this.iconSize,
  });

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
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      decoration: BoxDecoration(
        color: backgroundColor,
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 2),
        ],
      ),
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
              item: BeautifulNavigationItem(
                icon: Icon(item.icon),
                title: Text(item.name),
              ),
              isSelected: _selectedIndex == index,
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildItem({
    @required BeautifulNavigationItem item,
    @required bool isSelected,
  }) {
    assert(item != null);
    assert(isSelected != null);

    var icon = _buildIcon(item, isSelected);

    // defaultItemWidth - это ширина иконки
    var textWidth = expandedItemWidth - defaultItemWidth;
    var text = _buildText(item, isSelected);

    return AnimatedContainer(
      width: isSelected ? expandedItemWidth : defaultItemWidth,
      height: double.maxFinite,
      duration: Duration(milliseconds: expandItemDuration),
      padding: EdgeInsets.all(8),
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: icon,
              ),
              isSelected
                  ? SizedBox(width: textWidth, child: text)
                  : SizedBox.shrink()
            ],
          )
        ],
      ),
    );
  }

  Widget _buildIcon(BeautifulNavigationItem item, bool isSelected) {
    return IconTheme(
      data: IconThemeData(
          size: iconSize,
          color: isSelected
              ? AppColors.NAV_BAR_ACTIVE
              : AppColors.NAV_BAR_INACTIVE),
      child: item.icon,
    );
  }

  Widget _buildText(BeautifulNavigationItem item, bool isSelected) {
    return DefaultTextStyle.merge(
      style: TextStyle(
        color: AppColors.NAV_BAR_ACTIVE,
        fontWeight: FontWeight.bold,
      ),
      child: item.title,
      textAlign: TextAlign.center,
    );
  }
}

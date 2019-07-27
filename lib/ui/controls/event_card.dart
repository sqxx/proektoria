import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:proektoria/data/direction_type.dart';
import 'package:proektoria/data/forum_data.dart';
import 'package:proektoria/data/forum_event.dart';

class EventCard extends StatelessWidget {
  static const _INDICATOR_SIZE = 26.0;
  static const _INDICATOR_HORIZONTAL_PADDING = 6.0;

  static const _SPACE_BETWEEN_CONTENT_BLOCKS = 6.0;

  final ForumEvent event;

  EventCard(this.event);

  _safetyAddWidget({@required Widget child,
    @required List container,
    double topPadding = 0.0,
    double bottomPadding = 0.0}) {
    if (child == null) return;

    container.add(Padding(
      padding: EdgeInsets.only(
        top: topPadding,
        bottom: bottomPadding,
      ),
      child: child,
    ));
  }

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[
      _buildContent(),
    ];

    _safetyAddWidget(child: _buildIndicator(), container: children);

    return IntrinsicHeight(child: Row(children: children));
  }

  Widget _buildContent() {
    final children = <Widget>[
      _buildTitle(),
    ];

    // Описание
    _safetyAddWidget(
        child: _buildDescription(),
        container: children,
        topPadding: _SPACE_BETWEEN_CONTENT_BLOCKS);

    // Место проведения
    _safetyAddWidget(
        child: _buildEventVenue(),
        container: children,
        topPadding: _SPACE_BETWEEN_CONTENT_BLOCKS);

    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: children,
      ),
    );
  }

  Widget _buildTitle() => Text(
    event.name,
    style: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
    ),
  );

  Widget _buildDescription() =>
      event.description != null
          ? Text(
        event.description,
        style: TextStyle(
          fontSize: 14.0,
          color: Colors.black,
        ),
      )
          : null;

  Widget _buildEventVenue() =>
      event.venue != null
          ? IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(OMIcons.place),
            Padding(
              padding: const EdgeInsets.only(left: 6.0),
              child: Text(event.venue),
            )
          ],
        ),
      )
          : null;

  Widget _buildIndicator() =>
      event.type != DirectionType.NONE
          ? Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: _INDICATOR_HORIZONTAL_PADDING,
          ),
          child: Container(
            width: _INDICATOR_SIZE,
            height: _INDICATOR_SIZE,
            decoration: BoxDecoration(
              color:
              ForumData
                  .getForumDirectionByType(event.type)
                  .primaryColor,
              shape: BoxShape.circle,
            ),
          ),
        ),
      )
          : null;
}

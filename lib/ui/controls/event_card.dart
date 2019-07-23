import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:proektoria/data/direction_type.dart';
import 'package:proektoria/data/forum_data.dart';
import 'package:proektoria/data/forum_event.dart';

class EventCard extends StatelessWidget {
  static const _INDICATOR_SIZE = 26.0;

  final ForumEvent event;

  EventCard(this.event);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 14,
        horizontal: 4,
      ),
      child: IntrinsicHeight(
        child: Row(
          children: <Widget>[
            _buildContent(),
            if (event.type != DirectionType.NONE) _buildIndicator(),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() => Flexible(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                bottom: 8.0,
              ),
              child: _buildTitle(),
            ),
            if (event.description != null)
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 8.0,
                ),
                child: _buildDescription(),
              ),
            _buildEventVenue(),
          ],
        ),
      );

  Widget _buildTitle() => Text(
        event.name,
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      );

  Widget _buildDescription() => Text(
        event.description,
        style: TextStyle(
          fontSize: 14.0,
          color: Colors.black,
        ),
      );

  Widget _buildEventVenue() => IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(OMIcons.event),
            Padding(
              padding: const EdgeInsets.only(left: 6.0),
              child: Text(event.venue),
            )
          ],
        ),
      );

  Widget _buildIndicator() => Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 6.0,
          ),
          child: Container(
            width: _INDICATOR_SIZE,
            height: _INDICATOR_SIZE,
            decoration: BoxDecoration(
              color: ForumData.getForumDirectionByType(event.type).primaryColor,
              shape: BoxShape.circle,
            ),
          ),
        ),
      );
}

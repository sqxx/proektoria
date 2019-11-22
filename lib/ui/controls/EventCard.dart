import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:proektoria/data/ForumEvent.dart';
import 'package:proektoria/ui/styles/AppColors.dart';
import 'package:proektoria/ui/styles/AppStyles.dart';

class EventCard extends StatelessWidget {
  static const _SPACE_BETWEEN_CONTENT_BLOCKS = 6.0;

  final ForumEvent event;

  final DateTime today;

  final bool showCurrentLabel;

  EventCard(this.event, this.today, {this.showCurrentLabel = true});

  _safetyAddWidget({
    @required Widget child,
    @required List container,
    double topPadding = 0.0,
    double bottomPadding = 0.0,
  }) {
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
    return Container(
      decoration: AppStyles.CARD_DECORATION,
      padding: AppStyles.CARD_PADDING,
      child: IntrinsicHeight(
        child: _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    final children = <Widget>[];

    final currentTimeTS = today.millisecondsSinceEpoch;
    final isCurrentEvent =
        (currentTimeTS >= event.start.millisecondsSinceEpoch) &&
            (currentTimeTS <= event.end.millisecondsSinceEpoch);

    if (isCurrentEvent && showCurrentLabel) {
      _safetyAddWidget(
        child: _buildCurrent(),
        container: children,
        topPadding: 0.0,
      );
    }

    // Заголовок
    _safetyAddWidget(
        child: _buildTitle(),
        container: children,
        topPadding: isCurrentEvent ? _SPACE_BETWEEN_CONTENT_BLOCKS : 0);

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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: children,
    );
  }

  Widget _buildTitle() {
    return Text(
      event.name,
      style: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _buildDescription() {
    if (event.description != null) {
      return Text(
        event.description,
        style: TextStyle(
          fontSize: 14.0,
          color: Colors.black,
        ),
      );
    } else {
      return null;
    }
  }

  Widget _buildCurrent() {
    return Text(
      "Текущее",
      style: TextStyle(
        fontSize: 16,
        color: AppColors.SECOND_ACCENT,
      ),
    );
  }

  Widget _buildEventVenue() {
    if (event.venue != null) {
      return IntrinsicHeight(
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
      );
    } else {
      return null;
    }
  }
}

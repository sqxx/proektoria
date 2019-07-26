import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:proektoria/data/direction_type.dart';
import 'package:proektoria/data/forum_data.dart';
import 'package:proektoria/data/forum_event.dart';
import 'package:proektoria/data/profile.dart';
import 'package:proektoria/ui/controls/event_card.dart';
import 'package:sticky_headers/sticky_headers.dart';

class SchedulePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  static const _STICKY_HEADER_CONTENT_VERTICAL_PADDING = 8.0;
  static const _STICKY_HEADER_CONTENT_HORIZONTAL_PADDING = 10.0;
  static const _STICKY_HEADER_PADDING = 10.0;

  DirectionType _savedProfile;

  List<Widget> scheduleWidgetsList = [];
  Map<DateTime, int> scheduleDaysIndexes = {};

  void _loadPreferences() async {
    _savedProfile = await Profile.loadProfile();
    setState(() {});
  }

  @override
  initState() {
    super.initState();
    _loadPreferences();
  }

  @override
  Widget build(BuildContext context) {
    if (scheduleWidgetsList.isEmpty) _buildSchedule();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          // Элементами являются каждое событие и разделители даты
            itemCount: scheduleWidgetsList.length,
            itemBuilder: (context, index) => scheduleWidgetsList[index]),
      ),
    );
  }

  _buildSchedule() {
    for (int d = 0; d < ForumData.schedule.length; d++) {
      var daySchedule = ForumData.schedule[d];
      var currentDay = daySchedule[0].start;

      scheduleDaysIndexes.putIfAbsent(
          currentDay, () => scheduleWidgetsList.length);
      scheduleWidgetsList.add(_buildDateHeader(currentDay));

      for (int ev = 0; ev < daySchedule.length; ev++) {
        ForumEvent event = daySchedule[ev];
        ForumEvent nextEvent;

        if (ev != daySchedule.length - 1) nextEvent = daySchedule[ev + 1];

        if (event.type != DirectionType.NONE && event.type != _savedProfile)
          continue;

        DateTime nextEventStart;
        if (nextEvent != null) nextEventStart = nextEvent.start;

        scheduleWidgetsList.add(
          _buildStickyHeaderItem(
            content: EventCard(event),
            startTime: event.start,
            endTime: event.end != nextEventStart ? event.end : null,
          ),
        );
      }
    }
  }

  Widget _buildDateHeader(DateTime date) =>
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Text(
            // todo! remove hardcoded language of date
            DateFormat('dd MMMM', 'ru').format(date),
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );

  Widget _buildStickyHeaderItem({@required Widget content,
    @required DateTime startTime,
    DateTime endTime}) =>
      Padding(
        padding: const EdgeInsets.symmetric(
            vertical: _STICKY_HEADER_CONTENT_VERTICAL_PADDING),
        child: StickyHeader(
          context: context,
          overlapHeaders: true,
          offsetFromHeaders: true,
          contentRightOffset: _STICKY_HEADER_CONTENT_HORIZONTAL_PADDING,
          header: Padding(
            padding: const EdgeInsets.only(
              left: _STICKY_HEADER_PADDING,
              right: _STICKY_HEADER_PADDING, //_STICKY_HEADER_PADDING,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                _buildTimeHeader(startTime),
                if (endTime != null)
                  Opacity(
                    opacity: 0.65,
                    child: _buildTimeHeader(endTime),
                  )
              ],
            ),
          ),
          content: content,
        ),
      );

  Widget _buildTimeHeader(DateTime time) =>
      Text(
        DateFormat('HH:mm', 'ru').format(time),
        style: const TextStyle(
          color: Colors.teal,
          fontSize: 22,
        ),
      );
}

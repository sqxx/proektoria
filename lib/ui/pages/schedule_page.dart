import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:proektoria/data/forum_data.dart';
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

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> scheduleView = [];
    for (int d = 0; d < ForumData.schedule.length; d++) {
      scheduleView.add(_buildDateHeader(ForumData.schedule[d][0].start));
      for (int ev = 0; ev < ForumData.schedule[d].length; ev++) {
        scheduleView.add(EventCard(ForumData.schedule[d][ev]));
      }
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          // Элементами являются каждое событие и разделители даты
            itemCount: _scheduleSize() + ForumData.schedule.length,
            itemBuilder: (context, index) => scheduleView[index]),
      ),
    );
  }

  int _scheduleSize() {
    var size = 0;
    for (var i = 0; i < ForumData.schedule.length; i++) {
      size += ForumData.schedule[i].length;
    }
    return size;
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

  Widget _buildStickyHeaderItem(DateTime time, Widget content) =>
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
                Text(
                  DateFormat('HH:mm', 'ru').format(time),
                  style: const TextStyle(
                    color: Colors.teal,
                    fontSize: 22,
                  ),
                ),
                Opacity(
                  opacity: 0.65,
                  child: Text(
                    DateFormat('HH:mm', 'ru').format(time),
                    style: const TextStyle(
                      color: Colors.teal,
                      fontSize: 22,
                    ),
                  ),
                )
              ],
            ),
          ),
          content: content,
        ),
      );
}

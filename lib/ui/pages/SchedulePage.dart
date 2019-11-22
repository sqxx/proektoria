import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:proektoria/data/DirectionType.dart';
import 'package:proektoria/data/ForumData.dart';
import 'package:proektoria/data/ForumEvent.dart';
import 'package:proektoria/data/Profile.dart';
import 'package:proektoria/ui/controls/EventCard.dart';
import 'package:proektoria/ui/styles/AppColors.dart';
import 'package:proektoria/ui/styles/AppStyles.dart';
import 'package:sticky_headers/sticky_headers.dart';

class SchedulePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  static const _LIST_PADDING_HORIZONTAL = 12.0;
  static const _ITEM_PADDING_VERTICAL = 4.0;
  static const _CONTENT_PADDING = 12.0;

  DirectionType _savedProfile;

  final controller = ScrollController();
  List<Widget> scheduleWidgetsList = [];

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

    return Container(
      decoration: AppStyles.DEFAULT_BACKGROUND_DECORATION,
      child: ListView(
        controller: controller,
        children: scheduleWidgetsList,
      ),
    );
  }

  void _buildSchedule() {
    for (int d = 0; d < ForumData.schedule.length; d++) {
      var scheduleForDay = ForumData.schedule[d];

      // Добавляем перед расписание шапку с датой
      var currentDate = scheduleForDay[0].start;
      scheduleWidgetsList.add(_buildDateHeader(currentDate));

      // Добавление виджетов событий в общий список
      // Время окончания события отображается лишь в том случае,
      //   если время начало следующего не совпадает
      for (int ev = 0; ev < scheduleForDay.length; ev++) {
        ForumEvent event = scheduleForDay[ev];
        ForumEvent nextEvent;

        if (ev != scheduleForDay.length - 1) {
          nextEvent = scheduleForDay[ev + 1];
        }

        // Скрытие событий не своего направления
        // Сломано, неактуально
        //if (event.type != DirectionType.NONE && event.type != _savedProfile) {
        //  continue;
        //}

        DateTime nextEventStart;
        if (nextEvent != null) {
          nextEventStart = nextEvent.start;
        }

        scheduleWidgetsList.add(
          Padding(
            padding: EdgeInsets.symmetric(vertical: _ITEM_PADDING_VERTICAL),
            child: _buildStickyHeaderItem(
              content: Center(child: EventCard(event, ForumData.today)),
              startTime: event.start,
              endTime: event.end != nextEventStart ? event.end : null,
            ),
          ),
        );
      }
    }
  }

  Widget _buildDateHeader(DateTime date) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Center(
        child: Text(
          DateFormat('dd MMMM', 'ru').format(date),
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildStickyHeaderItem({
    @required Widget content,
    @required DateTime startTime,
    DateTime endTime,
  }) {
    return Padding(
      padding: EdgeInsets.only(left: _LIST_PADDING_HORIZONTAL),
      child: StickyHeader(
        context: context,
        overlapHeaders: true,
        offsetFromHeaders: true,
        hardcodedHeadersWidth: 70,
        contentRightOffset: _CONTENT_PADDING + _LIST_PADDING_HORIZONTAL,
        header: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _buildTimeHeader(startTime),
              if (endTime != null)
                Opacity(opacity: 0.65, child: _buildTimeHeader(endTime))
            ],
          ),
        ),
        content: content,
      ),
    );
  }

  Widget _buildTimeHeader(DateTime time) {
    return Text(
      DateFormat('HH:mm', 'ru').format(time).toUpperCase(),
      style: const TextStyle(
        color: AppColors.SECOND_ACCENT,
        fontSize: 22,
      ),
    );
  }
}

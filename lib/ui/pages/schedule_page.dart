import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:proektoria/data/direction_type.dart';
import 'package:proektoria/data/forum_data.dart';
import 'package:proektoria/data/forum_event.dart';
import 'package:proektoria/data/profile.dart';
import 'package:proektoria/ui/controls/event_card.dart';
import 'package:proektoria/ui/styles/AppStyles.dart';
import 'package:rect_getter/rect_getter.dart';
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

  List<Widget> scheduleWidgetsList = [];
  Map<DateTime, int> scheduleDaysIndexes = {};
  int scheduleCurrentDayIndex = 0;

  var key = GlobalKey();
  var _keys = {};

  List<Widget> scheduleDates = [];
  bool needsRedrawHeader = true;

  void _loadPreferences() async {
    _savedProfile = await Profile.loadProfile();
    setState(() {});
  }

  @override
  initState() {
    super.initState();
    _loadPreferences();
  }

  void _buildDatesHeader(ScrollController controller) {
    for (var k in scheduleDaysIndexes.keys) {
      var text = DateFormat('dd MMMM', 'ru').format(k);

      scheduleDates.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2.0),
          child: ActionChip(
            padding: EdgeInsets.all(8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40.0),
              side: scheduleDaysIndexes[k] == scheduleCurrentDayIndex
                  ? BorderSide(color: Colors.redAccent)
                  : BorderSide(color: Colors.transparent),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
            label: Text(text),
            onPressed: () {
              // jump to date
              var pxOffset = 0.0;

              var i = 0;
              _keys.forEach((index, key) {
                if (i == scheduleDaysIndexes[k]) return;

                var itemRect = RectGetter.getRectFromKey(key);
                pxOffset += itemRect.height;

                i++;
              });

              controller.jumpTo(pxOffset);
            },
          ),
        ),
      );
    }

    needsRedrawHeader = !needsRedrawHeader;
  }

  @override
  Widget build(BuildContext context) {
    var controller = ScrollController();

    if (scheduleWidgetsList.isEmpty) _buildSchedule();
    if (scheduleDates.isEmpty || needsRedrawHeader) _buildDatesHeader(
        controller);

    var listViewKey = RectGetter.createGlobalKey();

    List<int> getVisible() {
      var rect = RectGetter.getRectFromKey(listViewKey);
      var _items = <int>[];
      _keys.forEach((index, key) {
        var itemRect = RectGetter.getRectFromKey(key);
        if (itemRect != null &&
            !(itemRect.top > rect.bottom || itemRect.bottom < rect.top))
          _items.add(index);
      });

      return _items;
    }


    return Container(
      decoration: AppStyles.BACKGROUND_DECORATION,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              key: key,
              children: scheduleDates,
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ),
          Expanded(
            child: NotificationListener<ScrollUpdateNotification>(
              onNotification: (_) {
                var visibleItems = getVisible();
                var fvi = visibleItems.first;
                var sdiv = scheduleDaysIndexes.values.toList();

                var old = scheduleCurrentDayIndex;

                for (var i = 0; i < scheduleDaysIndexes.length; i++) {
                  if (i == scheduleDaysIndexes.length - 1) {
                    scheduleCurrentDayIndex = sdiv[i];
                    break;
                  }

                  if (fvi >= sdiv[i] && fvi < sdiv[i + 1]) {
                    scheduleCurrentDayIndex = sdiv[i];
                    break;
                  }
                }

                //todo Redraw top panel
                if (scheduleCurrentDayIndex != old) {
                  //scheduleDates.forEach((widget) {
                  //widget.
                  //});
                }

                return true;
              },
              child: RectGetter(
                key: listViewKey,
                child: ListView.builder(
                  controller: controller,
                  itemCount: scheduleWidgetsList.length,
                  itemBuilder: (context, index) {
                    _keys[index] = RectGetter.createGlobalKey();

                    return RectGetter(
                      key: _keys[index],
                      child: scheduleWidgetsList[index],
                    );
                  },
                ),
              ),
            ),
          ),
        ],
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
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: _ITEM_PADDING_VERTICAL,
            ),
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

  Widget _buildDateHeader(DateTime date) =>
      Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16.0,
        ),
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
        padding: EdgeInsets.only(
          left: _LIST_PADDING_HORIZONTAL,
        ),
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

  Widget _buildTimeHeader(DateTime time) =>
      Text(
        DateFormat('HH:mm', 'ru').format(time),
        style: const TextStyle(
          color: Colors.blue,
          fontSize: 22,
        ),
      );
}

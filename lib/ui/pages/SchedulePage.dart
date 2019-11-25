import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:proektoria/data/DirectionType.dart';
import 'package:proektoria/data/ForumData.dart';
import 'package:proektoria/data/ForumEvent.dart';
import 'package:proektoria/data/ForumEventType.dart';
import 'package:proektoria/data/Profile.dart';
import 'package:proektoria/ui/controls/EventCard.dart';
import 'package:proektoria/ui/controls/libs/numberpicker.dart';
import 'package:proektoria/ui/styles/AppColors.dart';
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

  final listController = ScrollController();
  final listKey = RectGetter.createGlobalKey();

  final scheduleWidgetsList = ValueNotifier<List<Widget>>([]);

  final rectGetterKeys = <GlobalKey>[];

  final startDaysIndexes = Map<DateTime, int>();
  final currentDay = ValueNotifier<DateTime>(null);

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
    if (scheduleWidgetsList.value.isEmpty) {
      _buildSchedule();
    }

    return Column(
      children: <Widget>[
        _buildDatesRow(),
        Expanded(
          child: ValueListenableBuilder<List<Widget>>(
            valueListenable: scheduleWidgetsList,
            builder: (context, value, child) {
              return Container(
                width: double.infinity,
                height: double.infinity,
                decoration: AppStyles.DEFAULT_BACKGROUND_DECORATION,
                child: NotificationListener<ScrollUpdateNotification>(
                  onNotification: (notification) => _onScheduleScroll(),
                  child: RectGetter(
                    key: listKey,
                    child: SingleChildScrollView(
                      controller: listController,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: value,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  int _t = 0;

  Widget _buildDatesRow() {
    return NumberPicker.horizontal(
      initialValue: _t,
      minValue: 0,
      maxValue: 5,
      onChanged: (i) {
        _t = i;
        setState(() {});
      },
    );

    final dateChips = List.generate(
      startDaysIndexes.keys.length,
          (i) {
        final currentDay = startDaysIndexes.keys.elementAt(i);

        return RawChip(
          label: Text(
            DateFormat('dd MMMM', 'ru').format(currentDay),
            textAlign: TextAlign.center,
          ),
          onPressed: () {},
        );
      },
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: dateChips,
    );
  }

  bool _onScheduleScroll() {
    print(getVisible());
    return true;
  }

  List<int> getVisible() {
    /// First, get the rect of ListView, and then traver the _keys
    /// get rect of each item by keys in _keys, and if this rect in the range of ListView's rect,
    /// add the index into result list.
    var rect = RectGetter.getRectFromKey(listKey);
    var _items = <int>[];
    for (int i = 0; i < rectGetterKeys.length; i++) {
      var key = rectGetterKeys[i];
      var itemRect = RectGetter.getRectFromKey(key);
      if (itemRect != null &&
          !(itemRect.top > rect.bottom || itemRect.bottom < rect.top))
        _items.add(i);
    }

    /// so all visible item's index are in this _items.
    return _items;
  }

  void _buildSchedule() {
    if (_savedProfile == null) return;

    List<Widget> t = [];

    int c = 0;

    for (int d = 0; d < ForumData.schedule.length; d++) {
      var scheduleForDay = ForumData.schedule[d];

      // Добавляем перед расписание шапку с датой
      var currentDate = scheduleForDay[0].start;

      rectGetterKeys.add(RectGetter.createGlobalKey());
      t.add(RectGetter(
        key: rectGetterKeys[rectGetterKeys.length - 1],
        child: _buildDateHeader(currentDate),
      ));
      startDaysIndexes.putIfAbsent(currentDate, () => c);
      c++;

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
        if (event.type != DirectionType.NONE &&
            event.type != _savedProfile &&
            event.eventType != ForumEventType.LESSON) {
          continue;
        }

        DateTime nextEventStart;
        if (nextEvent != null) {
          nextEventStart = nextEvent.start;
        }

        rectGetterKeys.add(RectGetter.createGlobalKey());
        t.add(
          RectGetter(
            key: rectGetterKeys[rectGetterKeys.length - 1],
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: _ITEM_PADDING_VERTICAL),
              child: _buildStickyHeaderItem(
                content: EventCard(event, ForumData.today),
                startTime: event.start,
                endTime: event.end != nextEventStart ? event.end : null,
              ),
            ),
          ),
        );

        c++;
      }
    }

    scheduleWidgetsList.value = t;
  }

  void _jumpToIndex(int index) {
    var offset = 0.0;

    for (int i = 0; i < index; i++) {
      offset += RectGetter
          .getRectFromKey(rectGetterKeys[i])
          .height;
    }

    listController.jumpTo(offset);
  }

  Widget _buildDateHeader(DateTime date) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Center(
        child: Text(
          DateFormat('dd MMMM', 'ru').format(date).toUpperCase(),
          style: TextStyle(
            fontSize: 21.0,
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

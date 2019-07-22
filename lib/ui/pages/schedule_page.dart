import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
    return Scaffold(
      body: ListView.builder(
          itemCount: 15,
          itemBuilder: (context, index) {
            if (index % 5 == 0)
              return _buildDateHeader(DateTime.now());
            else
              return _buildStickyHeaderItem(
                DateTime.now(),
                Text(
                    "1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890"),
              );
          }),
    );
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
            child: Text(
              DateFormat('HH:mm', 'ru').format(time),
              style: const TextStyle(
                color: Colors.teal,
                fontSize: 22,
              ),
            ),
          ),
          content: content,
        ),
      );
}

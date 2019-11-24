import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:proektoria/data/DirectionType.dart';
import 'package:proektoria/data/ForumData.dart';
import 'package:proektoria/data/ForumDirection.dart';
import 'package:proektoria/data/ForumEvent.dart';
import 'package:proektoria/data/Profile.dart';
import 'package:proektoria/ui/controls/EventCard.dart';
import 'package:proektoria/ui/controls/pages/home/ForumDirectionCardClipper.dart';
import 'package:proektoria/ui/styles/AppColors.dart';
import 'package:proektoria/ui/styles/AppStyles.dart';

class HomePage extends StatefulWidget {
  HomePage();

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DirectionType _savedProfile;

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
    final today = ForumData.today.millisecondsSinceEpoch;

    var currentEvents = ForumData.getCurrentEvents(today);
    final nextEvent = ForumData.getNextEvent(today);

    return Container(
      decoration: AppStyles.DEFAULT_BACKGROUND_DECORATION,
      child: ListView(
        padding: EdgeInsets.all(24),
        children: <Widget>[
          // Текущая дата
          _buildHeader(),
          SizedBox(height: 24),

          // Направление
          _buildSubHeader('Ваше направление'),
          SizedBox(height: 12),
          _buildCurrentDirectionCard(),
          SizedBox(height: 12),

          // Текущие события
          if (currentEvents.isNotEmpty)
            _buildSubHeader('Текущие события'),
          if (currentEvents.isNotEmpty)
            SizedBox(height: 12),
          if (currentEvents.isNotEmpty)
            _buildCurrentEventsCard(currentEvents),
          if (currentEvents.isNotEmpty)
            SizedBox(height: 12),

          // Следующее событие
          if (nextEvent != null)
            _buildSubHeader('Следующее событие'),
          if (nextEvent != null)
            SizedBox(height: 12),
          if (nextEvent != null)
            _buildNextEventCard(nextEvent),
          if (nextEvent != null)
            SizedBox(height: 12),

          // Совет
          _buildSubHeader('Информация'),
          SizedBox(height: 12),
          _buildHelperCard(),
          SizedBox(height: 12),

          _buildCard(_buildMotivationCard()),
        ],
      ),
    );
  }

  //region Общие

  Widget _buildSubHeader(String text) {
    return Text(
      text,
      style: TextStyle(
          color: AppColors.SECOND_ACCENT,
          fontSize: AppStyles.CARD_TITLE_SIZE,
          fontWeight: FontWeight.w500),
    );
  }

  Widget _buildCard(Widget content) {
    return Container(
      decoration: AppStyles.CARD_DECORATION,
      padding: AppStyles.CARD_PADDING,
      child: content,
    );
  }

  //endregion

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Сегодня',
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 2),
        Text(
          DateFormat('dd MMMM', 'ru').format(ForumData.today),
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  //region Текущее направление

  Widget _buildCurrentDirectionCard() {
    const cardHeight = 90.0;

    // Ничего не возвращаем пока не будут загружены настройки профиля
    if (_savedProfile == null) return Container();

    final direction = ForumData.getForumDirectionByType(_savedProfile);

    final directionName = direction.name;

    return Material(
      child: InkWell(
        onTap: () =>
            Navigator.pushNamed(context, '/student_direction_selector'),
        child: Container(
          decoration: AppStyles.CARD_DECORATION,
          height: cardHeight,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              _buildDirectionIcon(direction),
              SizedBox(width: 16),
              _buildDescription(directionName),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDirectionIcon(ForumDirection direction) {
    const iconSize = 90.0;

    return ClipPath(
      clipper: CurvedBottomClipper(),
      child: Container(
        height: iconSize,
        width: iconSize,
        decoration: BoxDecoration(
          borderRadius: AppStyles.CARD_BORDER_RADIUS,
          color: direction.primaryColor,
        ),
        child: Container(
          width: 80.0,
          height: 80.0,
          padding: const EdgeInsets.all(20),
          child: Center(child: SvgPicture.asset(
            direction.pathToIcon,
            width: 36,
            height: 36,
          ),),
        ),
      ),
    );
  }

  Widget _buildDescription(String directionName) {
    return Flexible(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            directionName,
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 4),
          Text(
            'Нажмите, чтобы сменить направление',
            style: TextStyle(
              fontSize: 12,
              color: Color(0x99000000),
            ),
          )
        ],
      ),
    );
  }

  //endregion

  Widget _buildCurrentEventsCard(List<ForumEvent> currentEvents) {
    var currentEventsList = <Widget>[];
    currentEvents.forEach((event) {
      if (currentEventsList.isNotEmpty) currentEventsList.add(
          SizedBox(height: 8));
      currentEventsList.add(
        EventCard(
          event,
          ForumData.today,
          showCurrentLabel: false,
        ),
      );
    });

    return Column(children: currentEventsList);
  }

  Widget _buildNextEventCard(ForumEvent nextEvent) {
    return EventCard(
      nextEvent,
      ForumData.today,
      showCurrentLabel: false,
    );
  }

  Widget _buildHelperCard() {
    final cardHeight = 100.0;

    final decorationIcon = ClipPath(
      clipper: CurvedBottomClipper(),
      child: Container(
        height: cardHeight,
        width: 60,
        decoration: BoxDecoration(
          borderRadius: AppStyles.CARD_BORDER_RADIUS,
          color: AppColors.SECOND_ACCENT,
        ),
        child: Container(
          width: 60.0,
          height: cardHeight,
          child: Center(
            child: Icon(
              OMIcons.help,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );

    return Material(
      child: InkWell(
        onTap: () =>
            Navigator.pushNamed(context, '/student_direction_selector'),
        child: Container(
          height: cardHeight,
          decoration: AppStyles.CARD_DECORATION,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              decorationIcon,
              SizedBox(width: 8),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'Для решения вопросов в рамках форума обращайтесь с вопросами к Кураторам и Организаторам.',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMotivationCard() {
    return IntrinsicHeight(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(
            'assets/i_knowledge.svg',
            width: 318,
            height: 216,
            semanticsLabel: 'Социальные сети',
          ),
          SizedBox(height: 12),
          Text(
            'Знание украшает человека',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

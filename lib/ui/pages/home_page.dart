import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:proektoria/data/direction_type.dart';
import 'package:proektoria/data/forum_data.dart';
import 'package:proektoria/data/profile.dart';
import 'package:proektoria/ui/controls/event_card.dart';
import 'package:proektoria/ui/controls/pages/home/ForumDirectionCardClipper.dart';
import 'package:proektoria/ui/controls/pages/home/InvitationToNextForum.dart';
import 'package:proektoria/ui/styles/AppStyles.dart';

class HomePage extends StatefulWidget {
  final DateTime day;

  HomePage(this.day);

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
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
  Widget build(BuildContext context) =>
      _isForumDay(widget.day)
          ? buildHomePage(context)
          : InvitationToNextForum();

  Widget buildHomePage(BuildContext context) {
    var dirTitle = Text("Ваше направление",
        style: TextStyle(fontSize: AppStyles.CARD_TITLE_SIZE));

    var dirCard = Container(
      decoration: AppStyles.CARD_DECORATION,
      child: _buildCurrentDirectionCard(),
    );

    var lastEventTitle = Text(
      "Последние события",
      style: TextStyle(fontSize: AppStyles.CARD_TITLE_SIZE),
    );

    //todo
    var currentEvent = EventCard(ForumData.schedule[0][0], ForumData.today);

    //todo
    var nextEvent = EventCard(ForumData.schedule[0][1], ForumData.today);

    var infoTitle = Text(
      "Информация",
      style: TextStyle(fontSize: AppStyles.CARD_TITLE_SIZE),
    );

    return Container(
      decoration: AppStyles.BACKGROUND_DECORATION,
      child: ListView(
        padding: EdgeInsets.all(18),
        shrinkWrap: true,
        children: <Widget>[
          _buildToday(),
          SizedBox(height: 12),
          _buildDaysUntilEnd(),
          SizedBox(height: 12),
          dirTitle,
          SizedBox(height: 12),
          dirCard,
          SizedBox(height: 12),
          lastEventTitle,
          SizedBox(height: 12),
          currentEvent,
          SizedBox(height: 12),
          nextEvent,
          SizedBox(height: 12),
          infoTitle,
          SizedBox(height: 12),
          _buildCard(Text("Супер важный совет")),
          SizedBox(height: 12),
          _buildCard(Text("Есть вопросы - пиздуй к организаторам")),
          SizedBox(height: 12),
          _buildCard(_buildMotivationCard()),
        ],
      ),
    );
  }

  bool _isForumDay(DateTime day) {
    var firstEvent = ForumData.schedule.first.first;
    var lastEvent = ForumData.schedule.last.last;

    var dts = day.millisecondsSinceEpoch;

    return firstEvent.start.millisecondsSinceEpoch <= dts &&
        lastEvent.end.millisecondsSinceEpoch > dts;
  }

  Widget _buildCard(Widget content) {
    return Container(
      decoration: AppStyles.CARD_DECORATION,
      padding: AppStyles.CARD_PADDING,
      child: content,
    );
  }

  Widget _buildDaysUntilEnd() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text("Осталось"),
        SizedBox(width: 8),
        Text(
          "2 дня",
          style: TextStyle(fontSize: AppStyles.TEXT_TITLE_SIZE),
        )
      ],
    );
  }

  Widget _buildToday() {
    return Text(
      "13 ноября",
      style: TextStyle(fontSize: AppStyles.TEXT_TITLE_SIZE),
    );
  }

  Widget _buildCurrentDirectionCard() {
    const cardHeight = 80.0;

    final direction = ForumData.getForumDirectionByType(_savedProfile);
    final directionName = direction.name;
    final directionColor = direction.primaryColor;

    final directionIconWidget = Center(
      child: const Placeholder(
        color: Colors.white,
        fallbackHeight: cardHeight,
        fallbackWidth: cardHeight,
      ),
    );

    return Material(
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          //Navigator.pushNamed(context, '/student_direction_selector');
        },
        child: Container(
          height: cardHeight,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              ClipPath(
                clipper: CurvedBottomClipper(),
                child: Container(
                  width: cardHeight,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: AppStyles.CARD_BORDER_RADIUS,
                    color: directionColor,
                  ),
                  child: directionIconWidget,
                ),
              ),
              SizedBox(width: 16),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    directionName,
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Нажмите, чтобы сменить направление",
                    style: TextStyle(fontSize: 12, color: Color(0x99000000)),
                  )
                ],
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
            'assets/i_illustration.svg',
            width: 318,
            height: 216,
            semanticsLabel: 'Социальные сети',
          ),
          SizedBox(height: 12),
          Text("Знание украшает человека"),
        ],
      ),
    );
  }
}

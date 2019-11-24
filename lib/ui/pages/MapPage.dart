import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:proektoria/ui/styles/AppColors.dart';
import 'package:proektoria/ui/styles/AppStyles.dart';

class MapPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MapPageState();
  }
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppStyles.DEFAULT_BACKGROUND_DECORATION,
      child: ListView(
        padding: EdgeInsets.all(24),
        children: <Widget>[
          _buildHeader(),
          SizedBox(height: 24),
          _buildFloorView(
            "Этаж 1",
            "assets/floors/floor_1.jpg",
            160.0 * 3.5,
            99.0 * 3.5,
          ),
          SizedBox(height: 12),
          _buildFloorView(
            "Этаж 2",
            "assets/floors/floor_2.jpg",
            150 * 3.5,
            116 * 3.5,
          ),
          SizedBox(height: 12),
          _buildFloorView(
            "Этаж 3",
            "assets/floors/floor_3.jpg",
            143 * 3.5,
            98 * 3.5,
          ),
          SizedBox(height: 12),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Text(
      "Карты",
      style: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildFloorView(String title,
      String pathToAsset,
      double width,
      double height,) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildSubHeader(title),
        SizedBox(height: 12),
        Container(
          decoration: AppStyles.CARD_DECORATION,
          padding: AppStyles.CARD_PADDING,
          height: height,
          width: width,
          child: ClipRect(
            child: PhotoView.customChild(
              child: Container(
                decoration: const BoxDecoration(color: Colors.white),
                child: Image.asset(pathToAsset),
              ),
              initialScale: 1.0,
              minScale: 1.0,
              maxScale: 3.5,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildSubHeader(String text) {
    return Text(
      text,
      style: TextStyle(
        color: AppColors.SECOND_ACCENT,
        fontSize: AppStyles.CARD_TITLE_SIZE,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

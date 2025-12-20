import 'package:flutter/material.dart';
import 'package:islami/core/resources/AppColors.dart';

class PrayTimeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 301,
      padding: EdgeInsets.only(top: 14, left: 7, right: 7),
      decoration: BoxDecoration(
        color: AppColors.gold,
        borderRadius: BorderRadius.circular(60),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildTopLabel("16 Jul,\n2024"),
                  _buildTopLabel("09 Muh,\n1446"),
                ],
              ),
              _buildMainHeader("Pray Time", "Tuesday"),
            ],
          ),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildTimeCard("Sunrise", "04:11", false),
                _buildTimeCard("Fajr", "04:04", false),
                _buildTimeCard("Dhuhr", "01:01", false),
                _buildTimeCard("ASR", "04:38", true),
                _buildTimeCard("Maghrib", "07:57", false),
                _buildTimeCard("Isha", "09:30", false),
              ],
            ),
          ),

          SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 24),
                Text(
                  "Next Pray - 02:32",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black87,
                  ),
                ),
                Icon(Icons.volume_off, color: Colors.black87),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopLabel(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 35, vertical: 10),
      decoration: BoxDecoration(
        color: Color(0xFF856B3F),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white, fontSize: 14),
      ),
    );
  }

  Widget _buildMainHeader(String title, String day) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 55, vertical: 30),
      decoration: BoxDecoration(
        color: AppColors.gold,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
          topLeft: Radius.circular(100),
          topRight: Radius.circular(100),
        ),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
          ),
          Text(
            day,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeCard(String name, String time, bool isSelected) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      padding: EdgeInsets.symmetric(vertical: 19, horizontal: 17),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          transform: GradientRotation(152.84 * 3.14159 / 180),
          colors: [Color(0xFF202020), Color(0xFFB19768)],
          stops: [0.0701, 0.9621],
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Text(name, style: TextStyle(color: Colors.white70, fontSize: 12)),
          SizedBox(height: 5),
          Text(
            time,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text("PM", style: TextStyle(color: Colors.white60, fontSize: 10)),
        ],
      ),
    );
  }
}

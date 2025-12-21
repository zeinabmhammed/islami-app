import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class PrayTimeWidget extends StatefulWidget {
  const PrayTimeWidget({super.key});

  @override
  State<PrayTimeWidget> createState() => _PrayTimeWidgetState();
}

class _PrayTimeWidgetState extends State<PrayTimeWidget> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> prayers = [
      {"name": "Sunrise", "time": "04:11"},
      {"name": "Fajr", "time": "04:04"},
      {"name": "Dhuhr", "time": "01:01"},
      {"name": "Asr", "time": "04:38"},
      {"name": "Maghrib", "time": "07:57"},
      {"name": "Isha", "time": "09:30"},
    ];
    return Center(
      child: Container(
        width: 400,
        height: 301,
        decoration: BoxDecoration(
          color: const Color(0xFF856B3F),
          borderRadius: BorderRadius.circular(40),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(35)),
              child: Image.asset(
                'assets/images/prayyy.png',
                height: 350,
                fit: BoxFit.fill,
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 14),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTopLabel("16 Jul,\n2024"),
                      _buildMainHeader("Pray Time", "Tuesday"),
                      _buildTopLabel("09 Muh,\n1446"),
                    ],
                  ),

                  const SizedBox(height: 15),

               CarouselSlider.builder(
                      itemCount: prayers.length,

               itemBuilder: (context, index, realIndex) {
                        final prayer = prayers[index];
                        final isActive = index == currentIndex;

                        Size size = MediaQuery.of(context).size;
                        return buildPrayItem(
                          prayer["time"]!,
                          prayer["name"]!,
                          isActive,
                        );
               },
                      options: CarouselOptions(
                        height: 120,
                        viewportFraction: 0.29,
                        enlargeCenterPage: true,
                        enlargeStrategy: CenterPageEnlargeStrategy.height,
                        autoPlay: true,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        autoPlayInterval: const Duration(seconds: 3),
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                      ),
                    ),


                  const SizedBox(height: 15),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        SizedBox(width: 24),
                        Text(
                          "Next Pray - 02:32",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                        Icon(Icons.volume_off, color: Colors.black),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopLabel(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFF856B3F),
        borderRadius: BorderRadius.circular(70),
      ),
      child: Text(
        text,
        textAlign: TextAlign.start,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget buildPrayItem(
      String prayTime,
      String prayName,
      bool isActive,
      ) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: 90,
      margin:EdgeInsets.only(top: 10) ,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xff202020), Color(0xFFB19768)],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            prayName,
            style: TextStyle(
              color: Colors.white70,
              fontSize: isActive ? 14 : 5,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            prayTime,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: isActive ? 28 : 18,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            "PM",
            style: TextStyle(
              color: Colors.white60,
              fontSize: isActive ? 14 : 5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainHeader(String title, String day) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Color(0XFF202020),
          ),
        ),
        Text(
          day,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Color(0xff202020),
          ),
        ),
      ],
    );
  }
}

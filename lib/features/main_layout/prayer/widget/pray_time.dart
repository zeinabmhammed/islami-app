import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:intl/intl.dart';
import 'package:islami/data/dataSource/time_prayer_data_source/time_prayer_remote_data_source_impl.dart';
import 'package:islami/data/model/Prayer_model.dart';

class PrayTimeWidget extends StatefulWidget {
  const PrayTimeWidget({super.key});

  @override
  State<PrayTimeWidget> createState() => _PrayTimeWidgetState();
}

class _PrayTimeWidgetState extends State<PrayTimeWidget> {
  int currentIndex = 0;
  late Future<PrayerModel> _futurePrayers;

  @override
  void initState() {
    super.initState();
    _futurePrayers = TimePrayerRemoteDataSourceImpl().getPrayerTimes();
  }
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PrayerModel>(
      future: _futurePrayers,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        } else if (!snapshot.hasData || snapshot.data?.data?.timings == null) {
          return const Center(child: Text("No prayer times found"));
        }

        final timings = snapshot.data!.data!.timings!;
        final hijri = snapshot.data!.data?.date?.hijri;

        final prayers = [
          {"name": "Fajr", "time": timings.fajr ?? "--"},
          {"name": "Dhuhr", "time": timings.dhuhr ?? "--"},
          {"name": "Asr", "time": timings.asr ?? "--"},
          {"name": "Maghrib", "time": timings.maghrib ?? "--"},
          {"name": "Isha", "time": timings.isha ?? "--"},
        ];

        final nextPrayer = _getNextPrayer(prayers);

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
                  padding: const EdgeInsets.symmetric(
                    horizontal: 11,
                    vertical: 14,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildTopLabel(
                            DateFormat("dd MMM,\nyyyy").format(DateTime.now()),
                          ),

                          _buildMainHeader(
                            "Pray Time",
                            DateFormat("EEEE").format(DateTime.now()),
                          ),

                          Column(
                            children: [
                              _buildTopLabel(
                                "${hijri?.day ?? "--"} ${hijri?.month?.en ?? "--"}",
                              ),
                              Text(
                                hijri?.year ?? "--",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      CarouselSlider.builder(
                        itemCount: prayers.length,
                        itemBuilder: (context, index, realIndex) {
                          final prayer = prayers[index];
                          final isActive = index == currentIndex;
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
                        padding: const EdgeInsets.symmetric(
                          horizontal: 11,
                          vertical: 14,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(width: 24),
                            Text(
                              "Next Pray - ${nextPrayer["name"]} ${nextPrayer["time"]}",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                            const Icon(Icons.volume_off, color: Colors.black),
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
      },
    );
  }

  Map<String, String> _getNextPrayer(List<Map<String, String>> prayers) {
    final now = TimeOfDay.now();
    for (final prayer in prayers) {
      final timeParts = prayer["time"]!.split(":");
      final prayerTime = TimeOfDay(
        hour: int.parse(timeParts[0]),
        minute: int.parse(timeParts[1]),
      );
      if (_isAfter(now, prayerTime)) {
        return prayer;
      }
    }
    return prayers.first;
  }

  bool _isAfter(TimeOfDay now, TimeOfDay prayerTime) {
    return now.hour < prayerTime.hour ||
        (now.hour == prayerTime.hour && now.minute < prayerTime.minute);
  }

  String formatPrayerTime(String time) {
    try {
      final parts = time.split(":");
      final hour = int.parse(parts[0]);
      final minute = int.parse(parts[1]);

      final dateTime = DateTime(2025, 1, 1, hour, minute);

      return DateFormat("HH:mm").format(dateTime);
    } catch (e) {
      return time;
    }
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

  Widget buildPrayItem(String prayTime, String prayName, bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: 90,
      margin: const EdgeInsets.only(top: 10),
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
          Text(
            prayTime,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: isActive ? 25 : 15,
            ),
          ),
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

import 'package:islami/data/model/Prayer_model.dart';

abstract class TimePrayerRemoteDataSource {
  Future<PrayerModel> getPrayerTimes();
}

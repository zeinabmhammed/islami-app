import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:islami/data/dataSource/time_prayer_data_source/time_prayer_remote_data_source.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../../model/Prayer_model.dart';

class TimePrayerRemoteDataSourceImpl implements TimePrayerRemoteDataSource {
  final Dio dio;

  TimePrayerRemoteDataSourceImpl()
    : dio = Dio()
        ..interceptors.add(
          PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            responseBody: true,
            responseHeader: false,
            error: true,
            compact: true,
            maxWidth: 90,
          ),
        );

  @override
  Future<PrayerModel> getPrayerTimes() async {
    String date = DateFormat("dd-MM-yyyy").format(DateTime.now());
    try {
      final response = await dio.get(
        'https://api.aladhan.com/v1/timingsByCity/$date?city=cairo&country=egypt',
        queryParameters: {'date': date, 'city': 'cairo', 'country': 'egypt'},
      );

      if (response.statusCode == 200) {
        return PrayerModel.fromJson(response.data);
      } else {
        throw Exception('Failed to load prayer times');
      }
    } catch (e) {
      print(e.toString());
      throw Exception('Failed to load prayer times');
    }
  }
}

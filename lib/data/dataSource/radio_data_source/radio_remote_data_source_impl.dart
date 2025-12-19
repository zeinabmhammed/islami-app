import 'package:dio/dio.dart';
import 'package:islami/data/dataSource/radio_data_source/radio_remote_data_source.dart';
import 'package:islami/data/model/Radio_model.dart';
import 'package:islami/data/model/Reciters_model.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class RadioRemoteDataSourceImpl implements RadioRemoteDataSource {
  final Dio dio;
  RadioRemoteDataSourceImpl()
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
  Future<RadioModel> getRadioData() async {
    final response = await dio.get('https://mp3quran.net/api/v3/radios');
    try {
      if (response.statusCode == 200) {
        return RadioModel.fromJson(response.data);
      } else {
        throw Exception('Failed to load radios data');
      }
    } catch (e) {
      print(e.toString());
      throw Exception('Failed to load radios data');
    }
  }

  @override
  Future<RecitersModel> getRecitersData() async {
    final response = await dio.get('https://mp3quran.net/api/v3/reciters');
    try {
      if (response.statusCode == 200) {
        return RecitersModel.fromJson(response.data);
      } else {
        throw Exception('Failed to load radios data');
      }
    } catch (e) {
      print(e.toString());
      throw Exception('Failed to load radios data');
    }
  }
}

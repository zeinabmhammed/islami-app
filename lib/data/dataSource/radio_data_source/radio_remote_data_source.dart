import 'package:islami/data/model/Radio_model.dart';
import 'package:islami/data/model/Reciters_model.dart';

abstract class RadioRemoteDataSource {
  Future<RadioModel> getRadioData();
  Future<RecitersModel> getRecitersData();
}

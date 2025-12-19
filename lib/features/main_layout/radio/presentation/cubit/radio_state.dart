import 'package:islami/data/model/Radios.dart';

abstract class RadioState {}

class RadioInitialState extends RadioState {}

class RadioLoadingState extends RadioState {}

class RadioEmptyState extends RadioState {
  final String message;
  RadioEmptyState(this.message);
}

class RadioErrorState extends RadioState {
  final String errorMessage;
  RadioErrorState(this.errorMessage);
}

class RadioSuccessState extends RadioState {
  List<Radios> radios;
  RadioSuccessState(this.radios);
}

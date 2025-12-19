import 'package:islami/data/model/Reciters.dart';

abstract class RecitersState {}

class RecitersInitialState extends RecitersState {}

class RecitersLoadingState extends RecitersState {}

class RecitersEmptyState extends RecitersState {
  final String message;
  RecitersEmptyState(this.message);
}

class RecitersErrorState extends RecitersState {
  final String errorMessage;
  RecitersErrorState(this.errorMessage);
}

class RecitersSuccessState extends RecitersState {
  List<Reciters> reciters;
  RecitersSuccessState(this.reciters);
}

import 'package:equatable/equatable.dart';

import '../../../../../data/model/prayer_model.dart';

abstract class PrayerState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PrayerInitial extends PrayerState {}

class PrayerLoading extends PrayerState {}

class PrayerLoaded extends PrayerState {
  final PrayerModel prayerModel;

  PrayerLoaded(this.prayerModel);

  @override
  List<Object?> get props => [prayerModel];
}

class PrayerError extends PrayerState {
  final String message;

  PrayerError(this.message);

  @override
  List<Object?> get props => [message];
}
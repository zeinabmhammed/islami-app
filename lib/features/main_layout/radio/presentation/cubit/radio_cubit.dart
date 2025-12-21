import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/data/dataSource/radio_data_source/radio_remote_data_source.dart';
import 'package:islami/features/main_layout/radio/presentation/cubit/radio_state.dart';

class RadioCubit extends Cubit<RadioState> {
  final RadioRemoteDataSource _dataSource;

  RadioCubit(this._dataSource) : super(RadioInitialState());

  Future<void> getRadioData() async {
    emit(RadioLoadingState());
    final result = await _dataSource.getRadioData();
    try {
      if (result.radios!.isEmpty){
        emit(RadioEmptyState('No data found'));
      }
      emit(RadioSuccessState(result.radios ?? []));
    } catch (e) {
      emit(RadioErrorState(e.toString()));
    }
  }
}

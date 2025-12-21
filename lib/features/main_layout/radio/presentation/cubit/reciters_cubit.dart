import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/data/dataSource/radio_data_source/radio_remote_data_source.dart';
import 'package:islami/features/main_layout/radio/presentation/cubit/reciters_state.dart';


class RecitersCubit extends Cubit<RecitersState> {
  final RadioRemoteDataSource _dataSource;

  RecitersCubit(this._dataSource) : super(RecitersInitialState());

  Future<void> getRecitersData() async {
    emit(RecitersLoadingState());
    final result = await _dataSource.getRecitersData();
    try {
      if (result.reciters!.isEmpty) {
        emit(RecitersEmptyState('No data found'));
      }
      emit(RecitersSuccessState(result.reciters ?? []));
    } catch (e) {
      emit(RecitersErrorState(e.toString()));
    }
  }
}

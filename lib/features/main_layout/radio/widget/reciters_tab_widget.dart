import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/core/widget/common/card_widget.dart';
import 'package:islami/features/main_layout/radio/presentation/cubit/reciters_cubit.dart';
import 'package:islami/features/main_layout/radio/presentation/cubit/reciters_state.dart';

class RecitersTabWidget extends StatefulWidget {
  const RecitersTabWidget({super.key});

  @override
  State<RecitersTabWidget> createState() => _RecitersTabWidgetState();
}

class _RecitersTabWidgetState extends State<RecitersTabWidget> {
  @override
  void initState() {
    super.initState();
    context.read<RecitersCubit>().getRecitersData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecitersCubit, RecitersState>(
      builder: (context, state) {
        if (state is RecitersLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is RecitersErrorState) {
          return Center(child: Text(state.errorMessage));
        } else if (state is RecitersSuccessState) {
          return ListView.builder(
            padding: const EdgeInsets.only(left: 10,right: 10),
            itemCount: state.reciters.length,
            itemBuilder: (context, index) {
              final reciter = state.reciters[index];
              final serverUrl = reciter.moshaf?.isNotEmpty == true
                  ? reciter.moshaf![0].server ?? ""
                  : "";

              return AudioCard(title: reciter.name ?? "", url: serverUrl);
            },
          );
        } else if (state is RecitersEmptyState) {
          return Center(child: Text(state.message));
        }
        return const SizedBox();
      },
    );
  }
}

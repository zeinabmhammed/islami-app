import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/core/widget/common/card_widget.dart';
import 'package:islami/features/main_layout/radio/presentation/cubit/radio_cubit.dart';
import 'package:islami/features/main_layout/radio/presentation/cubit/radio_state.dart';

class RadioTabWidget extends StatefulWidget {
  const RadioTabWidget({super.key});

  @override
  State<RadioTabWidget> createState() => _RadioTabWidgetState();
}

class _RadioTabWidgetState extends State<RadioTabWidget> {
  @override
  void initState() {
    super.initState();
    context.read<RadioCubit>().getRadioData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RadioCubit, RadioState>(
      builder: (context, state) {
        if (state is RadioLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is RadioErrorState) {
          return Center(child: Text(state.errorMessage));
        } else if (state is RadioSuccessState) {
          return ListView.builder(
            padding: const EdgeInsets.only(left: 10,right: 10),
            itemCount: state.radios.length,
            itemBuilder: (context, index) {
              final radio = state.radios[index];
              return AudioCard(title: radio.name ?? "", url: radio.url ?? "");
            },
          );
        } else if (state is RadioEmptyState) {
          return Center(child: Text(state.message));
        }
        return const SizedBox();
      },
    );
  }
}

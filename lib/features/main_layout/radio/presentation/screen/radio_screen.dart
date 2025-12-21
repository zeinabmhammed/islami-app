import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/core/resources/AppColors.dart';
import 'package:islami/data/dataSource/radio_data_source/radio_remote_data_source_impl.dart';
import 'package:islami/features/main_layout/radio/presentation/cubit/radio_cubit.dart';
import 'package:islami/features/main_layout/radio/presentation/cubit/reciters_cubit.dart';
import 'package:islami/features/main_layout/radio/widget/radio_tab_widget.dart';
import 'package:islami/features/main_layout/radio/widget/reciters_tab_widget.dart';

class RadioScreen extends StatefulWidget {
  const RadioScreen({super.key});

  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  final ValueNotifier<String> selectedTab = ValueNotifier("radio");

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              RadioCubit(RadioRemoteDataSourceImpl()..getRadioData()),
        ),
        BlocProvider(
          create: (context) =>
              RecitersCubit(RadioRemoteDataSourceImpl()..getRecitersData()),
        ),
      ],
      child: Column(
        children: [
          const SizedBox(height: 20),
          _buildTabBar(),
          const SizedBox(height: 20),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: selectedTab,
              builder: (context, value, child) {
                return value == 'radio'
                    ? const RadioTabWidget()
                    : const RecitersTabWidget();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return ValueListenableBuilder(
      valueListenable: selectedTab,
      builder: (context, value, child) {
        return Row(
          children: [
            _tabItem("radio", "Radio", value),
            const SizedBox(width: 15),
            _tabItem("reciters", "Reciters", value),
          ],
        );
      },
    );
  }

  Widget _tabItem(String id, String title, String selected) {
    final bool isSelected = (selected == id);
    return Expanded(
      child: GestureDetector(
        onTap: () => selectedTab.value = id,
        child: Container(
          height: 45,
          decoration: BoxDecoration(
            color: isSelected ? AppColors.gold : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: isSelected ? AppColors.black : AppColors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

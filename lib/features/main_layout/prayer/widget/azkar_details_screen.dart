import 'package:flutter/material.dart';
import 'package:islami/data/model/azkar_model.dart';

import 'package:flutter/material.dart';
import 'package:islami/data/model/azkar_model.dart';

class AzkarDetailScreen extends StatelessWidget {
  final String azkarType;
  final String title;

  const AzkarDetailScreen({super.key, required this.azkarType, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: FutureBuilder<List<AzkarModel>>(
        future: AzkarModel.loadAzkarSection(azkarType),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("لا يوجد أذكار"));
          }

          final azkarList = snapshot.data!;
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: azkarList.length,
            separatorBuilder: (_, __) => const Divider(),
            itemBuilder: (context, index) {
              final azkar = azkarList[index];
              return Card(
                color: const Color(0xFF202020),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(azkar.content ?? "",
                          style: const TextStyle(fontSize: 18, color: Colors.white)),
                      const SizedBox(height: 8),
                      Text("التكرار: ${azkar.count ?? "--"}",
                          style: const TextStyle(color: Colors.amber)),
                      if (azkar.description?.isNotEmpty == true)
                        Text(azkar.description!,
                            style: const TextStyle(color: Colors.grey)),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
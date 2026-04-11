import 'dart:math';
import 'package:dompet_iq/pages/chart_detail_page.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../theme_app.dart';

class DonutChart extends StatelessWidget {
  DonutChart({super.key});

  final List<Map<String, dynamic>> data = [
    {"title": "Makan dan Minum", "value": 1500000},
    {"title": "Kos", "value": 600000},
    {"title": "Transportasi", "value": 550000},
    {"title": "Internet", "value": 200000},
    {"title": "Skincare", "value": 150000},
    {"title": "Entertaint", "value": 120000},
  ];

  // Generate warna random
  List<Color> generateColors(int length) {
    final random = Random();
    return List.generate(
      length,
      (_) => Color.fromARGB(
        255,
        80 + random.nextInt(100),
        80 + random.nextInt(100),
        80 + random.nextInt(100),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = generateColors(data.length);

    final total = data.fold<int>(
      0,
      (sum, item) => sum + (item["value"] as int),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: SizedBox(
            height: 300,
            width: 300,
            child: Stack(
              alignment: Alignment.center,
              children: [
                PieChart(
                  PieChartData(
                    startDegreeOffset: -180,
                    sectionsSpace: 2,
                    centerSpaceRadius: 80, // ini bikin donut
                    sections: List.generate(data.length, (index) {
                      final item = data[index];
                      final percentage = (item["value"] / total * 100)
                          .toStringAsFixed(1);

                      return PieChartSectionData(
                        color: colors[index],
                        value: item["value"].toDouble(),
                        radius: 70,
                        title:
                            "$percentage%", // kosongkan (kita tampilkan di luar)
                      );
                    }),
                  ),
                ),

                // Total di tengah
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("IDR", style: poppinsMedium16),
                    Text("$total", style: poppinsBold18),
                  ],
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 20),

        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 20),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(color: beige),
          child: Row(
            children: [
              Icon(Icons.category, color: darkText),
              SizedBox(width: 8),
              Text(
                "${data.length.toString()} Category",
                style: poppinsMedium16.copyWith(color: darkText),
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(data.length, (index) {
            final item = data[index];
            final percentage = (item["value"] / total * 100).toStringAsFixed(1);
            final persenToDouble = item["value"] / total;

            return InkWell(
              onTap: () {
                context.pushNamed(ChartDetailPage.routeName);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "($percentage%) ${item['title']}",
                            style: poppinsRegular14,
                          ),
                          LinearPercentIndicator(
                            backgroundColor: Colors.transparent,
                            lineHeight: 16.0,
                            progressColor: colors[index],
                            percent: persenToDouble,
                            padding: EdgeInsets.only(top: 8),
                            barRadius: Radius.circular(20),
                            animation: true,
                            animationDuration: 1000,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Text(item["value"].toString(), style: poppinsRegular14),
                        Icon(Icons.chevron_right, color: greyText),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}

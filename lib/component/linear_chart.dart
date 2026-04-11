import 'package:dompet_iq/theme_app.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LinearChart extends StatefulWidget {
  const LinearChart({super.key});

  @override
  State<LinearChart> createState() => _LinearChartState();
}

class _LinearChartState extends State<LinearChart> {
  List<Color> gradientColor = [petalRouge, petalRouge];
  @override
  Widget build(BuildContext context) {
    final spots = [
      FlSpot(0, 2),
      FlSpot(1, 4),
      FlSpot(2, 3),
      FlSpot(3, 5),
      FlSpot(4, 4),
    ];
    return LineChart(
      LineChartData(
        minX: 0,
        maxX: 4,
        minY: 0,
        maxY: 6,

        gridData: FlGridData(
          show: true,
          drawVerticalLine: true,
          horizontalInterval: 1,
          verticalInterval: 1,
          getDrawingHorizontalLine: (value) {
            return FlLine(color: petalFrost, strokeWidth: 1);
          },
          getDrawingVerticalLine: (value) {
            return FlLine(color: petalFrost, strokeWidth: 1);
          },
        ),

        titlesData: FlTitlesData(
          show: true,
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 1,
              getTitlesWidget: (value, meta) {
                switch (value.toInt()) {
                  case 0:
                    return Text("Sen");
                  case 1:
                    return Text("Sel");
                  case 2:
                    return Text("Rab");
                  case 3:
                    return Text("Kam");
                  case 4:
                    return Text("Jum");
                }
                return Text("");
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 1,
              reservedSize: 20,
              maxIncluded: false,
            ),
          ),
        ),

        borderData: FlBorderData(
          show: true,
          border: Border.all(color: petalFrost),
        ),

        lineBarsData: [
          LineChartBarData(
            isCurved: true,
            color: petalRouge,
            barWidth: 4,
            dotData: FlDotData(show: true),
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                colors: [
                  petalRouge.withOpacity(0.8),
                  petalRouge.withOpacity(0.1),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            spots: spots,
          ),
        ],

        lineTouchData: LineTouchData(
          enabled: true,
          handleBuiltInTouches: true,

          touchTooltipData: LineTouchTooltipData(
            tooltipPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            tooltipMargin: 8,
            getTooltipColor: (touchedSpot) => Colors.transparent,
            getTooltipItems: (touchedSpots) {
              return touchedSpots.map((spot) {
                return LineTooltipItem(
                  spot.y.toInt().toString(), // 👈 nilai dari Y axis
                  poppinsReglar12,
                );
              }).toList();
            },
          ),
        ),
        showingTooltipIndicators: spots.asMap().entries.map((entry) {
          return ShowingTooltipIndicators([
            LineBarSpot(LineChartBarData(spots: spots), 0, entry.value),
          ]);
        }).toList(),
      ),
    );
  }
}

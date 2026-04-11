import 'package:dompet_iq/component/linear_chart.dart';
import 'package:dompet_iq/model/transaction_model.dart';
import 'package:dompet_iq/theme_app.dart';
import 'package:dompet_iq/utils/group_data.dart';
import 'package:flutter/material.dart';

class ChartDetailPage extends StatefulWidget {
  static const String routeName = "chart_detail";
  const ChartDetailPage({super.key});

  @override
  State<ChartDetailPage> createState() => _ChartDetailPageState();
}

class _ChartDetailPageState extends State<ChartDetailPage> {
  late Future<List<TransactionModel>> futureData;

  void testData() async {
    final dataMakanMinum = await getMakanMinum();
    final resultAll = await loadTransactions();
    final grouping = groupByDate(dataMakanMinum);

    final summaryData = getMonthlyCategorySummary(
      data: resultAll,
      year: "2026",
      month: "04",
      category: "Makan dan Minum",
    );

    print(
      "${summaryData.month}/${summaryData.year} - ${summaryData.category} = ${summaryData.total}",
    );
  }

  @override
  void initState() {
    super.initState();
    futureData = getMakanMinum();
  }

  @override
  Widget build(BuildContext context) {
    testData();
    return Scaffold(
      appBar: AppBar(
        title: Text("Eat and Drink", style: poppinsRegluar16),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    print("Before");
                  },
                  child: Icon(Icons.chevron_left, size: 30, color: greyText),
                ),
                Text("April 2026", style: poppinsRegluar16),
                GestureDetector(
                  onTap: () {
                    print("After");
                  },
                  child: Icon(Icons.chevron_right, size: 30, color: greyText),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(height: 250, child: LinearChart()),
              ),
            ),
            // SliverList(delegate: delegate)
          ],
        ),
      ),
    );
  }
}

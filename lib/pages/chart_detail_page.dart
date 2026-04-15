import 'package:dompet_iq/component/linear_chart.dart';
import 'package:dompet_iq/model/transaction_model.dart';
import 'package:dompet_iq/theme_app.dart';
// import 'package:dompet_iq/utils/group_data.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChartDetailPage extends StatefulWidget {
  static const String routeName = "chart_detail";
  const ChartDetailPage({super.key});

  @override
  State<ChartDetailPage> createState() => _ChartDetailPageState();
}

class _ChartDetailPageState extends State<ChartDetailPage> {
  late Future<List<TransactionModel>> futureData;

  void testData() async {
    // final dataMakanMinum = await getMakanMinum();
    // final resultAll = await loadTransactions();
    // final grouping = groupByDate(dataMakanMinum);

    // final summaryData = getMonthlyCategorySummary(
    //   data: resultAll,
    //   year: "2026",
    //   month: "04",
    //   category: "Makan dan Minum",
    // );

    // print(
    //   "${summaryData.month}/${summaryData.year} - ${summaryData.category} = ${summaryData.total}",
    // );
  }

  @override
  void initState() {
    super.initState();
    futureData = getMakanMinum();
  }

  @override
  Widget build(BuildContext context) {
    // testData();
    Widget headerList() {
      return Container(
        padding: const EdgeInsets.all(16),
        margin: EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(color: beige),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 60.0,
                  padding: EdgeInsets.symmetric(vertical: 4),
                  decoration: BoxDecoration(
                    color: petalRouge,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(5.0),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "2026",
                      style: poppinsRegular12.copyWith(color: whiteColor),
                    ),
                  ),
                ),
                Container(
                  width: 60.0,
                  padding: EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(5),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "04",
                      style: poppinsBold18.copyWith(color: greyText),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: 8),
            Text(
              "Makan dan Minum",
              style: poppinsSemibold16.copyWith(color: greyText),
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("Total", style: poppinsRegular14),
                Text(
                  "1500000",
                  style: poppinsSemibold16.copyWith(color: greyText),
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget cardDay() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              color: petalFrost,
              borderRadius: BorderRadius.vertical(top: Radius.circular(5)),
            ),
            child: Row(
              children: [
                Text("30", style: poppinsSemibold18),
                SizedBox(width: 12),
                Column(
                  children: [
                    Text(
                      "04-2026",
                      style: poppinsRegular12.copyWith(color: darkText),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(color: greyText),
                      child: Text(
                        "Sunday",
                        style: poppinsRegular12.copyWith(color: whiteColor),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Text(
                  "320.000",
                  style: poppinsMedium16.copyWith(color: darkText),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(16, 0, 16, 16),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(5)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text("16:31", style: poppinsRegular14),
                    SizedBox(width: 12),
                    Text("Sate", style: poppinsRegular14),
                    Spacer(),
                    Text("15.000", style: poppinsRegular14),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Text("118:01", style: poppinsRegular14),
                    SizedBox(width: 12),
                    Text("Spagetie", style: poppinsRegular14),
                    Spacer(),
                    Text("50.000", style: poppinsRegular14),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Text("19:12", style: poppinsRegular14),
                    SizedBox(width: 12),
                    Text("Pizzaaa", style: poppinsRegular14),
                    Spacer(),
                    Text("255.000", style: poppinsRegular14),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
    }

    Widget cardListData() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          cardDay(),
          cardDay(),
          cardDay(),
          cardDay(),
          cardDay(),
          cardDay(),
          cardDay(),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Makan dan Minum", style: poppinsRegular16),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            context.pop();
          },
        ),
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
                Text("April 2026", style: poppinsRegular16),
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
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SizedBox(height: 250, child: LinearChart()),
                  ),
                  headerList(),
                  cardListData(),
                ],
              ),
            ),
            // SliverList(delegate: delegate)
          ],
        ),
      ),
    );
  }
}

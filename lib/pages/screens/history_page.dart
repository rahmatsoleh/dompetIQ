import 'package:dompet_iq/theme_app.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  static const String routeName = "history";
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget tabNavigation() {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
        decoration: BoxDecoration(color: petalRouge),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {},
              child: Text(
                "Daily",
                style: poppinsBold16.copyWith(color: whiteColor),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Text(
                "Weekly",
                style: poppinsRegular14.copyWith(color: whiteColor),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Text(
                "Monthly",
                style: poppinsRegular14.copyWith(color: whiteColor),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Text(
                "Yearly",
                style: poppinsRegular14.copyWith(color: whiteColor),
              ),
            ),
          ],
        ),
      );
    }

    Widget headerTotal() {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 30),
        decoration: BoxDecoration(color: beige),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text(
                  "Income",
                  style: poppinsMedium14.copyWith(color: greyText),
                ),
                Text(
                  "12.000.000",
                  style: poppinsBold16.copyWith(color: petalRouge),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  "Expense",
                  style: poppinsMedium14.copyWith(color: greyText),
                ),
                Text(
                  "5.620.000",
                  style: poppinsBold16.copyWith(color: petalRouge),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  "Balance",
                  style: poppinsMedium14.copyWith(color: greyText),
                ),
                Text(
                  "6.320.000",
                  style: poppinsBold16.copyWith(color: petalRouge),
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget cardHistory() {
      return Container(
        margin: EdgeInsets.only(top: 12),
        padding: EdgeInsets.symmetric(vertical: 10),
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
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              decoration: BoxDecoration(color: whiteColor),
              child: Row(
                children: [
                  Text("30", style: poppinsBold16),
                  SizedBox(width: 12),
                  Column(
                    children: [
                      Text("04-2026", style: poppinsRegular12),
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 8,
                        ),
                        decoration: BoxDecoration(color: greyText),
                        child: Text(
                          "Monday",
                          style: poppinsRegular12.copyWith(color: whiteColor),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Column(
                    children: [
                      Text(
                        "Income",
                        style: poppinsRegular12.copyWith(color: greenColor),
                      ),
                      Text(
                        "3000000",
                        style: poppinsBold16.copyWith(color: greenColor),
                      ),
                    ],
                  ),
                  SizedBox(width: 12),
                  Column(
                    children: [
                      Text(
                        "Expense",
                        style: poppinsRegular12.copyWith(color: redColor),
                      ),
                      Text(
                        "1000000",
                        style: poppinsBold16.copyWith(color: redColor),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(height: 1, thickness: 2),
            Table(
              columnWidths: const {
                0: IntrinsicColumnWidth(),
                1: IntrinsicColumnWidth(),
                2: FlexColumnWidth(),
                3: IntrinsicColumnWidth(),
                4: IntrinsicColumnWidth(),
              },
              children: [
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("12:00", style: poppinsRegular14),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Gaji", style: poppinsRegular14),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Gaji bulan april", style: poppinsRegular14),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "1.000.000",
                        style: poppinsRegular14.copyWith(color: greenColor),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {},
                        child: Icon(Icons.edit, color: greyText, size: 20),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("10:00", style: poppinsRegular14),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Makan", style: poppinsRegular14),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Beli Sate", style: poppinsRegular14),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "15.000",
                        style: poppinsRegular14.copyWith(color: redColor),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {},
                        child: Icon(Icons.edit, color: greyText, size: 20),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("09:00", style: poppinsRegular14),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Internet", style: poppinsRegular14),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Mama minta pulsa", style: poppinsRegular14),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "102.000",
                        style: poppinsRegular14.copyWith(color: redColor),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {},
                        child: Icon(Icons.edit, color: greyText, size: 20),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget cardListsHistory() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          cardHistory(),
          cardHistory(),
          cardHistory(),
          cardHistory(),
          cardHistory(),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            InkWell(
              onTap: () {},
              child: Icon(Icons.chevron_left, color: greyText, size: 35),
            ),
            Text("April 2026", style: poppinsRegular16),
            InkWell(
              onTap: () {},
              child: Icon(Icons.chevron_right, color: greyText, size: 35),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  tabNavigation(),
                  headerTotal(),
                  cardListsHistory(),
                  SizedBox(height: 100),
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

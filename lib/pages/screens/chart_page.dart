import 'package:dompet_iq/component/donut_chart.dart';
import 'package:dompet_iq/theme_app.dart';
import 'package:flutter/material.dart';

class ChartPage extends StatefulWidget {
  const ChartPage({super.key});

  @override
  State<ChartPage> createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  String _selectedValue = "Monthly";
  String _transactionType = "Income";

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: greyText, width: 1.5)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Icon(Icons.chevron_left, size: 30, color: greyText),
                ),
                Text("April 2026", style: poppinsRegular14),
                GestureDetector(
                  onTap: () {},
                  child: Icon(Icons.chevron_right, size: 30, color: greyText),
                ),
              ],
            ),
            SizedBox(
              width: 120,
              child: DropdownButtonFormField(
                value: _selectedValue,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 8,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8), // rounded
                    borderSide: BorderSide(
                      color: greyText, // warna border normal
                      width: 1.5,
                    ),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: greyText, // warna saat fokus
                      width: 1.5,
                    ),
                  ),
                ),
                items: ["Monthly", "Yearly"]
                    .map(
                      (item) => DropdownMenuItem(
                        value: item,
                        child: Text(item, style: poppinsRegular14),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedValue = value!;
                  });
                },
              ),
            ),
          ],
        ),
      );
    }

    Widget tabNavTransaction() {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: ["Income", "Expenses"].map((item) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  _transactionType = item;
                });
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                padding: _transactionType == item
                    ? EdgeInsets.symmetric(horizontal: 25, vertical: 15)
                    : null,
                decoration: _transactionType == item
                    ? BoxDecoration(
                        color: petalRouge,
                        borderRadius: BorderRadius.circular(30),
                      )
                    : null,
                child: Text(
                  item,
                  style: _transactionType == item
                      ? poppinsMedium16.copyWith(color: whiteColor)
                      : poppinsRegluar16,
                ),
              ),
            );
          }).toList(),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
              tabNavTransaction(),
              DonutChart(),
              SizedBox(height: 200),
            ],
          ),
        ),
      ),
    );
  }
}

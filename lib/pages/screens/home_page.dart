import 'package:dompet_iq/component/spedometer_gauge.dart';
import 'package:dompet_iq/theme_app.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:percent_indicator/linear_percent_indicator.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(
                  side: BorderSide(color: greyText, width: 2),
                ),
                padding: EdgeInsets.all(6),
                elevation: 0,
                backgroundColor: whiteColor,
              ),

              child: Icon(
                Icons.person_outline_rounded,
                size: 35,
                color: greyText,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.grid_view_rounded, size: 25, color: greyText),
            ),
          ],
        ),
      );
    }

    Widget greeting() {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hello Rahmat Soleh,", style: poppinsSemibold32),
            SizedBox(height: 8),
            Text("Welcome back", style: poppinsRegluar16),
          ],
        ),
      );
    }

    Widget balanceCard() {
      double percentage = 70.0;
      return Container(
        width: double.infinity,
        height: 250,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: BoxDecoration(
          color: beige,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [SpedometerGauge(percentage: percentage)],
        ),
      );
    }

    Widget cardIncomeExpenses() {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: BoxDecoration(
          color: petalRouge,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: whiteColor,
                    shape: BoxShape.circle,
                  ),
                  child: Transform.rotate(
                    angle: 90 * math.pi / 180,
                    child: Icon(
                      Icons.chevron_left,
                      color: petalRouge,
                      size: 30,
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Income",
                      style: poppinsReglar12.copyWith(color: whiteColor),
                    ),
                    Text(
                      "12.000.000",
                      style: poppinsSemibold16.copyWith(color: whiteColor),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: whiteColor,
                    shape: BoxShape.circle,
                  ),
                  child: Transform.rotate(
                    angle: 270 * math.pi / 180,
                    child: Icon(
                      Icons.chevron_left,
                      color: petalRouge,
                      size: 30,
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Expenses",
                      style: poppinsReglar12.copyWith(color: whiteColor),
                    ),
                    Text(
                      "8.500.000",
                      style: poppinsSemibold16.copyWith(color: whiteColor),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget cardAllocations() {
      return Container(
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: beige,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Transportation",
                        style: poppinsMedium16.copyWith(color: darkText),
                      ),
                      Text("70%", style: poppinsRegular14),
                    ],
                  ),
                  LinearPercentIndicator(
                    backgroundColor: petalFrost,
                    lineHeight: 30.0,
                    progressColor: petalRouge,
                    percent: 0.7,
                    padding: EdgeInsets.only(top: 8),
                    barRadius: Radius.circular(20),
                    animation: true,
                    animationDuration: 1000,
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Spending Limit", style: poppinsRegular14),
                      Text("1.500.000", style: poppinsRegular14),
                    ],
                  ),
                  SizedBox(height: 4.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Your Spent", style: poppinsRegular14),
                      Text("1.350.000", style: poppinsRegular14),
                    ],
                  ),
                  SizedBox(height: 4.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Remaining", style: poppinsMedium14),
                      Text("150.000", style: poppinsMedium14),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget cardExpensesAndAlloctaions() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Expenses and Allocation", style: poppinsMedium20),
            SizedBox(height: 16),
            cardAllocations(),
            SizedBox(height: 16),
            cardAllocations(),
          ],
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
              greeting(),
              balanceCard(),
              cardIncomeExpenses(),
              cardExpensesAndAlloctaions(),
              SizedBox(height: 200),
            ],
          ),
        ),
      ),
    );
  }
}

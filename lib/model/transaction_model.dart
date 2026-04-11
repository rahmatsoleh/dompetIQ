import 'dart:convert';

import 'package:flutter/services.dart';

class TransactionModel {
  final String type;
  final String date;
  final String time;
  final String category;
  final int nominal;
  final String description;

  TransactionModel({
    required this.type,
    required this.date,
    required this.time,
    required this.category,
    required this.nominal,
    required this.description,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      type: json["type"],
      date: json["date"],
      time: json["time"],
      category: json["category"],
      nominal: json["nominal"],
      description: json["description"],
    );
  }
}

class MonthlyCategorySummary {
  final String year;
  final String month;
  final String category;
  final int total;

  MonthlyCategorySummary({
    required this.year,
    required this.month,
    required this.category,
    required this.total,
  });
}

Future<List<TransactionModel>> loadTransactions() async {
  final String response = await rootBundle.loadString(
    "assets/data/transactions.json",
  );

  final List data = json.decode(response);

  return data.map((item) => TransactionModel.fromJson(item)).toList();
}

Future<List<TransactionModel>> getMakanMinum() async {
  final data = await loadTransactions();

  return data.where((item) => item.category == "Makan dan Minum").toList();
}

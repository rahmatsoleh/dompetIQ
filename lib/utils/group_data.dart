import 'package:dompet_iq/model/transaction_model.dart';

class GroupedTransaction {
  final String date;
  final String category;
  final int amount;
  final List<TransactionModel> data;

  GroupedTransaction({
    required this.date,
    required this.data,
    required this.category,
    required this.amount,
  });
}

List<GroupedTransaction> groupByDate(List<TransactionModel> list) {
  Map<String, List<TransactionModel>> map = {};

  for (var item in list) {
    final key = "${item.date}_${item.category}";
    map.putIfAbsent(item.date, () => []).add(item);
  }

  final result = map.entries.map((entry) {
    final items = entry.value;

    final totalAmount = items.fold(0, (sum, e) => sum + e.nominal);

    return GroupedTransaction(
      date: items.first.date,
      category: items.first.category,
      amount: totalAmount,
      data: entry.value,
    );
  }).toList();

  result.sort((a, b) => a.date.compareTo(b.date));

  return result;
}

MonthlyCategorySummary getMonthlyCategorySummary({
  required List<TransactionModel> data,
  required String year,
  required String month,
  required String category,
}) {
  final filtered = data.where((item) {
    final itemDate = DateTime.parse(item.date);
    final matchYear = itemDate.year.toString() == year;
    final matchMonth = itemDate.month.toString().padLeft(2, "0") == month;
    final matchCategory = item.category == category;

    return matchYear && matchMonth && matchCategory;
  }).toList();

  final total = filtered.fold<int>(0, (sum, item) => sum + item.nominal);

  return MonthlyCategorySummary(
    year: year,
    month: month,
    category: category,
    total: total,
  );
}

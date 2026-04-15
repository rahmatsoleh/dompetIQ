import 'package:flutter/material.dart';

class TransactionPage extends StatelessWidget {
  static const String routeName = "transaction";

  const TransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Add Transaction")));
  }
}

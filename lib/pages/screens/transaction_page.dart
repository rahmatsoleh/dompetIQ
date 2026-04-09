import 'package:dompet_iq/theme_app.dart';
import 'package:flutter/material.dart';

class TransactionPage extends StatelessWidget {
  static const String routeName = "transaction";

  const TransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Transaction",
          style: poppinsMedium16.copyWith(color: darkText, fontSize: 18),
        ),
      ),
      body: Center(
        child: Text('Transaction Page', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}

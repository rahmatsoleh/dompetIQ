import 'package:dompet_iq/pages/category_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingsPage extends StatelessWidget {
  static const String routeName = "settings";

  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              onTap: () {
                context.pushNamed(CategoryPage.routeName);
              },
              title: Text("Category"),
              leading: Icon(Icons.receipt_long_outlined),
              trailing: Icon(Icons.chevron_right),
            ),
            Divider(height: 1),
          ],
        ),
      ),
    );
  }
}

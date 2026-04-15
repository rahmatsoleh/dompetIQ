import 'package:dompet_iq/theme_app.dart';
import 'package:flutter/material.dart';

void showAddCategoryDialog(BuildContext context) {
  String type = "income";
  final titleController = TextEditingController();
  final limitController = TextEditingController();

  showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Dialog(
            backgroundColor: whiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(width: 2, color: pinkMist),
            ),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "Add new category",
                      style: poppinsMedium20.copyWith(color: greyText),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Type",
                    style: poppinsRegular14.copyWith(color: greyText),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Radio<String>(
                        value: "expense",
                        activeColor: petalRouge,
                        groupValue: type,
                        onChanged: (val) {
                          setState(() => type = val!);
                        },
                      ),
                      Text(
                        "Expense",
                        style: poppinsRegular14.copyWith(color: greyText),
                      ),
                      SizedBox(width: 12),
                      Radio<String>(
                        value: "income",
                        activeColor: petalRouge,
                        groupValue: type,
                        onChanged: (val) {
                          setState(() => type = val!);
                        },
                      ),
                      Text(
                        "Income",
                        style: poppinsRegular14.copyWith(color: greyText),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),

                  // TITLE INPUT
                  TextField(
                    controller: titleController,
                    style: TextStyle(color: petalRouge),
                    decoration: InputDecoration(
                      labelText: "Title",
                      labelStyle: TextStyle(color: petalRouge),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: pinkMist),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: petalRouge),
                      ),
                    ),
                  ),

                  SizedBox(height: 10),

                  // LIMIT INPUT
                  TextField(
                    controller: limitController,
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: petalRouge),
                    decoration: InputDecoration(
                      labelText: "Limit",
                      labelStyle: TextStyle(color: petalRouge),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: pinkMist),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: petalRouge),
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text(
                          "Cancel",
                          style: poppinsMedium14.copyWith(color: petalRouge),
                        ),
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: petalRouge,
                        ),
                        onPressed: () {
                          print("Type: $type");
                          print("Title: ${titleController.text}");
                          print("Limit: ${limitController.text}");
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Save",
                          style: poppinsMedium16.copyWith(color: whiteColor),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}

class CategoryPage extends StatelessWidget {
  static const String routeName = "category";

  @override
  Widget build(BuildContext context) {
    Widget tabNavCategory() {
      return Container(
        padding: EdgeInsetsGeometry.symmetric(vertical: 16),
        margin: EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(color: lightBlue),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 1),
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                child: Text(
                  "Income",
                  style: poppinsRegular14.copyWith(color: greyText),
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 1),
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                decoration: BoxDecoration(
                  color: petalRouge,
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                child: Text(
                  "Expense",
                  style: poppinsBold16.copyWith(color: whiteColor),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget categoryLists() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(20, (index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                contentPadding: EdgeInsets.only(left: 16, right: 0),
                title: Text(
                  "Makan dan Minum",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: poppinsRegular16.copyWith(color: darkText),
                ),
                subtitle: Text(
                  "Budget 1.500.000",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: poppinsRegular12,
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                    IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                  ],
                ),
              ),
              Divider(height: 1),
            ],
          );
        }),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Category",
          style: poppinsMedium20.copyWith(color: greyText),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showAddCategoryDialog(context);
            },
            icon: Icon(Icons.add, color: greyText, size: 30),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [tabNavCategory(), categoryLists()],
          ),
        ),
      ),
    );
  }
}

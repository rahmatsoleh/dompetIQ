import 'package:dompet_iq/theme_app.dart';
import 'package:flutter/material.dart';

class TransactionPage extends StatefulWidget {
  static const String routeName = "transaction";

  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  String? category;

  Future<void> pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      String formatted =
          "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
      setState(() {
        _dateController.text = formatted;
      });
    }
  }

  Future<void> pickTime() async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      String formatted =
          "${pickedTime.hour.toString().padLeft(2, '0')}:${pickedTime.minute.toString().padLeft(2, '0')}";

      setState(() {
        _timeController.text = formatted;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget navTabType() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 25),
              decoration: BoxDecoration(
                color: greenColor,
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              child: Text(
                "Income",
                style: poppinsBold16.copyWith(color: whiteColor),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              child: Text("Expense", style: poppinsRegular14),
            ),
          ),
        ],
      );
    }

    Widget formWidget() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _dateController,
                      readOnly: true,
                      onTap: pickDate,
                      decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.calendar_today,
                          color: greenColor,
                        ),
                        labelText: "Date",
                        filled: true,
                        fillColor: whiteColor,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 14,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(
                            color: greenColor,
                            width: 2,
                            style: BorderStyle.solid,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(
                            color: greenColor,
                            width: 2,
                            style: BorderStyle.solid,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(
                            color: greenColor,
                            width: 2,
                            style: BorderStyle.solid,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: const BorderSide(
                            color: Colors.red,
                            width: 2,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Field tidak boleh kosong";
                        }
                        if (value.length < 3) {
                          return "Minimal 3 karakter";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(width: 6),
                  SizedBox(
                    width: 120,
                    child: TextFormField(
                      controller: _timeController,
                      readOnly: true,
                      onTap: pickTime,
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.access_time, color: greenColor),
                        labelText: "Time",
                        filled: true,
                        fillColor: whiteColor,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 14,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(
                            color: greenColor,
                            width: 2,
                            style: BorderStyle.solid,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(
                            color: greenColor,
                            width: 2,
                            style: BorderStyle.solid,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(
                            color: greenColor,
                            width: 2,
                            style: BorderStyle.solid,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: const BorderSide(
                            color: Colors.red,
                            width: 2,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Field tidak boleh kosong";
                        }
                        if (value.length < 3) {
                          return "Minimal 3 karakter";
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: category,
                      decoration: InputDecoration(
                        labelText: "Choose category",
                        filled: true,
                        fillColor: whiteColor,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 14,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(
                            color: greenColor,
                            width: 2,
                            style: BorderStyle.solid,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(
                            color: greenColor,
                            width: 2,
                            style: BorderStyle.solid,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(
                            color: greenColor,
                            width: 2,
                            style: BorderStyle.solid,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: const BorderSide(
                            color: Colors.red,
                            width: 2,
                          ),
                        ),
                      ),
                      items: [
                        DropdownMenuItem(
                          value: "makan",
                          child: Text(
                            "Makan dan Minum",
                            style: poppinsMedium14,
                          ),
                        ),
                        DropdownMenuItem(
                          value: "transportasi",
                          child: Text("Transportasi", style: poppinsMedium14),
                        ),
                        DropdownMenuItem(
                          value: "kos",
                          child: Text("Kos", style: poppinsMedium14),
                        ),
                      ],
                      onChanged: (val) {
                        setState(() {
                          category = val;
                        });
                      },
                      validator: (value) {
                        if (value == null) {
                          return "Pilih kategori";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    width: 50,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.edit, color: greenColor),
                    ),
                  ),
                ],
              ),
              // Submit Button
              const SizedBox(height: 20),

              /// BUTTON SUBMIT
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text("Hello ...")));
                    }
                  },
                  child: const Text("Submit"),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text("Add Transaction")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [navTabType(), formWidget()],
      ),
    );
  }
}

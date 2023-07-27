import 'package:day1/day6/details_list/worklist.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../widget/text_field.dart';

class WorkExperiance extends StatefulWidget {
  const WorkExperiance({super.key});

  @override
  State<WorkExperiance> createState() => _WorkExperianceState();
}

class _WorkExperianceState extends State<WorkExperiance> {
  final TextEditingController jobtitleController = TextEditingController();
  final TextEditingController summaryController = TextEditingController();
  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController entryDateController = TextEditingController();
  final TextEditingController exitDateController = TextEditingController();
  var _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Work'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  textform(
                      hint: 'Eg. Flutter Developer',
                      keyType: TextInputType.text,
                      labeltext: 'Job title',
                      validate: (value) {
                        if (value.isEmpty ||
                            !RegExp(r'^[a-zA-Z]{0,10}$').hasMatch(value)) {
                          return 'Enter only characters less then 10';
                        }
                        return null;
                      },
                      controller: jobtitleController),
                  const SizedBox(height: 10),
                  textform(
                      hint: 'Full Details of work',
                      labeltext: 'Summary',
                      validate: (value) {
                        if (value.isEmpty ||
                            !RegExp(r'^[a-zA-Z]{0,100}$').hasMatch(value)) {
                          return 'Enter only characters';
                        }
                        return null;
                      },
                      keyType: TextInputType.multiline,
                      controller: summaryController),
                  const SizedBox(height: 10),
                  textform(
                      hint: 'Company Name',
                      labeltext: 'Company Name',
                      validate: (value) {
                        if (value.isEmpty ||
                            !RegExp(r'^[a-zA-Z]{0,10}$').hasMatch(value)) {
                          return 'Enter only characters less then 10';
                        }
                        return null;
                      },
                      keyType: TextInputType.text,
                      controller: companyNameController),
                  const SizedBox(height: 10),
                  TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Choose Date';
                        }
                      },
                      controller: entryDateController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          icon: Icon(Icons.calendar_today),
                          labelText: "Enter Date",
                          labelStyle: TextStyle(color: Colors.red)),
                      readOnly: true,
                      onTap: () async {
                        //when click we have to show the datepicker
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2024),
                        );
                        if (pickedDate != null) {
                          String formattedDate = DateFormat('yyyy-MM-dd')
                              .format(pickedDate)
                              .toString();

                          setState(() {
                            entryDateController.text = formattedDate;
                          });
                        }
                      }),
                  const SizedBox(height: 10),
                  TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Choose Date';
                        }
                        return null;
                      },
                      controller: exitDateController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          icon: Icon(Icons.calendar_today),
                          labelText: "End Date",
                          labelStyle: TextStyle(color: Colors.red)),
                      readOnly: true,
                      onTap: () async {
                        //when click we have to show the datepicker
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2024),
                        );
                        if (pickedDate != null) {
                          String formattedDate = DateFormat('yyyy-MM-dd')
                              .format(pickedDate)
                              .toString();

                          setState(() {
                            exitDateController.text = formattedDate;
                          });
                        }
                      }),
                  const SizedBox(height: 15),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _addJobDetail();
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Center(
                                child: Text(
                              'Data Added Sucessfully',
                            )),
                            backgroundColor: Colors.green,
                          ));
                          Navigator.of(context).pop();
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Center(
                                child: Text(
                              'Error',
                            )),
                            backgroundColor: Colors.red,
                          ));
                        }
                      },
                      child: const Text('Save Data'))
                ],
              ),
            ),
          ),
        ));
  }

  void _addJobDetail() {
    setState(() {
      addworkList.add(addWork(
        jobtitle: jobtitleController.text,
        summary: summaryController.text,
        companyName: companyNameController.text,
        entryDate: entryDateController.text,
        exitDate: exitDateController.text,
      ));
      jobtitleController.clear();
      summaryController.clear();
      companyNameController.clear();
      entryDateController.clear();
      exitDateController.clear();
    });
  }
}

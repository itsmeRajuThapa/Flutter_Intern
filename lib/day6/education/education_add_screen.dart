import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../widget/text_field.dart';
import 'education_list.dart';

class EducationAddScreen extends StatefulWidget {
  const EducationAddScreen({super.key});

  @override
  State<EducationAddScreen> createState() => _EducationAddScreenState();
}

class _EducationAddScreenState extends State<EducationAddScreen> {
  final TextEditingController orgNameController = TextEditingController();
  final TextEditingController achivementController = TextEditingController();
  final TextEditingController entryDateController = TextEditingController();
  final TextEditingController exitDateController = TextEditingController();

  String selectedValue = 'SEE';
  List<String> dropdownItems = ['SEE', '+2', 'Bachelor', 'Master', 'Phd'];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addEducationList;
  }

  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Education'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  textform(
                    controller: orgNameController,
                    validate: (value) {
                      if (value.isEmpty ||
                          !RegExp(r'^[a-zA-Z]{0,10}$').hasMatch(value)) {
                        return 'Enter only characters less then 10';
                      }
                      return null;
                    },
                    hint: 'Eg. Ambition Guru',
                    labeltext: 'Organization Name',
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Text('Select Your education'),
                      const SizedBox(width: 40),
                      DropdownButton<String>(
                        value: selectedValue,
                        icon: const Icon(Icons.keyboard_double_arrow_down),
                        onChanged: (newValue) {
                          setState(() {
                            selectedValue = newValue!;
                          });
                        },
                        items: dropdownItems.map((String item) {
                          return DropdownMenuItem<String>(
                            value: item,
                            child: Text(item),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Choose Date';
                        }
                        return null;
                      },
                      controller: entryDateController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          icon: Icon(Icons.calendar_today),
                          labelText: "Enter Date",
                          labelStyle: TextStyle(color: Colors.purple)),
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
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);

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
                          labelStyle: TextStyle(color: Colors.purple)),
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
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);

                          setState(() {
                            exitDateController.text = formattedDate;
                          });
                        }
                      }),
                  const SizedBox(height: 10),
                  textform(
                      hint: '',
                      labeltext: 'Achievements ',
                      controller: achivementController),
                  const SizedBox(height: 15),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            addEducationList.add(addEducation(
                                selector: selectedValue,
                                achievement: achivementController.text,
                                orgName: orgNameController.text,
                                entryDate: entryDateController.text,
                                exitDate: exitDateController.text));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Center(
                                  child: Text(
                                'Data Added Sucessfully',
                              )),
                              backgroundColor: Colors.green,
                            ));
                          });
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
}

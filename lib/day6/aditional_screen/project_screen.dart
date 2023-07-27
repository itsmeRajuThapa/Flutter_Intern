import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../widget/text_field.dart';

class addProject {
  final String projecttitle;
  final String organization;
  final String summary;
  final String entryDate;
  final String exitDate;

  addProject({
    required this.projecttitle,
    required this.summary,
    required this.organization,
    required this.entryDate,
    required this.exitDate,
  });

  factory addProject.fromJson(Map<String, dynamic> json) {
    return addProject(
      projecttitle: json['projecttitle'],
      summary: json['summary'],
      organization: json['organization'],
      entryDate: json['entryDate'],
      exitDate: json['exitDate'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'projecttitle': projecttitle,
      'summary': summary,
      'organization': organization,
      'entryDate': entryDate,
      'exitDate': exitDate,
    };
  }
}

List<addProject> addProjectList = [];

class ProjectScreen extends StatefulWidget {
  const ProjectScreen({super.key});

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  final TextEditingController orgController = TextEditingController();

  final TextEditingController jobtitleController = TextEditingController();
  final TextEditingController summaryController = TextEditingController();
  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController entryDateController = TextEditingController();
  final TextEditingController exitDateController = TextEditingController();
  var _formKey = GlobalKey<FormState>();
  String groupValue = "no";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Project'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  textform(
                      hint: 'Eg. ecommerce app',
                      validate: (value) {
                        if (value.isEmpty ||
                            !RegExp(r'^[a-zA-Z]{0,10}$').hasMatch(value)) {
                          return 'Enter only characters less then 10';
                        }
                        return null;
                      },
                      keyType: TextInputType.text,
                      labeltext: 'Project Title',
                      controller: jobtitleController),
                  const SizedBox(height: 10),
                  textform(
                      hint: 'Full Details of project',
                      validate: (value) {
                        if (value.isEmpty ||
                            !RegExp(r'^[a-zA-Z]{0,100}$').hasMatch(value)) {
                          return 'Enter only characters';
                        }
                        return null;
                      },
                      keyType: TextInputType.multiline,
                      labeltext: 'Summary',
                      controller: summaryController),
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
                  Row(
                    children: [
                      const Text('Associated with any organization'),
                      Radio(
                          value: 'no',
                          groupValue: groupValue,
                          onChanged: ((value) {
                            setState(() {
                              groupValue = value!;
                            });
                          })),
                      const Text('No'),
                      Radio(
                          value: 'yes',
                          groupValue: groupValue,
                          onChanged: ((value) {
                            setState(() {
                              groupValue = value!;
                            });
                          })),
                      const Text('Yes')
                    ],
                  ),
                  if (groupValue == 'yes')
                    textform(
                      labeltext: 'Organization Name',
                      controller: orgController,
                      hint: '',
                      validate: (value) {
                        if (value.isEmpty ||
                            !RegExp(r'^[a-zA-Z]{0,10}$').hasMatch(value)) {
                          return 'Enter only characters less then 10';
                        }
                        return null;
                      },
                    ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _addProjectDetail();
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

  void _addProjectDetail() {
    setState(() {
      addProjectList.add(addProject(
        organization: orgController.text,
        projecttitle: jobtitleController.text,
        summary: summaryController.text,
        entryDate: entryDateController.text,
        exitDate: exitDateController.text,
      ));
      jobtitleController.clear();
      summaryController.clear();
      entryDateController.clear();
      exitDateController.clear();
      orgController.clear();
    });
  }
}

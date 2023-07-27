import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'details_list/worklist.dart';
import 'education/education_add_screen.dart';
import 'aditional_screen/project_screen.dart';
import 'aditional_screen/work_exp_screen.dart';
import 'education/education_list.dart';
import 'widget/all_user_details.dart';
import 'widget/check_box.dart';
import 'widget/chip_screen.dart';
import 'widget/radio_button.dart';
import 'widget/text_field.dart';

List<String> skills = [];
List<String> selectedItems = [];
List<String> checkedLanguageNames = [];

class Day6Screen extends StatefulWidget {
  const Day6Screen({super.key});

  @override
  State<Day6Screen> createState() => _Day6ScreenState();
}

class _Day6ScreenState extends State<Day6Screen> {
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController middleNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  bool isSwitched = false;
  var key = GlobalKey<FormState>();
  late String genderList;

  Future<void> saveCVData() async {
    Map<String, dynamic> cvEmptyList = {};
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final jsonString = sharedPreferences.getString('dataList');
    if (jsonString != null) {
      try {
        final jsonData = jsonDecode(jsonString);
        if (jsonData is List<dynamic>) {
          addAllDetailsList =
              jsonData.map((json) => AllModelData.fromJson(json)).toList();
        } else if (jsonData is Map<String, dynamic>) {
          cvEmptyList
              .addAll(AllModelData.fromJson(jsonData) as Map<String, dynamic>);
          //  cvEmptyList.addAll(a)
        }
      } catch (e) {
        print("error occure ${e}");
      }
    }

    addAllDetailsList.add(AllModelData(
      age: ageController.text,
      firstName: firstnameController.text,
      lastName: lastNameController.text,
      middleName: middleNameController.text,
      gender: genderList,
      skills: skills,
      workExp: addworkList,
      education: addEducationList,
      otherProjects: addProjectList,
      languages: checkedLanguageNames,
      interests: selectedItems,
    ));

    List<Map<String, dynamic>> jsonDataList =
        addAllDetailsList.map((cv) => cv.toJson()).toList();
    cvEmptyList[firstnameController.text] = jsonDataList;
    String jsonData = json.encode(jsonDataList);
    sharedPreferences.setString('dataList', jsonData);
  }

  @override
  void dispose() {
    ageController.dispose();
    firstnameController.dispose();
    lastNameController.dispose();
    middleNameController.dispose();
    skills.clear();
    addworkList.clear();
    addEducationList.clear();
    addProjectList.clear();
    checkedLanguageNames.clear();
    selectedItems.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 212, 184, 99),
      appBar: AppBar(
        title: const Text("User CV"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textform(
                    labeltext: "First Name",
                    hint: "Enter First Name",
                    controller: firstnameController,
                    validate: (value) {
                      if (value.isEmpty ||
                          !RegExp(r'^[a-zA-Z]{0,10}$').hasMatch(value)) {
                        return 'UseName mustbe characters & less then 10';
                      }
                      return null;
                    },
                    keyType: TextInputType.name),
                const SizedBox(height: 8),
                textform(
                    labeltext: "Middle Name",
                    hint: "Enter Middle Name",
                    controller: middleNameController,
                    validate: (value) {
                      if (!RegExp(r'^[a-zA-Z]{0,10}$').hasMatch(value)) {
                        return 'MiddleName mustbe characters & less then 10';
                      }
                      return null;
                    },
                    keyType: TextInputType.name),
                const SizedBox(height: 8),
                textform(
                    controller: lastNameController,
                    labeltext: "Last Name",
                    hint: "Enter Last Name",
                    validate: (value) {
                      if (value.isEmpty ||
                          !RegExp(r'^[a-zA-Z]{0,10}$').hasMatch(value)) {
                        return 'LastName mustbe characters & less then 10';
                      }
                      return null;
                    },
                    keyType: TextInputType.name),
                const SizedBox(height: 8),
                textform(
                    controller: ageController,
                    labeltext: "Age",
                    hint: 'Only Number',
                    validate: (value) {
                      if (value.isEmpty) {
                        return 'Enter your age';
                      }
                      return null;
                    },
                    keyType: TextInputType.number),
                const SizedBox(height: 9),
                RadioBox(
                  callback: (value) {
                    setState(() {
                      genderList = value!;
                    });
                  },
                ),
                const SizedBox(height: 10),
                const Text('Skills'),
                const ClipScreen(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Work Experience"),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const WorkExperiance()));
                        },
                        child: const Text("Add Experience"))
                  ],
                ),
                Wrap(
                  spacing: 7,
                  children: workExperianceList(),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Education"),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const EducationAddScreen()));
                        },
                        child: const Text("Add Education"))
                  ],
                ),
                Wrap(
                  spacing: 7,
                  children: educationList(),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Other Project"),
                    Switch(
                        value: isSwitched,
                        onChanged: (value) {
                          setState(() {
                            isSwitched = value;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ProjectScreen()));
                          });
                        })
                  ],
                ),
                Wrap(
                  spacing: 7,
                  children: projectList(),
                ),
                const SizedBox(height: 10),
                const Text('Languages'),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: languageList.map((e) {
                      return Row(
                        children: [
                          Checkbox(
                            value: e['isChecked'],
                            onChanged: (newVal) {
                              setState(() {
                                e['isChecked'] = newVal;
                                if (e['isChecked'] == true) {
                                  checkedLanguageNames.add(e["name"]);
                                } else {
                                  checkedLanguageNames.remove(e["name"]);
                                }
                              });
                            },
                          ),
                          Text(e["name"]),
                        ],
                      );
                    }).toList(),
                  ),
                ),
                const Text('Interest Areas'),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: intrestList.map((e) {
                      return Row(
                        children: [
                          Checkbox(
                            value: e['isCheck'],
                            onChanged: (newVal) {
                              setState(() {
                                e['isCheck'] = newVal;
                                if (e['isCheck'] == true) {
                                  selectedItems.add(e["name"]);
                                } else {
                                  selectedItems.remove(e["name"]);
                                }
                              });
                            },
                          ),
                          Text(e["name"]),
                        ],
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                    onPressed: () {
                      if (key.currentState!.validate()) {
                        setState(() {
                          saveCVData();

                          showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              title: const Text("Data Have Been Save"),
                              content: const Text(
                                  "You have sucessfully added all your details"),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(ctx).pop();
                                  },
                                  child: Container(
                                    color: Colors.grey,
                                    padding: const EdgeInsets.all(14),
                                    child: const Text("okay"),
                                  ),
                                ),
                              ],
                            ),
                          );
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Center(
                                child: Text(
                              'Data Added Sucessfully',
                            )),
                            backgroundColor: Colors.green,
                          ));
                        });
                        // ageController.clear();
                        // firstnameController.clear();
                        // lastNameController.clear();
                        // middleNameController.clear();
                        // skills.clear();
                        // addworkList.clear();
                        // addEducationList.clear();
                        // addProjectList.clear();
                        // checkedLanguageNames.clear();
                        // selectedItems.clear();
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
                    child: const Text('Save')),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ViewDetails()));
                    },
                    child: const Text('View'))
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> educationList() {
    return addEducationList.map((e) {
      return Card(
        color: Colors.grey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Organization: ${e.orgName}"),
                  Text("Education: ${e.selector}"),
                  Text('Entry Date: ${e.entryDate}'),
                  Text('Exit Date: ${e.exitDate}'),
                  if (e.achievement.isNotEmpty)
                    Text("Achievements: ${e.achievement}"),
                ],
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  setState(() {
                    addEducationList.remove(e);
                  });
                },
              ),
            ],
          ),
        ),
      );
    }).toList();
  }

  List<Widget> projectList() {
    return addProjectList.map((e) {
      return Card(
        color: Colors.grey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Project Title: ${e.projecttitle}"),
                  Text("Summary: ${e.summary}"),
                  Text('Entry Date: ${e.entryDate}'),
                  Text('Exit Date: ${e.exitDate}'),
                  if (e.organization.isNotEmpty)
                    Text('Organization: ${e.organization}'),
                ],
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  setState(() {
                    addProjectList.remove(e);
                  });
                },
              ),
            ],
          ),
        ),
      );
    }).toList();
  }

  List<Widget> workExperianceList() {
    return addworkList.map((e) {
      return Card(
        color: Colors.grey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Job Title: ${e.jobtitle}"),
                  Text("Summary: ${e.summary}"),
                  Text("Company Name: ${e.companyName}"),
                  Text('Entry Date: ${e.entryDate}'),
                  Text('Exit Date: ${e.exitDate}'),
                ],
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  setState(() {
                    addworkList.remove(e);
                  });
                },
              ),
            ],
          ),
        ),
      );
    }).toList();
  }
}

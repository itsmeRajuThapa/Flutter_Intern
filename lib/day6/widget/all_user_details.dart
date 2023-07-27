import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../aditional_screen/project_screen.dart';
import '../details_list/worklist.dart';
import '../education/education_list.dart';

class AllModelData {
  final String firstName;
  final String lastName;
  final String middleName;
  final String gender;
  final String age;
  final List<String> skills;
  final List<addWork> workExp;
  final List<addEducation> education;
  final List<addProject> otherProjects;
  final List<String> languages;
  final List<String> interests;

  AllModelData({
    required this.firstName,
    required this.lastName,
    required this.middleName,
    required this.gender,
    required this.age,
    required this.skills,
    required this.workExp,
    required this.education,
    required this.otherProjects,
    required this.languages,
    required this.interests,
  });

  factory AllModelData.fromJson(Map<String, dynamic> json) {
    return AllModelData(
      firstName: json['firstName'],
      lastName: json['lastName'],
      middleName: json['middleName'],
      gender: json['gender'],
      age: json['age'],
      skills: List<String>.from(json['skills']),
      workExp:
          List<addWork>.from(json['workExp'].map((e) => addWork.fromJson(e))),
      education: List<addEducation>.from(
          json['education'].map((e) => addEducation.fromJson(e))),
      otherProjects: List<addProject>.from(
          json['otherProjects'].map((e) => addProject.fromJson(e))),
      languages: List<String>.from(json['languages']),
      interests: List<String>.from(json['interests']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'middleName': middleName,
      'gender': gender,
      'age': age,
      'skills': skills,
      'workExp': workExp.map((e) => e.toJson()).toList(),
      'education': education.map((e) => e.toJson()).toList(),
      'otherProjects': otherProjects.map((e) => e.toJson()).toList(),
      'languages': languages,
      'interests': interests,
    };
  }
}

List<AllModelData> addAllDetailsList = [];

class ViewDetails extends StatefulWidget {
  const ViewDetails({super.key});

  @override
  State<ViewDetails> createState() => _ViewDetailsState();
}

class _ViewDetailsState extends State<ViewDetails> {
  //List<dynamic> cvDetails = [];
  List<AllModelData> cvDetails = [];

  Future<List<String>> getCVData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonData = prefs.getString('dataList');
    if (jsonData != null) {
      try {
        final decodedData = json.decode(jsonData) as List<dynamic>;
        setState(() {
          cvDetails = decodedData.map((e) => AllModelData.fromJson(e)).toList();
        });
      } catch (e) {
        print("error occure ${e}");
      }
    } else {
      cvDetails = [];
    }
    return [];
  }

  @override
  void initState() {
    super.initState();
    getCVData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.amber,
        appBar: AppBar(
          title: const Text('View'),
          actions: [
            IconButton(
                onPressed: () async {
                  var todelete = await SharedPreferences.getInstance();
                  await todelete.clear();
                },
                icon: const Icon(Icons.delete))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView.builder(
              itemCount: cvDetails.length,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        "User ${index + 1}",
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text('First Name: ${cvDetails[index].firstName}'),
                    const SizedBox(height: 10),
                    Text('Middle Name: ${cvDetails[index].middleName}'),
                    const SizedBox(height: 10),
                    Text('Last Name: ${cvDetails[index].lastName}'),
                    const SizedBox(height: 10),
                    Text('Age: ${cvDetails[index].age}'),
                    const SizedBox(height: 10),
                    Text('Skills: ${cvDetails[index].skills.join(',')}'),
                    const SizedBox(height: 10),
                    const Text(
                      'Education',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 63, 51, 12),
                      ),
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: cvDetails[index].education.length,
                      itemBuilder: (BuildContext context, int i) {
                        return Card(
                          color: const Color.fromARGB(255, 212, 211, 211),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    "Organization: ${cvDetails[index].education[i].orgName}"),
                                Text(
                                    "Education: ${cvDetails[index].education[i].selector}"),
                                Text(
                                    'Entry Date: ${cvDetails[index].education[i].entryDate}'),
                                Text(
                                    'Exit Date: ${cvDetails[index].education[i].exitDate}'),
                                if (cvDetails[index]
                                    .education[i]
                                    .achievement
                                    .isNotEmpty)
                                  Text(
                                      "Achievements: ${cvDetails[index].education[i].achievement}"),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                    const Text('Work Experiance'),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: cvDetails[index].workExp.length,
                      itemBuilder: (BuildContext context, int i) {
                        return Card(
                          color: const Color.fromARGB(255, 212, 211, 211),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    "Job Title:  ${cvDetails[index].workExp[i].jobtitle}"),
                                Text(
                                    "Summary:    ${cvDetails[index].workExp[i].summary}"),
                                Text(
                                    "Company Name:  ${cvDetails[index].workExp[i].companyName}"),
                                Text(
                                    'Entry Date:  ${cvDetails[index].workExp[i].entryDate}'),
                                Text(
                                    'Exit Date:  ${cvDetails[index].workExp[i].exitDate}'),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    const Text(' Project '),
                    const SizedBox(height: 10),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: cvDetails[index].otherProjects.length,
                      itemBuilder: (BuildContext context, int i) {
                        return Card(
                          color: const Color.fromARGB(255, 212, 211, 211),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    "Project Title: ${cvDetails[index].otherProjects[i].projecttitle}"),
                                Text(
                                    "Summary: ${cvDetails[index].otherProjects[i].summary}"),
                                Text(
                                    'Entry Date: ${cvDetails[index].otherProjects[i].entryDate}'),
                                Text(
                                    'Exit Date: ${cvDetails[index].otherProjects[i].exitDate}'),
                                if (cvDetails[index]
                                    .otherProjects[i]
                                    .organization
                                    .isNotEmpty)
                                  Text(
                                      'Organization: ${cvDetails[index].otherProjects[i].organization}'),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                    Text('Language: ${cvDetails[index].languages.join(',')}'),
                    const SizedBox(height: 10),
                    Text(
                        'Interest Area: ${cvDetails[index].interests.join(',')}'),
                    const SizedBox(height: 10),
                    const Divider(
                      height: 25,
                      color: Colors.black,
                      thickness: 5,
                      endIndent: 20,
                      indent: 20,
                    )
                  ],
                );
              }),
        ));
  }
}

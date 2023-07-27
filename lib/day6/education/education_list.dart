class addEducation {
  final String orgName;
  final String achievement;
  final String selector;
  final String entryDate;
  final String exitDate;

  addEducation({
    required this.orgName,
    required this.selector,
    required this.achievement,
    required this.entryDate,
    required this.exitDate,
  });

  factory addEducation.fromJson(Map<String, dynamic> json) {
    return addEducation(
      orgName: json['orgName'],
      achievement: json['achievement'],
      selector: json['selector'],
      entryDate: json['entryDate'],
      exitDate: json['exitDate'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'orgName': orgName,
      'achievement': achievement,
      'selector': selector,
      'entryDate': entryDate,
      'exitDate': exitDate,
    };
  }
}

List<addEducation> addEducationList = [];

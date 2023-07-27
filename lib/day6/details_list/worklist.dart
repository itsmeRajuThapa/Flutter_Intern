class addWork {
  final String jobtitle;
  final String companyName;
  final String summary;
  final String entryDate;
  final String exitDate;

  addWork({
    required this.jobtitle,
    required this.companyName,
    required this.summary,
    required this.entryDate,
    required this.exitDate,
  });

  factory addWork.fromJson(Map<String, dynamic> json) {
    return addWork(
      jobtitle: json['jobtitle'],
      companyName: json['companyName'],
      summary: json['summary'],
      entryDate: json['entryDate'],
      exitDate: json['exitDate'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'jobtitle': jobtitle,
      'companyName': companyName,
      'summary': summary,
      'entryDate': entryDate,
      'exitDate': exitDate,
    };
  }
}

List<addWork> addworkList = [];

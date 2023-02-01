class ClassModel {

  String? className;
  int? unitNumber;
  String? teacherName;
  bool? classSelected;

  static List<ClassModel> listOfClass = [];

  ClassModel({this.className, this.unitNumber, this.teacherName, this.classSelected});

}

List<ClassModel> classList = [
  ClassModel(className: 'Artificial Intelligent', unitNumber: 3 , teacherName: 'Elon Musk', classSelected: false),
  ClassModel(className: 'Mathematics', unitNumber: 4 , teacherName: 'Jack ma', classSelected: false),
  ClassModel(className: 'Web Design', unitNumber: 2 , teacherName: 'Jeff bezos', classSelected: false),
  // ClassModel('Computer Industry', 3 , 'Bill Gates', false),
  // ClassModel('Psychology', 2 , 'Warren Buffet', false),
  // ClassModel('Programming', 5 , 'Mark ZakerBerg', false),
];


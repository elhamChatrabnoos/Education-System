class ClassModel {
  String? className;
  int? unitNumber;
  String? teacherName;
  bool? classSelected;

  static List<ClassModel> listOfClass = [];

  ClassModel(
      {this.className, this.unitNumber, this.teacherName, this.classSelected});
}

List<ClassModel> classList = [
  ClassModel(
      className: 'Artificial Intelligent',
      unitNumber: 3,
      teacherName: 'Elon Musk',
      classSelected: false),
  ClassModel(
      className: 'Mathematics',
      unitNumber: 4,
      teacherName: 'Jack ma',
      classSelected: false),
  ClassModel(
      className: 'Web Design',
      unitNumber: 2,
      teacherName: 'Jeff bezos',
      classSelected: false),
  ClassModel(
      className: 'Computer Industry',
      unitNumber: 3,
      teacherName: 'Bill Gates',
      classSelected: false),
  ClassModel(
      className: 'Psychology',
      unitNumber: 2,
      teacherName: 'Warren Buffet',
      classSelected: false),
  ClassModel(
      className: 'Programming',
      unitNumber: 5,
      teacherName: 'Mark ZakerBerg',
      classSelected: false),
];

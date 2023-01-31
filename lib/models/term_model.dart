import 'package:amuzesh_system/models/class_model.dart';

class TermModel{
  String? name;
  List<ClassModel>? classList;

  TermModel(this.name, this.classList);
}

List<TermModel> termList = [
  TermModel('Term1', classList),
  TermModel('Term2', classList),
  TermModel('Term3', classList),
  TermModel('Term4', classList),
];
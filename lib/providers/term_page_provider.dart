import 'package:amuzesh_system/models/class_model.dart';
import 'package:amuzesh_system/models/term_model.dart';
import 'package:flutter/cupertino.dart';

class TermPageProvider extends ChangeNotifier {
  // a model with empty list
  TermModel _selectedTerm = TermModel('Term1', ClassModel.listOfClass);
  int _selectedTermIndex = 0;
  List<ClassModel> listOfClass = classList;
  List<TermModel> _termList = [];
  List<ClassModel>? classListTerm1 = [];
  List<ClassModel>? classListTerm2 = [];
  List<ClassModel>? classListTerm3 = [];
  List<ClassModel>? classListTerm4 = [];

  TermPageProvider() {
    // classListTerm4 = List.from(classList);
    _termList = [
      TermModel('Term1', classListTerm1),
      TermModel('Term2', classListTerm2),
      TermModel('Term3', classListTerm3),
      TermModel('Term4', classListTerm4),
    ];

  }

  void deleteTerm(TermModel term) {
    termList.remove(term);
    notifyListeners();
  }

  void editeTerm(TermModel term) {
    notifyListeners();
  }

  bool searchItemInClassList(List<ClassModel> classOfTermList,  ClassModel classModel){
    return classOfTermList.contains(classModel);
  }

  void selectClassForTerm(ClassModel classModel, bool isChecked,
      List<ClassModel> classOfTermList) {
    print(isChecked);
    int index = classOfTermList.indexOf(classModel);

    if (index >= 0) {
      if (!isChecked) {
        classOfTermList.remove(classModel);
      }
    } else {
      classModel.classSelected = true;
      classOfTermList.add(classModel);
    }

    notifyListeners();
  }

  List<ClassModel> getClassOfTerm(List<ClassModel> classList) {
    List<ClassModel> listOfClass = [];
    for (int i = 0; i < classList.length; i++) {
      if (classList[i].classSelected!) {
        listOfClass.add(classList[i]);
      }
    }
    return listOfClass;
  }

  int get selectedTermIndex => _selectedTermIndex;

  set selectedTermIndex(int value) {
    _selectedTermIndex = value;
  }

  TermModel get selectedTerm => _selectedTerm;

  set selectedTerm(TermModel value) {
    _selectedTerm = value;
    notifyListeners();
  }

  List<TermModel> get termList => _termList;

  set termList(List<TermModel> value) {
    _termList = value;
  }
}

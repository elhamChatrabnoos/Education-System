import 'package:amuzesh_system/models/class_model.dart';
import 'package:amuzesh_system/models/term_model.dart';
import 'package:flutter/cupertino.dart';

class TermPageProvider extends ChangeNotifier {
  // a model with empty list
  TermModel _selectedTerm = TermModel('Term1', ClassModel.listOfClass);
  int _selectedTermIndex = 0;
  List<ClassModel> listOfClass = [];

  List<TermModel> termList = [
    TermModel('Term1', ClassModel.listOfClass),
    TermModel('Term2', ClassModel.listOfClass),
    TermModel('Term3', ClassModel.listOfClass),
    TermModel('Term4', ClassModel.listOfClass),
  ];

  void deleteTerm(TermModel term) {
    termList.remove(term);
    notifyListeners();
  }

  void addRemoveClassToTerm(ClassModel classModel, bool isAdd) {
    isAdd ? listOfClass.add(classModel) : listOfClass.remove(classModel);
  }

  void editeTerm(TermModel term) {
    termList.forEach((element) {
      if (element.name == term.name) {
        element.classList = listOfClass;
      }
    });
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
}

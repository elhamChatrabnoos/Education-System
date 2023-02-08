import 'package:amuzesh_system/models/class_model.dart';
import 'package:amuzesh_system/models/term_model.dart';
import 'package:flutter/cupertino.dart';

class TermPageProvider extends ChangeNotifier {
  // a model with empty list
  static List<ClassModel> listOfClass = [];

  TermModel _selectedTerm = TermModel('Term 1', listOfClass);
  int _selectedTermIndex = 0;
  List<TermModel> _termList = [];
  int termUnits = 0;

  TermPageProvider() {
    List<ClassModel>? classListTerm1 = [];
    List<ClassModel>? classListTerm2 = [];
    List<ClassModel>? classListTerm3 = [];
    List<ClassModel>? classListTerm4 = [];

    _termList = [
      TermModel('Term 1', classListTerm1),
      TermModel('Term 2', classListTerm2),
      TermModel('Term 3', classListTerm3),
      TermModel('Term 4', classListTerm4),
    ];
  }


  void deleteTerm(TermModel term) {
    termList.remove(term);
    notifyListeners();
  }


  bool addTerm() {
    List<ClassModel> classList = [];
    // search in termList to check target term for add
    for (int i = 0; i < _termList.length + 1; ++i) {
      bool thereIs = false;
      TermModel termModel = TermModel('Term ${i + 1}', classList);
      for (var j = 0; j < _termList.length; ++j) {
        if (termList[j].name == termModel.name) {
          thereIs = true;
          break;
        }
      }
      if (!thereIs) {
        if(i < 10){
          termList.add(termModel);
          notifyListeners();
          return true;
        }
      }
    }
    return false;
  }


  bool editeTerm(TermModel term, List<ClassModel> classList) {
    int unitNumber = 0;
    for (int i = 0; i < classList.length; ++i) {
      unitNumber += classList[i].unitNumber!;
    }
    //// if selected unit is more than 12 or lower than 20 unit save it
    if (unitNumber >= 12 && unitNumber <= 20) {
      term.classList = classList;
      notifyListeners();
      return true;
    }
    return false;
  }


  bool searchInClassOfTerm(
      List<ClassModel> classOfTermList, ClassModel classModel) {
    print(classOfTermList.length);
    return classOfTermList.contains(classModel);
  }


  void selectClassForTerm(
      ClassModel classModel, bool isChecked, List<ClassModel> classOfTerm) {
    int index = classOfTerm.indexOf(classModel);
    if (index >= 0) {
      if (!isChecked) {
        classOfTerm.remove(classModel);
      }
    } else {
      classOfTerm.add(classModel);
    }
    notifyListeners();
  }


  List<ClassModel> getClassOfTerm(List<ClassModel> classList) {
    List<ClassModel> listOfClass = [];
    for (int i = 0; i < classList.length; i++) {
      listOfClass.add(classList[i]);
    }
    return listOfClass;
  }


  int getTermUnits(TermModel termModel) {
    termUnits = 0;
    for (var element in termModel.classList!) {
      termUnits += element.unitNumber!;
    }
    return termUnits;
  }



////////// getters and setters
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

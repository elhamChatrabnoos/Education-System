import 'package:amuzesh_system/models/class_model.dart';
import 'package:flutter/widgets.dart';

class ClassesProvider extends ChangeNotifier{

    void deleteClass(ClassModel model){
      classList.remove(model);
      notifyListeners();
    }

    void addClass(ClassModel model){
      classList.add(model);
      notifyListeners();
    }

    void editClass(ClassModel model, int index){
      classList[index] = model;
      notifyListeners();
    }

}
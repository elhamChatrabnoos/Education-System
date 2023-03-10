import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/constants.dart';
import '../../models/class_model.dart';
import '../../providers/class_provider.dart';
import '../custom_dialog.dart';
import '../custom_list_item_class.dart';

class ClassPage extends StatefulWidget {
  const ClassPage({Key? key}) : super(key: key);

  @override
  State<ClassPage> createState() => _ClassPageState();
}

class _ClassPageState extends State<ClassPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ClassesProvider>(
          builder: (context, provider, child) {
            return Scaffold(
              body: listViewItems(provider),
              floatingActionButton: floatingButtonClick(context, provider),
            );
          },
        );
    // );
  }

  Widget floatingButtonClick(BuildContext context, ClassesProvider provider) {
    return FloatingActionButton(
      onPressed: () => _showAddDialog(provider),
      backgroundColor: Constants.primaryColor,
      child: const Icon(Icons.add, color: Colors.white),
    );
  }

  ListView listViewItems(ClassesProvider provider) {
    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: classList.length,
      itemBuilder: (context, index) {
        return CustomListItemClass(
          checkboxValue: classList[index].classSelected!,
          unitNumber: classList[index].unitNumber!,
          textName: classList[index].className!,
          teacherName: classList[index].teacherName!,
          onDeleteTap: () => provider.deleteClass(classList[index]),
          onEditTap: () => _showEditDialog(context, index, provider),
        );
      },
    );
  }

  Future<void> _showAddDialog(ClassesProvider provider) {
    return showDialog(
      context: context,
      builder: (_) => CustomDialog(isAddAction: true),
    ).then((value) {
      ClassModel model = ClassModel(
          className: value['className'],
          unitNumber: value['classUnit'],
          teacherName: value['teacherName'],
          classSelected: false);
      provider.addClass(model);
    });
  }

  Future<void> _showEditDialog(
      BuildContext context, int index, ClassesProvider provider) {
    return showDialog(
        context: context,
        builder: (context) => CustomDialog(
              isAddAction: false,
              className: classList[index].className,
              classTeacher: classList[index].teacherName,
              classUnit: classList[index].unitNumber,
            )).then((value) {
      ClassModel model = ClassModel(
        className: value['className'],
        unitNumber: value['classUnit'],
        teacherName: value['teacherName'],
        classSelected: false,
      );
      provider.editClass(model, index);
    });
  }
}

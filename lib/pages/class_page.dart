import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/constants.dart';
import '../models/class_model.dart';
import '../providers/class_provider.dart';
import '../views/custom_dialog.dart';
import '../views/list_view_class.dart';

class ClassPage extends StatefulWidget {
  const ClassPage({Key? key}) : super(key: key);

  @override
  State<ClassPage> createState() => _ClassPageState();
}

class _ClassPageState extends State<ClassPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ClassesProvider(),
        child: Consumer<ClassesProvider>(
          builder: (context, provider, child) {
            return Scaffold(
              body: listViewItems(provider),
              floatingActionButton: floatingButtonClick(context, provider),
            );
          },
        ));
  }

  FloatingActionButton floatingButtonClick(
      BuildContext context, ClassesProvider provider) {
    return FloatingActionButton(
      onPressed: () => _showAddDialog(context, provider),
      backgroundColor: Constants.primaryColor,
      child: const Icon(Icons.add, color: Colors.white),
    );
  }

  Future<void> _showAddDialog(BuildContext context, ClassesProvider provider) {
    return showDialog(
      context: context,
      builder: (context) => CustomDialog(isAddAction: true),
    ).then((value) {
      ClassModel model =
          ClassModel(value['className'], value['classUnit'], value['teacherName']);
      provider.addClass(model);
    });
  }

  ListView listViewItems(ClassesProvider provider) {
    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: classList.length,
      itemBuilder: (context, index) {
        return CustomListItemClass(
          unitNumber: classList[index].unitNumber!,
          textName: classList[index].className!,
          teacherName: classList[index].teacherName!,
          closeOnTap: () => provider.deleteClass(classList[index]),
          editOnTap: () => _showEditDialog(context, index, provider),
        );
      },
    );
  }

  Future<void> _showEditDialog(BuildContext context, int index, ClassesProvider provider) {
    return showDialog(
            context: context,
            builder: (context) => CustomDialog(
              isAddAction: false,
                  className: classList[index].className,
                  classTeacher: classList[index].teacherName,
                  classUnit: classList[index].unitNumber,
                )).then((value) {
          ClassModel model = ClassModel(
              value['className'],
              value['classUnit'],
              value['teacherName']);
          provider.editClass(model, index);
        });
  }
}

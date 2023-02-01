import 'package:amuzesh_system/core/constants.dart';
import 'package:amuzesh_system/models/class_model.dart';
import 'package:amuzesh_system/models/term_model.dart';
import 'package:amuzesh_system/pages/home_page.dart';
import 'package:amuzesh_system/providers/class_provider.dart';
import 'package:amuzesh_system/providers/term_page_provider.dart';
import 'package:amuzesh_system/views/custom_list_item_class.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddEditTerm extends StatefulWidget {
  AddEditTerm({Key? key}) : super(key: key);

  @override
  State<AddEditTerm> createState() => _AddEditTermState();
}

class _AddEditTermState extends State<AddEditTerm> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TermPageProvider()),
        ChangeNotifierProvider(create: (context) => ClassesProvider()),
      ],
      child: Scaffold(
          backgroundColor: Constants.backColor,
          resizeToAvoidBottomInset: true,
          appBar: AppBar(),
          body: wholeBody(context)),
    );
  }

  Widget wholeBody(BuildContext context) {
    return Column(
      children: [
        _termsList(context),
        _dropdownButton(context),
        _saveButton(context),
        Constants.littleSizeBox,
      ],
    );
  }

  Widget _saveButton(BuildContext context) {
    return Consumer<TermPageProvider>(
      builder: (context, provider, child) {
        return Container(
          margin: const EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 14,
          child: saveButton(provider, context),
        );
      },
    );
  }

  ElevatedButton saveButton(TermPageProvider provider, BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          provider.editeTerm(provider.selectedTerm);
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(
                    termPageProvider: provider, backFromOtherPage: true),
              ));
        },
        child: Text('save'));
  }

  Widget _dropdownButton(BuildContext context) {
    bool helper = false;
    return Consumer<TermPageProvider>(builder: (context, provider, child) {
      return Container(
          margin: const EdgeInsets.all(10),
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          child: DropdownButtonHideUnderline(
            child: ButtonTheme(
              alignedDropdown: true,
              child: DropdownButton<TermModel>(
                hint: Text('select term'),
                value: !helper ? provider.termList[0] : provider.selectedTerm,
                onChanged: (TermModel? value) {
                  helper = true;
                  provider.selectedTerm = value!;
                },
                items: provider.termList.map((TermModel item) {
                  return DropdownMenuItem<TermModel>(
                      value: item, child: Text(item.name!));
                }).toList(),
              ),
            ),
          ));
    });
  }

  Widget _termsList(BuildContext context) {
    return Consumer2<ClassesProvider, TermPageProvider>(
      builder: (context, providerClass, providerTerm, child) {
        return Container(
          margin: EdgeInsets.all(20),
          color: Constants.primaryColor,
          height: MediaQuery.of(context).size.height / 1.6,
          child: ListView.builder(
            itemCount: classList.length,
            itemBuilder: (context, int index) {
              return CustomListItemClass(
                  isEditableActive: false,
                  onCheckbox: (checked) {
                    providerClass.selectClass(index, checked!);
                    providerTerm.addRemoveClassToTerm(
                        classList[index], checked);
                  },
                  checkboxValue: classList[index].classSelected!,
                  unitNumber: classList[index].unitNumber!,
                  textName: classList[index].className!,
                  teacherName: classList[index].teacherName!);
            },
          ),
        );
      },
    );
  }
}

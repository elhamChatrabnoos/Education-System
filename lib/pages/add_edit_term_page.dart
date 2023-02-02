import 'package:amuzesh_system/core/constants.dart';
import 'package:amuzesh_system/models/class_model.dart';
import 'package:amuzesh_system/models/term_model.dart';
import 'package:amuzesh_system/pages/home_page.dart';
import 'package:amuzesh_system/pages/term_page.dart';
import 'package:amuzesh_system/providers/class_provider.dart';
import 'package:amuzesh_system/providers/term_page_provider.dart';
import 'package:amuzesh_system/views/custom_list_item_class.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddEditTerm extends StatelessWidget {
  AddEditTerm(
      {Key? key,
      required this.termPageProvider,
      required this.inputClassList,
      this.selectedTerm})
      : super(key: key);

  TermPageProvider termPageProvider;
  List<ClassModel> inputClassList;
  final TermModel? selectedTerm;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: termPageProvider,
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
        _classList(context),
        _dropdownButton(context),
        _saveData(context),
        Constants.littleSizeBox,
      ],
    );
  }

  Widget _saveData(BuildContext context) {
    return Consumer<TermPageProvider>(builder: (context, provider, child) {
      return Container(
        margin: const EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 14,
        child: _saveButton(provider, context),
      );
    });
  }

  ElevatedButton _saveButton(TermPageProvider provider, BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          provider.editeTerm(provider.selectedTerm);
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(
                  termPageProvider: provider,
                  backFromOtherPage: true,
                ),
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
                hint: const Text('select term'),
                // if any term click to edit disable this button
                onChanged: selectedTerm == null ? (TermModel? value) {
                  helper = true;
                  provider.selectedTerm = value!;
                } : null,
                value: !helper ? selectedTerm : provider.selectedTerm,
                items: provider.termList.map((TermModel item) {
                  return DropdownMenuItem<TermModel>(
                      value: item, child: Text(item.name!));
                }).toList(),
              ),
            ),
          ));
    });
  }

  Widget _classList(BuildContext context) {
    return Consumer<TermPageProvider>(
      builder: (context, providerTerm, child) {
        return Container(
          margin: EdgeInsets.all(20),
          color: Constants.primaryColor,
          height: MediaQuery.of(context).size.height / 1.6,
          child: ListView.builder(
            itemCount: classList.length,
            itemBuilder: (context, int index) {
              return _classListItemEdit(providerTerm, index);
            },
          ),
        );
      },
    );
  }


  Widget _classListItemEdit(TermPageProvider providerTerm, int index) {
    return CustomListItemClass(
        isEditableActive: false,
        onCheckbox: (checked) {
          providerTerm.selectClassForTerm(
              classList[index], checked!, inputClassList);
        },
        checkboxValue: providerTerm.searchItemInClassList(
            inputClassList, classList[index]),
        unitNumber: classList[index].unitNumber!,
        textName: classList[index].className!,
        teacherName: classList[index].teacherName!);
  }

}

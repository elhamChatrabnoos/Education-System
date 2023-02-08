import 'package:amuzesh_system/core/app_texts.dart';
import 'package:amuzesh_system/core/constants.dart';
import 'package:amuzesh_system/models/class_model.dart';
import 'package:amuzesh_system/models/term_model.dart';
import 'package:amuzesh_system/providers/class_provider.dart';
import 'package:amuzesh_system/providers/term_page_provider.dart';
import 'package:amuzesh_system/views/custom_list_item_class.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home/home_view.dart';

class AddEditTerm extends StatelessWidget {
  AddEditTerm(
      {Key? key,
      required this.termPageProvider,
      required this.inputClassList,
      this.selectedTerm})
      : super(key: key);

  TermPageProvider termPageProvider;
  List<ClassModel> inputClassList;
  TermModel? selectedTerm;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: termPageProvider,
      child: Scaffold(
          backgroundColor: Colors.grey,
          resizeToAvoidBottomInset: true,
          appBar: AppBar(),
          body: wholeBody(context)),
    );
  }

  Widget wholeBody(BuildContext context) {
    return Column(
      children: [
        Constants.littleSizeBox,
        _dropdownButton(context),
        _classList(context),
        _saveData(context),
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
          if (provider.editeTerm(selectedTerm!, inputClassList)) {
            provider.getTermUnits(selectedTerm!);
            Navigator.pop(context);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(AppTexts.classLimitationMsg)));
          }
        },
        child: Text(AppTexts.saveButtonTxt));
  }

  Future<dynamic> _backHomePage(
      BuildContext context, TermPageProvider provider) {
    return Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeView(),
        ));
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
                onChanged: selectedTerm == null
                    ? (TermModel? value) {
                        helper = true;
                        provider.selectedTerm = value!;
                      }
                    : null,
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
          margin: const EdgeInsets.all(20),
          color: Colors.black45,
          height: MediaQuery.of(context).size.height / 1.6,
          child: ListView.builder(
            itemCount: classList.length,
            itemBuilder: (context, int index) {
              return _classListEditable(providerTerm, index);
            },
          ),
        );
      },
    );
  }

  Widget _classListEditable(TermPageProvider providerTerm, int index) {
    return CustomListItemClass(
        isEditableActive: false,
        onCheckbox: (checked) {
          providerTerm.selectClassForTerm(
              classList[index], checked!, inputClassList);
        },
        checkboxValue:
            providerTerm.searchInClassOfTerm(inputClassList, classList[index]),
        unitNumber: classList[index].unitNumber!,
        textName: classList[index].className!,
        teacherName: classList[index].teacherName!);
  }
}

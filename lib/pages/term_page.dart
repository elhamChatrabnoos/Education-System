import 'package:amuzesh_system/core/constants.dart';
import 'package:amuzesh_system/models/class_model.dart';
import 'package:amuzesh_system/pages/add_edit_term_page.dart';
import 'package:amuzesh_system/providers/term_page_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/app_texts.dart';
import '../views/custom_list_item.dart';

class TermPage extends StatelessWidget {
  const TermPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _listOfTerms(), floatingActionButton: _floatingButton(context));
  }

  Widget _floatingButton(BuildContext context) {
    return Consumer<TermPageProvider>(
      builder: (context, provider, child) {
        return FloatingActionButton(
          onPressed: () {
            if (!provider.addTerm()) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(AppTexts.extraTermMsg)));
            }
          },
          backgroundColor: Constants.primaryColor,
          child: const Icon(Icons.add, color: Colors.white),
        );
      },
    );
  }

  Widget _listOfTerms() {
    return Consumer<TermPageProvider>(
      builder: (context, provider, child) {
        return GridView.builder(
          padding: const EdgeInsets.all(10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.90,
          ),
          itemCount: provider.termList.length,
          itemBuilder: (context, index) {
            return _eachTermItem(provider, index, context);
          },
        );
      },
    );
  }

  InkWell _eachTermItem(
      TermPageProvider provider, int index, BuildContext context) {
    return InkWell(
        child: CustomListItem(
            onDeleteTap: () => provider.deleteTerm(provider.termList[index]),
            textName: provider.termList[index].name!,
            classNumber:
                provider.getTermUnits(provider.termList[index]).toString()),
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AddEditTerm(
                      termPageProvider: provider,
                      selectedTerm: provider.termList[index],
                      inputClassList: provider
                          .getClassOfTerm(provider.termList[index].classList!),
                    ))));
  }
}

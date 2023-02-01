import 'package:amuzesh_system/core/constants.dart';
import 'package:amuzesh_system/pages/add_edit_term_page.dart';
import 'package:amuzesh_system/providers/term_page_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../views/custom_list_item.dart';

class TermPage extends StatelessWidget {
  TermPage({Key? key, this.termPageProvider, this.backFromOtherPage = false})
      : super(key: key);

  TermPageProvider? termPageProvider;
  final bool backFromOtherPage;

  @override
  Widget build(BuildContext context) {
    return backFromOtherPage
        ? ChangeNotifierProvider.value(
            value: termPageProvider,
            child: Scaffold(
                body: _listsItemBody(),
                floatingActionButton: _floatingButton(context)))
        : ChangeNotifierProvider(
            create: (BuildContext context) => TermPageProvider(),
            child: Scaffold(
                body: _listsItemBody(),
                floatingActionButton: _floatingButton(context)));
  }

  Widget _floatingButton(
      BuildContext context) {
    return Consumer<TermPageProvider>(builder: (context, value, child) {
        return FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddEditTerm(
                      termPageProvider: value,
                    )));
          },
          backgroundColor: Constants.primaryColor,
          child: const Icon(Icons.add, color: Colors.white),
        );
      },);
  }

  Widget _listsItemBody() {
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
            return eachListItem(provider, index, context);
          },
        );
      },
    );
  }

  InkWell eachListItem(
      TermPageProvider provider, int index, BuildContext context) {
    return InkWell(
        child: CustomListItem(
            onDeleteTap: () => provider.deleteTerm(provider.termList[index]),
            textName: provider.termList[index].name!,
            classNumber: provider.termList[index].classList!.length.toString()),
        onTap: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => AddEditTerm())));
  }
}

import 'package:amuzesh_system/models/term_model.dart';
import 'package:amuzesh_system/pages/class_page.dart';
import 'package:amuzesh_system/pages/term_page.dart';
import 'package:amuzesh_system/providers/class_provider.dart';
import 'package:amuzesh_system/providers/term_page_provider.dart';
import 'package:amuzesh_system/views/custom_list_item.dart';
import 'package:amuzesh_system/views/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/constants.dart';
import 'add_edit_term_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key, this.termPageProvider, this.backFromOtherPage = false})
      : super(key: key);

  TermPageProvider? termPageProvider;
  final bool? backFromOtherPage;

  @override
  Widget build(BuildContext context) {
    return backFromOtherPage!
        ? ChangeNotifierProvider.value(
            value: termPageProvider,
            child: DefaultTabController(
                length: 2,
                child: Scaffold(appBar: appBarOptions(), body: wholeBody())))
        : ChangeNotifierProvider(
            create: (context) => TermPageProvider(),
            child: DefaultTabController(
                length: 2,
                child: Scaffold(appBar: appBarOptions(), body: wholeBody())),
          );
  }

  Widget wholeBody() {
    return Consumer<TermPageProvider>(
      builder: (context, provider, child) {
        return TabBarView(
          // controller: _tabController,
          children: <Widget>[
            Scaffold(
                body: _listsItemBody(),
                floatingActionButton: _floatingButton(context)),
            ClassPage()
          ],
        );
      },
    );
  }

  Widget _floatingButton(BuildContext context) {
    return Consumer<TermPageProvider>(
      builder: (context, value, child) {
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
      },
    );
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

  AppBar appBarOptions() {
    return AppBar(
      bottom: const TabBar(
          // controller: _tabController,
          tabs: [
            Tab(child: CustomText(text: 'Terms', textSize: 20)),
            Tab(child: CustomText(text: 'Classes', textSize: 20)),
          ]),
    );
  }
}

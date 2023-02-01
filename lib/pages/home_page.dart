import 'package:amuzesh_system/models/term_model.dart';
import 'package:amuzesh_system/pages/class_page.dart';
import 'package:amuzesh_system/pages/term_page.dart';
import 'package:amuzesh_system/providers/term_page_provider.dart';
import 'package:amuzesh_system/views/custom_list_item.dart';
import 'package:amuzesh_system/views/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
                child: Scaffold(
                    appBar: appBarOptions(),
                    body: wholeBody(termPageProvider!))),
          )
        : ChangeNotifierProvider(
            create: (context) => TermPageProvider(),
            child: Consumer<TermPageProvider>(
              builder: (context, value, child) => DefaultTabController(
                  length: 2,
                  child: Scaffold(
                      appBar: appBarOptions(), body: wholeBody(value))),
            ));
  }

  Widget wholeBody(TermPageProvider provider) {
    return TabBarView(
      // controller: _tabController,
      children: <Widget>[
        TermPage(
          termProvider: provider,
        ),
        ClassPage()
      ],
    );
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

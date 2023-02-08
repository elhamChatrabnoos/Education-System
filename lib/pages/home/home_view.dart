import 'package:amuzesh_system/pages/class_page.dart';
import 'package:amuzesh_system/pages/term_page.dart';
import 'package:amuzesh_system/providers/term_page_provider.dart';
import 'package:amuzesh_system/views/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2, child: Scaffold(appBar: appBarOptions(), body: wholeBody()));
  }

  Widget wholeBody() {
    return Consumer<TermPageProvider>(
      builder: (context, provider, child) {
        return const TabBarView(
          children: <Widget>[TermPage(), ClassPage()],
        );
      },
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

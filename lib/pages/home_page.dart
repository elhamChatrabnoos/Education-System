import 'package:amuzesh_system/models/term_model.dart';
import 'package:amuzesh_system/pages/class_page.dart';
import 'package:amuzesh_system/pages/term_page.dart';
import 'package:amuzesh_system/views/custom_list_item.dart';
import 'package:amuzesh_system/views/custom_text.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(appBar: appBarOptions(), body: wholeBody()));
  }

  Widget wholeBody() {
    return const TabBarView(
      // controller: _tabController,
      children: <Widget>[TermPage(), ClassPage()],
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

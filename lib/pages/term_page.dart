import 'package:amuzesh_system/core/constants.dart';
import 'package:amuzesh_system/pages/add_edit_term_page.dart';
import 'package:amuzesh_system/pages/login_page.dart';
import 'package:flutter/material.dart';

import '../models/term_model.dart';
import '../views/custom_list_item.dart';

class TermPage extends StatelessWidget {
  const TermPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _listsItemBody(), floatingActionButton: _floatingButton(context));
  }

  FloatingActionButton _floatingButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => AddEditTerm()));
      },
      backgroundColor: Constants.primaryColor,
      child: const Icon(Icons.add, color: Colors.white),
    );
  }

  GridView _listsItemBody() {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.90,
      ),
      itemCount: termList.length,
      itemBuilder: (context, index) {
        return InkWell(
            child: CustomListItem(
                textName: termList[index].name!,
                classNumber: termList[index].classList!.length.toString()),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddEditTerm())));
      },
    );
  }
}

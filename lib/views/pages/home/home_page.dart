import 'package:amuzesh_system/providers/term_page_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/class_provider.dart';
import 'home_view.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TermPageProvider()),
        ChangeNotifierProvider(create: (context) => ClassesProvider())
      ],
      child: HomeView(),
    );
  }
}

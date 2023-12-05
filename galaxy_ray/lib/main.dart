import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_file.dart';

import 'screens/loading.dart';

void main() async{

  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(scaffoldBackgroundColor: const Color(0xffeeeeee)),
      debugShowCheckedModeBanner: false,
      home: Loading(),
    );
  }
}

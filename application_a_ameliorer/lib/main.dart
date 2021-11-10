import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'src/data/done_provider.dart';
import 'src/data/loader.dart';
import 'src/data/parse_agenda.dart';
import 'src/list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => DoneNotifier(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: "Georgia",
          textTheme: const TextTheme(
              headline1: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber),
              headline2: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.amberAccent),
              bodyText1: TextStyle(
                  fontSize: 14, fontFamily: "Hind", color: Colors.red))),
      title: 'Flutter Demo',
      home: Loader(
        () => parseAgenda(context),
        (agenda) => MyAgendaList(agenda),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

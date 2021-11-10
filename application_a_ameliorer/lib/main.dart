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

Map<int, Color> xiketicColor = {
  50: Color.fromRGBO(28, 15, 19, .1),
  100: Color.fromRGBO(28, 15, 19, .2),
  200: Color.fromRGBO(28, 15, 19, .3),
  300: Color.fromRGBO(28, 15, 19, .4),
  400: Color.fromRGBO(28, 15, 19, .5),
  500: Color.fromRGBO(28, 15, 19, .6),
  600: Color.fromRGBO(28, 15, 19, .7),
  700: Color.fromRGBO(28, 15, 19, .8),
  800: Color.fromRGBO(28, 15, 19, .9),
  900: Color.fromRGBO(28, 15, 19, 1),
};

Map<int, Color> slateGrayColor = {
  50: Color.fromRGBO(110, 126, 133, .1),
  100: Color.fromRGBO(110, 126, 133, .2),
  200: Color.fromRGBO(110, 126, 133, .3),
  300: Color.fromRGBO(110, 126, 133, .4),
  400: Color.fromRGBO(110, 126, 133, .5),
  500: Color.fromRGBO(110, 126, 133, .6),
  600: Color.fromRGBO(110, 126, 133, .7),
  700: Color.fromRGBO(110, 126, 133, .8),
  800: Color.fromRGBO(110, 126, 133, .9),
  900: Color.fromRGBO(110, 126, 133, 1),
};

MaterialColor xiketic = MaterialColor(0xFF1C0F13, xiketicColor);
MaterialColor slateGray = MaterialColor(0xFF6E7E85, slateGrayColor);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: slateGray,
          ).copyWith(secondary: xiketic),
          fontFamily: "Georgia",
          textTheme: const TextTheme(
              headline1: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
              headline2: TextStyle(
                  fontSize: 16,
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

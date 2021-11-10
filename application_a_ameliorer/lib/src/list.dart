import 'package:flutter/material.dart';
import 'package:tp2/main.dart';
import 'congrats.dart';
import 'data/agenda.dart';
import 'item.dart';

class MyAgendaList extends StatelessWidget {
  final Agenda agenda;

  const MyAgendaList(this.agenda);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: Scaffold(
            body: Container(
              color: slateGray[900],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'My agendas',
                    style: Theme.of(context)
                        .textTheme
                        .headline1
                        .merge(TextStyle(color: xiketic[900])),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'These are the topics I’d like to discuss today.',
                    style: Theme.of(context)
                        .textTheme
                        .headline2
                        .merge(TextStyle(color: xiketic[900])),
                  ),
                  SizedBox(height: 20),
                  for (final item in agenda.items) AgendaListItem(item),
                ],
              ),
            ),
          ),
        ),
        CongratsCard(),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'data/agenda.dart';
import 'data/done_provider.dart';
import 'detail.dart';
import 'package:provider/provider.dart';

class AgendaListItem extends StatelessWidget {
  final AgendaItem item;

  const AgendaListItem(this.item);

  @override
  Widget build(BuildContext context) {
    final isDone =
        context.select<DoneNotifier, bool>((value) => value.isDone(item));

    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.fromLTRB(25, 10, 25, 10),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => ItemDetail(item)));
              },
              child: Text(
                item.name,
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              context.read<DoneNotifier>().toggle(item);
            },
            child: Icon(Icons.check_box_outline_blank,
                size: 48,
                color: isDone ? theme.primaryColor : theme.primaryColorLight),
          ),
        ],
      ),
    );
  }
}

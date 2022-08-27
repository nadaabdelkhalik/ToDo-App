import 'package:flutter/material.dart';

import 'consts.dart';
import 'item_builder.dart';

class Done extends StatefulWidget {
  const Done({Key? key}) : super(key: key);

  @override
  State<Done> createState() => _DoneState();
}

class _DoneState extends State<Done> {
  @override
  void initState() {
    tasks = doneTasks;
       done = Icons.undo;
    archive = Icons.archive;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: ((context, index) => item(index:index,context: context)),
      itemCount: tasks.length,
    );
  }
}
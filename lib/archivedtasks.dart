import 'package:flutter/material.dart';

import 'consts.dart';
import 'item_builder.dart';

class Archived extends StatefulWidget {
  const Archived({Key? key}) : super(key: key);

  @override
  State<Archived> createState() => _ArchivedState();
}

class _ArchivedState extends State<Archived> {
  @override
  void initState() {
    tasks = archivedTasks;
    archive = Icons.unarchive;
    done = Icons.done;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: ((context, index) => item(index: index, context: context)),
      itemCount: tasks.length,
    );
  }
}

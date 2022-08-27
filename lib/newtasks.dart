import 'package:flutter/material.dart';
import 'package:flutter_application_1/item_builder.dart';

import 'consts.dart';

class New extends StatefulWidget {
  const New({Key? key}) : super(key: key);

  @override
  State<New> createState() => _NewState();
}

class _NewState extends State<New> {
  @override
  void initState() {
    tasks = newTasks;
    done = Icons.done;
    archive = Icons.archive;
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

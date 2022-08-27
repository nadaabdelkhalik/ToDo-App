// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import 'consts.dart';
import 'creating_database.dart';

Widget itemBody(var index, var context) {
  return Column(
    children: [
      Container(
        color: Colors.grey[200],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 50,
                child: Text(tasks[index]['time']),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 1 / 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tasks[index]['title'],
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 1 / 30,
                ),
                Text(tasks[index]['date'])
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: IconButton(
                onPressed: (() {
                  if (tasks == doneTasks) {
                    updateData(status: 'new', id: tasks[index]['id'])
                        .then((value) => print('updated'));


                  } else {
                    updateData(status: 'done', id: tasks[index]['id'])
                        .then((value) => print('updated'));
                  }
                }),
                icon:  Icon(
                  done,
                  color: Colors.green,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: IconButton(
                onPressed: (() {
                  if(tasks==archivedTasks)
                  {
                    updateData(status: 'new', id: tasks[index]['id'])
                        .then((value) => print('updated'));
                  }
                  else {
                    updateData(status: 'archived', id: tasks[index]['id'])
                      .then((value) => print('updated'));
                  }
                }),
                icon:  Icon(
                  archive,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
      SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.width * (1 / 100),
      )
    ],
  );
}

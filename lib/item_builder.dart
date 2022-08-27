// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import 'package:flutter_application_1/creating_database.dart';
import 'package:flutter_application_1/item.dart';

import 'button.dart';
import 'consts.dart';

Widget item({var index, var context}) {
  return GestureDetector(
      onLongPress: () => showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text('Delete Item'),
                content: const Text('Do  You want to delete This Item?'),
                actions: [
                  button(
                      text: 'Cancel',
                      width: MediaQuery.of(context).size.width * 1 / 3,
                      height: MediaQuery.of(context).size.height * 1 / 12,
                      onPressed: () => Navigator.pop(context)),
                  button(
                      text: 'Delete',
                      width: MediaQuery.of(context).size.width * 1 / 3,
                      height: MediaQuery.of(context).size.height * 1 / 12,
                      onPressed: () {
                        deleteDataBase(id: tasks[index]['id']);
                        Navigator.pop(context);
                      })
                ],
              )),
      child: itemBody(index, context));
}

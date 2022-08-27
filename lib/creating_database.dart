// ignore_for_file: avoid_print

import 'package:flutter_application_1/consts.dart';
import 'package:sqflite/sqflite.dart';

void createDataBase() async {
  database =
      await openDatabase('ToDo.db', version: 1, onCreate: (database, version) {
    database
        .execute(
            'CREATE TABLE Task  (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT,status TEXT)')
        .then((value) => print('done'));
  }, onOpen: (database) {
    getDataFromDataBase(database).then((value) {
      print(tasks);
    });
  });
}

Future insertIntoDataBase(
    {required String title, required String date, required String time}) async {
  await database.transaction((txn) => txn.rawInsert(
      'INSERT INTO Task(title, date, time,status) VALUES("$title", "$date", "$time","new")'));
}

Future getDataFromDataBase(database) async {
  newTasks = [];
  doneTasks = [];
  archivedTasks = [];
  database.rawQuery('SELECT * FROM Task').then((value) {
    for (var n in value) {
      if (n['status'] == 'done') {
        doneTasks.add(n);
      } else if (n['status'] == 'archived') {
        archivedTasks.add(n);
      } else {
        newTasks.add(n);
      }
    }
  });
}

void deleteDataBase({required int id}) async {
  await database.transaction(
      (txn) => txn.rawDelete('DELETE FROM Task WHERE id = ?', [id]).then((value) => getDataFromDataBase(database)));
}

Future updateData({required String status, required int id}) async {
  await database.rawUpdate('UPDATE Task SET status = ?  WHERE id = ?',
      [status, id]).then((value) => getDataFromDataBase(database));
}

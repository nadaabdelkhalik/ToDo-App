// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_application_1/button.dart';
import 'package:flutter_application_1/consts.dart';
import 'package:flutter_application_1/creating_database.dart';
import 'package:flutter_application_1/text_fields.dart';
import 'package:intl/intl.dart';

class Bottom extends StatefulWidget {
  const Bottom({Key? key}) : super(key: key);

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          textField1(
              text: 'Title',
              prefixicon: const Icon(Icons.title),
              textInputType: TextInputType.text,
              controller: titleController,
              validator: (value) {
                if (value.isEmpty) return 'Task Name is required';
              }),
          textField1(
              text: 'Time',
              onTap: () {
                showTimePicker(context: context, initialTime: TimeOfDay.now())
                    .then((value) =>
                        timeController.text = value!.format(context));
              },
              prefixicon: const Icon(Icons.watch_later_outlined),
              textInputType: TextInputType.datetime,
              controller: timeController,
              validator: (value) {
                if (value.isEmpty) return 'Time is required';
              }),
          textField1(
              text: 'Date',
              onTap: () {
                showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime.parse('2030-12-12'))
                    .then((value) =>
                        dateController.text = DateFormat.yMEd().format(value!));
              },
              prefixicon: const Icon(Icons.calendar_today),
              textInputType: TextInputType.datetime,
              controller: dateController,
              validator: (value) {
                if (value.isEmpty) return 'Date is required';
              }),
          button(
              text: 'Add',
              width: MediaQuery.of(context).size.width*9/10,
              height: MediaQuery.of(context).size.height*1/10,
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  insertIntoDataBase(
                          title: titleController.text,
                          time: timeController.text,
                          date: dateController.text)
                      .then((value) {
                    titleController.clear();
                    timeController.clear();
                    dateController.clear();
                  });
                  getDataFromDataBase(database).then((value) {
                    print(tasks);
                  });
                }
              })
        ],
      ),
    );
  }
}

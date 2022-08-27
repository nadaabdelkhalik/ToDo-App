import 'package:flutter/material.dart';
import 'package:flutter_application_1/archivedtasks.dart';
import 'package:flutter_application_1/donetasks.dart';
import 'package:flutter_application_1/newtasks.dart';
import 'package:sqflite/sqflite.dart';

const titles = [' New Tasks', ' Done Tasks', ' Archived Tasks'];
var currentIndex = 0;
const pages = [New(), Done(), Archived()];
late Database database;
bool bottomSheetShown = false;
var bottomIcon = Icons.add;
var tasks = [];
var newTasks = [];
var doneTasks = [];
var archivedTasks = [];
var titleController = TextEditingController();
var timeController = TextEditingController();
var dateController = TextEditingController();
var scaffoldKey = GlobalKey<ScaffoldState>();
var formKey = GlobalKey<FormState>();
 var archive = Icons.archive;
  var done = Icons.done;


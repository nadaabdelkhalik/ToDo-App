import 'package:flutter/material.dart';
import 'package:flutter_application_1/bottomsheet.dart';
import 'package:flutter_application_1/creating_database.dart';

import 'consts.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    createDataBase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          centerTitle: true,
          title: Text(titles[currentIndex]),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: const Icon(Icons.task), label: titles[0]),
            BottomNavigationBarItem(
                icon: const Icon(Icons.done), label: titles[1]),
            BottomNavigationBarItem(
                icon: const Icon(Icons.archive), label: titles[2]),
          ],
          elevation: 0,
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
        body: pages[currentIndex],
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (!bottomSheetShown) {
              scaffoldKey.currentState!
                  .showBottomSheet((context) => const Bottom());
                    setState(() {
                         bottomIcon = Icons.edit;
                  
             });
          
            } else {
              (Navigator.pop(context));
                     setState(() {
                         bottomIcon = Icons.add;
                  
             });
            }
            bottomSheetShown = !bottomSheetShown;
           
          },
          child: Icon(bottomIcon),
          
        ));
        
  }
}

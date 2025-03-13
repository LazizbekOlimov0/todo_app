import 'dart:math';

import 'package:flutter/material.dart';
import 'package:todo_app/models/mock_todolist.dart';
import 'package:todo_app/pages/home_page.dart';
import '../models/todo_model.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});
  
  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {

  TextEditingController controllerTitle = TextEditingController();
  TextEditingController controllerDetail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.indigo.shade200,
        title: Text("Add Task",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        centerTitle: false,
        toolbarHeight: 84,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(32),
        child: SizedBox(
          height: 500,
          child: Column(
            spacing: 32,
            children: [
              TextField(
                controller: controllerTitle,
                decoration: InputDecoration(
                  label: Text("Title"),
                ),
              ),
              TextField(
                  controller: controllerDetail,
                  decoration: InputDecoration(
                    label: Text("Detail"),
                  ),
              ),
              MaterialButton(
                onPressed: (){
                  int id = Random().nextInt(100);
                  Set<int> setId={
                    id,
                  };
                  while(setId.contains(id)){
                    id = Random().nextInt(100);
                  }
                  if(controllerTitle.text.isNotEmpty && controllerDetail.text.isNotEmpty){
                    final todo = TodoModel(id: id, title: controllerTitle.text, subtitle: controllerDetail.text, isCheck: false);
                    setState(() {
                      todoList.add(todo);
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                            (Route<dynamic> route) => false,
                      );
                    });
                    controllerTitle.clear();
                    controllerDetail.clear();
                  }
                },
                elevation: 8,
                height: 72,
                minWidth: 800,
                color: Colors.indigo.shade200,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text("ADD",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}

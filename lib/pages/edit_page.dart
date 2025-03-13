import 'package:flutter/material.dart';
import 'package:todo_app/models/mock_todolist.dart';

import 'home_page.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {

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
          title: Text("Edit Task",
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      onPressed: (){
                        for(int i=0;i<todoList.length;i++){
                          if(controllerTitle.text.isNotEmpty) {
                            todoList[i].title = controllerTitle.text;
                          }
                          if(controllerDetail.text.isNotEmpty) {
                            todoList[i].subtitle = controllerDetail.text;
                          }
                        }
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                              (Route<dynamic> route) => false,
                        );
                        controllerTitle.clear();
                        controllerDetail.clear();
                        setState(() {});
                      },
                      elevation: 8,
                      height: 72,
                      minWidth: 200,
                      color: Colors.indigo.shade200,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text("Update",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    MaterialButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      elevation: 8,
                      height: 72,
                      minWidth: 200,
                      color: Colors.indigo.shade200,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text("Cancel",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        )
    );
  }
}

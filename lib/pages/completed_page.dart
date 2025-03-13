import 'package:flutter/material.dart';

import '../models/mock_todolist.dart';
import 'home_page.dart';

class CompletedPage extends StatefulWidget {
  const CompletedPage({super.key});

  @override
  State<CompletedPage> createState() => _CompletedPageState();
}

class _CompletedPageState extends State<CompletedPage> {
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
        title: Text("Completed Task",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        centerTitle: false,
        toolbarHeight: 84,
      ),
      backgroundColor: Colors.indigo.shade100,
      body: ListView(
        children: [
          for(int i=0;i<todoList.length;i++)
            if(todoList[i].isCheck==true)
            Container(
                margin: EdgeInsets.all(12),
                height: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                child: Center(
                  child: ListTile(
                    title: Text(todoList[i].title,
                      style: TextStyle(
                        color: Colors.indigo.shade200,
                      ),
                    ),
                    subtitle: Text(todoList[i].subtitle),
                  ),
                )
            )
        ],
      ),
    );
  }
}

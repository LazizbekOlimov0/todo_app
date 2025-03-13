import 'package:flutter/material.dart';
import 'package:todo_app/models/mock_todolist.dart';
import 'package:todo_app/pages/add_page.dart';
import 'package:todo_app/pages/completed_page.dart';
import 'package:todo_app/pages/edit_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TODO APP",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.calendar_today,
              color: Colors.white,
              size: 32,
              ),
          ),
          SizedBox(width: 20),
        ],
        backgroundColor: Colors.indigo.shade200,
        titleSpacing: 32,
        toolbarHeight: 84,
      ),
      body: SizedBox(
        height: 500,
        width: double.infinity,
        child: ListView(
          children: [
            for(int i=0;i<todoList.length;i++)
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
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        spacing: 12,
                        children: [
                          IconButton(
                            onPressed: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => EditPage()));
                            },
                            icon: Icon(Icons.edit,
                              color: Colors.indigo.shade200,
                            ),
                          ),
                          IconButton(
                            onPressed: (){
                              todoList.remove(todoList[i]);
                              setState(() {});
                            },
                            icon: Icon(Icons.delete_outline,
                              color: Colors.indigo.shade200,
                            ),
                          ),
                          Checkbox(
                            value: todoList[i].isCheck,
                            onChanged: (value) {
                              setState(() {
                                todoList[i].isCheck = value!;
                              });
                            },
                            checkColor: Colors.white,
                            activeColor: Colors.indigo.shade200,
                            shape: StadiumBorder(),
                          ),
                        ],
                      ),
                    ),
                  )
              )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddPage()));
        },
        backgroundColor: Colors.indigo.shade200,
        shape: StadiumBorder(),
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.menu),
                ),
                label: "All"),
            BottomNavigationBarItem(
                icon: IconButton(
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CompletedPage()));
                    },
                    icon: Icon(Icons.check)
                ),
                label: "Completed"),
          ],
      ),
      backgroundColor: Colors.indigo.shade100,
    );
  }
}

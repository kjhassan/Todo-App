import 'package:flutter/material.dart';
import 'package:todo_app/utils/todolist.dart';


class homePage extends StatefulWidget {
  homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();

}
class _homePageState extends State<homePage> {
  final _controller = TextEditingController();
  List todolist = [
    ['learn app dev', false],
    ['Drink coffee',false],
  ];

  void checkBoxChanged(int index) {
    setState(() {
      todolist[index][1] =!todolist[index][1];
    });
  }
  void saveNewTask(){
    if(_controller.text.isNotEmpty){
      setState(() {
        todolist.add([_controller.text, false]);
        _controller.clear();
      });
    }

  }

  void deleteTask(int index){
    setState(() {
      todolist.removeAt(index);
    });

  }

@override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[300],
      appBar: AppBar(
        title: const Center(
          child: Text(
            'ToDo list',
          ),
        ),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
          itemCount: todolist.length ,
          itemBuilder: (BuildContext context, index){
        return TodoList(
          taskname: todolist[index][0],
          taskcompleted: todolist[index][1],
          onChanged: (value) => checkBoxChanged(index),
          deleteFunction: (context) => deleteTask(index),
        );

      }  ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal:10 , vertical:10),
          child: Row(
            children:[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25,
                  ),
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                    hintText: 'Add a new task',
                    filled: true,
                    fillColor: Colors.deepPurple.shade200,
                    enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  )
                ),
              ),
            )
          ),
          FloatingActionButton(
            onPressed: saveNewTask,
            child: Icon(Icons.add),
              ),
            ],
          ),
      ),
    );

  }
}
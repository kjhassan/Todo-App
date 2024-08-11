import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key,
    required this.taskname,
    required this.taskcompleted,
    required this.onChanged,
    required this.deleteFunction});

  final String taskname;
  final bool taskcompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteFunction;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
        bottom: 0,
      ),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
          onPressed: deleteFunction,
              icon: Icons.delete,
              borderRadius: BorderRadius.circular(20),
              backgroundColor: Colors.red,


            ),

          ],
        ),
        child: Container(

          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.deepPurple,
            borderRadius: BorderRadius.circular(15),
          ),

          child: Row(
            children: [
              Checkbox(
                  value: taskcompleted,
                  onChanged: onChanged,
                  checkColor: Colors.white,
                  activeColor: Colors.deepPurple,
                side: BorderSide(
                  color: Colors.white,
                ) ,

              ),
              Text(
                taskname,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  decoration: taskcompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  decorationColor: taskcompleted
                      ? Colors.white // Change the line-through color here
                      : Colors.transparent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';

class Tasks{
  Tasks(
      {
        this.id,
        this.title = '',
        this.subtitle = '',
        this.color = Colors.white,
        this.image = ''
      }
      );
  UniqueKey? id = UniqueKey();
  String title, image;
  String? subtitle;
  Color color;

  static List<Tasks> tasks = [
    Tasks(title: 'Task 1',
        subtitle: 'Watch to earn Pkr 5',
      color: Colors.blue,
      image: 'assets/images/1.png'
    ),
    Tasks(title: 'Task 2',
        subtitle: 'Watch to earn Pkr 5',
        color: Colors.blue,
        image: 'assets/images/1.png'
    ),
    Tasks(title: 'Task 3',
        subtitle: 'Watch to earn Pkr 5',
        color: Colors.blue,
        image: 'assets/images/1.png'
    ),
  ];


}
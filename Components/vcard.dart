import 'package:flutter/material.dart';
import 'package:invite_earn/tasks.dart';
class VcardScreen extends StatefulWidget {
  const VcardScreen({super.key, required this.tasks});

  final Tasks tasks;
  @override
  State<VcardScreen> createState() => _VcardScreenState();
}

class _VcardScreenState extends State<VcardScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [widget.tasks.color, widget.tasks.color.withOpacity(0.5)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          Text(widget.tasks.title, style: const TextStyle(fontSize: 12),),
          Text(widget.tasks.image, style: const TextStyle(fontSize: 12),),
          Image.asset('assets/images/1.png')
        ],
      ),
    );
  }
}

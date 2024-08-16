import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReuseableRow extends StatelessWidget{

  final String title;
  final IconData icon;
  final String value;

  const ReuseableRow({super.key, required this.icon, required this.title, this.value= ''});


  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all()
        ),
        child: Row(
          children: <Widget>[
            const SizedBox(width: 10,),
            Icon(icon, size: 20,),
            const SizedBox(width: 10,),
            Text(title, style: const TextStyle(fontSize: 12 ,fontWeight: FontWeight.w400,),),
            const Spacer(),
            Text(value, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600,),),
            const SizedBox(width: 10,)
          ],
        ),
      ),
    );
  }
  
}
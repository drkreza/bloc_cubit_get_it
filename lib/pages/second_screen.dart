import 'package:flutter/material.dart';
import 'package:my_test_bloc_cubit/pages/third_screen.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ThirdScreen()));
            }, child: Text('Click me'))
          ],
        ),
      ),
    );
  }
}
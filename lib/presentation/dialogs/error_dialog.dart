import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ErrorDialog {
  static void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Stack(children: [LottieBuilder.asset('assets/lotties/error.json'),SizedBox(
          height: MediaQuery.sizeOf(context).height*.3,
          child:const Center(
            child: Column(
              children: [
                Spacer(),
                Text('Oops!',style: TextStyle(fontSize: 60),),
                Text("Somthing went wrong",style: TextStyle(fontSize: 25)),
                Spacer()
              ],
            ),
          ),
        )]),
        actions: [ElevatedButton(onPressed: ()=>exit(0), child:const Text("Close the app"))],
      ),
    );
  }
}

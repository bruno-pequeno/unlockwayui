import 'package:flutter/material.dart';
import 'package:unlockway/constants.dart';
import 'package:unlockway/screens/cellphone/components/bottom_navigator.dart';

class Routine extends StatelessWidget {
  const Routine({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(darkBgdark),
      bottomNavigationBar: const UBottomNavigator("Routine"),
      body: Container(
        height: MediaQuery.of(context).size.height,
        margin: const EdgeInsets.all(13),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Routine"),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.red,
            width: double.infinity,
            height: 350,
            child: Stack(
              children: [
                Positioned(
                    left: 0.0,
                    top: 0.0,
                    right: 0.0,
                    child: AppBar(
                      title: const Text(''),
                      leading: IconButton(
                          onPressed: () {
                            // Navigator.of(context).pop();
                          },
                          icon: const Icon(Icons.backpack)),
                    ))
              ],
            ),
          ),
          Container(
            color: Colors.white,
            width: 48,
            height: 48,
          )
        ],
      ),
    );
  }
}

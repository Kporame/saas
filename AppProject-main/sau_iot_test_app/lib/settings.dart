import 'package:flutter/material.dart';

class SETUI extends StatelessWidget {
  const SETUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Account",
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 40),
          Edititem(),

        ],
      ),
    );
  }
}

class Edititem extends StatelessWidget {
  const Edititem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row( 
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(
          child: Text(
            "Photo",
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey,
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Column(
            children: [
              Image.asset(
                'assets/images/111.jpg',
                height: 100,
                width: 100,
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  foregroundColor: Colors.lightBlueAccent,
                ),
                child: Text("Uplond Image"),
              )
            ],
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';

class BarbershopRegisterPage extends StatelessWidget {
  const BarbershopRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar estabelecimento'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          children: [
            SizedBox(
              height: 19,
            ),
          ],
        ),
      ),
    );
  }
}

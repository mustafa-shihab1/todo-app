import 'package:flutter/material.dart';

class CompletedView extends StatelessWidget {
  const CompletedView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        width: double.infinity,
        child: Text('Completed'),
      ),
    );
  }
}

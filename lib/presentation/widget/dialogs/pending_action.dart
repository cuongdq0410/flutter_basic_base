import 'package:flutter/material.dart';

class PendingAction extends StatelessWidget {
  const PendingAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: const CircularProgressIndicator(
        backgroundColor: Colors.white,
      ),
    );
  }
}

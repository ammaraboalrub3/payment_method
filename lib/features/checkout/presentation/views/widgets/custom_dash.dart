import 'package:flutter/material.dart';

class CustomDash extends StatelessWidget {
  const CustomDash({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: MediaQuery.sizeOf(context).height * 0.2 + 20,
      left: 20 + 8,
      right: 20 + 8,
      child: Row(
        children: List.generate(30, (index) {
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: Container(
                height: 3,

                decoration: BoxDecoration(
                  color: Color(0xffB8B8B8),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

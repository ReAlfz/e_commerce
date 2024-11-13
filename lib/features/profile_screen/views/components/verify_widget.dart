import 'package:flutter/material.dart';

class VerifyWidget extends StatelessWidget {
  final bool selectedKey;
  const VerifyWidget({super.key, required this.selectedKey});

  @override
  Widget build(BuildContext context) {
    return (selectedKey) ? Container() : Container();
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_crc/src/styles.dart';

class VSpace extends StatelessWidget {
  const VSpace(this.size, {Key? key}) : super(key: key);

  static const p4 = VSpace(Insets.p4);
  static const p13 = VSpace(Insets.p13);

  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: size);
  }
}

class HSpace extends StatelessWidget {
  const HSpace(this.size, {Key? key}) : super(key: key);

  static const p4 = HSpace(Insets.p4);
  static const p13 = HSpace(Insets.p13);

  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: size);
  }
}

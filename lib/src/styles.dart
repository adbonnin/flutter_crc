import 'package:flutter/widgets.dart';

class Insets {
  Insets._();

  static const p4 = 4.0;
  static const p8 = 8.0;
  static const p13 = 13.0;
}

class DialogConstraints {
  DialogConstraints._();

  static const dialog = BoxConstraints(
    maxWidth: 800,
    minWidth: 600,
    maxHeight: 600,
  );

  static const picker = BoxConstraints(
    maxWidth: 480,
    minWidth: 480,
    maxHeight: 320,
  );
}

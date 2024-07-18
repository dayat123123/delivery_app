import 'package:flutter/material.dart';

extension TextExtensions on String {
  Widget textWithStrip({
    TextStyle? style,
    int maxLines = 1,
  }) {
    return Text(this,
        maxLines: maxLines,
        style: style?.copyWith(decoration: TextDecoration.lineThrough) ??
            const TextStyle(decoration: TextDecoration.lineThrough));
  }
}

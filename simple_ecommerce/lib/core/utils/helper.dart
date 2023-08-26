import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:simple_ecommerce/core/core.dart';
import 'package:intl/intl.dart';

late Dio dioConnect;
smallVerticalSpacing() {
  return const SizedBox(height: paddingSmall);
}

mediumVerticalSpacing() {
  return const SizedBox(height: paddingMedium);
}

largeVerticalSpacing() {
  return const SizedBox(height: paddingLarge);
}

smallHorizontalSpacing() {
  return const SizedBox(width: paddingSmall);
}

mediumHorizontalSpacing() {
  return const SizedBox(width: paddingMedium);
}

largeHorizontalSpacing() {
  return const SizedBox(width: paddingLarge);
}

String formatCurrency(dynamic price) {
  final formatDolar = NumberFormat.currency(symbol: '\$', decimalDigits: 0);
  return formatDolar.format(price);
}

List<String> makeParagraph(String text) {
  final parafText = text.split(". ");
  return parafText;
}

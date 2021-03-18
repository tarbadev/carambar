import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Widget buildTestableWidget(
  Widget widget, {
  List<Override> providerOverrides: const [],
}) {
  return ProviderScope(
    overrides: providerOverrides,
    child: MaterialApp(home: widget),
  );
}

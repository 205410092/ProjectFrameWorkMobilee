// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:read_json_file/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);
    // Fungsi expect(find.text('0'), findsOneWidget)
    // dan expect(find.text('1'), findsNothing)
    // adalah bagian dari kerangka pengujian
    // (testing framework) Flutter seperti
    // flutter_test yang digunakan untuk
    // memverifikasi perilaku atau output
    // yang diharapkan dari kode Flutter.

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();
    // Fungsi await tester.tap(find.byIcon(Icons.add))
    // digunakan untuk mensimulasikan tindakan pengguna
    // mengetuk (tap) pada widget yang ditemukan dengan
    // menggunakan ikon tertentu, dalam hal ini adalah
    // ikon dengan nilai Icons.add. Tindakan ini akan
    // diproses dalam kerangka pengujian Flutter untuk
    // mensimulasikan interaksi pengguna dengan aplikasi.

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}

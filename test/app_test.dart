import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:super_dolores/dominio/plataforma.dart';
import 'package:super_dolores/main.dart';
import 'package:super_dolores/presentacion/pantallas/pantalla_horoscopo.dart';

void main() {
  testWidgets('la concha arranca con el inicio de Ana', (tester) async {
    tester.view.physicalSize = const Size(1600, 2400);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(const SuperDoloresApp());
    expect(find.textContaining('Hola, Ana'), findsOneWidget);
    expect(find.byType(NavigationBar), findsOneWidget);
    expect(find.text('Viajes'), findsWidgets);
  });

  testWidgets('el horóscopo (tercero) NO puede leer el saldo', (tester) async {
    final p = Plataforma()..cargarDatosDemo();
    await tester.pumpWidget(MaterialApp(home: PantallaHoroscopo(plataforma: p, usuarioId: 'ana')));
    await tester.tap(find.text('Intentar leer mi saldo'));
    await tester.pump();
    expect(find.textContaining('no tiene permiso'), findsOneWidget);
  });
}
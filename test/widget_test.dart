import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sistema_flota/main.dart';
import 'package:sistema_flota/services/api_service.dart';

void main() {
  testWidgets('hides API settings on the login screen', (
    tester,
  ) async {
    SharedPreferences.setMockInitialValues({});
    final preferences = await SharedPreferences.getInstance();
    final api = ApiService(baseUrl: 'http://10.0.2.2:8000/api');

    await tester.pumpWidget(
      FlotaApp(api: api, preferences: preferences, initialUser: null),
    );
    await tester.pumpAndSettle();

    expect(find.text('Sistema de Flota'), findsOneWidget);
    expect(find.text('Iniciar sesión'), findsOneWidget);
    expect(find.text('Usuario'), findsOneWidget);
    expect(find.text('Contraseña'), findsOneWidget);
    expect(find.text('Dirección de la API'), findsNothing);
    expect(find.text('Emulador'), findsNothing);
    expect(find.text('Teléfono USB'), findsNothing);
    expect(find.text('Teléfono Wi-Fi'), findsNothing);

    api.dispose();
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:myportofolio_mobile/main.dart';
import 'package:myportofolio_mobile/services/api_client.dart';

void main() {
  testWidgets('App builds without crashing', (WidgetTester tester) async {
    // MockClient mencegah tes melakukan permintaan jaringan sungguhan.
    final apiClient = ApiClient(
      client: MockClient((request) async => http.Response('[]', 200)),
    );

    await tester.pumpWidget(MyApp(apiClient: apiClient));

    expect(find.byType(MaterialApp), findsOneWidget);
  });
}

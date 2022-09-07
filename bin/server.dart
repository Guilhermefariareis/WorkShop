import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:dotenv/dotenv.dart' show load;
import 'package:shelf_static/shelf_static.dart';
import 'package:dart_backend/app/modules/eleitor/eleitor_controller.dart';
import 'package:dart_backend/app/modules/voto/voto_controller.dart';

final staticFiles = createStaticHandler('images/', listDirectories: true);

// Configure routes.
final _router = Router()
  ..mount('/images/', staticFiles)
  ..mount('/eleitor/', EleitorController().router)
  ..mount('/voto/', VotoController().router);

void main(List<String> args) async {
  // Use any available host or container IP (usually `0.0.0.0`).
  final ip = InternetAddress.anyIPv4;

  load();

  // Configure a pipeline that logs requests.
  final _handler = Pipeline().addMiddleware(logRequests()).addHandler(_router);

  // For running in containers, we respect the PORT environment variable.
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await serve(_handler, ip, port);
  print('Server listening on port ${server.port}');
}

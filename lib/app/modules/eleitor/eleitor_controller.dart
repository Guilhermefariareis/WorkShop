import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:dart_backend/app/repositories/eleitor_repository.dart';

part 'eleitor_controller.g.dart';

class EleitorController {
  final _eleitorRepository = EleitorRepository();

  @Route.get('/')
  Future<Response> find(Request request) async {
    try {
      final eleitores = await _eleitorRepository.findAll();
      return Response.ok(
          jsonEncode(
            eleitores.map((p) => p.toMap()).toList(),
          ),
          headers: {
            'content-type': 'application/json',
          });
          
    } catch (e, s) {
      log('Erro ao buscar os candidatos', error: e, stackTrace: s);
      return Response.internalServerError();
    }
  }

  Router get router => _$EleitorControllerRouter(this);
  
}

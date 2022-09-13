import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:dart_backend/app/repositories/voto_repository.dart';
import 'package:dart_backend/app/services/voto_services.dart';
import 'package:dart_backend/app/views_model/voto_view_model.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

part 'voto_controller.g.dart';

class VotoController {
  final _votoRepository = VotoService();

  @Route.post('/')
  Future<Response> register(Request request) async {
    try {
      final VotoVM = VotoViewModel.fromJson(await request.readAsString());
      final voto = await _votoRepository.register(VotoVM);
      return Response.ok(
        jsonEncode(VotoVM.toMap()),
        headers: {
          'content-type': 'application/json',
        },
      );
    } catch (e, s) {
      log('Erro ao inserir', error: e, stackTrace: s);
      return Response.internalServerError();
    }
  }

  Router get router => _$VotoControllerRouter(this);

  toJson() {
    log('voto com sucesso');
  }
}

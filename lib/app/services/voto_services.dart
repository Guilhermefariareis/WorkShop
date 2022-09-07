import 'package:dart_backend/app/repositories/voto_repository.dart';
import 'package:dart_backend/app/views_model/voto_view_model.dart';

class VotoService {
  final _votoRepositroy = VotoRepository();

  register(VotoViewModel voto) async {
    final votoId = await _votoRepositroy.save(voto);
  }
}

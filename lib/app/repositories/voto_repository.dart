import 'package:dart_backend/app/views_model/voto_view_model.dart';
import 'package:mysql1/mysql1.dart';
import 'package:dart_backend/app/core/database/database.dart';

class VotoRepository {
  Future<int> save(VotoViewModel voto) async {
    MySqlConnection? conn;
    try {
      // ignore: non_constant_identifier_names
      var VoteIdResponse = 0;
      conn = await Database().openConnection();
      await conn.transaction((_) async {
        final votoResult = await conn!.query('''
           INSERT INTO voto(idVoto, id, idade, cidade, uf)
            values(?, ?, ?, ?, ?)
          ''', [voto.idVoto, voto.id, voto.idade, voto.cidade, voto.uf]);
      });
      // ignore: unused_local_variable
      var updateVoto = await conn.query(
          '''UPDATE eleitor SET votos = votos + (SELECT COUNT(votos) FROM eleitor WHERE id = ?)  WHERE id = ?''',
          [voto.id, voto.id]);
      return VoteIdResponse;
    } on MySqlException catch (e, s) {
      print(e);
      print(s);
      throw Exception();
    } finally {
      await conn?.close();
    }
  }
}

import 'package:dart_backend/app/views_model/voto_view_model.dart';
import 'package:mysql1/mysql1.dart';
import 'package:dart_backend/app/core/database/database.dart';
import 'package:dart_backend/app/views_model/voto_view_model.dart';

class VotoRepository {
  Future<int> save(VotoViewModel voto) async {
    MySqlConnection? conn;
    try {
      var VoteIdResponse = 0;
      conn = await Database().openConnection();
      await conn.transaction((_) async {
        final votoResult = await conn!.query('''
           INSERT INTO voto(idVoto, idade, cidade, uf)
            values(?, ?, ?, ?)
          ''', [voto.idVoto, voto.idade, voto.cidade, voto.uf]);
        //   final orderId = await conn.query('select * from voto');
        //   final result = await conn.query('select * from eleitor');
      });
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

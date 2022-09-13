import 'dart:async';

import 'package:mysql1/mysql1.dart';
import 'package:dart_backend/app/core/database/database.dart';
import 'package:dart_backend/app/entities/eleitor.dart';

class EleitorRepository {
  Future<List<Eleitor>> findAll() async {
    MySqlConnection? conn;

    try {
      conn = await Database().openConnection();
      final result = await conn.query('select * from eleitor');

      return result
          .map(
            (p) => Eleitor(
              id: p['id'],
              name: p['nome'],
              partido: (p['partido'] as Blob?)?.toString() ?? '',
              image: (p['imagem'] as Blob?)?.toString() ?? '',
              votos: p['votos'],
            ),
          )
          .toList();
    } on MySqlException catch (e, s) {
      print(e);
      print(s);
      throw Exception();
    } finally {
      await conn?.close();
    }
  }

  Future<Eleitor> findById(int id) async {
    MySqlConnection? conn;
    try {
      conn = await Database().openConnection();
      final result =
          await conn.query('select * from eleitor where id = ?', [id]);

      final mysqlData = result.first;

      return Eleitor(
        id: mysqlData['id'],
        name: mysqlData['nome'],
        partido: (mysqlData['partido'] as Blob?)?.toString() ?? '',
        image: (mysqlData['imagem'] as Blob?)?.toString() ?? '',
        votos: mysqlData['votos'],
      );
    } on MySqlException catch (e, s) {
      print(e);
      print(s);
      throw Exception();
    } finally {
      await conn?.close();
    }
  }
}

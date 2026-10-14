import '../entities/artista.dart';

abstract class ArtistasRepository {
  Future<List<Artista>> obtenerTodos();
  Future<Artista?> obtenerPorId(String id);
}

import '../entities/artista.dart';
import '../repositories/artistas_repository.dart';

class ObtenerArtistaPorId {
  final ArtistasRepository repository;

  ObtenerArtistaPorId(this.repository);

  Future<Artista?> call(String id) {
    return repository.obtenerPorId(id);
  }
}

import '../entities/artista.dart';
import '../repositories/artistas_repository.dart';

class ObtenerArtistas {
  final ArtistasRepository repository;

  ObtenerArtistas(this.repository);

  Future<List<Artista>> call() {
    return repository.obtenerTodos();
  }
}

import '../../domain/entities/artista.dart';
import '../../domain/repositories/artistas_repository.dart';
import '../datasources/artistas_local_datasource.dart';

class ArtistasRepositoryImpl implements ArtistasRepository {
  final ArtistasLocalDataSource dataSource;

  ArtistasRepositoryImpl(this.dataSource);

  @override
  Future<List<Artista>> obtenerTodos() async {
    return dataSource.obtenerArtistas();
  }

  @override
  Future<Artista?> obtenerPorId(String id) async {
    for (final artista in dataSource.obtenerArtistas()) {
      if (artista.id == id) return artista;
    }
    return null;
  }
}

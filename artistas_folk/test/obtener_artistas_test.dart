import 'package:flutter_test/flutter_test.dart';
import 'package:artistas_folk/data/datasources/artistas_local_datasource.dart';
import 'package:artistas_folk/data/repositories/artistas_repository_impl.dart';
import 'package:artistas_folk/domain/entities/artista.dart';
import 'package:artistas_folk/domain/repositories/artistas_repository.dart';
import 'package:artistas_folk/domain/usecases/obtener_artistas.dart';

class FakeArtistasRepository implements ArtistasRepository {
  @override
  Future<List<Artista>> obtenerTodos() async => const [
        Artista(
          id: 'x',
          nombre: 'Artista de prueba',
          origen: 'México',
          estilo: 'Folk',
          biografia: 'Biografía de prueba',
          discos: ['Disco 1'],
          cancionesDestacadas: ['Canción 1'],
          colorTema: 0xFF8D6E63,
        ),
      ];

  @override
  Future<Artista?> obtenerPorId(String id) async => null;
}

void main() {
  test('ObtenerArtistas regresa la lista que entrega el repositorio', () async {
    final usecase = ObtenerArtistas(FakeArtistasRepository());
    final resultado = await usecase();
    expect(resultado.length, 1);
    expect(resultado.first.nombre, 'Artista de prueba');
  });

  test('El catálogo real contiene exactamente los 4 artistas folk', () async {
    final repo = ArtistasRepositoryImpl(ArtistasLocalDataSource());
    final artistas = await repo.obtenerTodos();
    expect(
      artistas.map((a) => a.nombre).toList(),
      ['Kevin Kaarl', 'Ed Maverick', 'Wuicho Kun', 'Dromedarios Mágicos'],
    );
  });

  test('obtenerPorId encuentra un artista y regresa null si no existe', () async {
    final repo = ArtistasRepositoryImpl(ArtistasLocalDataSource());
    expect((await repo.obtenerPorId('ed-maverick'))?.nombre, 'Ed Maverick');
    expect(await repo.obtenerPorId('no-existe'), isNull);
  });
}

import 'package:flutter/foundation.dart';
import '../../domain/entities/artista.dart';
import '../../domain/usecases/obtener_artistas.dart';

class ArtistasViewModel extends ChangeNotifier {
  final ObtenerArtistas obtenerArtistas;

  ArtistasViewModel(this.obtenerArtistas);

  List<Artista> _artistas = [];
  List<Artista> get artistas => _artistas;

  bool _cargando = false;
  bool get cargando => _cargando;

  Future<void> cargar() async {
    _cargando = true;
    notifyListeners();

    _artistas = await obtenerArtistas();

    _cargando = false;
    notifyListeners();
  }
}

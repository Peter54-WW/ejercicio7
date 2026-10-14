import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import '../../domain/entities/artista.dart';

class DetalleViewModel extends ChangeNotifier {
  final Artista artista;
  final AudioPlayer _reproductor = AudioPlayer();
  StreamSubscription<void>? _finSub;

  bool reproduciendo = false;
  bool _iniciado = false;

  DetalleViewModel(this.artista) {
    // Cuando el audio termina, el botón vuelve a "Escuchar".
    _finSub = _reproductor.onPlayerComplete.listen((_) {
      reproduciendo = false;
      _iniciado = false;
      notifyListeners();
    });
  }

  bool get tieneAudio => artista.audioAsset != null;

  Future<void> alternarAudio() async {
    final audio = artista.audioAsset;
    if (audio == null) return;

    if (reproduciendo) {
      await _reproductor.pause();
    } else if (_iniciado) {
      await _reproductor.resume();
    } else {
      await _reproductor.play(AssetSource(audio));
      _iniciado = true;
    }
    reproduciendo = !reproduciendo;
    notifyListeners();
  }

  @override
  void dispose() {
    _finSub?.cancel();
    _reproductor.dispose();
    super.dispose();
  }
}

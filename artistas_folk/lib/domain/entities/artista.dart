class Artista {
  final String id;
  final String nombre;
  final String? nombreReal;
  final String origen;
  final String estilo;
  final String biografia;
  final List<String> discos;
  final List<String> cancionesDestacadas;

  /// Color de acento del artista en formato ARGB (ej. 0xFF8D6E63).
  final int colorTema;

  /// Medios opcionales. Si son null, la pantalla simplemente no los muestra.
  final String? imagenAsset;
  final String? audioAsset;
  final String? videoAsset;

  const Artista({
    required this.id,
    required this.nombre,
    this.nombreReal,
    required this.origen,
    required this.estilo,
    required this.biografia,
    required this.discos,
    required this.cancionesDestacadas,
    required this.colorTema,
    this.imagenAsset,
    this.audioAsset,
    this.videoAsset,
  });
}

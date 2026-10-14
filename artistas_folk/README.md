# Folk Mexicano

App Flutter con los artistas más representativos del folk mexicano actual:

- **Kevin Kaarl**
- **Ed Maverick**
- **Wuicho Kun**
- **Dromedarios Mágicos**

Mantiene la arquitectura original (domain / data / presentation con ViewModels).

## Agregar fotos, audio o video (opcional)

Las fichas funcionan sin medios: si no hay foto se muestra un avatar con la inicial
del artista. Para agregar medios propios (con los derechos correspondientes):

1. Copia los archivos a `assets/images/`, `assets/audio/` o `assets/video/`.
2. En `lib/data/datasources/artistas_local_datasource.dart` agrega al artista, por ejemplo:

```dart
imagenAsset: 'assets/images/kevin_kaarl.jpg',
audioAsset: 'audio/kevin_kaarl.mp3',   // sin el prefijo "assets/" (AssetSource)
videoAsset: 'assets/video/kevin_kaarl.mp4',
```

El botón de audio y el reproductor de video aparecen solos cuando esos campos existen.

## Ejecutar

```
flutter pub get
flutter test
flutter run
```

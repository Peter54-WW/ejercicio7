import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../../domain/entities/artista.dart';
import '../viewmodels/detalle_view_model.dart';
import 'lista_artistas_screen.dart' show AvatarArtista;

class DetalleArtistaScreen extends StatefulWidget {
  final Artista artista;

  const DetalleArtistaScreen({super.key, required this.artista});

  @override
  State<DetalleArtistaScreen> createState() => _DetalleArtistaScreenState();
}

class _DetalleArtistaScreenState extends State<DetalleArtistaScreen> {
  late final DetalleViewModel _viewModel;
  VideoPlayerController? _videoController;

  @override
  void initState() {
    super.initState();
    _viewModel = DetalleViewModel(widget.artista);

    final video = widget.artista.videoAsset;
    if (video != null) {
      _videoController = VideoPlayerController.asset(video)
        ..initialize().then((_) {
          if (mounted) setState(() {});
        });
    }
  }

  @override
  void dispose() {
    _viewModel.dispose();
    _videoController?.dispose();
    super.dispose();
  }

  Widget _seccion(BuildContext context, String titulo, Widget contenido) {
    final tema = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titulo,
            style: tema.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: Color(widget.artista.colorTema),
            ),
          ),
          const SizedBox(height: 8),
          contenido,
        ],
      ),
    );
  }

  Widget _lista(BuildContext context, List<String> items, IconData icono) {
    return Column(
      children: [
        for (final item in items)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(icono, size: 18, color: Color(widget.artista.colorTema)),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(item, style: Theme.of(context).textTheme.bodyLarge),
                ),
              ],
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final artista = widget.artista;
    final tema = Theme.of(context);
    final color = Color(artista.colorTema);
    final video = _videoController;

    return Scaffold(
      appBar: AppBar(title: Text(artista.nombre)),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 32),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [color.withValues(alpha: 0.28), Colors.transparent],
              ),
            ),
            child: Column(
              children: [
                Hero(
                  tag: 'artista-${artista.id}',
                  child: AvatarArtista(artista: artista, tamano: 140, radio: 28),
                ),
                const SizedBox(height: 16),
                Text(
                  artista.nombre,
                  textAlign: TextAlign.center,
                  style: tema.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (artista.nombreReal != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    artista.nombreReal!,
                    textAlign: TextAlign.center,
                    style: tema.textTheme.bodyMedium?.copyWith(
                      color: tema.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  alignment: WrapAlignment.center,
                  children: [
                    Chip(
                      avatar: const Icon(Icons.place_outlined, size: 18),
                      label: Text(artista.origen),
                    ),
                    Chip(
                      avatar: const Icon(Icons.music_note, size: 18),
                      label: Text(artista.estilo),
                    ),
                  ],
                ),
              ],
            ),
          ),
          _seccion(
            context,
            'Biografía',
            Text(
              artista.biografia,
              style: tema.textTheme.bodyLarge?.copyWith(height: 1.5),
            ),
          ),
          _seccion(
            context,
            'Canciones destacadas',
            _lista(context, artista.cancionesDestacadas, Icons.music_note),
          ),
          _seccion(
            context,
            'Discografía',
            _lista(context, artista.discos, Icons.album),
          ),
          if (_viewModel.tieneAudio)
            AnimatedBuilder(
              animation: _viewModel,
              builder: (context, _) => Padding(
                padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
                child: FilledButton.icon(
                  onPressed: _viewModel.alternarAudio,
                  icon: Icon(
                    _viewModel.reproduciendo ? Icons.pause : Icons.headphones,
                  ),
                  label: Text(
                    _viewModel.reproduciendo ? 'Pausar' : 'Escuchar fragmento',
                  ),
                ),
              ),
            ),
          if (video != null && video.value.isInitialized)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: AspectRatio(
                      aspectRatio: video.value.aspectRatio,
                      child: VideoPlayer(video),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      video.value.isPlaying
                          ? Icons.pause_circle
                          : Icons.play_circle,
                    ),
                    iconSize: 48,
                    onPressed: () {
                      setState(() {
                        video.value.isPlaying ? video.pause() : video.play();
                      });
                    },
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

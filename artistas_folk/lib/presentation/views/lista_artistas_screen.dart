import 'package:flutter/material.dart';
import '../../domain/entities/artista.dart';
import '../viewmodels/artistas_view_model.dart';
import 'detalle_artista_screen.dart';

/// Avatar del artista: usa su foto si existe; si no, un degradado con su inicial.
class AvatarArtista extends StatelessWidget {
  final Artista artista;
  final double tamano;
  final double radio;

  const AvatarArtista({
    super.key,
    required this.artista,
    required this.tamano,
    this.radio = 16,
  });

  @override
  Widget build(BuildContext context) {
    final color = Color(artista.colorTema);
    final degradado = Container(
      width: tamano,
      height: tamano,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [color, Color.lerp(color, Colors.black, 0.45)!],
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        artista.nombre[0].toUpperCase(),
        style: TextStyle(
          fontSize: tamano * 0.45,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );

    final imagen = artista.imagenAsset;
    return ClipRRect(
      borderRadius: BorderRadius.circular(radio),
      child: imagen == null
          ? degradado
          : Image.asset(
              imagen,
              width: tamano,
              height: tamano,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => degradado,
            ),
    );
  }
}

class ListaArtistasScreen extends StatefulWidget {
  final ArtistasViewModel viewModel;

  const ListaArtistasScreen({super.key, required this.viewModel});

  @override
  State<ListaArtistasScreen> createState() => _ListaArtistasScreenState();
}

class _ListaArtistasScreenState extends State<ListaArtistasScreen> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.cargar();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.viewModel,
      builder: (context, _) {
        if (widget.viewModel.cargando) {
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        }

        final tema = Theme.of(context);
        final artistas = widget.viewModel.artistas;

        return Scaffold(
          appBar: AppBar(
            title: const Text('Folk Mexicano'),
            centerTitle: false,
          ),
          body: ListView.builder(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
            itemCount: artistas.length + 1,
            itemBuilder: (context, i) {
              if (i == 0) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text(
                    'Cuatro voces que están escribiendo el folk de hoy en México.',
                    style: tema.textTheme.bodyLarge?.copyWith(
                      color: tema.colorScheme.onSurfaceVariant,
                    ),
                  ),
                );
              }

              final artista = artistas[i - 1];
              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => DetalleArtistaScreen(artista: artista),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        Hero(
                          tag: 'artista-${artista.id}',
                          child: AvatarArtista(artista: artista, tamano: 76),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                artista.nombre,
                                style: tema.textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                artista.estilo,
                                style: tema.textTheme.bodyMedium?.copyWith(
                                  color: Color(artista.colorTema),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  const Icon(Icons.place_outlined, size: 16),
                                  const SizedBox(width: 4),
                                  Expanded(
                                    child: Text(
                                      artista.origen,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: tema.textTheme.bodySmall,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Icon(Icons.chevron_right),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'data/datasources/artistas_local_datasource.dart';
import 'data/repositories/artistas_repository_impl.dart';
import 'domain/usecases/obtener_artistas.dart';
import 'presentation/viewmodels/artistas_view_model.dart';
import 'presentation/views/lista_artistas_screen.dart';

void main() {
  // Composición manual de dependencias (Composition Root)
  final dataSource = ArtistasLocalDataSource();
  final repository = ArtistasRepositoryImpl(dataSource);
  final obtenerArtistas = ObtenerArtistas(repository);
  final viewModel = ArtistasViewModel(obtenerArtistas);

  runApp(FolkMexicanoApp(viewModel: viewModel));
}

class FolkMexicanoApp extends StatelessWidget {
  final ArtistasViewModel viewModel;

  const FolkMexicanoApp({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Folk Mexicano',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF8D6E63),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF8D6E63),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: ListaArtistasScreen(viewModel: viewModel),
    );
  }
}

import '../../domain/entities/artista.dart';

class ArtistasLocalDataSource {
  List<Artista> obtenerArtistas() {
    return const [
      Artista(
        id: 'kevin-kaarl',
        nombre: 'Kevin Kaarl',
        nombreReal: 'Kevin Eduardo Hernández Carlos',
        origen: 'Meoqui, Chihuahua',
        estilo: 'Folk · Indie alternativo',
        colorTema: 0xFF8D6E63,
        imagenAsset: 'assets/images/kevin.jpg',
        audioAsset: 'audio/kevin.mp3',
        biografia:
            'Cantautor chihuahuense que mezcla el folk con el indie alternativo, '
            'con influencias del norteño, la música clásica y el rock. Estudió '
            'ciencias de la comunicación antes de dedicarse de lleno a la música.\n\n'
            'Su proyecto nació en 2018 junto a su hermano gemelo, Bryan Kaarl, '
            'quien toca la trompeta y hace segundas voces. Primero subió '
            '"Amor viejo" a YouTube y, meses después, "Vámonos a Marte" se '
            'volvió viral en redes y lo catapultó a la fama.',
        discos: [
          'Hasta el fin del mundo (2019)',
          'San Lucas, EP (2019)',
          'París, Texas (2022)',
          'Ultra Sodade',
        ],
        cancionesDestacadas: [
          'Amor viejo',
          'Vámonos a Marte',
          'San Lucas',
          'Es que yo te quiero a ti',
        ],
      ),
      Artista(
        id: 'ed-maverick',
        nombre: 'Ed Maverick',
        nombreReal: 'Eduardo Hernández Saucedo',
        origen: 'Delicias, Chihuahua',
        estilo: 'Bedroom folk · Indie',
        colorTema: 0xFF5D7C6F,
        imagenAsset: 'assets/images/ed.jpg',
        audioAsset: 'audio/ed.mp3',
        biografia:
            'Nació en Delicias, Chihuahua, en 2001. Aprendió guitarra de forma '
            'autodidacta y tocó en grupos norteños y sierreños en bodas y '
            'fiestas antes de componer sus propias canciones.\n\n'
            'Compartió su música en redes y en 2018 lanzó "Mix pa\' llorar en tu '
            'cuarto", que incluye "Fuentes de Ortiz", certificada disco de '
            'diamante por AMPROFON. Ha colaborado con C. Tangana en '
            '"Párteme la cara" y es referente de toda una generación de '
            'cantautores.',
        discos: [
          "Mix pa' llorar en tu cuarto (2018)",
          'Transiciones, EP (2019)',
          'Ed Maverick en el Metropólitan, en vivo (2020)',
          'Eduardo (2021)',
          'La nube en el jardín (2024)',
        ],
        cancionesDestacadas: [
          'Fuentes de Ortiz',
          'Acurrucar',
          'Ropa de bazar',
          "Siempre estoy pa' ti",
          'Gracias',
        ],
      ),
      Artista(
        id: 'wuicho-kun',
        nombre: 'Wuicho Kun',
        nombreReal: 'Luis Ángel Rodríguez',
        origen: 'Tenancingo de Degollado, Estado de México',
        estilo: 'Folk contemporáneo',
        colorTema: 0xFFB0824F,
        imagenAsset: 'assets/images/kun.jpg',
        audioAsset: 'audio/kun.mp3',
        biografia:
            'Empezó su proyecto en 2022 grabando desde su celular con BandLab y '
            'en su primer año lanzó más de 60 canciones, construyendo una '
            'audiencia orgánica desde la honestidad y cercanía de su música.\n\n'
            'Su sonido acústico combina regionalismo, nostalgia y vulnerabilidad '
            'emocional, con influencia de Ed Maverick y Kevin Kaarl. "Llora" fue '
            'su primera canción en viralizarse en TikTok y hoy es una de las '
            'voces emergentes más queridas del folk mexicano.',
        discos: [
          'Nubes de Colores',
          'Quiéreme',
          'TRAUMADOS',
          'TRAUMA2',
          'Verde',
        ],
        cancionesDestacadas: [
          'Llora',
          'Quiero estar contigo (con Gonzalo Ávila)',
          'Nubecita',
          'Mentir por convivir',
          'Vuelve (con Andie Gago)',
        ],
      ),
      Artista(
        id: 'dromedarios-magicos',
        nombre: 'Dromedarios Mágicos',
        nombreReal: 'Diego Puerta',
        origen: 'Chihuahua, Chihuahua',
        estilo: 'Folk pop · Bedroom folk',
        colorTema: 0xFFC0714A,
        imagenAsset: 'assets/images/magicos.jpg',
        audioAsset: 'audio/magicos.mp3',
        biografia:
            'Es el proyecto de Diego Puerta, músico chihuahuense que armado con '
            'una guitarra acústica y mucho ingenio se abrió camino en la escena '
            'independiente. Dejó la carrera de odontología para dedicarse a la '
            'música tras sonar en Radio Ibero en 2014.\n\n'
            'Su folk pop, dulce y honesto, habla de amor, desamor y nostalgia '
            'por la infancia. Debutó con el EP "Bosque de San Marcos" y fue '
            'respaldado por el sello Arts & Crafts. Es una de las influencias '
            'reconocidas de Ed Maverick.',
        discos: [
          'Bosque de San Marcos, EP (2015)',
          'Temporada, EP',
          'Subcampeón (2020)',
        ],
        cancionesDestacadas: [
          'Una casa en construcción',
          'Los niños',
          'Buenos días',
          'Tu forma',
          'Acá',
        ],
      ),
    ];
  }
}

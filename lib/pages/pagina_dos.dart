import '../pages/pages.dart';// importa las paginas necesarias.  

class PaginaDos extends StatefulWidget {
  const PaginaDos({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PaginaDosState createState() => _PaginaDosState();
}

class _PaginaDosState extends State<PaginaDos> {
  // Lista de imágenes a mostrar
  final List<String> images = [
    'assets/curso1.jpg',
    'assets/curso2.jpg',
    'assets/curso3.jpg',
    'assets/curso4.jpg',
    'assets/curso5.jpg',
    'assets/curso6.jpg',
    'assets/curso7.jpg',
    'assets/curso8.jpg',
  ];
    // Lista de textos asociados a las imágenes
  final List<List<String>> texts = [
    ['eICFE1119-01', 'COMPUTACIÓN MÓVIL', 'RENE ALEJANDRO GALARCE'],
    [
      'eLCFE1118-01',
      'PROYECTO DE INGENIERÍA',
      'ISABEL MARGARITA ALVARADO '
    ],
    ['eICFE1121-01', 'GESTIÓN DE PROYECTOS INFORMATICOS', 'NICOL LILIANA BARAHONA'],
    ['eEGEM150-003', 'INNOVACIÓN Y EMPRENDIMIENTO', 'CLAUDIA ANDREA PONCE'],
    ['eICFE1120-01', 'SEGURIDAD DE LA INFORMACIÓN', 'SAUL ORTEGA'],
    ['eICFE1115-07', 'REDES DE COMPUTADORES', 'RICARDO AGUSTIN BRAVO'],
    ['eFGUM1513-03', 'SUSTENTABILIDAD Y MEDIOAMBIENTE', 'AMALIA ANDREA CASTRO'],
    ['eFGIN1103-02', 'INGLÉS III', 'LUCIA PATRICIA ABARCA'],
  ];
  // Número de elementos por página
  int elementosPorPage = 6;

  @override
  Widget build(BuildContext context) {
    return Menu(
      title: 'Todos Los cursos', // Título del menú
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              const Spacer(), // Espaciador para alinear elementos
              DropdownButton<int>(
                value: elementosPorPage,
                onChanged: (value) {
                  setState(() {
                    elementosPorPage = value!;
                  });
                },
                items:
                    <int>[2, 4, 6, 8].map<DropdownMenuItem<int>>((int value) {
                  return DropdownMenuItem<int>(
                    value: value,
                    child: Text(value.toString()), // Texto del dropdown
                  );
                }).toList(),
              ),
              const SizedBox(width: 10), // Espacio entre elementos
              const Text(
                'Elementos por página: ',
                style: TextStyle(fontSize: 15), // Estilo del texto
              ),
            ],
          ),
        ),
        body: Center(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Dos columnas.
            ),
            itemCount: images.length,
            itemBuilder: (BuildContext context, int index) {
              if (index < elementosPorPage) {
                const divider = Divider(); // Divisor entre textos
                return Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Image.asset(
                        images[index], // Imagen del curso
                        height: 90,
                        width: double.infinity,
                        fit: BoxFit.cover, // Ajuste de la imagen
                      ),
                      const SizedBox(
                        height: 8, // Espacio entre imagen y texto
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            texts[index][0],
                            style: const TextStyle(fontSize: 10),
                          ),
                          const SizedBox(height: 4), // Espacio entre textos
                          Text(
                            texts[index][1], // Nombre del curso
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          divider, // Divisor
                          Text(
                            texts[index][2], // Nombre del profesor
                            style: const TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}

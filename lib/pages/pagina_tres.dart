import '../pages/pages.dart'; // Importa las paginas necesarias. 

class PaginaTres extends StatefulWidget {
  const PaginaTres({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PaginaDosState createState() => _PaginaDosState();
}

class _PaginaDosState extends State<PaginaTres> {
  // Lista de imágenes a mostrar
  final List<String> images = [
    'assets/curso1.jpg',
    'assets/curso2.jpg',
    'assets/curso3.jpg',
    'assets/curso4.jpg',
    'assets/curso5.jpg',
    'assets/curso6.jpg',
    'assets/curso1.jpg',
    'assets/curso2.jpg',
  ];
// Lista de textos asociados a las imágenes
  final List<List<String>> texts = [
    [
      'eICFE1119-01 | COMPUTACIÓN MÓVIL ',
      'Su trabajo calificado recientemente aparecerá aquí',
      'ver Calificaciones',
      'COMPUTACIÓN MÓVIL'
    ],
    [
      'eLCFE1118-01 | PROYECTO DE INGENIERÍA',
      'Su trabajo calificado recientemente aparecerá aquí',
      'ver Calificaciones',
      'PROYECTO DE INGENIERÍA'
    ],
    [
      'eICFE1121-01 | GESTIÓN DE PROYECTOS INFORMÁTICOS',
      'Su trabajo calificado recientemente aparecerá aquí',
      'ver Calificaciones',
      'GESTIÓN DE PROYECTOS INFORMÁTICOS'
    ],
    [
      'eEGEM150-003 | INNOVACIÓN Y EMPRENDIMIENTO',
      'Su trabajo calificado recientemente aparecerá aquí',
      'ver Calificaciones',
      'INNOVACIÓN Y EMPRENDIMIENTO'
    ],
    [
      'eICFE1120-01 | SEGURIDAD DE LA INFORMACIÓN',
      'Su trabajo calificado recientemente aparecerá aquí',
      'ver Calificaciones',
      'SEGURIDAD DE LA INFORMACIÓN'
    ],
    [
      'eICFE1115-07 | REDES DE COMPUTADORES',
      'Su trabajo calificado recientemente aparecerá aquí',
      'ver Calificaciones',
      'REDES DE COMPUTADORES'
    ],
    [
      'eFGUM1513-03 | SUSTENTABILIDAD Y MEDIOAMBIENTE',
      'Su trabajo calificado recientemente aparecerá aquí',
      'ver Calificaciones',
      'SUSTENTABILIDAD Y MEDIOAMBIENTE'
    ],
    [
      'eFGIN1103-02 | INGLÉS III',
      'Su trabajo calificado recientemente aparecerá aquí',
      'ver Calificaciones',
      'INGLÉS III'
    ],
  ];
// Número de elementos por página
  int elementosPorPage = 6;

  @override
  Widget build(BuildContext context) {
    return Menu(
      title: 'Calificaciones', // Título del menú
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
          child: ListView.builder(
            itemCount: images.length,
            itemBuilder: (BuildContext context, int index) {
              if (index < elementosPorPage) {
                return Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(
                        height: 15, // Espacio antes del texto
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            texts[index][0], // Código y nombre del curso
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 20), // Espacio entre textos
                          Center(
                            // Centro del segundo texto
                            child: Text(
                              texts[index][1],
                              style: const TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ),
                          const Divider(),
                          Row(
                            // Row para alinear el tercer texto a la derecha

                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                // Hipervínculo para el tercer texto
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PaginaNotas(
                                          nombreRamo: texts[index][
                                              3]), // Pasar el nombre del ramo como argumento
                                    ),
                                  );
                                },
                                child: Text(
                                  texts[index][2],
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              } else {
                return Container(); // Contenedor vacío si el índice es mayor que los elementos por página.
              }
            },
          ),
        ),
      ),
    );
  }
}
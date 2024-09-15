import '../pages/pages.dart'; // Importa las páginas necesarias

class PaginaUno extends StatefulWidget {
  const PaginaUno({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PaginaUnoState createState() => _PaginaUnoState();
}

class _PaginaUnoState extends State<PaginaUno> {
  // Variables para almacenar los datos del estudiante
  String nombreCompleto = '';
  String email = '';
  String idEstudiante = '';

  @override
  void initState() {
    super.initState();
    obtenerDatosAlumno(); // Llama a la función para obtener los datos del alumno
  }
// Función para obtener los datos del alumno desde el servicio API
  Future<void> obtenerDatosAlumno() async {
    ApiService apiService = ApiService();
    var data = await apiService.obtenerDatos();
    setState(() {
      nombreCompleto = data['nombre'];
      email = data['email'];
      idEstudiante = data['id'].toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Menu(
      title: 'Perfil', // Título del menú
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(195.0), // Altura preferida del AppBar
          child: AppBar(
            flexibleSpace: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/fondo_pag1.jpg', // Imagen de fondo
                  width: 360,
                  height: 160,
                ),
                const SizedBox(height: 5),
                Text(
                  nombreCompleto.toUpperCase(), // Nombre del estudiante en mayúsculas
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0), // Padding alrededor del cuerpo
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Información del Estudiante',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Table(
                border: TableBorder.all(color: Colors.black), // Bordes de la tabla
                children: [
                  TableRow(children: [
                    TableCell(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Nombre Completo',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(nombreCompleto), // Muestra el nombre completo del estudiante
                        ],
                      ),
                    ),
                  ]),
                  TableRow(children: [
                    TableCell(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Dirección de correo electrónico',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(email), // Muestra el email del estudiante
                        ],
                      ),
                    ),
                  ]),
                  TableRow(children: [
                    TableCell(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'ID de estudiante',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(idEstudiante),
                        ],
                      ),
                    ),
                  ]),
                ],
              ),
              const SizedBox(height: 30),
              const Text(
                'Configuración del sistema',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10), // Espacio entre el título y la tabla
              Table(
                border: TableBorder.all(color: Colors.black), // Bordes de la tabla
                children: const [
                  TableRow(children: [
                    TableCell(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Idioma',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('Español (Chile UM)'), // Muestra el idioma configurado
                        ],
                      ),
                    ),
                  ]),
                  TableRow(children: [
                    TableCell(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ajustes de privacidad',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                              'Solo los profesores pueden ver la información de mi perfil'),
                        ],
                      ),
                    ),
                  ]),
                  TableRow(children: [
                    TableCell(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ajustes de notificaciones generales',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                              'Notificaciones de secuencias \n Notificaciones por correo electrónico \n Notificaciones emergentes'),
                        ],
                      ),
                    ),
                  ]),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

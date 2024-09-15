import '../../pages/pages.dart'; //importa las paginas necesarias. 

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0), // Sin padding
      child: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start, // Alineación principal al inicio
            crossAxisAlignment: CrossAxisAlignment.center, // Alineación cruzada al centro
            children: [
              Image.asset(
                'assets/home.jpg', // Imagen de recurso local
                width: 400,
                height: 150,
              ),
              const SizedBox(height: 1), // Espacio entre imágenes
              Image.asset(
                'assets/home2.jpg',
                width: 300,
                height: 250,
              ),
              const SizedBox(height: 30), // Espacio antes de la tabla
              Table(
                border: TableBorder.all(),
                children: [
                  _buildTableRow(context, 'Recursos de apoyo al estudiante'), // Fila de la tabla
                  _buildTableRow(context, 'Soporte Campus Virtual'), // Fila de la tabla
                  _buildTableRow(
                      context, 'Código de conducta en Campus Virtual'),// Fila de la tabla
                  _buildTableRow(context, 'Sistema de Biblioteca (Sibum)'),// Fila de la tabla
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  TableRow _buildTableRow(BuildContext context, String text) {
    return TableRow(
      children: [
        TableCell(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Construccion(), // Navega a la página de construcción
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0), // Padding dentro de la celda
              child: Text(
                text,
                textAlign: TextAlign.center, // Texto centrado
              ),
            ),
          ),
        ),
      ],
    );
  }
}

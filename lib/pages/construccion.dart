// Importa las páginas necesarias.
import '../pages/pages.dart';
// Clase que representa una página de "En Construcción".
class Construccion extends StatelessWidget {  // Constructor de la clase. La clave es opcional.
  const Construccion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      // Barra de aplicación en la parte superior.
      appBar: AppBar(
        title: const Text('Página en Contruccion'),// Título de la barra de aplicación.
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),// Ícono de flecha hacia atrás.
          onPressed: () {
            Navigator.of(context).pop(); // Navega de vuelta a la página anterior.
          },
        ),
      ),
      // Cuerpo de la página.
      body: const Center(
        child: Text(
          "Estamos Trabajando",
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}
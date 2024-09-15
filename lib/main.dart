import 'pages/pages.dart'; // Importa las rutas y recursos desde 'pages/pages.dart'.

// Punto de entrada de la aplicación.
void main() {
  runApp(const MyApp());  // Inicia la aplicación con MyApp.
}
// La clase MyApp es el widget principal sin estado mutable.
class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Constructor de MyApp.

  @override
  Widget build(BuildContext context) {
    // Configura la aplicación con rutas y opciones de navegación.
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.InitialRoute,   // Ruta inicial al iniciar la aplicación.
        routes: AppRoutes.routes, // Definición de rutas.
        onGenerateRoute: AppRoutes.onGenerateRoute);
  }
}   
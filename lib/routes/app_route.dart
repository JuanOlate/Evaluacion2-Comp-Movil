import '../pages/pages.dart'; // Importa las páginas necesarias

class AppRoutes {
  // ignore: constant_identifier_names
  static const InitialRoute = '/';
// Mapa de rutas de la aplicación
  static Map<String, Widget Function(BuildContext)> routes = {
    '/': (context) => const Menu(
          title: 'Pagina de la Institucion', // Título del menú principal
          child: MyHomePage(),// Página principal de la aplicación
        ),
    '/paginaUno': (context) => const PaginaUno(),// Ruta a la página uno
    '/paginaDos': (context) => const PaginaDos(),// Ruta a la página dos
    '/paginaTres': (context) => const PaginaTres(),// Ruta a la página tres
  };
   // Genera una ruta para las páginas no definidas
  // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
  static Route<dynamic> onGenerateRoute(RouteSettings) {
    return MaterialPageRoute(builder: (context) => const Construccion()); // Página de construcción para rutas no definidas
  }
}
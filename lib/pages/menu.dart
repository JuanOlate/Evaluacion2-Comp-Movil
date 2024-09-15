import '../pages/pages.dart';

class Menu extends StatefulWidget {
  final Widget child;
  final String title;

  const Menu({
    Key? key,
    required this.child,
    required this.title,
  }) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  String nombre = '';

  @override
  void initState() {
    super.initState();
    obtenerDatosAlumno();
  }

  Future<void> obtenerDatosAlumno() async {
    ApiService apiService = ApiService();
    var data = await apiService.obtenerDatos();
    setState(() {
      nombre = data['nombre'].toUpperCase();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.yellow,
      ),
      drawer: Drawer(
        child: Container(
          color: const Color.fromRGBO(38, 38, 38, 1),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                height: 110,
                child: DrawerHeader(
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(38, 38, 38, 1),
                  ),
                  child: Image.asset(
                    'assets/navigationlogo.gif',
                    //width: 40,
                    //height: 40,
                  ),
                ),
              ),
              Container(
                color: const Color.fromRGBO(255, 201, 14, 1),
                child: ListTile(
                  leading: Image.asset('assets/ico5.png'),
                  title: const Text('Página de la institución',
                      style: TextStyle(color: Colors.black, fontSize: 18)),
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/');
                  },
                ),
              ),
              const Divider(),
              ListTile(
                leading: Image.asset('assets/ico1.png'),
                title: Text(
                  nombre,
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/paginaUno');
                },
              ),
              ListTile(
                leading: Image.asset('assets/ico2.png'),
                title: const Text(
                  'Cursos',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/paginaDos');
                },
              ),
              ListTile(
                leading: Image.asset('assets/ico3.png'),
                title: const Text(
                  'Calificaciones',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/paginaTres');
                },
              ),
              ListTile(
                leading: Image.asset('assets/ico4.png'),
                title: const Text(
                  'Cerrar sesión',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/');
                },
              ),
            ],
          ),
        ),
      ),
      body: widget.child,
    );
  }
}

import '../pages/pages.dart'; // importa las paginas necesarias. 

class PaginaNotas extends StatefulWidget {
  final String nombreRamo; // Nombre del ramo

  const PaginaNotas({super.key, required this.nombreRamo});

  @override
  // ignore: library_private_types_in_public_api
  _PaginaNotasState createState() => _PaginaNotasState();
}

class _PaginaNotasState extends State<PaginaNotas> {
  // Controladores para los campos de texto
  TextEditingController parcial1Controller = TextEditingController();
  TextEditingController parcial2Controller = TextEditingController();
  TextEditingController parcial3Controller = TextEditingController();
  TextEditingController notaExamenController = TextEditingController();
// Variables para almacenar las notas
  double? parcial1 = 0;
  double? parcial2 = 0;
  double? parcial3 = 0;
  double? notaExamen = 0;
  double? promedioControl = 0;
  double? notaFinalRamo = 0;
// Variables para indicar si las notas son bajas
  bool promedioBajo = false;
  bool notaFinalBaja = false;
// Función para calcular el promedio de los controles
  void calcularPromedioControl() {
    setState(() {
      if (parcial1Controller.text.isNotEmpty &&
          parcial2Controller.text.isNotEmpty &&
          parcial3Controller.text.isNotEmpty) {
        parcial1 = double.tryParse(parcial1Controller.text) ?? 0;
        parcial2 = double.tryParse(parcial2Controller.text) ?? 0;
        parcial3 = double.tryParse(parcial3Controller.text) ?? 0;
// Verifica que las notas no sean mayores a 70
        if (parcial1! > 70 || parcial2! > 70 || parcial3! > 70) {
          return;
        }
// Calcula el promedio de los controles
        promedioControl =
            ((parcial1! * 0.3) + (parcial2! * 0.35) + (parcial3! * 0.35));
      }

      if (notaExamenController.text.isNotEmpty) {
        notaExamen = double.tryParse(notaExamenController.text) ?? 0;
// Verifica que la nota del examen no sea mayor a 70
        if (notaExamen! > 70) {
          return;
        }
// Calcula la nota final del ramo
        notaFinalRamo = (promedioControl! * 0.7) + (notaExamen! * 0.3);
// Verifica si la nota final o la nota del examen son bajas
        notaFinalBaja = notaFinalRamo! < 40 || notaExamen! < 40;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notas de ${widget.nombreRamo}', // Mostrar el nombre del ramo en el título
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ), // Mostrar el nombre del ramo en el título
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Parcial 1   30%:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: parcial1Controller,
              keyboardType: TextInputType.number,
              onChanged: (value) {
                calcularPromedioControl(); // Calcula el promedio al cambiar el valor
              },
            ),
            const SizedBox(height: 5),
            const Text(
              'Parcial 2   35%:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: parcial2Controller,
              keyboardType: TextInputType.number,
              onChanged: (value) {
                calcularPromedioControl();
              },
            ),
            const SizedBox(height: 5),
            const Text(
              'Parcial 3   35%:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: parcial3Controller,
              keyboardType: TextInputType.number,
              onChanged: (value) {
                calcularPromedioControl(); // Calcula el promedio al cambiar el valor
              },
            ),
            const SizedBox(height: 1),
            const Text(
              'Promedio Control:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 1),
            Text(
              promedioControl != null ? promedioControl.toString() : '',
              style: TextStyle(
                color: promedioBajo ? Colors.red : null,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'Nota Examen Final (30%):',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: notaExamenController,
              keyboardType: TextInputType.number,
              onChanged: (value) {
                calcularPromedioControl(); // Calcula el promedio al cambiar el valor
              },
            ),
            const SizedBox(height: 5),
            const Text(
              'Nota Final Ramo:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              notaFinalRamo != null ? notaFinalRamo.toString() : '',
              style: TextStyle(
                color: notaFinalBaja ? Colors.red : null, // Cambia el color si el promedio es bajo
                fontSize: 17,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

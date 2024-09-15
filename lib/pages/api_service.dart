// Importa las bibliotecas necesarias: 
// 'dart:convert' para convertir JSON a Map y 'package:http/http.dart' para hacer solicitudes HTTP.
import 'dart:convert'; 
import 'package:http/http.dart' as http;
// Clase que maneja las solicitudes a la API.
class ApiService {
  // Método para obtener datos de la API.
  Future<Map<String, dynamic>> obtenerDatos() async {
    try {
      // Realiza una solicitud GET a la API.
      var response = await http.get(Uri.parse(
          'https://66e3a507d2405277ed1166d0.mockapi.io/api/v1/desarrollador'));

       // Verifica si la respuesta de la API fue exitosa (código de estado 200).
      if (response.statusCode == 200) {
        // Decodificar el JSON de la respuesta como una lista
        List<dynamic> datos = json.decode(response.body);

        // Si la lista tiene datos, devuelve el primer elemento.
        if (datos.isNotEmpty) {
          return datos[0];
        } else {
          // Si la lista está vacía, devuelve un mapa vacío.
          return <String, dynamic>{};
        }
      } else {
        // Si la solicitud no fue exitosa, devuelve un mapa vacío.
        return <String, dynamic>{};
      }
    } catch (e) {
       // Captura cualquier error que ocurra y devuelve un mapa vacío.
      return <String, dynamic>{};
    }
  }
}

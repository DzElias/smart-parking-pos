import 'package:dio/dio.dart';
import '../errors/exceptions.dart';
import '../utils/constants.dart';

class ApiService {
  final Dio dio = Dio();  // Instancia de Dio

  Future<void> payParking(String licensePlate) async {
    final url = '${Constants.apiBaseUrl}/api/vehicles/pay';

    try {
      final response = await dio.post(
        url,
        data: {
          'license_plate': licensePlate,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
        ),
      );

      if (response.statusCode != 200) {
        throw ServerException('Error al procesar el pago');
      }
    } on DioError catch (e) {
      // Manejar errores de Dio
      if (e.response != null) {
        throw ServerException('Error en la respuesta del servidor: ${e.response?.data}');
      } else {
        throw ServerException('Error en la conexión: ${e.message}');
      }
    }
  }
}

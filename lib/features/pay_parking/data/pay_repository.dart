import '../../../core/services/api_service.dart';
import '../../../core/errors/exceptions.dart';

class PayRepository {
  final ApiService apiService = ApiService();

  Future<void> processPayment(String licensePlate) async {
    try {
      await apiService.payParking(licensePlate);
    } catch (e) {
      throw ServerException('No se pudo procesar el pago. Intenta de nuevo.');
    }
  }
}

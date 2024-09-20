// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:pos_smart_parking/core/services/api_service.dart';

class PayButton {
  static Future<void> processPayment(BuildContext context, String licensePlate) async {
    final apiService = ApiService();

    try {
      await apiService.payParking(licensePlate);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Pago procesado exitosamente')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al procesar el pago: $e')),
      );
    }
  }
}

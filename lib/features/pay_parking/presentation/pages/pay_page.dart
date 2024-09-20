import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/pay_button.dart';

class PayPage extends StatefulWidget {
  const PayPage({super.key});

  @override
  _PayPageState createState() => _PayPageState();
}

class _PayPageState extends State<PayPage> {
  final TextEditingController _licensePlateController = TextEditingController();
  String? errorMessage;

  @override
  void dispose() {
    _licensePlateController.dispose();
    super.dispose();
  }

  void handlePayment() async {
    final licensePlate = _licensePlateController.text;

    // Verificar si el campo no está vacío
    if (licensePlate.isEmpty) {
      setState(() {
        errorMessage = 'La matrícula no puede estar vacía.';
      });
      return;
    }

    try {
      // Llamar al botón que maneja el pago
      await PayButton.processPayment(context, licensePlate);
      setState(() {
        errorMessage = null;
      });
    } catch (e) {
      setState(() {
        errorMessage = 'Error al procesar el pago: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar Pago'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _licensePlateController,
              decoration: InputDecoration(
                labelText: 'Matrícula del vehículo',
                errorText: errorMessage,
              ),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[A-Z0-9]')), // Solo letras mayúsculas y números
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: handlePayment,
              child: const Text('Pagar'),
            ),
          ],
        ),
      ),
    );
  }
}

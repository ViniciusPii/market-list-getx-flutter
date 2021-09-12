import 'package:flutter/material.dart';
import 'package:market_list/repositories/product_list_repository.dart';
import 'package:provider/provider.dart';

class FormPage extends StatelessWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<ProductListRepository>(
          builder: (_, ProductListRepository productListRepository, __) {
            return ElevatedButton(
              onPressed: () async {
                await productListRepository.save();
                Navigator.pushNamedAndRemoveUntil(context, '/', (Route<dynamic> route) => false);
              },
              child: const Text('Voltar'),
            );
          },
        ),
      ),
    );
  }
}

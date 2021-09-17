import 'package:flutter/material.dart';
import 'package:market_list/models/product_model.dart';
import 'package:market_list/repositories/product_list_repository.dart';
import 'package:market_list/theme/app_colors.dart';
import 'package:market_list/theme/app_dimension.dart';
import 'package:market_list/theme/app_fonts.dart';
import 'package:provider/provider.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.celeste[200],
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: AppDimension.dm_16,
              horizontal: AppDimension.dm_24,
            ),
            child: Form(
              key: _form,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      fillColor: AppColors.white,
                      filled: true,
                      isDense: true,
                      contentPadding:
                          const EdgeInsets.only(left: AppDimension.dm_32, top: AppDimension.dm_32),
                      border: const OutlineInputBorder(),
                      hintText: 'Produto',
                      hintStyle: AppFonts.size_4(color: AppColors.neutral[500]),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(AppDimension.dm_32),
                        borderSide: BorderSide(color: AppColors.celeste[200]!),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(AppDimension.dm_32),
                        borderSide: BorderSide(color: AppColors.celeste[200]!),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(AppDimension.dm_32),
                        borderSide: BorderSide(color: AppColors.celeste[200]!),
                      ),
                    ),
                  ),
                  const SizedBox(height: AppDimension.dm_24),
                  Consumer<ProductListRepository>(
                    builder: (_, ProductListRepository productListRepository, __) {
                      return ElevatedButton(
                        onPressed: () async {
                          await productListRepository.save(
                            ProductModel(
                              productName: 'productName',
                              price: 5,
                              quantity: 1,
                              fullPrice: 5,
                              timestamp: DateTime.now(),
                            ),
                          );

                          Navigator.pop(context);
                        },
                        child: const Text('Adicionar'),
                        style: ElevatedButton.styleFrom(
                          primary: AppColors.pink[400],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(AppDimension.dm_32),
                          ),
                          textStyle: AppFonts.size_3(),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

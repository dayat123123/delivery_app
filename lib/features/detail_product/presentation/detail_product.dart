import 'package:delivery_app/core/entities/result.dart';
import 'package:delivery_app/features/detail_product/data/repositories/product_repositories_impl.dart';
import 'package:delivery_app/features/detail_product/domain/entities/product_model.dart';
import 'package:delivery_app/features/detail_product/domain/usecases/get_product_detail/get_product_detail.dart';
import 'package:delivery_app/shared/extensions/widget_extensions.dart';
import 'package:delivery_app/shared/widgets/scaffold.dart';
import 'package:flutter/material.dart';

class DetailProductPage extends StatefulWidget {
  final String idProduct;
  const DetailProductPage({super.key, required this.idProduct});

  @override
  State<DetailProductPage> createState() => _DetailProductPageState();
}

class _DetailProductPageState extends State<DetailProductPage> {
  late Future<Result<DetailProductModel>> future;
  @override
  void initState() {
    future =
        GetProductDetail(networkProductRepositories: ProductRepositoriesImpl())
            .call(widget.idProduct);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        appbar: AppBar(
          title: Text('Detail ${widget.idProduct}'),
          actions: [const Icon(Icons.favorite).marginOnly(right: 15)],
        ),
        body: FutureBuilder<Result<DetailProductModel>>(
          future: future,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              var data = snapshot.data;
              if (data is Success) {
                if (data?.resultValue != null) {
                  DetailProductModel produkModel = data!.resultValue!;
                  return Column(
                    children: [Text('Data : $produkModel')],
                  );
                } else {
                  return const Text('Result value is null');
                }
              } else {
                if (data?.errorMessage != null) {
                  return Text(data!.errorMessage!);
                } else {
                  return const Text('Unknown error occurred');
                }
              }
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return const SizedBox();
            }
          },
        ));
  }
}

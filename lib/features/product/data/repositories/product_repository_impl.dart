import 'package:dartz/dartz.dart';
import 'package:myapp/core/error/failures.dart';
import 'package:myapp/features/product/data/datasources/product_local_data_source.dart';
import 'package:myapp/features/product/data/datasources/product_remote_data_source.dart';
import 'package:myapp/features/product/domain/entities/product.dart';
import 'package:myapp/features/product/domain/repositories/product_repository.dart';
import 'package:myapp/core/error/platform/network_info.dart';
import 'package:meta/meta.dart';

class ProductRepositoryImpl extends ProductRepository {
  late ProductRemoteDataSource remoteDataSource;
  late ProductLocalDataSource localDataSource;
  late NetworkInfo networkInfo;

  ProductRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Product>> createNewProduct(Product product) {
    // TODO: implement createNewProduct
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> deleteProduct(String id) {
    // TODO: implement deleteProduct
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Product>>> getAllProducts() async {
    // TODO: implement getAllProducts

    networkInfo.isConnected;
    final result = await remoteDataSource.getAllProducts();
    localDataSource.cacheProducts(result);
    return Right(result);
  }

  @override
  Future<Either<Failure, Product>> getSpecificProduct(String id) {
    // TODO: implement getSpecificProduct
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Product>> updateProduct(Product product) {
    // TODO: implement updateProduct
    throw UnimplementedError();
  }
}
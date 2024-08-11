import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:myapp/features/product/domain/entities/product.dart';
import 'package:myapp/features/product/domain/usecases/get_specific_product.dart';

import 'view_all_products_test.mocks.dart';

void main() {
  late GetSpecificProduct usecase;
  late MockProductRepository mockProductRepository;

  setUp(() {
    mockProductRepository = MockProductRepository();
    usecase = GetSpecificProduct(mockProductRepository);
  });

  final tId = '1';

  final Product1 = Product(
    id: '1',
    name: 'shoes',
    description: 'best product',
    price: 23,
    imageUrl: 'imageUrl',
  );

  test('should get a product Id and return the product', () async {
    //arrange
    when(mockProductRepository.getSpecificProduct(tId))
        .thenAnswer((_) async => Right(Product1));
    //act
    final resutl = await usecase.execute(id: tId);
    //assert
    expect(resutl, Right(Product1));
    verify(mockProductRepository.getSpecificProduct(tId));
    verifyNoMoreInteractions(mockProductRepository);
  });
}
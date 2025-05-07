import 'package:fruits_hub_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/order_product_entity.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/shipping_address_entity.dart';

OrderEntity getDummyOrders() {
  ShippingAddressEntity shippingAddressEntity = ShippingAddressEntity(
    name: 'John Doe',
    address: '123 Main St',
    phone: '123-456-7890',
    city: 'New York',
    email: 'Vj4lT@example.com',
    apartmentNumber: 'Apt 1',
    floorNumber: '5',
  );

  List<OrderProductEntity> orderProductEntities = [
    OrderProductEntity(
      name: 'Apple',
      code: 'P123',
      imageUrl:
          'https://www.luluhypermarket.com/medias/19047-01.jpg-1200Wx1200H?context=bWFzdGVyfGltYWdlc3wyODA0NjR8aW1hZ2UvanBlZ3xoZmMvaDZjLzEwNTI1ODQxMzU4ODc4LzE5MDQ3LTAxLmpwZ18xMjAwV3gxMjAwSHwxNzc2MTdkZWFiZjljYjQ4NTkxNzM1M2RmYWNiN2EyYTZjNjM5NzM3YmIyMGI4NWI1NDkyMDcyZTdiMjU1YThh',
      price: 9.99,
      quantity: 2,
    ),
    OrderProductEntity(
      name: 'orange',
      code: 'P456',
      imageUrl:
          'https://www.jonesthegrocer.com/images/orange-1kg-p1440-3590_image.jpg',
      price: 19.99,
      quantity: 1,
    ),
    OrderProductEntity(
      name: 'Banana',
      code: 'P456',
      imageUrl:
          'https://www.organicfacts.net/wp-content/uploads/2013/05/Banana3.jpg',
      price: 19.99,
      quantity: 1,
    ),
  ];

  return OrderEntity(
    uID: 'order123',
    shippingAddressEntity: shippingAddressEntity,
    orderProductEntity: orderProductEntities,
    totalPrice: 29.98,
    paymentMethod: 'Credit Card',
  );
}

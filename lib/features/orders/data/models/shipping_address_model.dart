
import 'package:fruits_hub_dashboard/features/orders/domain/entities/shipping_address_entity.dart';

class ShippingAddressModel {
  String? name;
  String? address;
  String? phone;
  String? city;
  String? email;
  String? apartmentNumber;
  String? floorNumber;

  ShippingAddressModel({
    this.name,
    this.address,
    this.phone,
    this.city,
    this.email,
    this.apartmentNumber,
    this.floorNumber,
  });


  @override
  String toString() {
    return '$city $address $apartmentNumber $floorNumber';
  }

  factory ShippingAddressModel.fromJson(Map<String, dynamic> json) {
    return ShippingAddressModel(
      name: json['name'] as String?,
      address: json['address'] as String?,
      phone: json['phone'] as String?,
      city: json['city'] as String?,
      email: json['email'] as String?,
      apartmentNumber: json['apartmentNumber'] as String?,
      floorNumber: json['floorNumber'] as String?,
    );
  }

  toJson() {
    return {
      'name': name,
      'address': address,
      'phone': phone,
      'city': city,
      'email': email,
      'apartmentNumber': apartmentNumber,
      'floorNumber': floorNumber,
    };
  }
  toEntity(){
    return ShippingAddressEntity(
      name: name,
      address: address,
      phone: phone,
      city: city,
      email: email,
      apartmentNumber: apartmentNumber,
      floorNumber: floorNumber,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/enums/order_enum.dart';
import 'package:fruits_hub_dashboard/core/utils/text_styles.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/order_entity.dart';

class OrderItem extends StatelessWidget {
  final OrderEntity order;

  const OrderItem({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Order Summary", style: AppTextStyle.heading4Bold),
            const SizedBox(height: 12),
            Row(
              children: [
                Text("Total Price: \$${order.totalPrice.toStringAsFixed(2)}",
                    style: AppTextStyle.font16Bold),
                Spacer(),
                buildStatusChip(order.status),
              ],
            ),
            Text("Payment Method: ${order.paymentMethod}",
                style: AppTextStyle.font16Regular),
            const SizedBox(height: 16),
            Text("Shipping Address:", style: AppTextStyle.font19Bold),
            const SizedBox(height: 4),
            Text("Name: ${order.shippingAddressEntity.name ?? '-'}",
                style: AppTextStyle.font16Regular),
            Text("Phone: ${order.shippingAddressEntity.phone ?? '-'}",
                style: AppTextStyle.font16Regular),
            Text("Email: ${order.shippingAddressEntity.email ?? '-'}",
                style: AppTextStyle.font16Regular),
            Text("City: ${order.shippingAddressEntity.city ?? '-'}",
                style: AppTextStyle.font16Regular),
            Text("Address: ${order.shippingAddressEntity.address ?? '-'}",
                style: AppTextStyle.font16Regular),
            Text(
                "Apartment #: ${order.shippingAddressEntity.apartmentNumber ?? '-'}",
                style: AppTextStyle.font16Regular),
            Text("Floor #: ${order.shippingAddressEntity.floorNumber ?? '-'}",
                style: AppTextStyle.font16Regular),
            const SizedBox(height: 16),
            Text("Ordered Products:", style: AppTextStyle.font19Bold),
            const SizedBox(height: 8),
            Column(
              children: order.orderProductEntity.map((product) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        product.imageUrl,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(product.name, style: AppTextStyle.font16Bold),
                            Text(
                                "Qty: ${product.quantity} x \$${product.price.toStringAsFixed(2)}",
                                style: AppTextStyle.font13w400),
                          ],
                        ),
                      ),
                      Text(
                        "\$${(product.price * product.quantity).toStringAsFixed(2)}",
                        style: AppTextStyle.font16Bold,
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildStatusChip(OrderStatusEnum status) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: getStatusColor(status).withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        status.name.toUpperCase(),
        style: TextStyle(
          color: getStatusColor(status),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Color getStatusColor(OrderStatusEnum status) {
    switch (status) {
      case OrderStatusEnum.pending:
        return Colors.orange;
      case OrderStatusEnum.processing:
        return Colors.blue;
      case OrderStatusEnum.shipped:
        return Colors.purple;
      case OrderStatusEnum.delivered:
        return Colors.green;
      case OrderStatusEnum.cancelled:
        return Colors.red;
    }
  }
}

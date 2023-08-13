class Billing {
  final String id;
  final String userId;
  final String accessoriesId;
  final String plantId;
  final DateTime orderDate;
  final int quantity;
  final double billAmount;

  Billing(this.id, this.userId, this.accessoriesId, this.plantId, this.orderDate, this.quantity, this.billAmount);
}

import 'package:json_annotation/json_annotation.dart';

part 'inventory.g.dart';

@JsonSerializable()
class Inventory {
  Inventory();

  late String inventoryId;
  late String category;
  late String brand;
  late String supplier;
  late num minimumStock;
  late String updateDate;
  late num taxRate;
  late String notes;
  late String productSize;
  late String productWeight;
  late String partnershipProgramInfo;
  late String storageLocation;
  
  factory Inventory.fromJson(Map<String,dynamic> json) => _$InventoryFromJson(json);
  Map<String, dynamic> toJson() => _$InventoryToJson(this);
}

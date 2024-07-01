// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Inventory _$InventoryFromJson(Map<String, dynamic> json) => Inventory()
  ..inventoryId = json['inventoryId'] as String
  ..category = json['category'] as String
  ..brand = json['brand'] as String
  ..supplier = json['supplier'] as String
  ..minimumStock = json['minimumStock'] as num
  ..updateDate = json['updateDate'] as String
  ..taxRate = json['taxRate'] as num
  ..notes = json['notes'] as String
  ..productSize = json['productSize'] as String
  ..productWeight = json['productWeight'] as String
  ..partnershipProgramInfo = json['partnershipProgramInfo'] as String
  ..storageLocation = json['storageLocation'] as String;

Map<String, dynamic> _$InventoryToJson(Inventory instance) => <String, dynamic>{
      'inventoryId': instance.inventoryId,
      'category': instance.category,
      'brand': instance.brand,
      'supplier': instance.supplier,
      'minimumStock': instance.minimumStock,
      'updateDate': instance.updateDate,
      'taxRate': instance.taxRate,
      'notes': instance.notes,
      'productSize': instance.productSize,
      'productWeight': instance.productWeight,
      'partnershipProgramInfo': instance.partnershipProgramInfo,
      'storageLocation': instance.storageLocation,
    };

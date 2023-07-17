// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

import 'package:intl/intl.dart';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  bool? success;
  String? type;
  String? message;
  Data? data;

  Welcome({
    this.success,
    this.type,
    this.message,
    this.data,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        success: json["success"],
        type: json["type"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "type": type,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  String? id;
  String? userId;
  String? createdBy;
  String? truckId;
  String? trailerId;
  String? driverId;
  String? uniqueId;
  String? startAddress;
  String? startLat;
  String? startLng;
  String? endAddress;
  String? endLat;
  String? endLng;
  DateTime? startDate;
  DateTime? expectedEndDate;
  String? endDate;
  String? state;
  String? statusByDriver;
  dynamic rejectedReason;
  dynamic weight;
  bool? saveAsTemplate;
  DateTime? createdAt;
  DateTime? updatedAt;
  TruckData? truckData;
  TrailerData? trailerData;
  List<dynamic>? stopsData;
  CustomerDetails? customerDetails;
  List<ServiceProvider>? serviceProvider;

  Data({
    this.id,
    this.userId,
    this.createdBy,
    this.truckId,
    this.trailerId,
    this.driverId,
    this.uniqueId,
    this.startAddress,
    this.startLat,
    this.startLng,
    this.endAddress,
    this.endLat,
    this.endLng,
    this.startDate,
    this.expectedEndDate,
    this.endDate,
    this.state,
    this.statusByDriver,
    this.rejectedReason,
    this.weight,
    this.saveAsTemplate,
    this.createdAt,
    this.updatedAt,
    this.truckData,
    this.trailerData,
    this.stopsData,
    this.customerDetails,
    this.serviceProvider,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        userId: json["user_id"],
        createdBy: json["created_by"],
        truckId: json["truck_id"],
        trailerId: json["trailer_id"],
        driverId: json["driver_id"],
        uniqueId: json["unique_id"],
        startAddress: json["start_address"],
        startLat: json["start_lat"],
        startLng: json["start_lng"],
        endAddress: json["end_address"],
        endLat: json["end_lat"],
        endLng: json["end_lng"],
        startDate: json["start_date"] == null
            ? null
            : DateTime.parse(json["start_date"]),
        expectedEndDate: json["expected_end_date"] == null
            ? null
            : DateTime.parse(json["expected_end_date"]),
        endDate: json["end_date"],
        state: json["state"],
        statusByDriver: json["status_by_driver"],
        rejectedReason: json["rejected_reason"],
        weight: json["weight"],
        saveAsTemplate: json["save_as_template"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        truckData: json["truckData"] == null
            ? null
            : TruckData.fromJson(json["truckData"]),
        trailerData: json["trailerData"] == null
            ? null
            : TrailerData.fromJson(json["trailerData"]),
        stopsData: json["stopsData"] == null
            ? []
            : List<dynamic>.from(json["stopsData"]!.map((x) => x)),
        customerDetails: json["customerDetails"] == null
            ? null
            : CustomerDetails.fromJson(json["customerDetails"]),
        serviceProvider: json["serviceProvider"] == null
            ? []
            : List<ServiceProvider>.from(json["serviceProvider"]!
                .map((x) => ServiceProvider.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "created_by": createdBy,
        "truck_id": truckId,
        "trailer_id": trailerId,
        "driver_id": driverId,
        "unique_id": uniqueId,
        "start_address": startAddress,
        "start_lat": startLat,
        "start_lng": startLng,
        "end_address": endAddress,
        "end_lat": endLat,
        "end_lng": endLng,
        "start_date": startDate?.toIso8601String(),
        "expected_end_date": expectedEndDate?.toIso8601String(),
        "end_date": endDate,
        "state": state,
        "status_by_driver": statusByDriver,
        "rejected_reason": rejectedReason,
        "weight": weight,
        "save_as_template": saveAsTemplate,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "truckData": truckData?.toJson(),
        "trailerData": trailerData?.toJson(),
        "stopsData": stopsData == null
            ? []
            : List<dynamic>.from(stopsData!.map((x) => x)),
        "customerDetails": customerDetails?.toJson(),
        "serviceProvider": serviceProvider == null
            ? []
            : List<dynamic>.from(serviceProvider!.map((x) => x.toJson())),
      };

  String? getPassingNetWeight(List<dynamic>? stopsData) {
    var totalWeight = 0;
    stopsData?.forEach((it) {
      totalWeight += int.tryParse(it.weight) ?? 0;
    });
    return totalWeight.toString();
  }

  String? formattedDate(String? startDate) {
    var formattedDate =
        startDate != null ? changeDateAndTimeFormat(startDate) : null;
    return formattedDate;
  }

  String? changeDateAndTimeFormat(String date) {
    var inputFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
    var outputFormat = DateFormat('dd-MM-yyyy, HH:mm:ss a'
        '');
    var dateTime = inputFormat.parse(date);
    return outputFormat.format(dateTime);
  }

  String tripDuration(String? startDate, String? endDate) {
    DateFormat dates = DateFormat('MM/dd/yyyy');

    if (startDate != null && endDate != null) {
      DateTime startDateParsed = dates.parse(startDate);
      DateTime endDateParsed = dates.parse(endDate);

      Duration difference = startDateParsed.difference(endDateParsed);
      int differenceInDays = difference.inDays.abs();

      return differenceInDays.toString();
    } else {
      return '';
    }
  }
}

class CustomerDetails {
  String? name;

  CustomerDetails({
    this.name,
  });

  factory CustomerDetails.fromJson(Map<String, dynamic> json) =>
      CustomerDetails(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

class ServiceProvider {
  String? id;
  String? consignmentId;
  String? serviceProviderId;
  String? serviceProviderName;
  String? serviceProviderNumber;
  String? serviceProviderAddress;
  String? serviceProviderLatitude;
  String? serviceProviderLongitude;
  int? pathSequence;
  DateTime? arrivalDate;
  String? serviceProviderType;
  bool? additionalServicePresent;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<ServicesProvided>? servicesProvided;

  ServiceProvider({
    this.id,
    this.consignmentId,
    this.serviceProviderId,
    this.serviceProviderName,
    this.serviceProviderNumber,
    this.serviceProviderAddress,
    this.serviceProviderLatitude,
    this.serviceProviderLongitude,
    this.pathSequence,
    this.arrivalDate,
    this.serviceProviderType,
    this.additionalServicePresent,
    this.createdAt,
    this.updatedAt,
    this.servicesProvided,
  });

  factory ServiceProvider.fromJson(Map<String, dynamic> json) =>
      ServiceProvider(
        id: json["id"],
        consignmentId: json["consignment_id"],
        serviceProviderId: json["service_provider_id"],
        serviceProviderName: json["service_provider_name"],
        serviceProviderNumber: json["service_provider_number"],
        serviceProviderAddress: json["service_provider_address"],
        serviceProviderLatitude: json["service_provider_latitude"],
        serviceProviderLongitude: json["service_provider_longitude"],
        pathSequence: json["path_sequence"],
        arrivalDate: json["arrival_date"] == null
            ? null
            : DateTime.parse(json["arrival_date"]),
        serviceProviderType: json["service_provider_type"],
        additionalServicePresent: json["additional_service_present"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        servicesProvided: json["servicesProvided"] == null
            ? []
            : List<ServicesProvided>.from(json["servicesProvided"]!
                .map((x) => ServicesProvided.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "consignment_id": consignmentId,
        "service_provider_id": serviceProviderId,
        "service_provider_name": serviceProviderName,
        "service_provider_number": serviceProviderNumber,
        "service_provider_address": serviceProviderAddress,
        "service_provider_latitude": serviceProviderLatitude,
        "service_provider_longitude": serviceProviderLongitude,
        "path_sequence": pathSequence,
        "arrival_date": arrivalDate?.toIso8601String(),
        "service_provider_type": serviceProviderType,
        "additional_service_present": additionalServicePresent,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "servicesProvided": servicesProvided == null
            ? []
            : List<dynamic>.from(servicesProvided!.map((x) => x.toJson())),
      };
}

class ServicesProvided {
  String? id;
  String? consignmentServiceProviderI;
  String? status;
  String? serviceTypeId;
  String? serviceTypeName;
  String? quantity;
  String? unitApply;
  String? estimatedAmount;
  String? actualAmount;
  String? currencyUsed;
  bool? isProvided;
  bool? isApproved;
  bool? isRequested;
  DateTime? expectedTime;
  dynamic actualCompleteTime;
  String? ratingForOperator;
  ServiceMetadata? serviceMetadata;
  String? serviceIcon;
  String? uniqueId;
  DateTime? createdAt;
  DateTime? updatedAt;
  ServiceType? serviceType;

  ServicesProvided({
    this.id,
    this.consignmentServiceProviderI,
    this.status,
    this.serviceTypeId,
    this.serviceTypeName,
    this.quantity,
    this.unitApply,
    this.estimatedAmount,
    this.actualAmount,
    this.currencyUsed,
    this.isProvided,
    this.isApproved,
    this.isRequested,
    this.expectedTime,
    this.actualCompleteTime,
    this.ratingForOperator,
    this.serviceMetadata,
    this.serviceIcon,
    this.uniqueId,
    this.createdAt,
    this.updatedAt,
    this.serviceType,
  });

  factory ServicesProvided.fromJson(Map<String, dynamic> json) =>
      ServicesProvided(
        id: json["id"],
        consignmentServiceProviderI: json["consignment_service_provider_i"],
        status: json["status"],
        serviceTypeId: json["service_type_id"],
        serviceTypeName: json["service_type_name"],
        quantity: json["quantity"],
        unitApply: json["unit_apply"],
        estimatedAmount: json["estimated_amount"],
        actualAmount: json["actual_amount"],
        currencyUsed: json["currency_used"],
        isProvided: json["is_provided"],
        isApproved: json["is_approved"],
        isRequested: json["is_requested"],
        expectedTime: json["expected_time"] == null
            ? null
            : DateTime.parse(json["expected_time"]),
        actualCompleteTime: json["actual_complete_time"],
        ratingForOperator: json["rating_for_operator"],
        serviceMetadata: json["service_metadata"] == null
            ? null
            : ServiceMetadata.fromJson(json["service_metadata"]),
        serviceIcon: json["service_icon"],
        uniqueId: json["unique_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        serviceType: json["service_type"] == null
            ? null
            : ServiceType.fromJson(json["service_type"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "consignment_service_provider_i": consignmentServiceProviderI,
        "status": status,
        "service_type_id": serviceTypeId,
        "service_type_name": serviceTypeName,
        "quantity": quantity,
        "unit_apply": unitApply,
        "estimated_amount": estimatedAmount,
        "actual_amount": actualAmount,
        "currency_used": currencyUsed,
        "is_provided": isProvided,
        "is_approved": isApproved,
        "is_requested": isRequested,
        "expected_time": expectedTime?.toIso8601String(),
        "actual_complete_time": actualCompleteTime,
        "rating_for_operator": ratingForOperator,
        "service_metadata": serviceMetadata?.toJson(),
        "service_icon": serviceIcon,
        "unique_id": uniqueId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "service_type": serviceType?.toJson(),
      };
}

class ServiceMetadata {
  int? quantity;
  String? detail;

  ServiceMetadata({
    this.quantity,
    this.detail,
  });

  factory ServiceMetadata.fromJson(Map<String, dynamic> json) =>
      ServiceMetadata(
        quantity: json["quantity"],
        detail: json["detail"],
      );

  Map<String, dynamic> toJson() => {
        "quantity": quantity,
        "detail": detail,
      };
}

class ServiceType {
  String? icon;

  ServiceType({
    this.icon,
  });

  factory ServiceType.fromJson(Map<String, dynamic> json) => ServiceType(
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "icon": icon,
      };
}

class TrailerData {
  String? trailerNumber;
  String? capacity;

  TrailerData({
    this.trailerNumber,
    this.capacity,
  });

  factory TrailerData.fromJson(Map<String, dynamic> json) => TrailerData(
        trailerNumber: json["trailer_number"],
        capacity: json["capacity"],
      );

  Map<String, dynamic> toJson() => {
        "trailer_number": trailerNumber,
        "capacity": capacity,
      };
}

class TruckData {
  String? truckNumber;
  String? capacity;

  TruckData({
    this.truckNumber,
    this.capacity,
  });

  factory TruckData.fromJson(Map<String, dynamic> json) => TruckData(
        truckNumber: json["truck_number"],
        capacity: json["capacity"],
      );

  Map<String, dynamic> toJson() => {
        "truck_number": truckNumber,
        "capacity": capacity,
      };
}

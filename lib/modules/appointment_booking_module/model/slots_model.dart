// To parse this JSON data, do
//
//     final slotsModel = slotsModelFromJson(jsonString);

import 'dart:convert';

SlotsModel slotsModelFromJson(String str) =>
    SlotsModel.fromJson(json.decode(str));

String slotsModelToJson(SlotsModel data) => json.encode(data.toJson());

class SlotsModel {
  final String doctor;
  final DateTime date;
  final List<Slot> slots;

  const SlotsModel({
    required this.doctor,
    required this.date,
    required this.slots,
  });

  SlotsModel copyWith({String? doctor, DateTime? date, List<Slot>? slots}) =>
      SlotsModel(
        doctor: doctor ?? this.doctor,
        date: date ?? this.date,
        slots: slots ?? this.slots,
      );

  factory SlotsModel.fromJson(Map<String, dynamic> json) => SlotsModel(
    doctor: json['doctor'],
    date: DateTime.parse(json['date']),
    slots: List<Slot>.from(json['slots'].map((x) => Slot.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    'doctor': doctor,
    'date':
        "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    'slots': List<dynamic>.from(slots.map((x) => x.toJson())),
  };
}

class Slot {
  final int slotId;
  final String startTime;
  final String endTime;
  final bool availability;
  final int bookedCount;
  final bool cancelledByDoctor;
  final String remarks;

  const Slot({
    required this.slotId,
    required this.startTime,
    required this.endTime,
    required this.availability,
    required this.bookedCount,
    required this.cancelledByDoctor,
    required this.remarks,
  });

  Slot copyWith({
    int? slotId,
    String? startTime,
    String? endTime,
    bool? availability,
    int? bookedCount,
    bool? cancelledByDoctor,
    String? remarks,
  }) => Slot(
    slotId: slotId ?? this.slotId,
    startTime: startTime ?? this.startTime,
    endTime: endTime ?? this.endTime,
    availability: availability ?? this.availability,
    bookedCount: bookedCount ?? this.bookedCount,
    cancelledByDoctor: cancelledByDoctor ?? this.cancelledByDoctor,
    remarks: remarks ?? this.remarks,
  );

  factory Slot.fromJson(Map<String, dynamic> json) => Slot(
    slotId: json['slot_id'],
    startTime: json['start_time'],
    endTime: json['end_time'],
    availability: json['availability'],
    bookedCount: json['booked_count'],
    cancelledByDoctor: json['cancelled_by_doctor'],
    remarks: json['remarks'],
  );

  Map<String, dynamic> toJson() => {
    'slot_id': slotId,
    'start_time': startTime,
    'end_time': endTime,
    'availability': availability,
    'booked_count': bookedCount,
    'cancelled_by_doctor': cancelledByDoctor,
    'remarks': remarks,
  };
}

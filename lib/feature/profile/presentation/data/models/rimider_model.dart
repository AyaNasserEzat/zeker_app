class ReminderModel {
  final bool isOn;
  final DateTime? startTime;
  final DateTime? endTime;
  final Duration interval;
  final List<String> azkarList;

  ReminderModel({
    required this.isOn,
    required this.startTime,
    required this.endTime,
    required this.interval,
    required this.azkarList,
  });
  
  }
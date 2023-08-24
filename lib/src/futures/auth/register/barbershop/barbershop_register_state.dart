// ignore_for_file: public_member_api_docs, sort_constructors_first
enum BarbershopRegisterStateStatus {
  initial,
  success,
  error,
}

class BarbershopregisterState {
  final BarbershopRegisterStateStatus status;
  final List<String> openingDays;
  final List<int> openingHours;

  BarbershopregisterState.initial()
      : this(
          status: BarbershopRegisterStateStatus.initial,
          openingDays: <String>[],
          openingHours: <int>[],
        );

  BarbershopregisterState({
    required this.status,
    required this.openingDays,
    required this.openingHours,
  });

  BarbershopregisterState copyWith({
    BarbershopRegisterStateStatus? status,
    List<String>? openingDays,
    List<int>? openingHours,
  }) {
    return BarbershopregisterState(
      status: status ?? this.status,
      openingDays: openingDays ?? this.openingDays,
      openingHours: openingHours ?? this.openingHours,
    );
  }
}

part of 'dashboard_bloc.dart';

abstract class DashboardEvent extends Equatable {
  const DashboardEvent();
}

class SelectPage extends DashboardEvent {
  final int page;

  const SelectPage({required this.page});

  @override
  List<Object?> get props => [page];
}

import 'package:equatable/equatable.dart';

class Err extends Equatable {
  final String? message;

  const Err({this.message});

  @override
  List<Object?> get props => [message];
}

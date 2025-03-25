part of 'market_bloc.dart';

sealed class MarketEvent {}

final class GetCryptoListEvent extends MarketEvent {}

final class GetGlobalDataEvent extends MarketEvent {}

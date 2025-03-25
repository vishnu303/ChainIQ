part of 'market_bloc.dart';

sealed class MarketState {}

final class MarketInitial extends MarketState {}

final class CryptoListLoading extends MarketState {}

final class CryptoListError extends MarketState {
  final String message;
  CryptoListError({required this.message});
}

final class CryptoListLoaded extends MarketState {
  final List<Crypto> cryptoList;
  CryptoListLoaded({required this.cryptoList});
}

final class GlobalDataLoaded extends MarketState {
  final GlobalMarketData globalMarketData;
  GlobalDataLoaded({required this.globalMarketData});
}

final class GlobalDataLoading extends MarketState {}

final class GlobalDataError extends MarketState {
  final String message;
  GlobalDataError({required this.message});
}

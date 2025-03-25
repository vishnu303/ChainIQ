import 'package:chainiq/features/market/domain/entities/crypto.dart';
import 'package:chainiq/features/market/domain/entities/global_market_data.dart';
import 'package:chainiq/features/market/domain/usecases/crypto_list.dart';
import 'package:chainiq/features/market/domain/usecases/global_market_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'market_event.dart';
part 'market_state.dart';

class MarketBloc extends Bloc<MarketEvent, MarketState> {
  final CryptoList _cryptoList;
  final GetGlobalMarketData _getGlobalMarketData;
  MarketBloc({
    required CryptoList cryptoList,
    required GetGlobalMarketData getGlobalMarketData,
  })  : _cryptoList = cryptoList,
        _getGlobalMarketData = getGlobalMarketData,
        super(MarketInitial()) {
    on<GetCryptoListEvent>(_getCryptoList);
    on<GetGlobalDataEvent>(_globalMarketData);
  }

  /// Get list of crypto by market cap
  void _getCryptoList(event, emit) async {
    emit(CryptoListLoading());
    try {
      var cryptoList = await _cryptoList();

      emit(CryptoListLoaded(cryptoList: cryptoList));
    } catch (e) {
      emit(CryptoListError(message: e.toString()));
    }
  }

  /// Get global market data
  void _globalMarketData(event, emit) async {
    emit(GlobalDataLoading());
    try {
      var globalMarketData = await _getGlobalMarketData();

      emit(GlobalDataLoaded(globalMarketData: globalMarketData));
    } catch (e) {
      emit(GlobalDataError(message: e.toString()));
    }
  }
}

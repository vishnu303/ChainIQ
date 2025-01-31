import 'package:chainiq/features/market/domain/entities/crypto.dart';
import 'package:chainiq/features/market/domain/usecases/crypto_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'market_event.dart';
part 'market_state.dart';

class MarketBloc extends Bloc<MarketEvent, MarketState> {
  final CryptoList _cryptoList;
  MarketBloc({required CryptoList cryptoList})
      : _cryptoList = cryptoList,
        super(MarketInitial()) {
    on<GetCryptoListEvent>(_getCryptoList);
  }

  /// Get list of crypto by market cap
  void _getCryptoList(event, emit) async {
    emit(CryptoListLoading());
    try {
      var cryptoList = await _cryptoList();
      emit(CryptoListLoaded(cryptoList: cryptoList));
    } catch (e) {
      emit(e.toString());
    }
  }
}

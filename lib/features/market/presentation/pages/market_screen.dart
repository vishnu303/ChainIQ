import 'package:chainiq/core/constants/constants.dart';
import 'package:chainiq/features/market/presentation/bloc/market_bloc.dart';
import 'package:chainiq/features/market/presentation/widgets/crypto_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MarketScreen extends StatefulWidget {
  const MarketScreen({super.key});

  @override
  State<MarketScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  @override
  void initState() {
    context.read<MarketBloc>().add(GetCryptoListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          BlocBuilder<MarketBloc, MarketState>(
            builder: (context, state) {
              if (state is CryptoListLoading) {
                return Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              } else if (state is CryptoListLoaded) {
                return Expanded(
                    child: CryptoListWidget(
                  cryptoList: state.cryptoList,
                ));
              } else {
                final errorMessage = (state is CryptoListError)
                    ? state.message
                    : defaultErrorMessage;
                return Center(child: Text(errorMessage));
              }
            },
          ),
        ],
      ),
    );
  }
}

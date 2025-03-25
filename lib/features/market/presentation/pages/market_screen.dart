import 'package:chainiq/core/constants/constants.dart';
import 'package:chainiq/core/responsive/responsive_layout.dart';
import 'package:chainiq/features/market/presentation/bloc/market_bloc.dart';
import 'package:chainiq/features/market/presentation/widgets/crypto_list_widget.dart';
import 'package:chainiq/features/market/presentation/widgets/global_data_widget.dart';
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
    super.initState();
    context.read<MarketBloc>().add(GetCryptoListEvent());
    context.read<MarketBloc>().add(GetGlobalDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 8 : 16,
        vertical: isMobile ? 8 : 16,
      ),
      child: Column(
        children: [
          Expanded(
              flex: 1,
              child: BlocBuilder<MarketBloc, MarketState>(
                buildWhen: (previous, current) =>
                    current is GlobalDataLoading ||
                    current is GlobalDataLoaded ||
                    current is GlobalDataError,
                builder: (context, state) {
                  if (state is GlobalDataLoading) {
                    return Container();
                  } else if (state is GlobalDataLoaded) {
                    return GlobalDataWidget(
                      globalMarketData: state.globalMarketData,
                    );
                  }
                  return Container();
                },
              )),
          const SizedBox(height: 10),
          Expanded(
            flex: isMobile ? 6 : 3,
            child: BlocBuilder<MarketBloc, MarketState>(
              buildWhen: (previous, current) =>
                  current is CryptoListLoading ||
                  current is CryptoListLoaded ||
                  current is CryptoListError,
              builder: (context, state) {
                if (state is CryptoListLoading) {
                  return Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                } else if (state is CryptoListLoaded) {
                  return CryptoListWidget(
                    cryptoList: state.cryptoList,
                  );
                } else {
                  final errorMessage = (state is CryptoListError)
                      ? state.message
                      : defaultErrorMessage;
                  return Center(child: Text(errorMessage));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

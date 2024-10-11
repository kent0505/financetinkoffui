import 'package:financetinkoffui/core/widgets/buttons/cuper_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/texts/text_r.dart';

class ExchangeWidget extends StatefulWidget {
  const ExchangeWidget({super.key});

  @override
  State<ExchangeWidget> createState() => _ExchangeWidgetState();
}

class _ExchangeWidgetState extends State<ExchangeWidget> {
  int index = 2;

  void onCurrency(int value) {
    setState(() {
      index = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _CurrencyCard('MILL', '₥', index == 0, () {
                onCurrency(0);
              }),
              _CurrencyCard('BTC', '₿', index == 1, () {
                onCurrency(1);
              }),
              _CurrencyCard('EUR', '€', index == 2, () {
                onCurrency(2);
              }),
              _CurrencyCard('RUB', '₽', index == 3, () {
                onCurrency(3);
              }),
              _CurrencyCard('KRW', '₩', index == 4, () {
                onCurrency(4);
              }),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _ExchangeIcon(index == 0),
              _ExchangeIcon(index == 1),
              _ExchangeIcon(index == 2),
              _ExchangeIcon(index == 3),
              _ExchangeIcon(index == 4),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _CurrencyCard('RUB', '₽', index == 0, () {
                onCurrency(0);
              }),
              _CurrencyCard('KRW', '₩', index == 1, () {
                onCurrency(1);
              }),
              _CurrencyCard('USD', '\$', index == 2, () {
                onCurrency(2);
              }),
              _CurrencyCard('BTC', '₿', index == 3, () {
                onCurrency(3);
              }),
              _CurrencyCard('MILL', '₥', index == 4, () {
                onCurrency(4);
              }),
            ],
          ),
        ],
      ),
    );
  }
}

class _CurrencyCard extends StatelessWidget {
  const _CurrencyCard(
    this.title,
    this.currency,
    this.active,
    this.onPressed,
  );

  final String title;
  final String currency;
  final bool active;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextR(
          title,
          fontSize: 16,
          color: active ? AppColors.black : Colors.transparent,
        ),
        const SizedBox(height: 14),
        CuperButton(
          onPressed: onPressed,
          child: Container(
            height: 54,
            width: 54,
            decoration: BoxDecoration(
              color: active ? AppColors.main : const Color(0xffD9D9D9),
              shape: BoxShape.circle,
              border: Border.all(
                width: 3,
                color: AppColors.white,
              ),
            ),
            child: Center(
              child: TextB(
                currency,
                fontSize: 30,
                color: AppColors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ExchangeIcon extends StatelessWidget {
  const _ExchangeIcon(this.active);

  final bool active;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      width: 54,
      child: active
          ? Center(
              child: SvgPicture.asset('assets/exchange.svg'),
            )
          : null,
    );
  }
}

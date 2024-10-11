import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/utils.dart';
import '../../../core/widgets/others/divider_widget.dart';
import '../../../core/widgets/texts/text_r.dart';
import '../../money/bloc/money_bloc.dart';
import '../../money/pages/money_add_page.dart';
import '../widgets/home_button.dart';
import '../widgets/home_title.dart';
import '../widgets/money_card.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  void onAdd(bool expense) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: const Color(0xfffef6ca),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
      ),
      builder: (context) {
        return MoneyAddPage(expense: expense);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 35 + getStatusBar(context)),
        const HomeTitle(),
        const SizedBox(height: 18),
        const Row(
          children: [
            SizedBox(width: 40),
            TextB('18,000', fontSize: 28),
          ],
        ),
        const SizedBox(height: 18),
        const DividerWidget(),
        const SizedBox(height: 22),
        Row(
          children: [
            const SizedBox(width: 30),
            HomeButton(
              id: 1,
              title: 'Add income',
              onPressed: () {
                onAdd(false);
              },
            ),
            const SizedBox(width: 40),
            HomeButton(
              id: 1,
              title: 'Add expense',
              onPressed: () {
                onAdd(true);
              },
            ),
            const SizedBox(width: 30),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            const SizedBox(width: 30),
            HomeButton(
              id: 3,
              title: 'Exchange',
              onPressed: () {},
            ),
            const SizedBox(width: 40),
            HomeButton(
              id: 4,
              title: 'History',
              onPressed: () {},
            ),
            const SizedBox(width: 30),
          ],
        ),
        const SizedBox(height: 50),
        Row(
          children: [
            const SizedBox(width: 34),
            SvgPicture.asset('assets/home4.svg'),
            const SizedBox(width: 13),
            const TextR('History', fontSize: 18),
          ],
        ),
        const SizedBox(height: 4),
        const DividerWidget(),
        const SizedBox(height: 11),
        BlocBuilder<MoneyBloc, MoneyState>(
          builder: (context, state) {
            if (state is MoneyLoadedState) {
              return Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  children: [
                    const SizedBox(height: 11),
                    ...List.generate(
                      state.money.length,
                      (index) {
                        return MoneyCard(money: state.money[index]);
                      },
                    ),
                  ],
                ),
              );
            }
            return Container();
          },
        ),
      ],
    );
  }
}

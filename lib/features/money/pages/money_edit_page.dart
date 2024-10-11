import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/models/money.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/buttons/cuper_button.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../../../core/widgets/dialogs/delete_dialog.dart';
import '../../../core/widgets/textfields/txt_field.dart';
import '../../../core/widgets/texts/text_r.dart';
import '../bloc/money_bloc.dart';
import '../widgets/money_category_card.dart';

class MoneyEditPage extends StatefulWidget {
  const MoneyEditPage({
    super.key,
    required this.money,
  });

  final Money money;

  @override
  State<MoneyEditPage> createState() => _MoneyEditPageState();
}

class _MoneyEditPageState extends State<MoneyEditPage> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();

  bool active = true;
  bool getSelected(String title) {
    return controller3.text == title;
  }

  void checkActive() {
    setState(() {
      active = getButtonActive([
        controller1,
        controller2,
        controller3,
      ]);
    });
  }

  void onCategory(String value) {
    controller3.text = value;
    checkActive();
  }

  void onDone() {
    context.read<MoneyBloc>().add(
          EditMoneyEvent(
            money: Money(
              id: widget.money.id,
              title: controller1.text,
              amount: int.tryParse(controller2.text) ?? 0,
              category: controller3.text,
              expense: widget.money.expense,
            ),
          ),
        );
    context.pop();
  }

  void onDelete() {
    showDialog(
      context: context,
      builder: (context) {
        return DeleteDialog(
          title: widget.money.expense ? 'Delete Expense?' : 'Delete Income?',
          onYes: () {
            context
                .read<MoneyBloc>()
                .add(DeleteMoneyEvent(id: widget.money.id));
            context.pop();
          },
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    controller1.text = widget.money.title;
    controller2.text = widget.money.amount.toString();
    controller3.text = widget.money.category;
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children: [
            const SizedBox(height: 22),
            Row(
              children: [
                const SizedBox(width: 10),
                TextB(
                  widget.money.expense ? 'Edit Expense' : 'Edit Income',
                  fontSize: 32,
                ),
              ],
            ),
            const SizedBox(height: 24),
            TextM(
              'Title',
              fontSize: 16,
              color: AppColors.black64,
            ),
            const SizedBox(height: 8),
            TxtField(
              controller: controller1,
              hintText: 'Name title',
              onChanged: checkActive,
            ),
            const SizedBox(height: 16),
            TextM(
              'Amount (\$)',
              fontSize: 16,
              color: AppColors.black64,
            ),
            const SizedBox(height: 8),
            TxtField(
              controller: controller2,
              hintText:
                  widget.money.expense ? 'Amount Expense' : 'Amount Income',
              number: true,
              length: 6,
              onChanged: checkActive,
            ),
            const SizedBox(height: 16),
            TextM(
              'Category',
              fontSize: 16,
              color: AppColors.black64,
            ),
            const SizedBox(height: 8),
            if (widget.money.expense) ...[
              MoneyCategoryCard(
                id: 7,
                title: 'Investment ',
                selected: getSelected('Investment '),
                onPressed: onCategory,
              ),
              const SizedBox(height: 8),
              MoneyCategoryCard(
                id: 8,
                title: 'Food',
                selected: getSelected('Food'),
                onPressed: onCategory,
              ),
              const SizedBox(height: 8),
              MoneyCategoryCard(
                id: 9,
                title: 'Transport',
                selected: getSelected('Transport'),
                onPressed: onCategory,
              ),
              const SizedBox(height: 8),
              MoneyCategoryCard(
                id: 10,
                title: 'Rest',
                selected: getSelected('Rest'),
                onPressed: onCategory,
              ),
              const SizedBox(height: 8),
              MoneyCategoryCard(
                id: 11,
                title: 'Procuerement',
                selected: getSelected('Procuerement'),
                onPressed: onCategory,
              ),
            ] else ...[
              MoneyCategoryCard(
                id: 1,
                title: 'Salary',
                selected: getSelected('Salary'),
                onPressed: onCategory,
              ),
              const SizedBox(height: 8),
              MoneyCategoryCard(
                id: 2,
                title: 'Passive',
                selected: getSelected('Passive'),
                onPressed: onCategory,
              ),
              const SizedBox(height: 8),
              MoneyCategoryCard(
                id: 3,
                title: 'Investment',
                selected: getSelected('Investment'),
                onPressed: onCategory,
              ),
              const SizedBox(height: 8),
              MoneyCategoryCard(
                id: 4,
                title: 'Dividends',
                selected: getSelected('Dividends'),
                onPressed: onCategory,
              ),
              const SizedBox(height: 8),
              MoneyCategoryCard(
                id: 5,
                title: 'Business',
                selected: getSelected('Business'),
                onPressed: onCategory,
              ),
              const SizedBox(height: 8),
              MoneyCategoryCard(
                id: 6,
                title: 'Rent',
                selected: getSelected('Rent'),
                onPressed: onCategory,
              ),
            ],
            const SizedBox(height: 16),
            PrimaryButton(
              title: 'Done',
              active: active,
              onPressed: onDone,
            ),
            const SizedBox(height: 16),
            PrimaryButton(
              title: 'Delete',
              white: true,
              onPressed: onDelete,
            ),
            const SizedBox(height: 16),
          ],
        ),
        const _CLoseButton(),
        const _Top(),
      ],
    );
  }
}

class _CLoseButton extends StatelessWidget {
  const _CLoseButton();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 14,
      right: 25,
      child: CuperButton(
        onPressed: () {
          context.pop();
        },
        minSize: 20,
        child: const TextM(
          'Close',
          fontSize: 16,
          color: AppColors.main,
        ),
      ),
    );
  }
}

class _Top extends StatelessWidget {
  const _Top();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 6,
      left: 0,
      right: 0,
      child: GestureDetector(
        onTap: () {},
        child: Center(
          child: Container(
            height: 5,
            width: 36,
            decoration: BoxDecoration(
              color: AppColors.black10,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      ),
    );
  }
}

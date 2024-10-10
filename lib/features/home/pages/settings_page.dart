import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/buttons/cuper_button.dart';
import '../../../core/widgets/others/divider_widget.dart';
import '../../../core/widgets/texts/text_r.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 35 + getStatusBar(context)),
        const Center(child: TextR('Settings', fontSize: 24)),
        const SizedBox(height: 25),
        const DividerWidget(),
        const SizedBox(height: 46),
        _Button(
          id: 1,
          title: 'Share with friends',
          onPressed: () {},
        ),
        const SizedBox(height: 16),
        _Button(
          id: 2,
          title: 'Privacy Policy',
          onPressed: () {},
        ),
        const SizedBox(height: 16),
        _Button(
          id: 3,
          title: 'Support page',
          onPressed: () {},
        ),
        const SizedBox(height: 16),
        _Button(
          id: 4,
          title: 'Terms of use',
          onPressed: () {},
        ),
        const SizedBox(height: 16),
        _Button(
          id: 5,
          title: 'Subscription info',
          onPressed: () {},
        ),
      ],
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    required this.id,
    required this.title,
    required this.onPressed,
  });

  final int id;
  final String title;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      margin: const EdgeInsets.symmetric(horizontal: 32),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: CuperButton(
        onPressed: onPressed,
        child: Row(
          children: [
            SizedBox(
              width: 54,
              child: SvgPicture.asset('assets/s$id.svg'),
            ),
            TextR(
              title,
              fontSize: 16,
              color: AppColors.grey,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zker/core/utils/app_colors.dart';
import 'package:zker/feature/profile/presentation/views/widgets/riminder_dialog.dart';

class CustomSwitch<TCubit extends Cubit<TState>, TState> extends StatelessWidget {
  final String title;
  final bool Function(TState) isActiveSelector;
  final void Function(BuildContext context, bool value) onToggle;
final  Widget widget;
  const CustomSwitch({
    super.key,
    required this.title,
    required this.isActiveSelector,
    required this.onToggle, required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final cubit = context.read<TCubit>();
        showDialog(
          context: context,
          builder: (dialogContext) {
            return BlocProvider.value(
              value: cubit,
              child:  widget,
            );
          },
        );
      },
      child: BlocBuilder<TCubit, TState>(
        builder: (context, state) {
          final isActive = isActiveSelector(state);
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x40000000),
                    offset: Offset(0, 1),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Row(
                textDirection: TextDirection.rtl,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      isActive
                          ? Icons.notifications_active
                          : Icons.notifications_off_sharp,
                    ),
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const Spacer(),
                  Switch(
                    value: isActive,
                    onChanged: (v) => onToggle(context, v),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

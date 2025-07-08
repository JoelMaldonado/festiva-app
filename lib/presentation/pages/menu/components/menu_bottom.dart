import 'package:festiva/domain/enum/menu_enum.dart';
import 'package:festiva/presentation/theme/theme.dart';
import 'package:flutter/material.dart';

class MenuBottom extends StatefulWidget {
  final MenuEnum selected;
  final Function(MenuEnum) onSelected;

  const MenuBottom({
    super.key,
    required this.selected,
    required this.onSelected,
  });

  @override
  State<MenuBottom> createState() => _MenuBottomState();
}

class _MenuBottomState extends State<MenuBottom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 72,
      color: AppColors.colorB3,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: MenuEnum.values.map((item) {
          return IconButton(
            style: IconButton.styleFrom(
              foregroundColor: widget.selected == item
                  ? AppColors.colorP1
                  : AppColors.colorT3,
            ),
            onPressed: () => widget.onSelected(item),
            icon: Icon(item.icon),
          );
        }).toList(),
      ),
    );
  }
}

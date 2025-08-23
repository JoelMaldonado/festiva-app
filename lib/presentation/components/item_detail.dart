import 'package:festiva/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class ItemDetail extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final Widget? child;
  final IconData? iconAction;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  const ItemDetail({
    super.key,
    required this.icon,
    required this.title,
    this.value = "",
    this.child,
    this.iconAction,
    this.onTap,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Ink(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.colorB3,
          borderRadius: BorderRadius.circular(12),
        ),
        child: InkWell(
          onTap: onTap,
          onLongPress: onLongPress,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 4,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 8,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            icon,
                            size: 20,
                            color: AppColors.colorT1,
                          ),
                          Expanded(
                            child: Text(
                              title,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w900,
                                color: AppColors.colorT1,
                              ),
                            ),
                          ),
                        ],
                      ),
                      child != null
                          ? child!
                          : Text(
                              value,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColors.colorT2,
                              ),
                              maxLines: 1,
                            ),
                    ],
                  ),
                ),
                if (iconAction != null) Icon(iconAction),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

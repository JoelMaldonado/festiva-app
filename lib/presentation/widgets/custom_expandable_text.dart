import 'package:festiva/presentation/theme/theme.dart';
import 'package:flutter/material.dart';

class CustomExpandableText extends StatefulWidget {
  final String text;
  final int maxLines;
  final Duration animationDuration;

  const CustomExpandableText({
    super.key,
    required this.text,
    this.maxLines = 5,
    this.animationDuration = const Duration(milliseconds: 200),
  });

  @override
  State<CustomExpandableText> createState() => _CustomExpandableTextState();
}

class _CustomExpandableTextState extends State<CustomExpandableText>
    with SingleTickerProviderStateMixin {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final span = TextSpan(text: widget.text);
        final tp = TextPainter(
          text: span,
          maxLines: widget.maxLines,
          textDirection: TextDirection.ltr,
        )..layout(maxWidth: constraints.maxWidth);

        final isOverflowing = tp.didExceedMaxLines;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedSize(
              duration: widget.animationDuration,
              curve: Curves.easeInOut,
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                constraints: const BoxConstraints(),
                child: Text(
                  widget.text,
                  style: TextStyle(fontSize: 14, color: AppColors.colorT2),
                  softWrap: true,
                  overflow:
                      expanded ? TextOverflow.visible : TextOverflow.ellipsis,
                  maxLines: expanded ? null : widget.maxLines,
                ),
              ),
            ),
            if (isOverflowing)
              GestureDetector(
                onTap: () => setState(() => expanded = !expanded),
                child: Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    expanded ? "Show less" : "Show more",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}

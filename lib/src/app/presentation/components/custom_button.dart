import 'package:eshop/src/app/presentation/theme/color_theme.dart';
import 'package:eshop/src/app/presentation/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final Function()? onPressed;
  final String text;
  final double? width;
  final double radius;
  final bool smallText;
  final bool showLoadingIndicator;
  final Widget? icon;
  final String fontFamily;
  final bool showLoading;
  final bool changeColor;
  final bool negativeColor;
  final Widget? icon2;
  final bool isOutlineButton;
  final double? fontSize;
  final double? height;

  const CustomButton(
      {super.key,
      required this.onPressed,
      required this.text,
      this.width,
      this.icon,
      this.radius = 0,
      this.smallText = false,
      this.showLoadingIndicator = false,
      this.fontFamily = "",
      this.showLoading = false,
      this.negativeColor = false,
      this.icon2,
      this.isOutlineButton = false,
      this.changeColor = false,
      this.fontSize,
      this.height});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    final onPressed = widget.onPressed != null
        ? (widget.showLoadingIndicator
            ? () async {
                if (loading) {
                  return;
                }
                setState(() => loading = true);
                try {
                  if (widget.onPressed != null) {
                    await widget.onPressed!();
                  }
                } finally {
                  if (mounted) {
                    setState(() => loading = false);
                  }
                }
              }
            : () {
                if (widget.onPressed != null) {
                  widget.onPressed!();
                }
              })
        : null;
    return widget.isOutlineButton == true
        ? OutlinedButton(
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: kPrimaryColor),
            ),
            onPressed: onPressed,
            child: loading
                ? const Center(
                    child: SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.white,
                        ),
                      ),
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (widget.showLoading) ...[
                        const Center(
                          child: SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.white,
                              ),
                            ),
                          ),
                        )
                      ] else ...[
                        if (widget.icon != null)
                          Padding(
                            padding: const EdgeInsets.only(right: kPadding / 2),
                            child: widget.icon!,
                          ),
                        Text(widget.text,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 15,
                                color: kPrimaryColor)),
                        if (widget.icon2 != null)
                          Padding(
                            padding: const EdgeInsets.only(left: kPadding),
                            child: widget.icon2!,
                          ),
                      ],
                    ],
                  ),
          )
        : SizedBox(
            width: widget.width,
            height: widget.height,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                backgroundColor:
                    widget.negativeColor ? kGreyButtonColor : kPrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(kRadius * 2.5),
                ),
              ),
              onPressed: onPressed,
              child: loading
                  ? const Center(
                      child: SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.white,
                          ),
                        ),
                      ),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (widget.showLoading) ...[
                          const Center(
                            child: SizedBox(
                              width: 16,
                              height: 16,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.white,
                                ),
                              ),
                            ),
                          )
                        ] else ...[
                          if (widget.icon != null)
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: kPadding / 2),
                              child: widget.icon!,
                            ),
                          Expanded(
                            child: Center(
                              child: Text(widget.text,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15,
                                      color: kWhiteColor)),
                            ),
                          ),
                          if (widget.icon2 != null)
                            Padding(
                              padding: const EdgeInsets.only(left: kPadding),
                              child: widget.icon2!,
                            ),
                        ],
                      ],
                    ),
            ),
          );
  }
}

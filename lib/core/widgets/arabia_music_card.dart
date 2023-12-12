import 'package:arabiamusic_app/core/constant/colors.dart';
import 'package:arabiamusic_app/core/widgets/arabia_music_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArabiaMusicCard extends StatefulWidget {
  const ArabiaMusicCard({
    required this.imagePath,
    super.key,
    this.title,
    this.body,
    this.subtitle,
    this.buttonTitle,
    this.onButtonPressed,
    this.onCardPressed,
  });

  final String imagePath;
  final String? title;
  final Widget? body;
  final String? subtitle;
  final String? buttonTitle;
  final VoidCallback? onCardPressed;
  final VoidCallback? onButtonPressed;

  @override
  _ArabiaMusicCardState createState() => _ArabiaMusicCardState();
}

class _ArabiaMusicCardState extends State<ArabiaMusicCard> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onCardPressed,
      onTapDown: (_) =>
          setState(() => isPressed = widget.onCardPressed != null),
      onTapCancel: () => setState(() => isPressed = false),
      onTapUp: (_) => setState(() => isPressed = false),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          color: AppColors.grey[600],
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          boxShadow: [
            BoxShadow(
              color: AppColors.black[600]!.withOpacity(isPressed ? 0.25 : 0.10),
              spreadRadius: isPressed ? 7 : 4,
              blurRadius: isPressed ? 10 : 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Stack(
          children: [
            Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Image.asset(
                      widget.imagePath,
                      height: 150,
                      color: AppColors.pink[500],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  if (widget.body == null)
                    Text(
                      widget.title!,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    )
                  else
                    widget.body!,
                  if (widget.subtitle != null)
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        widget.subtitle!,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  if (widget.onButtonPressed != null &&
                      widget.buttonTitle != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: ArabiaMusicButton(
                        onPressed: widget.onButtonPressed!,
                        label: widget.buttonTitle!,
                      ),
                    ),
                ],
              ),
            ),
            if (widget.onCardPressed != null)
              const Positioned.fill(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Icon(CupertinoIcons.chevron_forward),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

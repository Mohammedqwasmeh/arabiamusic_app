import 'package:arabiamusic_app/core/constant/colors.dart';
import 'package:flutter/material.dart';

class ArabiaMusicButton extends StatefulWidget {
  const ArabiaMusicButton({
    required this.onPressed,
    required this.label,
    super.key,
    this.isLoading = false,
  });

  final VoidCallback onPressed;
  final String label;
  final bool isLoading;

  @override
  State<ArabiaMusicButton> createState() => ArabiaMusicButtonState();
}

class ArabiaMusicButtonState extends State<ArabiaMusicButton> {

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.isLoading ? () {} : widget.onPressed,
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(11),
        ),
        minimumSize: const Size.fromHeight(40),
        padding: const EdgeInsets.all(12),
        elevation: 0,
        backgroundColor: AppColors.grey[800]
      ),
      child: widget.isLoading
          ? const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 3,
              ),
            )
          : Text(
              widget.label,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 13,
                color: Colors.white,
              ),
            ),
    );
  }
}

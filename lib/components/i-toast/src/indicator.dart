import 'package:flutter/material.dart';

///
/// @author xbwca
/// @description: 各种小框框
/// @date :2022/3/3 16:02
///
class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator(this.message, {super.key});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      constraints: const BoxConstraints(
        minWidth: 80,
        minHeight: 80,
      ),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 104, 104, 104),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: 35,
            height: 35,
            child: CircularProgressIndicator(
              color: Colors.white,
              strokeWidth: 4,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            message,
            style: const TextStyle(color: Colors.white),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class TextIndicator extends StatelessWidget {
  const TextIndicator(this.message, {super.key});

  final String? message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.8),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Text(
        message ?? "",
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}

class IconIndicator extends StatelessWidget {
  const IconIndicator({super.key, 
    required this.message,
    required this.icon,
  });

  final String message;

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      constraints: const BoxConstraints(
        minWidth: 120,
        minHeight: 120,
      ),
      decoration: const BoxDecoration(
        color: Color(0xFF4C4C4C),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 60,
            color: Colors.white,
          ),
          Text(
            message,
            style: const TextStyle(color: Colors.white),
            maxLines: 10,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

import 'package:new_approach/logic/index.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:flutter/material.dart';

class Notification {
  static void showError(e) => showSimpleNotification(
        Text(e.toString()),
        background: Colors.redAccent,
        foreground: Colors.white,
        duration: const Duration(seconds: 3),
      );

  static void showNotification(String message) => showSimpleNotification(
        Text(message),
        background: Colors.blueAccent,
        foreground: Colors.white,
        duration: const Duration(seconds: 3),
      );

  static void showAction(String message, VoidCallback onTap) =>
      showOverlayNotification(
        (context) => Material(
          color: Colors.orange,
          child: SafeArea(
            top: false,
            left: false,
            right: false,
            child: ListTileTheme(
              textColor: Colors.black,
              iconColor: Colors.black,
              child: ListTile(
                title: Text(message),
                onTap: onTap,
              ),
            ),
          ),
        ),
        position: NotificationPosition.bottom,
        duration: const Duration(seconds: 5),
      );
}

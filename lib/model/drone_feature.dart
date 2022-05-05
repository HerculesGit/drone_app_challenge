import 'package:flutter/material.dart';

class DroneFeature {
  final IconData icon;
  final String title;
  final String subtitle;

  DroneFeature(
      {required this.icon, required this.title, required this.subtitle});
}

final droneFeaturesMock = [
  DroneFeature(
      icon: Icons.cloud,
      title: "Sync with Multiple Device",
      subtitle: "Login to sync your drones"),
  DroneFeature(
      icon: Icons.videogame_asset,
      title: "Dedicated Controller",
      subtitle: "Use your smartphone as a controller"),
  DroneFeature(
      icon: Icons.description,
      title: "Automation",
      subtitle: "Create new scenario or automatic task"),
];

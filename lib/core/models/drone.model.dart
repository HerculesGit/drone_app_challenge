import '../paths.dart';

class DroneModel {
  final String name;
  final String desc;
  final String imageUrl;
  final double starts;

  final Specification specification;

  final BatteryLifeCycle? batteryLifeCycle;

  DroneModel({
    required this.name,
    required this.desc,
    required this.imageUrl,
    this.batteryLifeCycle,
    required this.starts,
    required this.specification,
  });

  get containsBattery => batteryLifeCycle != null;
}

class Specification {
  final String videoQuality;
  final String transmission;
  final String flightTime;
  final String hyperlapse;

  Specification(
      {required this.videoQuality,
      required this.transmission,
      required this.flightTime,
      required this.hyperlapse});
}

class BatteryLifeCycle {
  final int chargePercentage;

// another properties that the possible class contains...

  BatteryLifeCycle({required this.chargePercentage});
}

final droneModelsMock = [
  DroneModel(
      name: "Safety Drone",
      desc: "Wireless Control Done",
      imageUrl: "$kAssetsImages/drone_wbg_1.png",
      starts: 4.5,
      batteryLifeCycle: BatteryLifeCycle(chargePercentage: 30),
      specification: Specification(
          videoQuality: "4K/ 30FPS",
          transmission: "7 Kilometers",
          flightTime: "30 minutes",
          hyperlapse: "4K Video")),
  DroneModel(
      name: "Safety Drone",
      desc: "Wireless Control Done",
      imageUrl: "$kAssetsImages/drone_wbg_1.png",
      starts: 4.5,
      batteryLifeCycle: BatteryLifeCycle(chargePercentage: 30),
      specification: Specification(
          videoQuality: "4K/ 30FPS",
          transmission: "7 Kilometers",
          flightTime: "30 minutes",
          hyperlapse: "4K Video")),
  DroneModel(
      name: "Safety Drone",
      desc: "Wireless Control Done",
      imageUrl: "$kAssetsImages/drone_wbg_1.png",
      starts: 4.5,
      batteryLifeCycle: BatteryLifeCycle(chargePercentage: 30),
      specification: Specification(
          videoQuality: "4K/ 30FPS",
          transmission: "7 Kilometers",
          flightTime: "30 minutes",
          hyperlapse: "4K Video")),
  DroneModel(
      name: "Safety Drone",
      desc: "Wireless Control Done",
      imageUrl: "$kAssetsImages/drone_wbg_1.png",
      starts: 4.5,
      specification: Specification(
          videoQuality: "4K/ 30FPS",
          transmission: "7 Kilometers",
          flightTime: "30 minutes",
          hyperlapse: "4K Video")),
];

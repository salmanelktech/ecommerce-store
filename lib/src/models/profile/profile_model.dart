import 'package:flutter/material.dart';

class ProfileModel {
  final IconData icon;
  final String title;

  const ProfileModel({
    required this.icon,
    required this.title,
  });
}

final List<ProfileModel> profileItems = [
  const ProfileModel(icon: Icons.dashboard, title: "Accessiblity"),
  const ProfileModel(icon: Icons.book, title: "Profile"),
  const ProfileModel(icon: Icons.public, title: "Grades"),
  const ProfileModel(icon: Icons.spatial_audio_off_rounded, title: "Calendar"),
  const ProfileModel(icon: Icons.email, title: "Private files"),
  const ProfileModel(icon: Icons.email, title: "Reports"),
  const ProfileModel(icon: Icons.email, title: "Preferences"),
];

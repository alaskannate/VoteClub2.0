import 'package:flutter/material.dart';

class User {
  int? id;
  String name;
  String email;
  String passwordHash;
  DateTime? createdAt;
  DateTime? updatedAt;


 
  User({this.id, required this.name, required this.email, required this.passwordHash, this.createdAt,  this.updatedAt});

  // bool authenticate(String password) {
  //   // Implement password verification logic
  //   // Return true if password matches, false otherwise
  // }

  // void vote(Proposal proposal, VoteType voteType) {
  //   // Implement voting logic
  //   // Record the user's vote on the given proposal
  // }

  // List<Vote> getVotingHistory() {
  //   // Return a list of votes cast by the user
  //   // This will require a database or data structure to track votes
  // }

  // void updateProfile(String newEmail, String newUsername) {
  //   // Update the user's email and/or username
  //   // Ensure to validate and save the changes
  // }

  // void changePassword(String oldPassword, String newPassword) {
  //   // Change the user's password after verifying the old password
  //   // Ensure to hash the new password before saving
  // }
}

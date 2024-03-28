import 'package:flutter/cupertino.dart';

class RegistrationData extends ChangeNotifier {
   String? name;
   String? email;
   String? password;
  // String? phone;
   String? gender;
   String? fitnessLevel;
   String? goal;
   String? experience;
   String? motivationLevel;
   String? accessToEquipment;
   String? trainingEnvironment;
   String? preferredExerciseTypes;
   String? workoutFrequencyPreference;
   String? workoutDurationPreference;
   int? weight;
   int? height;
   int? age;
   int? bodyFatPercentage;
   int? muscleMass;
   int? stressLevels;

  void updateName(String value) {
    name = value;
    notifyListeners();
  }

  void updateEmail(String value) {
    email = value;
    notifyListeners();
  }

  void updatePassword(String value) {
    password = value;
    notifyListeners();
  }

  // void updatePhone(String value) {
  //   phone = value;
  //   notifyListeners();
  // }

  void updateGender(String value) {
    gender = value;
    notifyListeners();
  }

  void updateFitnessLevel(String value) {
    fitnessLevel = value;
    notifyListeners();
  }

  void updateGoal(String value) {
    goal = value;
    notifyListeners();
  }

  void updateExperience(String value) {
    experience = value;
    notifyListeners();
  }

  void updateMotivationLevel(String value) {
    motivationLevel = value;
    notifyListeners();
  }

  void updateAccessToEquipment(String value) {
    accessToEquipment = value;
    notifyListeners();
  }

  void updateTrainingEnvironment(String value) {
    trainingEnvironment = value;
    notifyListeners();
  }

  void updatePreferredExerciseTypes(String value) {
    preferredExerciseTypes = value;
    notifyListeners();
  }

  void updateWorkoutFrequencyPreference(String value) {
    workoutFrequencyPreference = value;
    notifyListeners();
  }

  void updateWorkoutDurationPreference(String value) {
    workoutDurationPreference = value;
    notifyListeners();
  }

  void updateWeight(int value) {
    weight = value;
    notifyListeners();
  }

  void updateHeight(int value) {
    height = value;
    notifyListeners();
  }

  void updateAge(int value) {
    age = value;
    notifyListeners();
  }

  void updateBodyFatPercentage(int value) {
    bodyFatPercentage = value;
    notifyListeners();
  }

  void updateMuscleMass(int value) {
    muscleMass = value;
    notifyListeners();
  }

  void updateStressLevels(int value) {
    stressLevels = value;
    notifyListeners();
  }
}

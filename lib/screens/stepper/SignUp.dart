class SignUp {
  String? name;
  String? email;
  Authentication? authentication;
  String? gender;
  int? age;
  int? weight;
  int? height;
  String? goal;
  String? experience;
  int? bodyFatPercentage;
  int? muscleMass;
  String? workoutDurationPreference;
  String? workoutFrequencyPreference;
  String? preferredExerciseTypes;
  String? trainingEnvironmentPreference;
  String? accessToEquipment;
  String? motivationLevel;
  int? stressLevels;

  SignUp(
      {this.name,
        this.email,
        this.authentication,
        this.gender,
        this.age,
        this.weight,
        this.height,
        this.goal,
        this.experience,
        this.bodyFatPercentage,
        this.muscleMass,
        this.workoutDurationPreference,
        this.workoutFrequencyPreference,
        this.preferredExerciseTypes,
        this.trainingEnvironmentPreference,
        this.accessToEquipment,
        this.motivationLevel,
        this.stressLevels
      }
      );

  SignUp.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    authentication = json['authentication'] != null
        ? new Authentication.fromJson(json['authentication'])
        : null;
    gender = json['gender'];
    age = json['age'];
    weight = json['weight'];
    height = json['height'];
    goal = json['goal'];
    experience = json['experience'];
    bodyFatPercentage = json['bodyFatPercentage'];
    muscleMass = json['muscleMass'];
    workoutDurationPreference = json['workoutDurationPreference'];
    workoutFrequencyPreference = json['workoutFrequencyPreference'];
    preferredExerciseTypes = json['preferredExerciseTypes'];
    trainingEnvironmentPreference = json['trainingEnvironmentPreference'];
    accessToEquipment = json['accessToEquipment'];
    motivationLevel = json['motivationLevel'];
    stressLevels = json['stressLevels'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;

    if (this.authentication != null) {
      data['authentication'] = this.authentication!.toJson();
    }
    data['gender'] = this.gender;
    data['age'] = this.age;
    data['weight'] = this.weight;
    data['height'] = this.height;
    data['goal'] = this.goal;
    data['experience'] = this.experience;
    data['bodyFatPercentage'] = this.bodyFatPercentage;
    data['muscleMass'] = this.muscleMass;
    data['workoutDurationPreference'] = this.workoutDurationPreference;
    data['workoutFrequencyPreference'] = this.workoutFrequencyPreference;
    data['preferredExerciseTypes'] = this.preferredExerciseTypes;
    data['trainingEnvironmentPreference'] = this.trainingEnvironmentPreference;
    data['accessToEquipment'] = this.accessToEquipment;
    data['motivationLevel'] = this.motivationLevel;
    data['stressLevels'] = this.stressLevels;
    return data;
  }
}

class Authentication {
  String? password;

  Authentication({this.password});

  Authentication.fromJson(Map<String, dynamic> json) {
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['password'] = this.password;
    return data;
  }
}
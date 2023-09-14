class PersonalDetails {
  final String fullName;
  final String slackName;
  final String githubHandle;
  final String bio;

  PersonalDetails({
    required this.fullName,
    required this.slackName,
    required this.githubHandle,
    required this.bio,
  });

  PersonalDetails copyWith({
    String? fullName,
    String? slackName,
    String? githubHandle,
    String? bio,
  }) {
    return PersonalDetails(
      fullName: fullName ?? this.fullName,
      slackName: slackName ?? this.slackName,
      githubHandle: githubHandle ?? this.githubHandle,
      bio: bio ?? this.bio,
    );
  }

  @override
  String toString() {
    return "PersonDetails instance : $fullName,$slackName,$githubHandle,$bio";
  }
}
//
//
//
//
//
//
//
//
//
//
//
///2nd Implementation - not using copyWith method - work with 2nd implm. - homepage.dart
///
// class PersonalDetails {
//   final String? fullName;
//   final String? slackName;
//   final String? githubHandle;
//   final String? bio;

//   PersonalDetails({
//     this.fullName,
//     this.slackName,
//     this.githubHandle,
//     this.bio,
//   });

//   @override
//   String toString() {
//     return "PersonDetails instance : $fullName,$slackName,$githubHandle,$bio";
//   }
// }

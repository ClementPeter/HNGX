class PersonalDetails {
  final String? fullName;
  final String? slackName;
  final String? githubHandle;
  final String? bio;

  // PersonalDetails(this.fullName, this.slackName, this.githubHandle, this.bio);

  // PersonalDetails({
  //   this.fullName : 'D-Peter',
  //   this.slackName = 'Dcarlos_dev',
  //   this.githubHandle = 'D-https://github.com/ClementPeter',
  //   this.bio =
  //       'D-A goal driven developer keen on learning and building usable product',
  // });

  PersonalDetails({
    this.fullName = 'Clement Peter',
    this.slackName = 'carlos_dev',
    this.githubHandle = 'https://github.com/ClementPeter',
    this.bio =
        'A goal driven developer keen on learning and building usable product',
  });

  // PersonalDetails.copyWith(
  //     this.fullName, this.slackName, this.githubHandle, this.bio);

  @override
  String toString() {
    return "PersonDetails instance : $fullName,$slackName,$githubHandle,$bio";
  }
}

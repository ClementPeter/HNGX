import 'package:flutter/material.dart';

//This works fine with both 1st and 2nd implementation of homepage and personal_details_model.dartsss
class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _ModifyProfileState();
}

class _ModifyProfileState extends State<EditProfile> {
  //dispose text controllers
  @override
  void dispose() {
    // TODO: implement dispose
    fullNameController.dispose();
    slackDisplayNameController.dispose();
    gitHubHandleController.dispose();
    bioController.dispose();
    super.dispose();
  }

  //
  final fullNameController = TextEditingController(text: 'Peter Clement');
  //
  final slackDisplayNameController = TextEditingController(text: 'carlos_dev');
  //
  final gitHubHandleController =
      TextEditingController(text: 'https://github.com/ClementPeter');
  //
  final bioController = TextEditingController(
      text:
          'A goal driven developer keen on learning and building usable products');

  //save user details, pass data and navigate back to homepage
  saveCVDetails() {
    Navigator.pop(context, [
      fullNameController.text,
      slackDisplayNameController.text,
      gitHubHandleController.text,
      bioController.text,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Edit CV'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          children: [
            TextField(
              controller: fullNameController,
              decoration: const InputDecoration(
                label: Text('Full Name'),
              ),
            ),
            TextField(
              controller: slackDisplayNameController,
              decoration: const InputDecoration(
                label: Text('Slack username Name'),
              ),
            ),
            TextField(
              controller: gitHubHandleController,
              decoration: const InputDecoration(
                label: Text('Github handle'),
              ),
            ),
            TextField(
              controller: bioController,
              decoration: const InputDecoration(
                label: Text('Full Name'),
              ),
            ),
            const SizedBox(height: 30),
            Container(
              height: 70,
              width: MediaQuery.of(context).size.width * 50,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Material(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
                child: InkWell(
                  onTap: () {
                    print('::modify screen -> save CV details::');
                    saveCVDetails();
                  },
                  borderRadius: BorderRadius.circular(10),
                  child: const Center(
                    child: Text(
                      'Save',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

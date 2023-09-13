import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_2/model/personal_details_model.dart';
import 'package:task_2/modify_profile.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //
  PersonalDetails personalDetails = PersonalDetails();
  //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
              onTap: () async {
                //result returns void here- which makes it useless
                // since the 'result' cant be used...reason :<void>
                // final result = Navigator.push<void>(
                //   context,
                //   MaterialPageRoute<void>(
                //     builder: (BuildContext context) => const ModifyProfile(),
                //   ),
                // );

                //result returns dynamic here
                final result = await Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const ModifyProfile(),
                  ),
                );

                print('::RESULT from modify ui::');
                print('::$result::');

                if (result != null) {
                  setState(() {
                    PersonalDetails personalDetails = PersonalDetails(
                      fullName: result[0],
                      slackName: result[1],
                      githubHandle: result[2],
                      bio: result[3],
                    );
                    //personalDetailsOriginal.copyWith();

                    // print('::personalDetailsOriginal::');
                    // //print(personalDetailsOriginal.toString());
                    // print('::personalDetailsModified::');
                    // print(personalDetails.toString());

                    //update the original details
                    //personalDetailsOriginal = personalDetailsModified;
                    personalDetails = personalDetails;
                  });
                  return;
                }
              },
              child: const Row(
                children: [
                  Text(
                    'Edit CV',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 10),
                  Icon(Icons.receipt),
                ],
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 225, 225, 225),
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(color: Color(0xFF7DB5E0)),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                //FullName section
                const Text(
                  'Full Name',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  personalDetails.fullName!,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 20),
                //slack username section
                const Text(
                  'slack username',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  personalDetails.slackName!,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 20),
                //GitHub handle section
                const Text(
                  'Github handle',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  personalDetails.githubHandle!,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 20),
                //Brief Bio section
                const Text(
                  'Brief Bio',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  personalDetails.bio!,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_2/model/personal_details_model.dart';
import 'package:task_2/edit_profile.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //Pre - populate the UI with user info
  PersonalDetails personalDetails = PersonalDetails(
    fullName: 'Clement Peter',
    slackName: 'carlos_dev',
    githubHandle: 'https://github.com/ClementPeter',
    bio: 'A goal driven developer keen on learning and building usable product',
  );

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
                //result returns dynamic here - which is usable
                final List result = await Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const EditProfile(),
                  ),
                );

                print('::RESULT from modify ui::');
                print('::$result::');

                setState(() {
                  PersonalDetails personalDetailsUpdated =
                      personalDetails.copyWith(
                    fullName: result.elementAt(0),
                    slackName: result.elementAt(1),
                    githubHandle: result.elementAt(2),
                    bio: result.elementAt(3),
                  );
                  personalDetails = personalDetailsUpdated;
                });
                //return;
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
                  personalDetails.fullName,
                  style: const TextStyle(fontSize: 18),
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
                  personalDetails.slackName,
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
                  personalDetails.githubHandle,
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
                  personalDetails.bio,
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
///
///
///2nd Implementation -works swith 2nd implm. - personal_details_model.dart
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:task_2/model/personal_details_model.dart';
// import 'package:task_2/edit_profile.dart';

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   //Pre - populate the UI with user info
//   PersonalDetails personalDetails = PersonalDetails(
//     fullName: 'Clement Peter',
//     slackName: 'carlos_dev',
//     githubHandle: 'https://github.com/ClementPeter',
//     bio: 'A goal driven developer keen on learning and building usable product',
//   );

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(right: 20),
//             child: InkWell(
//               onTap: () async {
//                 //result returns void here- which makes it useless
//                 // since the 'result' cant be used...reason :<void>
//                 // final result = Navigator.push<void>(
//                 //   context,
//                 //   MaterialPageRoute<void>(
//                 //     builder: (BuildContext context) => const EditProfile(),
//                 //   ),
//                 // );

//                 //result returns dynamic here - which is usable
//                 final List result = await Navigator.push(
//                   context,
//                   CupertinoPageRoute(
//                     builder: (context) => const EditProfile(),
//                   ),
//                 );

//                 print('::RESULT from edit ui::');
//                 print('::$result::');

//                 setState(() {
//                   PersonalDetails personalDetailsUpdated = PersonalDetails(
//                     fullName: result[0],
//                     slackName: result[1],
//                     githubHandle: result[2],
//                     bio: result[3],
//                   );

//                   print('::personalDetails::');
//                   print(personalDetails.toString());
//                   print('::personalDetailsUpdated::');
//                   print(personalDetailsUpdated.toString());

//                   //update the original details
//                   personalDetails = personalDetailsUpdated;
//                 });
//                 return;
//               },
//               child: const Row(
//                 children: [
//                   Text(
//                     'Edit CV',
//                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(width: 10),
//                   Icon(Icons.receipt),
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Container(
//           width: double.infinity,
//           height: double.infinity,
//           decoration: BoxDecoration(
//             color: const Color.fromARGB(255, 225, 225, 225),
//             borderRadius: BorderRadius.circular(12),
//             boxShadow: const [
//               BoxShadow(color: Color(0xFF7DB5E0)),
//             ],
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(height: 10),
//                 //FullName section
//                 const Text(
//                   'Full Name',
//                   style: TextStyle(
//                     fontSize: 22,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 5),
//                 Text(
//                   personalDetails.fullName!,
//                   style: const TextStyle(fontSize: 18),
//                 ),
//                 const SizedBox(height: 20),
//                 //slack username section
//                 const Text(
//                   'slack username',
//                   style: TextStyle(
//                     fontSize: 22,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Text(
//                   personalDetails.slackName!,
//                   style: const TextStyle(
//                     fontSize: 18,
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 //GitHub handle section
//                 const Text(
//                   'Github handle',
//                   style: TextStyle(
//                     fontSize: 22,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Text(
//                   personalDetails.githubHandle!,
//                   style: const TextStyle(
//                     fontSize: 18,
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 //Brief Bio section
//                 const Text(
//                   'Brief Bio',
//                   style: TextStyle(
//                     fontSize: 22,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Text(
//                   personalDetails.bio!,
//                   style: const TextStyle(
//                     fontSize: 18,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

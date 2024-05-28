

import 'package:flutter/material.dart';

SizedBox kSizedBox() => SizedBox(
      height: 10,
    );
SizedBox MSizedBox() => SizedBox(
      height: 15,
    );
SizedBox LSizedBox() => SizedBox(
      height: 20,
    );
SizedBox LLSizedBox() => SizedBox(
      height: 25,
    );

SizedBox sSizedBox() => SizedBox(
      height: 5,
    );
SizedBox minWidthSpan() => const SizedBox(
      width: 5,
    );
SizedBox maxWidthSpan() => const SizedBox(
      width: 10,
    );
SizedBox largeWidthSpan() => const SizedBox(
      width: 20,
    );

EdgeInsets kStandardPadding() =>
    const EdgeInsets.symmetric(horizontal: 25, vertical: 10);

EdgeInsets kSignInStandardPadding() =>
    const EdgeInsets.symmetric(horizontal: 40, vertical: 10);

EdgeInsets kPadding() => const EdgeInsets.all(10);
EdgeInsets kVerticalPadding() => const EdgeInsets.symmetric(vertical: 10);
EdgeInsets kHorizontalPadding() => const EdgeInsets.symmetric(horizontal: 10);

// showDeleteConfirmationDialog(BuildContext context) async {
//   return showDialog(
//     context: context,
//     builder: (context) {
//       return AlertDialog(
//         surfaceTintColor: Color(0xFF0000001F),
//         shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(15.0),
//                 bottomRight: Radius.circular(15.0),
//                 topLeft: Radius.circular(5.0),
//                 topRight: Radius.circular(5.0))),
//         title: Text(
//           DeleteDialogTitleText,
//           style: DeleteDialogTitleTextStyle,
//         ),
//         content: Text(
//           DeleteDialogContentText,
//           style: DeleteDialogContentTextStyle,
//         ),
//         actions: [
//           ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Color(0xFF2443AC),
//               ),
//               onPressed: () {
//                 AutoRouter.of(context).pop();
//               },
//               child: Text(DeleteDialogElevatedButtonText,
//                   style: DeleteDialogElevatedButtonTextStyle)),
//         ],
//       );
//     },
//   );
// }

showLogoutConfirmationDialog(BuildContext context) async {
  return showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              // shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.all(Radius.circular(10.0))),
              // insetPadding: EdgeInsets.zero,
              title: Text('Log Out!', style: kBoldTextStyle()),
              content: const Text('Are you sure you want to logout?'),

              actions: <Widget>[
                TextButton(
                  child: Text(
                    "Cancel",
                    style: kTextStyle().copyWith(color: Colors.grey),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                TextButton(
                    child: Text(
                      'Log Out',
                      style: kTextStyle().copyWith(color: primaryColor),
                    ),
                    onPressed: () async {
                      // LocalStorageService().clear(LocalStorageKeys.accessToken);
                      // LocalStorageService()
                      //     .clear(LocalStorageKeys.registerToken);
                      // LocalStorageService().clear(LocalStorageKeys.googleToken);
                      // Navigator.pop(context);
                      // Navigator.pushNamedAndRemoveUntil(
                      //     context, LoginScreen.id, (route) => false);
                      // isLoggedIn = false;
                    }),
              ],
            );
          },
        );
      });
}

Future<bool> showAppExitConfirmationDialog(BuildContext context) async {
  bool exitApp = await showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              // shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.all(Radius.circular(10.0))),
              // insetPadding: EdgeInsets.zero,
              title: Text('Exit App!', style: kBoldTextStyle()),
              content: const Text('Are you sure you want to Exit App?'),

              actions: <Widget>[
                TextButton(
                  child: Text(
                    "Cancel",
                    style: kTextStyle().copyWith(color: Colors.grey),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                ),
                TextButton(
                    child: Text(
                      'Exit',
                      style: kTextStyle().copyWith(color: primaryColor),
                    ),
                    onPressed: () async {
                      Navigator.of(context).pop(true);
                    }),
              ],
            );
          },
        );
      });
  return exitApp ?? false;
}

showListDialog(BuildContext context) async {
  return showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              height: 200,
              width: double.infinity,
            );
          },
        );
      });
}

Future<T?> showTopModalSheet<T>(BuildContext context, Widget child,
    {bool barrierDismissible = true}) {
  return showGeneralDialog<T?>(
    context: context,
    barrierDismissible: barrierDismissible,
    transitionDuration: const Duration(milliseconds: 250),
    barrierLabel: MaterialLocalizations.of(context).dialogLabel,
    barrierColor: Colors.black.withOpacity(0.5),
    pageBuilder: (context, _, __) => child,
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        child: Column(
          children: [
            Material(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [child],
              ),
            )
          ],
        ),
        position: CurvedAnimation(parent: animation, curve: Curves.easeOutCubic)
            .drive(
                Tween<Offset>(begin: const Offset(0, -1.0), end: Offset.zero)),
      );
    },
  );
}

String formatNumber(int number) {
  return number.toString().replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
        (Match match) => '${match[1]},',
      );
}

// AppBar defaultAppBar(String title) {
//   return AppBar(
//     // leading: InkWell(onTap: navigatorKey.currentState!.pop, child: backArrow()),
//     elevation: 0,
//     centerTitle: true,
//     title: Text(
//       title,
//       style: kkWhiteBoldTextStyle(),
//     ),
//     backgroundColor: primaryColor,
//   );
// }

Icon backArrow() => const Icon(
      Icons.arrow_back_ios,
      color: Colors.white,
      size: 20,
    );
TextStyle kTextStyle() => TextStyle(
      fontFamily: 'Poppins',
      fontSize: 14,
      color: Colors.black,
      fontWeight: FontWeight.w400,
    );

TextStyle kkTextStyle() => TextStyle(
      // color: Colors.grey[800],
      color: Colors.black,
      fontFamily: 'Poppins',
      fontSize: 16,
    );

TextStyle kUnderline() => TextStyle(
      color: Colors.grey[800],
      fontFamily: 'Poppins',
      decoration: TextDecoration.lineThrough,
      fontSize: 11,
    );

TextStyle sTextStyle() => TextStyle(
      color: Colors.grey[800],
      fontFamily: 'Poppins',
      fontSize: 10,
    );

TextStyle kBoldTextStyle() => TextStyle(
      color: const Color.fromARGB(255, 0, 0, 0),
      fontFamily: 'Poppins',
      fontSize: 14,
      fontWeight: FontWeight.w600,
    );

TextStyle kWhiteBoldTextStyle() => TextStyle(
      color: Colors.white,
      fontFamily: 'Poppins',
      fontSize: 15,
      fontWeight: FontWeight.w600,
    );

TextStyle kkWhiteTextStyle() => TextStyle(
      color: Colors.white,
      fontFamily: 'Poppins',
      fontSize: 12,
      fontWeight: FontWeight.w400,
    );

TextStyle kkBoldTextStyle() => TextStyle(
      color: const Color.fromARGB(255, 0, 0, 0),
      fontFamily: 'Poppins',
      fontSize: 16,
      fontWeight: FontWeight.w700,
    );

TextStyle kkWhiteBoldTextStyle() => TextStyle(
      color: Colors.white,
      fontFamily: 'Poppins',
      fontSize: 18,
      fontWeight: FontWeight.w600,
    );

TextStyle tabsTextStyle() => TextStyle(
      color: Colors.white,
      fontFamily: 'Poppins',
      fontSize: 15,
      fontWeight: FontWeight.w500,
    );

TextStyle sBoldTextStyle() => TextStyle(
      // color: Colors.white,
      fontFamily: 'Poppins',
      fontSize: 12,
      fontWeight: FontWeight.bold,
    );

// <<<<<<< feature/Inventory_Extended

// Color primaryColor = Color(0xFF2443AC).withOpacity(0.96);
// Color secondaryColor = Color(0xFF855CF8);
// =======
Color primaryColor = Color(0xFF2443AC).withOpacity(0.96);
Color secondaryColor = Color(0xFF4D4DFF).withOpacity(0.96);
// >>>>>>> dev
Color cursorColor = Color(0xff4DA64D);
Color blueColor = Color(0xff1A469D);
Color darkGrey = Color.fromARGB(255, 14, 14, 15);
// Color yellowColor = Color(0xffFFCF01);
Color errorColor = Colors.red;
Color whiteColor = Colors.white;
Color lightPurple = Color(0xFF8080FF);
// <<<<<<< feature/Inventory_Extended
// =======
// Color creamColor = Color(0xFFCCE6CC);
// >>>>>>> dev
// Color greyColor = Color(0xffF2F2F2);

Color skyBlue = Color(0xFF16DBCC);
Color pinkColor = Color(0xFFFF82AC);
Color yellowColor = Color(0xFFFFBB38);
// <<<<<<< feature/Inventory_Extended
Color greyColor = Color(0xFF4D4A4A);
// =======
// Color greyColor = Color(0xFF5C5C5C);
// >>>>>>> dev

//#E5283C

Color successColor = Colors.green;

const kBottomContainerHeight = 80.0;
const kActiveCartColour = Color.fromARGB(255, 70, 72, 107);
const kInactiveCartColour = Color(0xFF111328);
const kBottomContainerColour = Color.fromARGB(255, 248, 0, 74);

const kLabelTextStyle = TextStyle(
  fontSize: 18.0,
  color: Color.fromARGB(255, 42, 42, 44),
);

const kNumberTextStyle = TextStyle(
  fontSize: 40.0,
  fontWeight: FontWeight.w900,
);

const kLargeButtonTextStyle = TextStyle(
  fontSize: 25.0,
  fontWeight: FontWeight.bold,
);

const kTitleTextStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.bold,
);

const kResultTextStyle = TextStyle(
  color: Color(0xFF24D876),
  fontSize: 22.0,
  fontWeight: FontWeight.bold,
);

const kBMITextStyle = TextStyle(
  fontSize: 100.0,
  fontWeight: FontWeight.bold,
);

const kBodyTextStyle = TextStyle(
  fontSize: 22.0,
);
// <<<<<<< feature/Inventory_Extended
// =======

// String base_url = 'https://www.elabnepal.com/api/v1';
// >>>>>>> dev

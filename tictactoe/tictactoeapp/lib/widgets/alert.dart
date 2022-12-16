import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> showAlertDialog(
    {required BuildContext context,
    required String content,
    required String defaultActionText,
    required final VoidCallback onOkPressed}) async {
  if (Platform.isIOS) {
    return await showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        content: Text(
          content,
        ),
        actions: <Widget>[
          CupertinoDialogAction(
              onPressed: () => onOkPressed(),
              child: Text(
                textAlign: TextAlign.center,
                defaultActionText,
                style: GoogleFonts.poppins(
                  color: Colors.black,
                ),
              )),
        ],
      ),
    );
  }

  return await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      content: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Text(
          content,
          textAlign: TextAlign.center,
          style: GoogleFonts.quicksand(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 7, 8, 63),
          ),
        ),
      ),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () => onOkPressed(),
          child: Text(
            defaultActionText,
            style: GoogleFonts.montserrat(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
  );
}

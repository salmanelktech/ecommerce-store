
import 'package:flutter/material.dart';


class Utils {
  Utils._();

 
 

  //* ------------------ Show SnackBar Message ------------------

  static showSnackBarMessage(
    BuildContext context, {
    required String text,
    Color? color,
    String? actionName,
    Function()? action,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        action: (action != null && actionName != null)
            ? SnackBarAction(
                label: actionName,
                onPressed: action,
                textColor: Colors.white,
              )
            : null,
        backgroundColor: color ?? Colors.green,
      ),
    );
  }

  //* ------------------ Validate Text Field Input ------------------

  static String? validateInput(
    String? value, {
    int? minValue,
    int? maxValue,
    bool isRequired = true,
    bool disableValidation = false,

    bool isEmail = false,
    bool isUrl = false,

    String? phoneNumber,
    int? maxSkills,
    String? match,
  }) {
    if (disableValidation) {
      return null;
    }

    if (isRequired && (value == null || value.trim().isEmpty)) {
      return '* Required';
    }

    if (minValue != null) {
      try {
        if (int.parse(value!) < minValue) {
          return 'Minimum $minValue.';
        }
      } catch (e) {
        debugPrint(e.toString());
      }
    }
    if (match != null) {
      if ((value ?? '') != match) {
        return 'Does not match';
      }
    }
    if (maxValue != null) {
      try {
        if (int.parse(value!) > maxValue) {
          return 'Maximum $maxValue.';
        }
      } catch (e) {
        debugPrint(e.toString());
      }
    }
    
    

    if (isEmail) {
      if ((value ?? '').isEmpty && isRequired == false) return null;
      final urlPattern = RegExp(
        r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
        caseSensitive: false,
      );

      if (!urlPattern.hasMatch(value ?? '')) {
        return 'Not a valid mail.';
      }
    }

    if (isUrl) {
      if ((value ?? '').isEmpty && isRequired == false) return null;
      final RegExp urlPattern = RegExp(
        r"^(http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,}(:[0-9]{1,5})?(\/.*)?$",
        caseSensitive: false,
      );
      if (!urlPattern.hasMatch(value ?? '')) {
        return 'Not valid Url.';
      }
    }
    if (maxSkills != null) {
      if (maxSkills < value!.split(',').length) {
        return 'Maximum $maxSkills skills.';
      }
    }

    if (phoneNumber != null) {
      if ((value ?? '').isEmpty && isRequired == false) return null;
      try {
        // final parsedNumber = PhoneNumber.parse(phoneNumber);
        // if (!parsedNumber.isValid(type: PhoneNumberType.mobile)) {
        //   return 'Please enter a valid number';
        // }
      } catch (e) {
        return 'Please enter a valid number';
      }
    }
    

    return null;
  }

  }

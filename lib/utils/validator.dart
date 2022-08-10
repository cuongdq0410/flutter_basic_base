class Validator {
  static final RegExp _phoneRegex = RegExp(r'(\+84|0)\d{9}$');
  static final RegExp _emailRegex = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  String? checkPhoneNumber(String phoneNumber) {
    if (phoneNumber.trim().isEmpty) {
      return '';
    } else if (!_phoneRegex.hasMatch(phoneNumber.trim())) {
      return '';
    } else {
      return null;
    }
  }

  String? checkFullName(String value) {
    if (value.trim().isEmpty) {
      return '';
    } else {
      return null;
    }
  }

  String? checkPass(String value) {
    if (value.trim().isEmpty) {
      return '';
    } else if (value.trim().length < 6) {
      return '';
    } else {
      return null;
    }
  }

  String? checkEmail(String email) {
    if (email.isEmpty) {
      return '';
    } else if (!_emailRegex.hasMatch(email.trim())) {
      return '';
    } else {
      return null;
    }
  }
}

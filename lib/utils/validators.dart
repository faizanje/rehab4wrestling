import 'package:form_field_validator/form_field_validator.dart';
TextFieldValidator getRequiredValidator() {
  return RequiredValidator(errorText: 'This field is required');
}

TextFieldValidator getRequiredEmail() {
  return EmailValidator(errorText: 'Please enter a valid email');
}


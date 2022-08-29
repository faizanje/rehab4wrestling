import 'package:form_field_validator/form_field_validator.dart';
TextFieldValidator getRequiredValidator() {
  return RequiredValidator(errorText: 'This field is required');
}


TextFieldValidator getEmailValidator() {
  return EmailValidator(errorText: 'Email is invalid');
}

TextFieldValidator getNameValidator() {
  return EmailValidator(errorText: 'This field is invalid');
}

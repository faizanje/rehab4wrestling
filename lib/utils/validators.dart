import 'package:form_field_validator/form_field_validator.dart';
TextFieldValidator getRequiredValidator() {
  return RequiredValidator(errorText: 'This field is required');
}


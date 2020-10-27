/// Represents the validation of an attribute in a class.
/// Validation is well succeeded if the attributes [memberName] and [errorMessage]
/// are empty.
class ValidationResult {
  final String memberName;
  final String errorMessage;

  ValidationResult(this.memberName, this.errorMessage);

  ValidationResult.success() : this('','');

  bool get isSuccess => memberName.isEmpty && errorMessage.isEmpty;

  bool get isError => !isSuccess;

  @override
  bool operator ==(Object other) {
    return (other is ValidationResult)
        && other.memberName == memberName
        && other.errorMessage == errorMessage;
  }

  @override
  int get hashCode => memberName.hashCode ^ errorMessage.hashCode;

  @override
  String toString() => '$memberName: $errorMessage';
}
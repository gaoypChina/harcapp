class MissingDecodeParamError extends Error{

  String paramName;

  MissingDecodeParamError(this.paramName);

  @override
  String toString() => 'MissingDecodeParamError. Missing param: $paramName.';

}
class CryptoFailureResposne {
  Status status;

  CryptoFailureResposne({
    required this.status,
  });

  factory CryptoFailureResposne.fromMap(Map<String, dynamic> json) =>
      CryptoFailureResposne(
        status: Status.fromMap(json["status"]),
      );
}

class Status {
  int errorCode;
  String errorMessage;

  Status({
    required this.errorCode,
    required this.errorMessage,
  });

  factory Status.fromMap(Map<String, dynamic> json) => Status(
        errorCode: json["error_code"],
        errorMessage: json["error_message"],
      );
}

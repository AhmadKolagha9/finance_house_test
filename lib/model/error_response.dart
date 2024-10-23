class ErrorResponse {
  ErrorResponse({
      this.statusCode, 
      this.statusMessage, 
      this.success,});

  ErrorResponse.fromJson(dynamic json) {
    statusCode = json['status_code'];
    statusMessage = json['status_message'];
    success = json['success'];
  }
  int? statusCode;
  String? statusMessage;
  bool? success;
ErrorResponse copyWith({  int? statusCode,
  String? statusMessage,
  bool? success,
}) => ErrorResponse(  statusCode: statusCode ?? this.statusCode,
  statusMessage: statusMessage ?? this.statusMessage,
  success: success ?? this.success,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status_code'] = statusCode;
    map['status_message'] = statusMessage;
    map['success'] = success;
    return map;
  }

}
class AuthResponse {
  String token;
  String redirectUrl;

  AuthResponse({
    required this.token,
    required this.redirectUrl,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      token: json['token'],
      redirectUrl: json['redirectUrl'],
    );
  }
}

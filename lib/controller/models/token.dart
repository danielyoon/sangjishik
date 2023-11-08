class Token {
  final String jwtToken, refreshToken;

  Token(this.jwtToken, this.refreshToken);

  Token.fromJson(Map<String, dynamic> json)
      : jwtToken = json['jwtToken'],
        refreshToken = json['refreshToken'];

  Map<String, dynamic> toJson() => {
        'jwtToken': jwtToken,
        'refreshToken': refreshToken,
      };
}

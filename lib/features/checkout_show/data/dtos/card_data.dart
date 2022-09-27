class CardData {
  final String? cardNumber;
  final String? cardHolderName;
  final String? cardExpirationDate;
  final String? cardCvv;

  CardData({
    this.cardNumber,
    this.cardHolderName,
    this.cardExpirationDate,
    this.cardCvv,
  });

  CardData copyWith({
    String? cardNumber,
    String? cardHolderName,
    String? cardExpirationDate,
    String? cardCvv,
  }) {
    return CardData(
      cardNumber: cardNumber ?? this.cardNumber,
      cardHolderName: cardHolderName ?? this.cardHolderName,
      cardExpirationDate: cardExpirationDate ?? this.cardExpirationDate,
      cardCvv: cardCvv ?? this.cardCvv,
    );
  }
}

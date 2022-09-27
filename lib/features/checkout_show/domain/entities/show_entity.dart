class ShowEntity {
  final String nameShow;
  final String descriptionShow;
  final num priceShow;
  final num serviceFee;
  final num orderProcessingFee;
  final num deliveryPrice;
  final String? notesFromSeller;
  final String addressShow;

  ShowEntity({
    required this.nameShow,
    required this.descriptionShow,
    required this.priceShow,
    required this.serviceFee,
    required this.orderProcessingFee,
    required this.deliveryPrice,
    this.notesFromSeller,
    required this.addressShow,
  });

  ShowEntity copyWith({
    String? nameShow,
    String? descriptionShow,
    num? priceShow,
    num? serviceFee,
    num? orderProcessingFee,
    num? deliveryPrice,
    String? notesFromSeller,
    String? addressShow,
  }) {
    return ShowEntity(
      nameShow: nameShow ?? this.nameShow,
      descriptionShow: descriptionShow ?? this.descriptionShow,
      priceShow: priceShow ?? this.priceShow,
      serviceFee: serviceFee ?? this.serviceFee,
      orderProcessingFee: orderProcessingFee ?? this.orderProcessingFee,
      deliveryPrice: deliveryPrice ?? this.deliveryPrice,
      notesFromSeller: notesFromSeller ?? this.notesFromSeller,
      addressShow: addressShow ?? this.addressShow,
    );
  }
}

class Show {
  final String nameShow;
  final String descriptionShow;
  final num priceShow;
  final num serviceFee;
  final num orderProcessingFee;
  final num deliveryPrice;
  final String? notesFromSeller;
  final String addressShow;

  Show({
    required this.nameShow,
    required this.descriptionShow,
    required this.priceShow,
    required this.serviceFee,
    required this.orderProcessingFee,
    required this.deliveryPrice,
    this.notesFromSeller,
    required this.addressShow,
  });

  factory Show.fromJson(Map<String, dynamic> json) {
    return Show(
      nameShow: json['nameShow'],
      descriptionShow: json['descriptionShow'],
      priceShow: json['priceShow'],
      serviceFee: json['serviceFee'],
      orderProcessingFee: json['orderProcessingFee'],
      deliveryPrice: json['deliveryPrice'],
      notesFromSeller: json['notesFromSeller'],
      addressShow: json['addressShow'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nameShow': nameShow,
      'descriptionShow': descriptionShow,
      'priceShow': priceShow,
      'serviceFeee': serviceFee,
      'orderProcessingFee': orderProcessingFee,
      'deliveryPrice': deliveryPrice,
      'notesFromSeller': notesFromSeller,
      'addressShow': addressShow,
    };
  }

  Show copyWith({
    String? nameShow,
    String? descriptionShow,
    num? priceShow,
    num? serviceFee,
    num? orderProcessingFee,
    num? deliveryPrice,
    String? notesFromSeller,
    String? addressShow,
  }) {
    return Show(
      nameShow: nameShow ?? this.nameShow,
      descriptionShow: descriptionShow ?? this.descriptionShow,
      priceShow: priceShow ?? this.priceShow,
      serviceFee: serviceFee ?? this.serviceFee,
      deliveryPrice: deliveryPrice ?? this.deliveryPrice,
      orderProcessingFee: orderProcessingFee ?? this.orderProcessingFee,
      notesFromSeller: notesFromSeller ?? this.notesFromSeller,
      addressShow: addressShow ?? this.addressShow,
    );
  }
}

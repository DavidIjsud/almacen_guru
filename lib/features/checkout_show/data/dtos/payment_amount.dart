class PaymentAmount {
  final int? totalTickets;
  final num? totalAmount;
  final num? totalAmountWithFees;
  final num? totalAmountWithFeesAndOrderProcessingFee;

  PaymentAmount({
    this.totalTickets,
    this.totalAmount,
    this.totalAmountWithFees,
    this.totalAmountWithFeesAndOrderProcessingFee,
  });

  PaymentAmount copyWith({
    int? totalTickets,
    num? totalAmount,
    num? totalAmountWithFees,
    num? totalAmountWithFeesAndOrderProcessingFee,
  }) {
    return PaymentAmount(
      totalTickets: totalTickets ?? this.totalTickets,
      totalAmount: totalAmount ?? this.totalAmount,
      totalAmountWithFees: totalAmountWithFees ?? this.totalAmountWithFees,
      totalAmountWithFeesAndOrderProcessingFee:
          totalAmountWithFeesAndOrderProcessingFee ??
              this.totalAmountWithFeesAndOrderProcessingFee,
    );
  }
}

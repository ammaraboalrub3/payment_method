class PaymentIntentInputModel {
  final num amount;
  final String currency;
  final String customerId;

  PaymentIntentInputModel({
    required this.amount,
    required this.currency,
    required this.customerId,
  });

  // عملات بدون كسور
  static const _zeroDecimal = {
    'bif',
    'clp',
    'djf',
    'gnf',
    'jpy',
    'kmf',
    'krw',
    'mga',
    'pyg',
    'rwf',
    'ugx',
    'vnd',
    'vuv',
    'xaf',
    'xof',
    'xpf',
  };

  // عملات ثلاث خانات عشرية (مثل الدينار الأردني)
  static const _threeDecimal = {'bhd', 'jod', 'kwd', 'omr', 'tnd'};

  static int _multiplier(String ccy) {
    final c = ccy.toLowerCase();
    if (_zeroDecimal.contains(c)) return 1; // لا كسور
    if (_threeDecimal.contains(c)) return 1000; // ثلاث خانات
    return 100; // الافتراضي: خانتان
  }

  Map<String, dynamic> toJson() {
    final mult = _multiplier(currency);

    // احسب أصغر وحدة (minor units) مع التقريب لتفادي أخطاء double
    final minorUnits = (amount * mult).round();

    // (اختياري) منع الكسور غير المسموحة لعملات zero-decimal
    if (mult == 1 && (amount % 1 != 0)) {
      throw ArgumentError('العملة ${currency.toUpperCase()} لا تقبل الكسور.');
    }

    return {
      'amount': minorUnits
          .toString(), // Stripe يفضّل integer كـ string في form-encoded
      'currency': currency.toLowerCase(),
      "customer": customerId,
    };
  }
}

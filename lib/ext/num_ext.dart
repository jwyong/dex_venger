extension SafeDivision on num? {
  num safeDiv(num? other, {num fallback = 0}) {
    if (this == null || other == null || other == 0) return fallback;
    return this! / other;
  }
}
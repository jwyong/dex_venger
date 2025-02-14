class Holding {
  final String id; // Concatenated tokenAddress + ownerAddress
  final String? imgUrl;
  final String? name;
  final String? symbol;

  final double? amount;
  final double? totalValue;
  final double? pnlUnrealised;

  Holding({required this.id, this.imgUrl, this.name, this.symbol, this.amount, this.totalValue, this.pnlUnrealised});

  @override
  String toString() {
    return 'Holding{id: $id, imgUrl: $imgUrl, name: $name, symbol: $symbol, amount: $amount, totalValue: $totalValue, pnlUnrealised: $pnlUnrealised}';
  }
}

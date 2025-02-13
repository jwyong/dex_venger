import 'package:json_annotation/json_annotation.dart';

part 'solana_token_item.g.dart';

@JsonSerializable(explicitToJson: true)
class SolanaTokenItem {
  final String id;
  final Content content;
  // final Ownership ownership;
  final TokenInfo? token_info;

  SolanaTokenItem({
    required this.id,
    required this.content,
    // required this.ownership,
    this.token_info,
  });

  factory SolanaTokenItem.fromJson(Map<String, dynamic> json) =>
      _$SolanaTokenItemFromJson(json);

  Map<String, dynamic> toJson() => _$SolanaTokenItemToJson(this);
}

@JsonSerializable()
class Content {
  // @JsonKey(name: "\$schema")
  // final String schema;
  // final String json_uri;
  final Metadata? metadata;
  final Links? links;

  Content({
    // required this.schema,
    // required this.json_uri,
    this.metadata,
    this.links,
  });

  factory Content.fromJson(Map<String, dynamic> json) =>
      _$ContentFromJson(json);

  Map<String, dynamic> toJson() => _$ContentToJson(this);
}

@JsonSerializable()
class Metadata {
  final String? description;
  final String? name;
  final String? symbol;
  final String? token_standard;

  Metadata({this.description, this.name, this.symbol, this.token_standard});

  factory Metadata.fromJson(Map<String, dynamic> json) =>
      _$MetadataFromJson(json);

  Map<String, dynamic> toJson() => _$MetadataToJson(this);
}

@JsonSerializable()
class Links {
  final String? image;

  Links({this.image});

  factory Links.fromJson(Map<String, dynamic> json) =>
      _$LinksFromJson(json);

  Map<String, dynamic> toJson() => _$LinksToJson(this);
}

// @JsonSerializable()
// class Ownership {
//   final String owner;
//
//   Ownership({required this.owner});
//
//   factory Ownership.fromJson(Map<String, dynamic> json) =>
//       _$OwnershipFromJson(json);
//
//   Map<String, dynamic> toJson() => _$OwnershipToJson(this);
// }

@JsonSerializable(explicitToJson: true)
class TokenInfo {
  // final List<TokenAccount>? token_accounts;
  final String? symbol;
  final int? balance;
  final int? supply;
  final int? decimals;
  final String? token_program;
  final String? associated_token_address;
  final PriceInfo? price_info;

  TokenInfo({
    // this.token_accounts,
    this.symbol,
    this.balance,
    this.supply,
    this.decimals,
    this.token_program,
    this.associated_token_address,
    this.price_info,
  });

  factory TokenInfo.fromJson(Map<String, dynamic> json) =>
      _$TokenInfoFromJson(json);

  Map<String, dynamic> toJson() => _$TokenInfoToJson(this);
}

// @JsonSerializable()
// class TokenAccount {
//   final String address;
//   final int balance;
//
//   TokenAccount({required this.address, required this.balance});
//
//   factory TokenAccount.fromJson(Map<String, dynamic> json) =>
//       _$TokenAccountFromJson(json);
//
//   Map<String, dynamic> toJson() => _$TokenAccountToJson(this);
// }

@JsonSerializable()
class PriceInfo {
  final double? price_per_token;
  final double? total_price;
  final String? currency;

  PriceInfo({this.price_per_token, this.total_price, this.currency});

  factory PriceInfo.fromJson(Map<String, dynamic> json) =>
      _$PriceInfoFromJson(json);

  Map<String, dynamic> toJson() => _$PriceInfoToJson(this);
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'solana_token_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SolanaTokenItem _$SolanaTokenItemFromJson(Map<String, dynamic> json) =>
    SolanaTokenItem(
      id: json['id'] as String,
      content: json['content'] == null
          ? null
          : Content.fromJson(json['content'] as Map<String, dynamic>),
      token_info: json['token_info'] == null
          ? null
          : TokenInfo.fromJson(json['token_info'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SolanaTokenItemToJson(SolanaTokenItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content?.toJson(),
      'token_info': instance.token_info?.toJson(),
    };

Content _$ContentFromJson(Map<String, dynamic> json) => Content(
      metadata: json['metadata'] == null
          ? null
          : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
      links: json['links'] == null
          ? null
          : Links.fromJson(json['links'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ContentToJson(Content instance) => <String, dynamic>{
      'metadata': instance.metadata,
      'links': instance.links,
    };

Metadata _$MetadataFromJson(Map<String, dynamic> json) => Metadata(
      description: json['description'] as String?,
      name: json['name'] as String?,
      symbol: json['symbol'] as String?,
      token_standard: json['token_standard'] as String?,
    );

Map<String, dynamic> _$MetadataToJson(Metadata instance) => <String, dynamic>{
      'description': instance.description,
      'name': instance.name,
      'symbol': instance.symbol,
      'token_standard': instance.token_standard,
    };

Links _$LinksFromJson(Map<String, dynamic> json) => Links(
      image: json['image'] as String?,
    );

Map<String, dynamic> _$LinksToJson(Links instance) => <String, dynamic>{
      'image': instance.image,
    };

TokenInfo _$TokenInfoFromJson(Map<String, dynamic> json) => TokenInfo(
      symbol: json['symbol'] as String?,
      balance: (json['balance'] as num?)?.toInt(),
      supply: (json['supply'] as num?)?.toInt(),
      decimals: (json['decimals'] as num?)?.toInt(),
      token_program: json['token_program'] as String?,
      associated_token_address: json['associated_token_address'] as String?,
      price_info: json['price_info'] == null
          ? null
          : PriceInfo.fromJson(json['price_info'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TokenInfoToJson(TokenInfo instance) => <String, dynamic>{
      'symbol': instance.symbol,
      'balance': instance.balance,
      'supply': instance.supply,
      'decimals': instance.decimals,
      'token_program': instance.token_program,
      'associated_token_address': instance.associated_token_address,
      'price_info': instance.price_info?.toJson(),
    };

PriceInfo _$PriceInfoFromJson(Map<String, dynamic> json) => PriceInfo(
      price_per_token: (json['price_per_token'] as num?)?.toDouble(),
      total_price: (json['total_price'] as num?)?.toDouble(),
      currency: json['currency'] as String?,
    );

Map<String, dynamic> _$PriceInfoToJson(PriceInfo instance) => <String, dynamic>{
      'price_per_token': instance.price_per_token,
      'total_price': instance.total_price,
      'currency': instance.currency,
    };

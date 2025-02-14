// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_database.dart';

// ignore_for_file: type=lint
class $TokenEntityTable extends TokenEntity
    with TableInfo<$TokenEntityTable, TokenEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TokenEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _tokenAddressMeta =
      const VerificationMeta('tokenAddress');
  @override
  late final GeneratedColumn<String> tokenAddress = GeneratedColumn<String>(
      'token_address', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _imgUrlMeta = const VerificationMeta('imgUrl');
  @override
  late final GeneratedColumn<String> imgUrl = GeneratedColumn<String>(
      'img_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _symbolMeta = const VerificationMeta('symbol');
  @override
  late final GeneratedColumn<String> symbol = GeneratedColumn<String>(
      'symbol', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _networkMeta =
      const VerificationMeta('network');
  @override
  late final GeneratedColumnWithTypeConverter<TokenChain, int> network =
      GeneratedColumn<int>('network', aliasedName, false,
              type: DriftSqlType.int,
              requiredDuringInsert: false,
              defaultValue: Constant(TokenChain.SOL.index))
          .withConverter<TokenChain>($TokenEntityTable.$converternetwork);
  @override
  List<GeneratedColumn> get $columns =>
      [tokenAddress, imgUrl, name, symbol, network];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'token_entity';
  @override
  VerificationContext validateIntegrity(Insertable<TokenEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('token_address')) {
      context.handle(
          _tokenAddressMeta,
          tokenAddress.isAcceptableOrUnknown(
              data['token_address']!, _tokenAddressMeta));
    } else if (isInserting) {
      context.missing(_tokenAddressMeta);
    }
    if (data.containsKey('img_url')) {
      context.handle(_imgUrlMeta,
          imgUrl.isAcceptableOrUnknown(data['img_url']!, _imgUrlMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('symbol')) {
      context.handle(_symbolMeta,
          symbol.isAcceptableOrUnknown(data['symbol']!, _symbolMeta));
    }
    context.handle(_networkMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {tokenAddress};
  @override
  TokenEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TokenEntityData(
      tokenAddress: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}token_address'])!,
      imgUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}img_url']),
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name']),
      symbol: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}symbol']),
      network: $TokenEntityTable.$converternetwork.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}network'])!),
    );
  }

  @override
  $TokenEntityTable createAlias(String alias) {
    return $TokenEntityTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<TokenChain, int, int> $converternetwork =
      const EnumIndexConverter<TokenChain>(TokenChain.values);
}

class TokenEntityData extends DataClass implements Insertable<TokenEntityData> {
  final String tokenAddress;
  final String? imgUrl;
  final String? name;
  final String? symbol;
  final TokenChain network;
  const TokenEntityData(
      {required this.tokenAddress,
      this.imgUrl,
      this.name,
      this.symbol,
      required this.network});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['token_address'] = Variable<String>(tokenAddress);
    if (!nullToAbsent || imgUrl != null) {
      map['img_url'] = Variable<String>(imgUrl);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || symbol != null) {
      map['symbol'] = Variable<String>(symbol);
    }
    {
      map['network'] =
          Variable<int>($TokenEntityTable.$converternetwork.toSql(network));
    }
    return map;
  }

  TokenEntityCompanion toCompanion(bool nullToAbsent) {
    return TokenEntityCompanion(
      tokenAddress: Value(tokenAddress),
      imgUrl:
          imgUrl == null && nullToAbsent ? const Value.absent() : Value(imgUrl),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      symbol:
          symbol == null && nullToAbsent ? const Value.absent() : Value(symbol),
      network: Value(network),
    );
  }

  factory TokenEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TokenEntityData(
      tokenAddress: serializer.fromJson<String>(json['tokenAddress']),
      imgUrl: serializer.fromJson<String?>(json['imgUrl']),
      name: serializer.fromJson<String?>(json['name']),
      symbol: serializer.fromJson<String?>(json['symbol']),
      network: $TokenEntityTable.$converternetwork
          .fromJson(serializer.fromJson<int>(json['network'])),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'tokenAddress': serializer.toJson<String>(tokenAddress),
      'imgUrl': serializer.toJson<String?>(imgUrl),
      'name': serializer.toJson<String?>(name),
      'symbol': serializer.toJson<String?>(symbol),
      'network': serializer
          .toJson<int>($TokenEntityTable.$converternetwork.toJson(network)),
    };
  }

  TokenEntityData copyWith(
          {String? tokenAddress,
          Value<String?> imgUrl = const Value.absent(),
          Value<String?> name = const Value.absent(),
          Value<String?> symbol = const Value.absent(),
          TokenChain? network}) =>
      TokenEntityData(
        tokenAddress: tokenAddress ?? this.tokenAddress,
        imgUrl: imgUrl.present ? imgUrl.value : this.imgUrl,
        name: name.present ? name.value : this.name,
        symbol: symbol.present ? symbol.value : this.symbol,
        network: network ?? this.network,
      );
  TokenEntityData copyWithCompanion(TokenEntityCompanion data) {
    return TokenEntityData(
      tokenAddress: data.tokenAddress.present
          ? data.tokenAddress.value
          : this.tokenAddress,
      imgUrl: data.imgUrl.present ? data.imgUrl.value : this.imgUrl,
      name: data.name.present ? data.name.value : this.name,
      symbol: data.symbol.present ? data.symbol.value : this.symbol,
      network: data.network.present ? data.network.value : this.network,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TokenEntityData(')
          ..write('tokenAddress: $tokenAddress, ')
          ..write('imgUrl: $imgUrl, ')
          ..write('name: $name, ')
          ..write('symbol: $symbol, ')
          ..write('network: $network')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(tokenAddress, imgUrl, name, symbol, network);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TokenEntityData &&
          other.tokenAddress == this.tokenAddress &&
          other.imgUrl == this.imgUrl &&
          other.name == this.name &&
          other.symbol == this.symbol &&
          other.network == this.network);
}

class TokenEntityCompanion extends UpdateCompanion<TokenEntityData> {
  final Value<String> tokenAddress;
  final Value<String?> imgUrl;
  final Value<String?> name;
  final Value<String?> symbol;
  final Value<TokenChain> network;
  final Value<int> rowid;
  const TokenEntityCompanion({
    this.tokenAddress = const Value.absent(),
    this.imgUrl = const Value.absent(),
    this.name = const Value.absent(),
    this.symbol = const Value.absent(),
    this.network = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TokenEntityCompanion.insert({
    required String tokenAddress,
    this.imgUrl = const Value.absent(),
    this.name = const Value.absent(),
    this.symbol = const Value.absent(),
    this.network = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : tokenAddress = Value(tokenAddress);
  static Insertable<TokenEntityData> custom({
    Expression<String>? tokenAddress,
    Expression<String>? imgUrl,
    Expression<String>? name,
    Expression<String>? symbol,
    Expression<int>? network,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (tokenAddress != null) 'token_address': tokenAddress,
      if (imgUrl != null) 'img_url': imgUrl,
      if (name != null) 'name': name,
      if (symbol != null) 'symbol': symbol,
      if (network != null) 'network': network,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TokenEntityCompanion copyWith(
      {Value<String>? tokenAddress,
      Value<String?>? imgUrl,
      Value<String?>? name,
      Value<String?>? symbol,
      Value<TokenChain>? network,
      Value<int>? rowid}) {
    return TokenEntityCompanion(
      tokenAddress: tokenAddress ?? this.tokenAddress,
      imgUrl: imgUrl ?? this.imgUrl,
      name: name ?? this.name,
      symbol: symbol ?? this.symbol,
      network: network ?? this.network,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (tokenAddress.present) {
      map['token_address'] = Variable<String>(tokenAddress.value);
    }
    if (imgUrl.present) {
      map['img_url'] = Variable<String>(imgUrl.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (symbol.present) {
      map['symbol'] = Variable<String>(symbol.value);
    }
    if (network.present) {
      map['network'] = Variable<int>(
          $TokenEntityTable.$converternetwork.toSql(network.value));
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TokenEntityCompanion(')
          ..write('tokenAddress: $tokenAddress, ')
          ..write('imgUrl: $imgUrl, ')
          ..write('name: $name, ')
          ..write('symbol: $symbol, ')
          ..write('network: $network, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $HoldingEntityTable extends HoldingEntity
    with TableInfo<$HoldingEntityTable, HoldingEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HoldingEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _tokenAddressMeta =
      const VerificationMeta('tokenAddress');
  @override
  late final GeneratedColumn<String> tokenAddress = GeneratedColumn<String>(
      'token_address', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _ownerAddressMeta =
      const VerificationMeta('ownerAddress');
  @override
  late final GeneratedColumn<String> ownerAddress = GeneratedColumn<String>(
      'owner_address', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
      'amount', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _totalValueMeta =
      const VerificationMeta('totalValue');
  @override
  late final GeneratedColumn<double> totalValue = GeneratedColumn<double>(
      'total_value', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _avgBuyPriceMeta =
      const VerificationMeta('avgBuyPrice');
  @override
  late final GeneratedColumn<double> avgBuyPrice = GeneratedColumn<double>(
      'avg_buy_price', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _pnlUnrealisedMeta =
      const VerificationMeta('pnlUnrealised');
  @override
  late final GeneratedColumn<double> pnlUnrealised = GeneratedColumn<double>(
      'pnl_unrealised', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _pnlRealisedMeta =
      const VerificationMeta('pnlRealised');
  @override
  late final GeneratedColumn<double> pnlRealised = GeneratedColumn<double>(
      'pnl_realised', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        tokenAddress,
        ownerAddress,
        amount,
        totalValue,
        avgBuyPrice,
        pnlUnrealised,
        pnlRealised
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'holding_entity';
  @override
  VerificationContext validateIntegrity(Insertable<HoldingEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('token_address')) {
      context.handle(
          _tokenAddressMeta,
          tokenAddress.isAcceptableOrUnknown(
              data['token_address']!, _tokenAddressMeta));
    } else if (isInserting) {
      context.missing(_tokenAddressMeta);
    }
    if (data.containsKey('owner_address')) {
      context.handle(
          _ownerAddressMeta,
          ownerAddress.isAcceptableOrUnknown(
              data['owner_address']!, _ownerAddressMeta));
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    }
    if (data.containsKey('total_value')) {
      context.handle(
          _totalValueMeta,
          totalValue.isAcceptableOrUnknown(
              data['total_value']!, _totalValueMeta));
    }
    if (data.containsKey('avg_buy_price')) {
      context.handle(
          _avgBuyPriceMeta,
          avgBuyPrice.isAcceptableOrUnknown(
              data['avg_buy_price']!, _avgBuyPriceMeta));
    }
    if (data.containsKey('pnl_unrealised')) {
      context.handle(
          _pnlUnrealisedMeta,
          pnlUnrealised.isAcceptableOrUnknown(
              data['pnl_unrealised']!, _pnlUnrealisedMeta));
    }
    if (data.containsKey('pnl_realised')) {
      context.handle(
          _pnlRealisedMeta,
          pnlRealised.isAcceptableOrUnknown(
              data['pnl_realised']!, _pnlRealisedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {tokenAddress, ownerAddress};
  @override
  HoldingEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HoldingEntityData(
      tokenAddress: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}token_address'])!,
      ownerAddress: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}owner_address']),
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount']),
      totalValue: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}total_value']),
      avgBuyPrice: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}avg_buy_price']),
      pnlUnrealised: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}pnl_unrealised']),
      pnlRealised: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}pnl_realised']),
    );
  }

  @override
  $HoldingEntityTable createAlias(String alias) {
    return $HoldingEntityTable(attachedDatabase, alias);
  }
}

class HoldingEntityData extends DataClass
    implements Insertable<HoldingEntityData> {
  final String tokenAddress;
  final String? ownerAddress;
  final double? amount;
  final double? totalValue;

  /// Calculated values
  final double? avgBuyPrice;
  final double? pnlUnrealised;
  final double? pnlRealised;
  const HoldingEntityData(
      {required this.tokenAddress,
      this.ownerAddress,
      this.amount,
      this.totalValue,
      this.avgBuyPrice,
      this.pnlUnrealised,
      this.pnlRealised});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['token_address'] = Variable<String>(tokenAddress);
    if (!nullToAbsent || ownerAddress != null) {
      map['owner_address'] = Variable<String>(ownerAddress);
    }
    if (!nullToAbsent || amount != null) {
      map['amount'] = Variable<double>(amount);
    }
    if (!nullToAbsent || totalValue != null) {
      map['total_value'] = Variable<double>(totalValue);
    }
    if (!nullToAbsent || avgBuyPrice != null) {
      map['avg_buy_price'] = Variable<double>(avgBuyPrice);
    }
    if (!nullToAbsent || pnlUnrealised != null) {
      map['pnl_unrealised'] = Variable<double>(pnlUnrealised);
    }
    if (!nullToAbsent || pnlRealised != null) {
      map['pnl_realised'] = Variable<double>(pnlRealised);
    }
    return map;
  }

  HoldingEntityCompanion toCompanion(bool nullToAbsent) {
    return HoldingEntityCompanion(
      tokenAddress: Value(tokenAddress),
      ownerAddress: ownerAddress == null && nullToAbsent
          ? const Value.absent()
          : Value(ownerAddress),
      amount:
          amount == null && nullToAbsent ? const Value.absent() : Value(amount),
      totalValue: totalValue == null && nullToAbsent
          ? const Value.absent()
          : Value(totalValue),
      avgBuyPrice: avgBuyPrice == null && nullToAbsent
          ? const Value.absent()
          : Value(avgBuyPrice),
      pnlUnrealised: pnlUnrealised == null && nullToAbsent
          ? const Value.absent()
          : Value(pnlUnrealised),
      pnlRealised: pnlRealised == null && nullToAbsent
          ? const Value.absent()
          : Value(pnlRealised),
    );
  }

  factory HoldingEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HoldingEntityData(
      tokenAddress: serializer.fromJson<String>(json['tokenAddress']),
      ownerAddress: serializer.fromJson<String?>(json['ownerAddress']),
      amount: serializer.fromJson<double?>(json['amount']),
      totalValue: serializer.fromJson<double?>(json['totalValue']),
      avgBuyPrice: serializer.fromJson<double?>(json['avgBuyPrice']),
      pnlUnrealised: serializer.fromJson<double?>(json['pnlUnrealised']),
      pnlRealised: serializer.fromJson<double?>(json['pnlRealised']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'tokenAddress': serializer.toJson<String>(tokenAddress),
      'ownerAddress': serializer.toJson<String?>(ownerAddress),
      'amount': serializer.toJson<double?>(amount),
      'totalValue': serializer.toJson<double?>(totalValue),
      'avgBuyPrice': serializer.toJson<double?>(avgBuyPrice),
      'pnlUnrealised': serializer.toJson<double?>(pnlUnrealised),
      'pnlRealised': serializer.toJson<double?>(pnlRealised),
    };
  }

  HoldingEntityData copyWith(
          {String? tokenAddress,
          Value<String?> ownerAddress = const Value.absent(),
          Value<double?> amount = const Value.absent(),
          Value<double?> totalValue = const Value.absent(),
          Value<double?> avgBuyPrice = const Value.absent(),
          Value<double?> pnlUnrealised = const Value.absent(),
          Value<double?> pnlRealised = const Value.absent()}) =>
      HoldingEntityData(
        tokenAddress: tokenAddress ?? this.tokenAddress,
        ownerAddress:
            ownerAddress.present ? ownerAddress.value : this.ownerAddress,
        amount: amount.present ? amount.value : this.amount,
        totalValue: totalValue.present ? totalValue.value : this.totalValue,
        avgBuyPrice: avgBuyPrice.present ? avgBuyPrice.value : this.avgBuyPrice,
        pnlUnrealised:
            pnlUnrealised.present ? pnlUnrealised.value : this.pnlUnrealised,
        pnlRealised: pnlRealised.present ? pnlRealised.value : this.pnlRealised,
      );
  HoldingEntityData copyWithCompanion(HoldingEntityCompanion data) {
    return HoldingEntityData(
      tokenAddress: data.tokenAddress.present
          ? data.tokenAddress.value
          : this.tokenAddress,
      ownerAddress: data.ownerAddress.present
          ? data.ownerAddress.value
          : this.ownerAddress,
      amount: data.amount.present ? data.amount.value : this.amount,
      totalValue:
          data.totalValue.present ? data.totalValue.value : this.totalValue,
      avgBuyPrice:
          data.avgBuyPrice.present ? data.avgBuyPrice.value : this.avgBuyPrice,
      pnlUnrealised: data.pnlUnrealised.present
          ? data.pnlUnrealised.value
          : this.pnlUnrealised,
      pnlRealised:
          data.pnlRealised.present ? data.pnlRealised.value : this.pnlRealised,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HoldingEntityData(')
          ..write('tokenAddress: $tokenAddress, ')
          ..write('ownerAddress: $ownerAddress, ')
          ..write('amount: $amount, ')
          ..write('totalValue: $totalValue, ')
          ..write('avgBuyPrice: $avgBuyPrice, ')
          ..write('pnlUnrealised: $pnlUnrealised, ')
          ..write('pnlRealised: $pnlRealised')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(tokenAddress, ownerAddress, amount,
      totalValue, avgBuyPrice, pnlUnrealised, pnlRealised);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HoldingEntityData &&
          other.tokenAddress == this.tokenAddress &&
          other.ownerAddress == this.ownerAddress &&
          other.amount == this.amount &&
          other.totalValue == this.totalValue &&
          other.avgBuyPrice == this.avgBuyPrice &&
          other.pnlUnrealised == this.pnlUnrealised &&
          other.pnlRealised == this.pnlRealised);
}

class HoldingEntityCompanion extends UpdateCompanion<HoldingEntityData> {
  final Value<String> tokenAddress;
  final Value<String?> ownerAddress;
  final Value<double?> amount;
  final Value<double?> totalValue;
  final Value<double?> avgBuyPrice;
  final Value<double?> pnlUnrealised;
  final Value<double?> pnlRealised;
  final Value<int> rowid;
  const HoldingEntityCompanion({
    this.tokenAddress = const Value.absent(),
    this.ownerAddress = const Value.absent(),
    this.amount = const Value.absent(),
    this.totalValue = const Value.absent(),
    this.avgBuyPrice = const Value.absent(),
    this.pnlUnrealised = const Value.absent(),
    this.pnlRealised = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  HoldingEntityCompanion.insert({
    required String tokenAddress,
    this.ownerAddress = const Value.absent(),
    this.amount = const Value.absent(),
    this.totalValue = const Value.absent(),
    this.avgBuyPrice = const Value.absent(),
    this.pnlUnrealised = const Value.absent(),
    this.pnlRealised = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : tokenAddress = Value(tokenAddress);
  static Insertable<HoldingEntityData> custom({
    Expression<String>? tokenAddress,
    Expression<String>? ownerAddress,
    Expression<double>? amount,
    Expression<double>? totalValue,
    Expression<double>? avgBuyPrice,
    Expression<double>? pnlUnrealised,
    Expression<double>? pnlRealised,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (tokenAddress != null) 'token_address': tokenAddress,
      if (ownerAddress != null) 'owner_address': ownerAddress,
      if (amount != null) 'amount': amount,
      if (totalValue != null) 'total_value': totalValue,
      if (avgBuyPrice != null) 'avg_buy_price': avgBuyPrice,
      if (pnlUnrealised != null) 'pnl_unrealised': pnlUnrealised,
      if (pnlRealised != null) 'pnl_realised': pnlRealised,
      if (rowid != null) 'rowid': rowid,
    });
  }

  HoldingEntityCompanion copyWith(
      {Value<String>? tokenAddress,
      Value<String?>? ownerAddress,
      Value<double?>? amount,
      Value<double?>? totalValue,
      Value<double?>? avgBuyPrice,
      Value<double?>? pnlUnrealised,
      Value<double?>? pnlRealised,
      Value<int>? rowid}) {
    return HoldingEntityCompanion(
      tokenAddress: tokenAddress ?? this.tokenAddress,
      ownerAddress: ownerAddress ?? this.ownerAddress,
      amount: amount ?? this.amount,
      totalValue: totalValue ?? this.totalValue,
      avgBuyPrice: avgBuyPrice ?? this.avgBuyPrice,
      pnlUnrealised: pnlUnrealised ?? this.pnlUnrealised,
      pnlRealised: pnlRealised ?? this.pnlRealised,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (tokenAddress.present) {
      map['token_address'] = Variable<String>(tokenAddress.value);
    }
    if (ownerAddress.present) {
      map['owner_address'] = Variable<String>(ownerAddress.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (totalValue.present) {
      map['total_value'] = Variable<double>(totalValue.value);
    }
    if (avgBuyPrice.present) {
      map['avg_buy_price'] = Variable<double>(avgBuyPrice.value);
    }
    if (pnlUnrealised.present) {
      map['pnl_unrealised'] = Variable<double>(pnlUnrealised.value);
    }
    if (pnlRealised.present) {
      map['pnl_realised'] = Variable<double>(pnlRealised.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HoldingEntityCompanion(')
          ..write('tokenAddress: $tokenAddress, ')
          ..write('ownerAddress: $ownerAddress, ')
          ..write('amount: $amount, ')
          ..write('totalValue: $totalValue, ')
          ..write('avgBuyPrice: $avgBuyPrice, ')
          ..write('pnlUnrealised: $pnlUnrealised, ')
          ..write('pnlRealised: $pnlRealised, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TokenPriceEntityTable extends TokenPriceEntity
    with TableInfo<$TokenPriceEntityTable, TokenPriceEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TokenPriceEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _tokenAddressMeta =
      const VerificationMeta('tokenAddress');
  @override
  late final GeneratedColumn<String> tokenAddress = GeneratedColumn<String>(
      'token_address', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
      'price', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [tokenAddress, price];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'token_price_entity';
  @override
  VerificationContext validateIntegrity(
      Insertable<TokenPriceEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('token_address')) {
      context.handle(
          _tokenAddressMeta,
          tokenAddress.isAcceptableOrUnknown(
              data['token_address']!, _tokenAddressMeta));
    } else if (isInserting) {
      context.missing(_tokenAddressMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {tokenAddress};
  @override
  TokenPriceEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TokenPriceEntityData(
      tokenAddress: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}token_address'])!,
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}price']),
    );
  }

  @override
  $TokenPriceEntityTable createAlias(String alias) {
    return $TokenPriceEntityTable(attachedDatabase, alias);
  }
}

class TokenPriceEntityData extends DataClass
    implements Insertable<TokenPriceEntityData> {
  final String tokenAddress;
  final double? price;
  const TokenPriceEntityData({required this.tokenAddress, this.price});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['token_address'] = Variable<String>(tokenAddress);
    if (!nullToAbsent || price != null) {
      map['price'] = Variable<double>(price);
    }
    return map;
  }

  TokenPriceEntityCompanion toCompanion(bool nullToAbsent) {
    return TokenPriceEntityCompanion(
      tokenAddress: Value(tokenAddress),
      price:
          price == null && nullToAbsent ? const Value.absent() : Value(price),
    );
  }

  factory TokenPriceEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TokenPriceEntityData(
      tokenAddress: serializer.fromJson<String>(json['tokenAddress']),
      price: serializer.fromJson<double?>(json['price']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'tokenAddress': serializer.toJson<String>(tokenAddress),
      'price': serializer.toJson<double?>(price),
    };
  }

  TokenPriceEntityData copyWith(
          {String? tokenAddress,
          Value<double?> price = const Value.absent()}) =>
      TokenPriceEntityData(
        tokenAddress: tokenAddress ?? this.tokenAddress,
        price: price.present ? price.value : this.price,
      );
  TokenPriceEntityData copyWithCompanion(TokenPriceEntityCompanion data) {
    return TokenPriceEntityData(
      tokenAddress: data.tokenAddress.present
          ? data.tokenAddress.value
          : this.tokenAddress,
      price: data.price.present ? data.price.value : this.price,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TokenPriceEntityData(')
          ..write('tokenAddress: $tokenAddress, ')
          ..write('price: $price')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(tokenAddress, price);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TokenPriceEntityData &&
          other.tokenAddress == this.tokenAddress &&
          other.price == this.price);
}

class TokenPriceEntityCompanion extends UpdateCompanion<TokenPriceEntityData> {
  final Value<String> tokenAddress;
  final Value<double?> price;
  final Value<int> rowid;
  const TokenPriceEntityCompanion({
    this.tokenAddress = const Value.absent(),
    this.price = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TokenPriceEntityCompanion.insert({
    required String tokenAddress,
    this.price = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : tokenAddress = Value(tokenAddress);
  static Insertable<TokenPriceEntityData> custom({
    Expression<String>? tokenAddress,
    Expression<double>? price,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (tokenAddress != null) 'token_address': tokenAddress,
      if (price != null) 'price': price,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TokenPriceEntityCompanion copyWith(
      {Value<String>? tokenAddress, Value<double?>? price, Value<int>? rowid}) {
    return TokenPriceEntityCompanion(
      tokenAddress: tokenAddress ?? this.tokenAddress,
      price: price ?? this.price,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (tokenAddress.present) {
      map['token_address'] = Variable<String>(tokenAddress.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TokenPriceEntityCompanion(')
          ..write('tokenAddress: $tokenAddress, ')
          ..write('price: $price, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(e);
  $MyDatabaseManager get managers => $MyDatabaseManager(this);
  late final $TokenEntityTable tokenEntity = $TokenEntityTable(this);
  late final $HoldingEntityTable holdingEntity = $HoldingEntityTable(this);
  late final $TokenPriceEntityTable tokenPriceEntity =
      $TokenPriceEntityTable(this);
  late final TokenDao tokenDao = TokenDao(this as MyDatabase);
  late final HoldingDao holdingDao = HoldingDao(this as MyDatabase);
  late final TokenPriceDao tokenPriceDao = TokenPriceDao(this as MyDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [tokenEntity, holdingEntity, tokenPriceEntity];
}

typedef $$TokenEntityTableCreateCompanionBuilder = TokenEntityCompanion
    Function({
  required String tokenAddress,
  Value<String?> imgUrl,
  Value<String?> name,
  Value<String?> symbol,
  Value<TokenChain> network,
  Value<int> rowid,
});
typedef $$TokenEntityTableUpdateCompanionBuilder = TokenEntityCompanion
    Function({
  Value<String> tokenAddress,
  Value<String?> imgUrl,
  Value<String?> name,
  Value<String?> symbol,
  Value<TokenChain> network,
  Value<int> rowid,
});

class $$TokenEntityTableFilterComposer
    extends Composer<_$MyDatabase, $TokenEntityTable> {
  $$TokenEntityTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get tokenAddress => $composableBuilder(
      column: $table.tokenAddress, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get imgUrl => $composableBuilder(
      column: $table.imgUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get symbol => $composableBuilder(
      column: $table.symbol, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<TokenChain, TokenChain, int> get network =>
      $composableBuilder(
          column: $table.network,
          builder: (column) => ColumnWithTypeConverterFilters(column));
}

class $$TokenEntityTableOrderingComposer
    extends Composer<_$MyDatabase, $TokenEntityTable> {
  $$TokenEntityTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get tokenAddress => $composableBuilder(
      column: $table.tokenAddress,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get imgUrl => $composableBuilder(
      column: $table.imgUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get symbol => $composableBuilder(
      column: $table.symbol, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get network => $composableBuilder(
      column: $table.network, builder: (column) => ColumnOrderings(column));
}

class $$TokenEntityTableAnnotationComposer
    extends Composer<_$MyDatabase, $TokenEntityTable> {
  $$TokenEntityTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get tokenAddress => $composableBuilder(
      column: $table.tokenAddress, builder: (column) => column);

  GeneratedColumn<String> get imgUrl =>
      $composableBuilder(column: $table.imgUrl, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get symbol =>
      $composableBuilder(column: $table.symbol, builder: (column) => column);

  GeneratedColumnWithTypeConverter<TokenChain, int> get network =>
      $composableBuilder(column: $table.network, builder: (column) => column);
}

class $$TokenEntityTableTableManager extends RootTableManager<
    _$MyDatabase,
    $TokenEntityTable,
    TokenEntityData,
    $$TokenEntityTableFilterComposer,
    $$TokenEntityTableOrderingComposer,
    $$TokenEntityTableAnnotationComposer,
    $$TokenEntityTableCreateCompanionBuilder,
    $$TokenEntityTableUpdateCompanionBuilder,
    (
      TokenEntityData,
      BaseReferences<_$MyDatabase, $TokenEntityTable, TokenEntityData>
    ),
    TokenEntityData,
    PrefetchHooks Function()> {
  $$TokenEntityTableTableManager(_$MyDatabase db, $TokenEntityTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TokenEntityTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TokenEntityTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TokenEntityTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> tokenAddress = const Value.absent(),
            Value<String?> imgUrl = const Value.absent(),
            Value<String?> name = const Value.absent(),
            Value<String?> symbol = const Value.absent(),
            Value<TokenChain> network = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TokenEntityCompanion(
            tokenAddress: tokenAddress,
            imgUrl: imgUrl,
            name: name,
            symbol: symbol,
            network: network,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String tokenAddress,
            Value<String?> imgUrl = const Value.absent(),
            Value<String?> name = const Value.absent(),
            Value<String?> symbol = const Value.absent(),
            Value<TokenChain> network = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TokenEntityCompanion.insert(
            tokenAddress: tokenAddress,
            imgUrl: imgUrl,
            name: name,
            symbol: symbol,
            network: network,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TokenEntityTableProcessedTableManager = ProcessedTableManager<
    _$MyDatabase,
    $TokenEntityTable,
    TokenEntityData,
    $$TokenEntityTableFilterComposer,
    $$TokenEntityTableOrderingComposer,
    $$TokenEntityTableAnnotationComposer,
    $$TokenEntityTableCreateCompanionBuilder,
    $$TokenEntityTableUpdateCompanionBuilder,
    (
      TokenEntityData,
      BaseReferences<_$MyDatabase, $TokenEntityTable, TokenEntityData>
    ),
    TokenEntityData,
    PrefetchHooks Function()>;
typedef $$HoldingEntityTableCreateCompanionBuilder = HoldingEntityCompanion
    Function({
  required String tokenAddress,
  Value<String?> ownerAddress,
  Value<double?> amount,
  Value<double?> totalValue,
  Value<double?> avgBuyPrice,
  Value<double?> pnlUnrealised,
  Value<double?> pnlRealised,
  Value<int> rowid,
});
typedef $$HoldingEntityTableUpdateCompanionBuilder = HoldingEntityCompanion
    Function({
  Value<String> tokenAddress,
  Value<String?> ownerAddress,
  Value<double?> amount,
  Value<double?> totalValue,
  Value<double?> avgBuyPrice,
  Value<double?> pnlUnrealised,
  Value<double?> pnlRealised,
  Value<int> rowid,
});

class $$HoldingEntityTableFilterComposer
    extends Composer<_$MyDatabase, $HoldingEntityTable> {
  $$HoldingEntityTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get tokenAddress => $composableBuilder(
      column: $table.tokenAddress, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get ownerAddress => $composableBuilder(
      column: $table.ownerAddress, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get totalValue => $composableBuilder(
      column: $table.totalValue, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get avgBuyPrice => $composableBuilder(
      column: $table.avgBuyPrice, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get pnlUnrealised => $composableBuilder(
      column: $table.pnlUnrealised, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get pnlRealised => $composableBuilder(
      column: $table.pnlRealised, builder: (column) => ColumnFilters(column));
}

class $$HoldingEntityTableOrderingComposer
    extends Composer<_$MyDatabase, $HoldingEntityTable> {
  $$HoldingEntityTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get tokenAddress => $composableBuilder(
      column: $table.tokenAddress,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get ownerAddress => $composableBuilder(
      column: $table.ownerAddress,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get totalValue => $composableBuilder(
      column: $table.totalValue, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get avgBuyPrice => $composableBuilder(
      column: $table.avgBuyPrice, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get pnlUnrealised => $composableBuilder(
      column: $table.pnlUnrealised,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get pnlRealised => $composableBuilder(
      column: $table.pnlRealised, builder: (column) => ColumnOrderings(column));
}

class $$HoldingEntityTableAnnotationComposer
    extends Composer<_$MyDatabase, $HoldingEntityTable> {
  $$HoldingEntityTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get tokenAddress => $composableBuilder(
      column: $table.tokenAddress, builder: (column) => column);

  GeneratedColumn<String> get ownerAddress => $composableBuilder(
      column: $table.ownerAddress, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<double> get totalValue => $composableBuilder(
      column: $table.totalValue, builder: (column) => column);

  GeneratedColumn<double> get avgBuyPrice => $composableBuilder(
      column: $table.avgBuyPrice, builder: (column) => column);

  GeneratedColumn<double> get pnlUnrealised => $composableBuilder(
      column: $table.pnlUnrealised, builder: (column) => column);

  GeneratedColumn<double> get pnlRealised => $composableBuilder(
      column: $table.pnlRealised, builder: (column) => column);
}

class $$HoldingEntityTableTableManager extends RootTableManager<
    _$MyDatabase,
    $HoldingEntityTable,
    HoldingEntityData,
    $$HoldingEntityTableFilterComposer,
    $$HoldingEntityTableOrderingComposer,
    $$HoldingEntityTableAnnotationComposer,
    $$HoldingEntityTableCreateCompanionBuilder,
    $$HoldingEntityTableUpdateCompanionBuilder,
    (
      HoldingEntityData,
      BaseReferences<_$MyDatabase, $HoldingEntityTable, HoldingEntityData>
    ),
    HoldingEntityData,
    PrefetchHooks Function()> {
  $$HoldingEntityTableTableManager(_$MyDatabase db, $HoldingEntityTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HoldingEntityTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HoldingEntityTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HoldingEntityTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> tokenAddress = const Value.absent(),
            Value<String?> ownerAddress = const Value.absent(),
            Value<double?> amount = const Value.absent(),
            Value<double?> totalValue = const Value.absent(),
            Value<double?> avgBuyPrice = const Value.absent(),
            Value<double?> pnlUnrealised = const Value.absent(),
            Value<double?> pnlRealised = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              HoldingEntityCompanion(
            tokenAddress: tokenAddress,
            ownerAddress: ownerAddress,
            amount: amount,
            totalValue: totalValue,
            avgBuyPrice: avgBuyPrice,
            pnlUnrealised: pnlUnrealised,
            pnlRealised: pnlRealised,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String tokenAddress,
            Value<String?> ownerAddress = const Value.absent(),
            Value<double?> amount = const Value.absent(),
            Value<double?> totalValue = const Value.absent(),
            Value<double?> avgBuyPrice = const Value.absent(),
            Value<double?> pnlUnrealised = const Value.absent(),
            Value<double?> pnlRealised = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              HoldingEntityCompanion.insert(
            tokenAddress: tokenAddress,
            ownerAddress: ownerAddress,
            amount: amount,
            totalValue: totalValue,
            avgBuyPrice: avgBuyPrice,
            pnlUnrealised: pnlUnrealised,
            pnlRealised: pnlRealised,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$HoldingEntityTableProcessedTableManager = ProcessedTableManager<
    _$MyDatabase,
    $HoldingEntityTable,
    HoldingEntityData,
    $$HoldingEntityTableFilterComposer,
    $$HoldingEntityTableOrderingComposer,
    $$HoldingEntityTableAnnotationComposer,
    $$HoldingEntityTableCreateCompanionBuilder,
    $$HoldingEntityTableUpdateCompanionBuilder,
    (
      HoldingEntityData,
      BaseReferences<_$MyDatabase, $HoldingEntityTable, HoldingEntityData>
    ),
    HoldingEntityData,
    PrefetchHooks Function()>;
typedef $$TokenPriceEntityTableCreateCompanionBuilder
    = TokenPriceEntityCompanion Function({
  required String tokenAddress,
  Value<double?> price,
  Value<int> rowid,
});
typedef $$TokenPriceEntityTableUpdateCompanionBuilder
    = TokenPriceEntityCompanion Function({
  Value<String> tokenAddress,
  Value<double?> price,
  Value<int> rowid,
});

class $$TokenPriceEntityTableFilterComposer
    extends Composer<_$MyDatabase, $TokenPriceEntityTable> {
  $$TokenPriceEntityTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get tokenAddress => $composableBuilder(
      column: $table.tokenAddress, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get price => $composableBuilder(
      column: $table.price, builder: (column) => ColumnFilters(column));
}

class $$TokenPriceEntityTableOrderingComposer
    extends Composer<_$MyDatabase, $TokenPriceEntityTable> {
  $$TokenPriceEntityTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get tokenAddress => $composableBuilder(
      column: $table.tokenAddress,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get price => $composableBuilder(
      column: $table.price, builder: (column) => ColumnOrderings(column));
}

class $$TokenPriceEntityTableAnnotationComposer
    extends Composer<_$MyDatabase, $TokenPriceEntityTable> {
  $$TokenPriceEntityTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get tokenAddress => $composableBuilder(
      column: $table.tokenAddress, builder: (column) => column);

  GeneratedColumn<double> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);
}

class $$TokenPriceEntityTableTableManager extends RootTableManager<
    _$MyDatabase,
    $TokenPriceEntityTable,
    TokenPriceEntityData,
    $$TokenPriceEntityTableFilterComposer,
    $$TokenPriceEntityTableOrderingComposer,
    $$TokenPriceEntityTableAnnotationComposer,
    $$TokenPriceEntityTableCreateCompanionBuilder,
    $$TokenPriceEntityTableUpdateCompanionBuilder,
    (
      TokenPriceEntityData,
      BaseReferences<_$MyDatabase, $TokenPriceEntityTable, TokenPriceEntityData>
    ),
    TokenPriceEntityData,
    PrefetchHooks Function()> {
  $$TokenPriceEntityTableTableManager(
      _$MyDatabase db, $TokenPriceEntityTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TokenPriceEntityTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TokenPriceEntityTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TokenPriceEntityTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> tokenAddress = const Value.absent(),
            Value<double?> price = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TokenPriceEntityCompanion(
            tokenAddress: tokenAddress,
            price: price,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String tokenAddress,
            Value<double?> price = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TokenPriceEntityCompanion.insert(
            tokenAddress: tokenAddress,
            price: price,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TokenPriceEntityTableProcessedTableManager = ProcessedTableManager<
    _$MyDatabase,
    $TokenPriceEntityTable,
    TokenPriceEntityData,
    $$TokenPriceEntityTableFilterComposer,
    $$TokenPriceEntityTableOrderingComposer,
    $$TokenPriceEntityTableAnnotationComposer,
    $$TokenPriceEntityTableCreateCompanionBuilder,
    $$TokenPriceEntityTableUpdateCompanionBuilder,
    (
      TokenPriceEntityData,
      BaseReferences<_$MyDatabase, $TokenPriceEntityTable, TokenPriceEntityData>
    ),
    TokenPriceEntityData,
    PrefetchHooks Function()>;

class $MyDatabaseManager {
  final _$MyDatabase _db;
  $MyDatabaseManager(this._db);
  $$TokenEntityTableTableManager get tokenEntity =>
      $$TokenEntityTableTableManager(_db, _db.tokenEntity);
  $$HoldingEntityTableTableManager get holdingEntity =>
      $$HoldingEntityTableTableManager(_db, _db.holdingEntity);
  $$TokenPriceEntityTableTableManager get tokenPriceEntity =>
      $$TokenPriceEntityTableTableManager(_db, _db.tokenPriceEntity);
}

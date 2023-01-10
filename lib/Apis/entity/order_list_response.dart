// To parse this JSON data, do
//
//     final orderList = orderListFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

OrderList orderListFromJson(String str) => OrderList.fromJson(json.decode(str));

String orderListToJson(OrderList data) => json.encode(data.toJson());

class OrderList {
  OrderList({
    required this.orders,
  });

  final List<Order>? orders;

  factory OrderList.fromJson(Map<String, dynamic> json) => OrderList(
        orders: json["orders"] == null
            ? null
            : List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "orders": orders == null
            ? null
            : List<dynamic>.from(orders!.map((x) => x.toJson())),
      };
}

class Order {
  Order({
    required this.id,
    required this.adminGraphqlApiId,
    required this.appId,
    required this.browserIp,
    required this.buyerAcceptsMarketing,
    required this.cancelReason,
    required this.cancelledAt,
    required this.cartToken,
    required this.checkoutId,
    required this.checkoutToken,
    required this.clientDetails,
    required this.closedAt,
    required this.confirmed,
    required this.contactEmail,
    required this.createdAt,
    required this.currency,
    required this.currentSubtotalPrice,
    required this.currentSubtotalPriceSet,
    required this.currentTotalDiscounts,
    required this.currentTotalDiscountsSet,
    required this.currentTotalDutiesSet,
    required this.currentTotalPrice,
    required this.currentTotalPriceSet,
    required this.currentTotalTax,
    required this.currentTotalTaxSet,
    required this.customerLocale,
    required this.deviceId,
    required this.discountCodes,
    required this.email,
    required this.financialStatus,
    required this.fulfillmentStatus,
    required this.gateway,
    required this.landingSite,
    required this.landingSiteRef,
    required this.locationId,
    required this.name,
    required this.note,
    required this.noteAttributes,
    required this.number,
    required this.orderNumber,
    required this.orderStatusUrl,
    required this.originalTotalDutiesSet,
    required this.paymentGatewayNames,
    required this.phone,
    required this.presentmentCurrency,
    required this.processedAt,
    required this.processingMethod,
    required this.reference,
    required this.referringSite,
    required this.sourceIdentifier,
    required this.sourceName,
    required this.sourceUrl,
    required this.subtotalPrice,
    required this.subtotalPriceSet,
    required this.tags,
    required this.taxLines,
    required this.taxesIncluded,
    required this.test,
    required this.token,
    required this.totalDiscounts,
    required this.totalDiscountsSet,
    required this.totalLineItemsPrice,
    required this.totalLineItemsPriceSet,
    required this.totalOutstanding,
    required this.totalPrice,
    required this.totalPriceSet,
    required this.totalPriceUsd,
    required this.totalShippingPriceSet,
    required this.totalTax,
    required this.totalTaxSet,
    required this.totalTipReceived,
    required this.totalWeight,
    required this.updatedAt,
    required this.userId,
    required this.billingAddress,
    required this.customer,
    required this.discountApplications,
    required this.fulfillments,
    required this.lineItems,
    required this.paymentDetails,
    required this.refunds,
    required this.shippingAddress,
    required this.shippingLines,
  });

  final int? id;
  final String? adminGraphqlApiId;
  final dynamic appId;
  final String? browserIp;
  final bool? buyerAcceptsMarketing;
  final dynamic cancelReason;
  final dynamic cancelledAt;
  final String? cartToken;
  final int? checkoutId;
  final String? checkoutToken;
  final ClientDetails? clientDetails;
  final dynamic closedAt;
  final bool? confirmed;
  final String? contactEmail;
  final DateTime? createdAt;
  final Currency? currency;
  final String? currentSubtotalPrice;
  final Set? currentSubtotalPriceSet;
  final String? currentTotalDiscounts;
  final Set? currentTotalDiscountsSet;
  final dynamic? currentTotalDutiesSet;
  final String? currentTotalPrice;
  final Set? currentTotalPriceSet;
  final String? currentTotalTax;
  final Set? currentTotalTaxSet;
  final dynamic customerLocale;
  final dynamic deviceId;
  final List<DiscountCode>? discountCodes;
  final String? email;
  final String? financialStatus;
  final dynamic fulfillmentStatus;
  final String? gateway;
  final String? landingSite;
  final String? landingSiteRef;
  final dynamic locationId;
  final String? name;
  final dynamic note;
  final List<NoteAttribute>? noteAttributes;
  final int? number;
  final int? orderNumber;
  final String? orderStatusUrl;
  final dynamic originalTotalDutiesSet;
  final List<String>? paymentGatewayNames;
  final String? phone;
  final Currency? presentmentCurrency;
  final DateTime? processedAt;
  final String? processingMethod;
  final String? reference;
  final String? referringSite;
  final String? sourceIdentifier;
  final String? sourceName;
  final dynamic sourceUrl;
  final String? subtotalPrice;
  final Set? subtotalPriceSet;
  final String? tags;
  final List<TaxLine>? taxLines;
  final bool? taxesIncluded;
  final bool? test;
  final String? token;
  final String? totalDiscounts;
  final Set? totalDiscountsSet;
  final String? totalLineItemsPrice;
  final Set? totalLineItemsPriceSet;
  final String? totalOutstanding;
  final String? totalPrice;
  final Set? totalPriceSet;
  final String? totalPriceUsd;
  final Set? totalShippingPriceSet;
  final String? totalTax;
  final Set? totalTaxSet;
  final String? totalTipReceived;
  final int? totalWeight;
  final DateTime? updatedAt;
  final dynamic userId;
  final Address? billingAddress;
  final Customer? customer;
  final List<DiscountApplication>? discountApplications;
  final List<Fulfillment>? fulfillments;
  final List<LineItem>? lineItems;
  final PaymentDetails? paymentDetails;
  final List<Refund>? refunds;
  final Address? shippingAddress;
  final List<ShippingLine>? shippingLines;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"] ?? null,
        adminGraphqlApiId: json["admin_graphql_api_id"] ?? null,
        appId: json["app_id"],
        browserIp: json["browser_ip"] ?? null,
        buyerAcceptsMarketing: json["buyer_accepts_marketing"] ?? null,
        cancelReason: json["cancel_reason"],
        cancelledAt: json["cancelled_at"],
        cartToken: json["cart_token"] ?? null,
        checkoutId: json["checkout_id"] ?? null,
        checkoutToken: json["checkout_token"] ?? null,
        clientDetails: json["client_details"] == null
            ? null
            : ClientDetails.fromJson(json["client_details"]),
        closedAt: json["closed_at"],
        confirmed: json["confirmed"] ?? null,
        contactEmail: json["contact_email"] ?? null,
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        currency: json["currency"] == null
            ? null
            : currencyValues.map![json["currency"]],
        currentSubtotalPrice: json["current_subtotal_price"] ?? null,
        currentSubtotalPriceSet: json["current_subtotal_price_set"] == null
            ? null
            : Set.fromJson(json["current_subtotal_price_set"]),
        currentTotalDiscounts: json["current_total_discounts"] ?? null,
        currentTotalDiscountsSet: json["current_total_discounts_set"] == null
            ? null
            : Set.fromJson(json["current_total_discounts_set"]),
        currentTotalDutiesSet: json["current_total_duties_set"],
        currentTotalPrice: json["current_total_price"] ?? null,
        currentTotalPriceSet: json["current_total_price_set"] == null
            ? null
            : Set.fromJson(json["current_total_price_set"]),
        currentTotalTax: json["current_total_tax"] ?? null,
        currentTotalTaxSet: json["current_total_tax_set"] == null
            ? null
            : Set.fromJson(json["current_total_tax_set"]),
        customerLocale: json["customer_locale"],
        deviceId: json["device_id"],
        discountCodes: json["discount_codes"] == null
            ? null
            : List<DiscountCode>.from(
                json["discount_codes"].map((x) => DiscountCode.fromJson(x))),
        email: json["email"] ?? null,
        financialStatus: json["financial_status"] ?? null,
        fulfillmentStatus: json["fulfillment_status"],
        gateway: json["gateway"] ?? null,
        landingSite: json["landing_site"] ?? null,
        landingSiteRef: json["landing_site_ref"] ?? null,
        locationId: json["location_id"],
        name: json["name"] ?? null,
        note: json["note"],
        noteAttributes: json["note_attributes"] == null
            ? null
            : List<NoteAttribute>.from(
                json["note_attributes"].map((x) => NoteAttribute.fromJson(x))),
        number: json["number"] ?? null,
        orderNumber: json["order_number"] ?? null,
        orderStatusUrl: json["order_status_url"] ?? null,
        originalTotalDutiesSet: json["original_total_duties_set"],
        paymentGatewayNames: json["payment_gateway_names"] == null
            ? null
            : List<String>.from(json["payment_gateway_names"].map((x) => x)),
        phone: json["phone"] ?? null,
        presentmentCurrency: json["presentment_currency"] == null
            ? null
            : currencyValues.map![json["presentment_currency"]],
        processedAt: json["processed_at"] == null
            ? null
            : DateTime.parse(json["processed_at"]),
        processingMethod: json["processing_method"] ?? null,
        reference: json["reference"] ?? null,
        referringSite: json["referring_site"] ?? null,
        sourceIdentifier: json["source_identifier"] ?? null,
        sourceName: json["source_name"] ?? null,
        sourceUrl: json["source_url"],
        subtotalPrice: json["subtotal_price"] ?? null,
        subtotalPriceSet: json["subtotal_price_set"] == null
            ? null
            : Set.fromJson(json["subtotal_price_set"]),
        tags: json["tags"] ?? null,
        taxLines: json["tax_lines"] == null
            ? null
            : List<TaxLine>.from(
                json["tax_lines"].map((x) => TaxLine.fromJson(x))),
        taxesIncluded: json["taxes_included"] ?? null,
        test: json["test"] ?? null,
        token: json["token"] ?? null,
        totalDiscounts: json["total_discounts"] ?? null,
        totalDiscountsSet: json["total_discounts_set"] == null
            ? null
            : Set.fromJson(json["total_discounts_set"]),
        totalLineItemsPrice: json["total_line_items_price"] ?? null,
        totalLineItemsPriceSet: json["total_line_items_price_set"] == null
            ? null
            : Set.fromJson(json["total_line_items_price_set"]),
        totalOutstanding: json["total_outstanding"] ?? null,
        totalPrice: json["total_price"] ?? null,
        totalPriceSet: json["total_price_set"] == null
            ? null
            : Set.fromJson(json["total_price_set"]),
        totalPriceUsd: json["total_price_usd"] ?? null,
        totalShippingPriceSet: json["total_shipping_price_set"] == null
            ? null
            : Set.fromJson(json["total_shipping_price_set"]),
        totalTax: json["total_tax"] ?? null,
        totalTaxSet: json["total_tax_set"] == null
            ? null
            : Set.fromJson(json["total_tax_set"]),
        totalTipReceived: json["total_tip_received"] ?? null,
        totalWeight: json["total_weight"] ?? null,
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        userId: json["user_id"],
        billingAddress: json["billing_address"] == null
            ? null
            : Address.fromJson(json["billing_address"]),
        customer: json["customer"] == null
            ? null
            : Customer.fromJson(json["customer"]),
        discountApplications: json["discount_applications"] == null
            ? null
            : List<DiscountApplication>.from(json["discount_applications"]
                .map((x) => DiscountApplication.fromJson(x))),
        fulfillments: json["fulfillments"] == null
            ? null
            : List<Fulfillment>.from(
                json["fulfillments"].map((x) => Fulfillment.fromJson(x))),
        lineItems: json["line_items"] == null
            ? null
            : List<LineItem>.from(
                json["line_items"].map((x) => LineItem.fromJson(x))),
        paymentDetails: json["payment_details"] == null
            ? null
            : PaymentDetails.fromJson(json["payment_details"]),
        refunds: json["refunds"] == null
            ? null
            : List<Refund>.from(json["refunds"].map((x) => Refund.fromJson(x))),
        shippingAddress: json["shipping_address"] == null
            ? null
            : Address.fromJson(json["shipping_address"]),
        shippingLines: json["shipping_lines"] == null
            ? null
            : List<ShippingLine>.from(
                json["shipping_lines"].map((x) => ShippingLine.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? null,
        "admin_graphql_api_id": adminGraphqlApiId ?? null,
        "app_id": appId,
        "browser_ip": browserIp ?? null,
        "buyer_accepts_marketing": buyerAcceptsMarketing ?? null,
        "cancel_reason": cancelReason,
        "cancelled_at": cancelledAt,
        "cart_token": cartToken ?? null,
        "checkout_id": checkoutId ?? null,
        "checkout_token": checkoutToken ?? null,
        "client_details":
            clientDetails == null ? null : clientDetails!.toJson(),
        "closed_at": closedAt,
        "confirmed": confirmed ?? null,
        "contact_email": contactEmail ?? null,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "currency": currency == null ? null : currencyValues.reverse[currency],
        "current_subtotal_price": currentSubtotalPrice ?? null,
        "current_subtotal_price_set": currentSubtotalPriceSet == null
            ? null
            : currentSubtotalPriceSet!.toJson(),
        "current_total_discounts": currentTotalDiscounts ?? null,
        "current_total_discounts_set": currentTotalDiscountsSet == null
            ? null
            : currentTotalDiscountsSet!.toJson(),
        "current_total_duties_set": currentTotalDutiesSet,
        "current_total_price": currentTotalPrice ?? null,
        "current_total_price_set": currentTotalPriceSet == null
            ? null
            : currentTotalPriceSet!.toJson(),
        "current_total_tax": currentTotalTax ?? null,
        "current_total_tax_set":
            currentTotalTaxSet == null ? null : currentTotalTaxSet!.toJson(),
        "customer_locale": customerLocale,
        "device_id": deviceId,
        "discount_codes": discountCodes == null
            ? null
            : List<dynamic>.from(discountCodes!.map((x) => x.toJson())),
        "email": email ?? null,
        "financial_status": financialStatus ?? null,
        "fulfillment_status": fulfillmentStatus,
        "gateway": gateway ?? null,
        "landing_site": landingSite ?? null,
        "landing_site_ref": landingSiteRef ?? null,
        "location_id": locationId,
        "name": name ?? null,
        "note": note,
        "note_attributes": noteAttributes == null
            ? null
            : List<dynamic>.from(noteAttributes!.map((x) => x.toJson())),
        "number": number ?? null,
        "order_number": orderNumber ?? null,
        "order_status_url": orderStatusUrl ?? null,
        "original_total_duties_set": originalTotalDutiesSet,
        "payment_gateway_names": paymentGatewayNames == null
            ? null
            : List<dynamic>.from(paymentGatewayNames!.map((x) => x)),
        "phone": phone ?? null,
        "presentment_currency": presentmentCurrency == null
            ? null
            : currencyValues.reverse[presentmentCurrency],
        "processed_at":
            processedAt == null ? null : processedAt!.toIso8601String(),
        "processing_method": processingMethod ?? null,
        "reference": reference ?? null,
        "referring_site": referringSite ?? null,
        "source_identifier": sourceIdentifier ?? null,
        "source_name": sourceName ?? null,
        "source_url": sourceUrl,
        "subtotal_price": subtotalPrice ?? null,
        "subtotal_price_set":
            subtotalPriceSet == null ? null : subtotalPriceSet!.toJson(),
        "tags": tags ?? null,
        "tax_lines": taxLines == null
            ? null
            : List<dynamic>.from(taxLines!.map((x) => x.toJson())),
        "taxes_included": taxesIncluded ?? null,
        "test": test ?? null,
        "token": token ?? null,
        "total_discounts": totalDiscounts ?? null,
        "total_discounts_set":
            totalDiscountsSet == null ? null : totalDiscountsSet!.toJson(),
        "total_line_items_price": totalLineItemsPrice ?? null,
        "total_line_items_price_set": totalLineItemsPriceSet == null
            ? null
            : totalLineItemsPriceSet!.toJson(),
        "total_outstanding": totalOutstanding ?? null,
        "total_price": totalPrice ?? null,
        "total_price_set":
            totalPriceSet == null ? null : totalPriceSet!.toJson(),
        "total_price_usd": totalPriceUsd ?? null,
        "total_shipping_price_set": totalShippingPriceSet == null
            ? null
            : totalShippingPriceSet!.toJson(),
        "total_tax": totalTax ?? null,
        "total_tax_set": totalTaxSet == null ? null : totalTaxSet!.toJson(),
        "total_tip_received": totalTipReceived ?? null,
        "total_weight": totalWeight ?? null,
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "user_id": userId,
        "billing_address":
            billingAddress == null ? null : billingAddress!.toJson(),
        "customer": customer == null ? null : customer!.toJson(),
        "discount_applications": discountApplications == null
            ? null
            : List<dynamic>.from(discountApplications!.map((x) => x.toJson())),
        "fulfillments": fulfillments == null
            ? null
            : List<dynamic>.from(fulfillments!.map((x) => x.toJson())),
        "line_items": lineItems == null
            ? null
            : List<dynamic>.from(lineItems!.map((x) => x.toJson())),
        "payment_details":
            paymentDetails == null ? null : paymentDetails!.toJson(),
        "refunds": refunds == null
            ? null
            : List<dynamic>.from(refunds!.map((x) => x.toJson())),
        "shipping_address":
            shippingAddress == null ? null : shippingAddress!.toJson(),
        "shipping_lines": shippingLines == null
            ? null
            : List<dynamic>.from(shippingLines!.map((x) => x.toJson())),
      };
}

class Address {
  Address({
    required this.firstName,
    required this.address1,
    required this.phone,
    required this.city,
    required this.zip,
    required this.province,
    required this.country,
    required this.lastName,
    required this.address2,
    required this.company,
    required this.latitude,
    required this.longitude,
    required this.name,
    required this.countryCode,
    required this.provinceCode,
    required this.id,
    required this.customerId,
    required this.countryName,
    required this.addressDefault,
  });

  final String? firstName;
  final String? address1;
  final String? phone;
  final String? city;
  final String? zip;
  final String? province;
  final String? country;
  final String? lastName;
  final String? address2;
  final dynamic company;
  final double? latitude;
  final double? longitude;
  final String? name;
  final String? countryCode;
  final String? provinceCode;
  final int? id;
  final int? customerId;
  final String? countryName;
  final bool? addressDefault;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        firstName: json["first_name"] ?? null,
        address1: json["address1"] ?? null,
        phone: json["phone"] ?? null,
        city: json["city"] ?? null,
        zip: json["zip"] ?? null,
        province: json["province"] ?? null,
        country: json["country"] ?? null,
        lastName: json["last_name"] ?? null,
        address2: json["address2"] ?? null,
        company: json["company"],
        latitude: json["latitude"] == null ? null : json["latitude"].toDouble(),
        longitude:
            json["longitude"] == null ? null : json["longitude"].toDouble(),
        name: json["name"] ?? null,
        countryCode: json["country_code"] ?? null,
        provinceCode: json["province_code"] ?? null,
        id: json["id"] ?? null,
        customerId: json["customer_id"] ?? null,
        countryName: json["country_name"] ?? null,
        addressDefault: json["default"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName ?? null,
        "address1": address1 ?? null,
        "phone": phone ?? null,
        "city": city ?? null,
        "zip": zip ?? null,
        "province": province ?? null,
        "country": country ?? null,
        "last_name": lastName ?? null,
        "address2": address2 ?? null,
        "company": company,
        "latitude": latitude ?? null,
        "longitude": longitude ?? null,
        "name": name ?? null,
        "country_code": countryCode ?? null,
        "province_code": provinceCode ?? null,
        "id": id ?? null,
        "customer_id": customerId ?? null,
        "country_name": countryName ?? null,
        "default": addressDefault ?? null,
      };
}

class ClientDetails {
  ClientDetails({
    required this.acceptLanguage,
    required this.browserHeight,
    required this.browserIp,
    required this.browserWidth,
    required this.sessionHash,
    required this.userAgent,
  });

  final dynamic acceptLanguage;
  final dynamic browserHeight;
  final String? browserIp;
  final dynamic browserWidth;
  final dynamic sessionHash;
  final dynamic userAgent;

  factory ClientDetails.fromJson(Map<String, dynamic> json) => ClientDetails(
        acceptLanguage: json["accept_language"],
        browserHeight: json["browser_height"],
        browserIp: json["browser_ip"] ?? null,
        browserWidth: json["browser_width"],
        sessionHash: json["session_hash"],
        userAgent: json["user_agent"],
      );

  Map<String, dynamic> toJson() => {
        "accept_language": acceptLanguage,
        "browser_height": browserHeight,
        "browser_ip": browserIp ?? null,
        "browser_width": browserWidth,
        "session_hash": sessionHash,
        "user_agent": userAgent,
      };
}

enum Currency { USD }

final currencyValues = EnumValues({"USD": Currency.USD});

class Set {
  Set({
    required this.shopMoney,
    required this.presentmentMoney,
  });

  final Money? shopMoney;
  final Money? presentmentMoney;

  factory Set.fromJson(Map<String, dynamic> json) => Set(
        shopMoney: json["shop_money"] == null
            ? null
            : Money.fromJson(json["shop_money"]),
        presentmentMoney: json["presentment_money"] == null
            ? null
            : Money.fromJson(json["presentment_money"]),
      );

  Map<String, dynamic> toJson() => {
        "shop_money": shopMoney == null ? null : shopMoney!.toJson(),
        "presentment_money":
            presentmentMoney == null ? null : presentmentMoney!.toJson(),
      };
}

class Money {
  Money({
    required this.amount,
    required this.currencyCode,
  });

  final String? amount;
  final Currency? currencyCode;

  factory Money.fromJson(Map<String, dynamic> json) => Money(
        amount: json["amount"] ?? null,
        currencyCode: json["currency_code"] == null
            ? null
            : currencyValues.map![json["currency_code"]],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount ?? null,
        "currency_code":
            currencyCode == null ? null : currencyValues.reverse[currencyCode],
      };
}

class Customer {
  Customer({
    required this.id,
    required this.email,
    required this.acceptsMarketing,
    required this.createdAt,
    required this.updatedAt,
    required this.firstName,
    required this.lastName,
    required this.ordersCount,
    required this.state,
    required this.totalSpent,
    required this.lastOrderId,
    required this.note,
    required this.verifiedEmail,
    required this.multipassIdentifier,
    required this.taxExempt,
    required this.tags,
    required this.lastOrderName,
    required this.currency,
    required this.phone,
    required this.acceptsMarketingUpdatedAt,
    required this.marketingOptInLevel,
    required this.taxExemptions,
    required this.adminGraphqlApiId,
    required this.defaultAddress,
  });

  final int? id;
  final String? email;
  final bool? acceptsMarketing;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? firstName;
  final String? lastName;
  final int? ordersCount;
  final String? state;
  final String? totalSpent;
  final int? lastOrderId;
  final dynamic note;
  final bool? verifiedEmail;
  final dynamic multipassIdentifier;
  final bool? taxExempt;
  final String? tags;
  final String? lastOrderName;
  final Currency? currency;
  final String? phone;
  final DateTime? acceptsMarketingUpdatedAt;
  final dynamic marketingOptInLevel;
  final List<dynamic>? taxExemptions;
  final String? adminGraphqlApiId;
  final Address? defaultAddress;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"] ?? null,
        email: json["email"] ?? null,
        acceptsMarketing: json["accepts_marketing"] ?? null,
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        firstName: json["first_name"] ?? null,
        lastName: json["last_name"] ?? null,
        ordersCount: json["orders_count"] ?? null,
        state: json["state"] ?? null,
        totalSpent: json["total_spent"] ?? null,
        lastOrderId: json["last_order_id"] ?? null,
        note: json["note"],
        verifiedEmail: json["verified_email"] ?? null,
        multipassIdentifier: json["multipass_identifier"],
        taxExempt: json["tax_exempt"] ?? null,
        tags: json["tags"] ?? null,
        lastOrderName: json["last_order_name"] ?? null,
        currency: json["currency"] == null
            ? null
            : currencyValues.map![json["currency"]],
        phone: json["phone"] ?? null,
        acceptsMarketingUpdatedAt: json["accepts_marketing_updated_at"] == null
            ? null
            : DateTime.parse(json["accepts_marketing_updated_at"]),
        marketingOptInLevel: json["marketing_opt_in_level"],
        taxExemptions: json["tax_exemptions"] == null
            ? null
            : List<dynamic>.from(json["tax_exemptions"].map((x) => x)),
        adminGraphqlApiId: json["admin_graphql_api_id"] ?? null,
        defaultAddress: json["default_address"] == null
            ? null
            : Address.fromJson(json["default_address"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? null,
        "email": email ?? null,
        "accepts_marketing": acceptsMarketing ?? null,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "first_name": firstName ?? null,
        "last_name": lastName ?? null,
        "orders_count": ordersCount ?? null,
        "state": state ?? null,
        "total_spent": totalSpent ?? null,
        "last_order_id": lastOrderId ?? null,
        "note": note,
        "verified_email": verifiedEmail ?? null,
        "multipass_identifier": multipassIdentifier,
        "tax_exempt": taxExempt ?? null,
        "tags": tags ?? null,
        "last_order_name": lastOrderName ?? null,
        "currency": currency == null ? null : currencyValues.reverse[currency],
        "phone": phone ?? null,
        "accepts_marketing_updated_at": acceptsMarketingUpdatedAt == null
            ? null
            : acceptsMarketingUpdatedAt!.toIso8601String(),
        "marketing_opt_in_level": marketingOptInLevel,
        "tax_exemptions": taxExemptions == null
            ? null
            : List<dynamic>.from(taxExemptions!.map((x) => x)),
        "admin_graphql_api_id": adminGraphqlApiId ?? null,
        "default_address":
            defaultAddress == null ? null : defaultAddress!.toJson(),
      };
}

class DiscountApplication {
  DiscountApplication({
    required this.targetType,
    required this.type,
    required this.value,
    required this.valueType,
    required this.allocationMethod,
    required this.targetSelection,
    required this.code,
  });

  final String? targetType;
  final String? type;
  final String? value;
  final String? valueType;
  final String? allocationMethod;
  final String? targetSelection;
  final String? code;

  factory DiscountApplication.fromJson(Map<String, dynamic> json) =>
      DiscountApplication(
        targetType: json["target_type"] ?? null,
        type: json["type"] ?? null,
        value: json["value"] ?? null,
        valueType: json["value_type"] ?? null,
        allocationMethod: json["allocation_method"] ?? null,
        targetSelection: json["target_selection"] ?? null,
        code: json["code"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "target_type": targetType ?? null,
        "type": type ?? null,
        "value": value ?? null,
        "value_type": valueType ?? null,
        "allocation_method": allocationMethod ?? null,
        "target_selection": targetSelection ?? null,
        "code": code ?? null,
      };
}

class DiscountCode {
  DiscountCode({
    required this.code,
    required this.amount,
    required this.type,
  });

  final String? code;
  final String? amount;
  final String? type;

  factory DiscountCode.fromJson(Map<String, dynamic> json) => DiscountCode(
        code: json["code"] ?? null,
        amount: json["amount"] ?? null,
        type: json["type"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "code": code ?? null,
        "amount": amount ?? null,
        "type": type ?? null,
      };
}

class Fulfillment {
  Fulfillment({
    required this.id,
    required this.adminGraphqlApiId,
    required this.createdAt,
    required this.locationId,
    required this.name,
    required this.orderId,
    required this.receipt,
    required this.service,
    required this.shipmentStatus,
    required this.status,
    required this.trackingCompany,
    required this.trackingNumber,
    required this.trackingNumbers,
    required this.trackingUrl,
    required this.trackingUrls,
    required this.updatedAt,
    required this.lineItems,
  });

  final int? id;
  final String? adminGraphqlApiId;
  final DateTime? createdAt;
  final int? locationId;
  final String? name;
  final int? orderId;
  final FulfillmentReceipt? receipt;
  final String? service;
  final dynamic shipmentStatus;
  final String? status;
  final String? trackingCompany;
  final String? trackingNumber;
  final List<String>? trackingNumbers;
  final String? trackingUrl;
  final List<String>? trackingUrls;
  final DateTime? updatedAt;
  final List<LineItem>? lineItems;

  factory Fulfillment.fromJson(Map<String, dynamic> json) => Fulfillment(
        id: json["id"] ?? null,
        adminGraphqlApiId: json["admin_graphql_api_id"] ?? null,
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        locationId: json["location_id"] ?? null,
        name: json["name"] ?? null,
        orderId: json["order_id"] ?? null,
        receipt: json["receipt"] == null
            ? null
            : FulfillmentReceipt.fromJson(json["receipt"]),
        service: json["service"] ?? null,
        shipmentStatus: json["shipment_status"],
        status: json["status"] ?? null,
        trackingCompany: json["tracking_company"] ?? null,
        trackingNumber: json["tracking_number"] ?? null,
        trackingNumbers: json["tracking_numbers"] == null
            ? null
            : List<String>.from(json["tracking_numbers"].map((x) => x)),
        trackingUrl: json["tracking_url"] ?? null,
        trackingUrls: json["tracking_urls"] == null
            ? null
            : List<String>.from(json["tracking_urls"].map((x) => x)),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        lineItems: json["line_items"] == null
            ? null
            : List<LineItem>.from(
                json["line_items"].map((x) => LineItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? null,
        "admin_graphql_api_id": adminGraphqlApiId ?? null,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "location_id": locationId ?? null,
        "name": name ?? null,
        "order_id": orderId ?? null,
        "receipt": receipt == null ? null : receipt!.toJson(),
        "service": service ?? null,
        "shipment_status": shipmentStatus,
        "status": status ?? null,
        "tracking_company": trackingCompany ?? null,
        "tracking_number": trackingNumber ?? null,
        "tracking_numbers": trackingNumbers == null
            ? null
            : List<dynamic>.from(trackingNumbers!.map((x) => x)),
        "tracking_url": trackingUrl ?? null,
        "tracking_urls": trackingUrls == null
            ? null
            : List<dynamic>.from(trackingUrls!.map((x) => x)),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "line_items": lineItems == null
            ? null
            : List<dynamic>.from(lineItems!.map((x) => x.toJson())),
      };
}

class LineItem {
  LineItem({
    required this.id,
    required this.adminGraphqlApiId,
    required this.fulfillableQuantity,
    required this.fulfillmentService,
    required this.fulfillmentStatus,
    required this.giftCard,
    required this.grams,
    required this.name,
    required this.price,
    required this.priceSet,
    required this.productExists,
    required this.productId,
    required this.properties,
    required this.quantity,
    required this.requiresShipping,
    required this.sku,
    required this.taxable,
    required this.title,
    required this.totalDiscount,
    required this.totalDiscountSet,
    required this.variantId,
    required this.variantInventoryManagement,
    required this.variantTitle,
    required this.vendor,
    required this.taxLines,
    required this.duties,
    required this.discountAllocations,
  });

  final int? id;
  final String? adminGraphqlApiId;
  final int? fulfillableQuantity;
  final String? fulfillmentService;
  final dynamic fulfillmentStatus;
  final bool? giftCard;
  final int? grams;
  final String? name;
  final String? price;
  final Set? priceSet;
  final bool? productExists;
  final int? productId;
  final List<NoteAttribute>? properties;
  final int? quantity;
  final bool? requiresShipping;
  final String? sku;
  final bool? taxable;
  final String? title;
  final String? totalDiscount;
  final Set? totalDiscountSet;
  final int? variantId;
  final String? variantInventoryManagement;
  final String? variantTitle;
  final dynamic vendor;
  final List<TaxLine>? taxLines;
  final List<dynamic>? duties;
  final List<DiscountAllocation>? discountAllocations;

  factory LineItem.fromJson(Map<String, dynamic> json) => LineItem(
        id: json["id"] ?? null,
        adminGraphqlApiId: json["admin_graphql_api_id"] ?? null,
        fulfillableQuantity: json["fulfillable_quantity"] ?? null,
        fulfillmentService: json["fulfillment_service"] ?? null,
        fulfillmentStatus: json["fulfillment_status"],
        giftCard: json["gift_card"] ?? null,
        grams: json["grams"] ?? null,
        name: json["name"] ?? null,
        price: json["price"] ?? null,
        priceSet:
            json["price_set"] == null ? null : Set.fromJson(json["price_set"]),
        productExists: json["product_exists"] ?? null,
        productId: json["product_id"] ?? null,
        properties: json["properties"] == null
            ? null
            : List<NoteAttribute>.from(
                json["properties"].map((x) => NoteAttribute.fromJson(x))),
        quantity: json["quantity"] ?? null,
        requiresShipping: json["requires_shipping"] ?? null,
        sku: json["sku"] ?? null,
        taxable: json["taxable"] ?? null,
        title: json["title"] ?? null,
        totalDiscount: json["total_discount"] ?? null,
        totalDiscountSet: json["total_discount_set"] == null
            ? null
            : Set.fromJson(json["total_discount_set"]),
        variantId: json["variant_id"] ?? null,
        variantInventoryManagement:
            json["variant_inventory_management"] ?? null,
        variantTitle: json["variant_title"] ?? null,
        vendor: json["vendor"],
        taxLines: json["tax_lines"] == null
            ? null
            : List<TaxLine>.from(
                json["tax_lines"].map((x) => TaxLine.fromJson(x))),
        duties: json["duties"] == null
            ? null
            : List<dynamic>.from(json["duties"].map((x) => x)),
        discountAllocations: json["discount_allocations"] == null
            ? null
            : List<DiscountAllocation>.from(json["discount_allocations"]
                .map((x) => DiscountAllocation.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? null,
        "admin_graphql_api_id": adminGraphqlApiId ?? null,
        "fulfillable_quantity": fulfillableQuantity ?? null,
        "fulfillment_service": fulfillmentService ?? null,
        "fulfillment_status": fulfillmentStatus,
        "gift_card": giftCard ?? null,
        "grams": grams ?? null,
        "name": name ?? null,
        "price": price ?? null,
        "price_set": priceSet == null ? null : priceSet!.toJson(),
        "product_exists": productExists ?? null,
        "product_id": productId ?? null,
        "properties": properties == null
            ? null
            : List<dynamic>.from(properties!.map((x) => x.toJson())),
        "quantity": quantity ?? null,
        "requires_shipping": requiresShipping ?? null,
        "sku": sku ?? null,
        "taxable": taxable ?? null,
        "title": title ?? null,
        "total_discount": totalDiscount ?? null,
        "total_discount_set":
            totalDiscountSet == null ? null : totalDiscountSet!.toJson(),
        "variant_id": variantId ?? null,
        "variant_inventory_management": variantInventoryManagement ?? null,
        "variant_title": variantTitle ?? null,
        "vendor": vendor,
        "tax_lines": taxLines == null
            ? null
            : List<dynamic>.from(taxLines!.map((x) => x.toJson())),
        "duties":
            duties == null ? null : List<dynamic>.from(duties!.map((x) => x)),
        "discount_allocations": discountAllocations == null
            ? null
            : List<dynamic>.from(discountAllocations!.map((x) => x.toJson())),
      };
}

class DiscountAllocation {
  DiscountAllocation({
    required this.amount,
    required this.amountSet,
    required this.discountApplicationIndex,
  });

  final String? amount;
  final Set? amountSet;
  final int? discountApplicationIndex;

  factory DiscountAllocation.fromJson(Map<String, dynamic> json) =>
      DiscountAllocation(
        amount: json["amount"] ?? null,
        amountSet: json["amount_set"] == null
            ? null
            : Set.fromJson(json["amount_set"]),
        discountApplicationIndex: json["discount_application_index"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "amount": amount ?? null,
        "amount_set": amountSet == null ? null : amountSet!.toJson(),
        "discount_application_index": discountApplicationIndex ?? null,
      };
}

class NoteAttribute {
  NoteAttribute({
    required this.name,
    required this.value,
  });

  final String? name;
  final String? value;

  factory NoteAttribute.fromJson(Map<String, dynamic> json) => NoteAttribute(
        name: json["name"] ?? null,
        value: json["value"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "name": name ?? null,
        "value": value ?? null,
      };
}

class TaxLine {
  TaxLine({
    required this.price,
    required this.priceSet,
    required this.rate,
    required this.title,
  });

  final String? price;
  final Set? priceSet;
  final double? rate;
  final String? title;

  factory TaxLine.fromJson(Map<String, dynamic> json) => TaxLine(
        price: json["price"] ?? null,
        priceSet:
            json["price_set"] == null ? null : Set.fromJson(json["price_set"]),
        rate: json["rate"] == null ? null : json["rate"].toDouble(),
        title: json["title"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "price": price ?? null,
        "price_set": priceSet == null ? null : priceSet!.toJson(),
        "rate": rate ?? null,
        "title": title ?? null,
      };
}

class FulfillmentReceipt {
  FulfillmentReceipt({
    required this.testcase,
    required this.authorization,
  });

  final bool? testcase;
  final String? authorization;

  factory FulfillmentReceipt.fromJson(Map<String, dynamic> json) =>
      FulfillmentReceipt(
        testcase: json["testcase"] ?? null,
        authorization: json["authorization"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "testcase": testcase ?? null,
        "authorization": authorization ?? null,
      };
}

class PaymentDetails {
  PaymentDetails({
    required this.creditCardBin,
    required this.avsResultCode,
    required this.cvvResultCode,
    required this.creditCardNumber,
    required this.creditCardCompany,
  });

  final dynamic creditCardBin;
  final dynamic avsResultCode;
  final dynamic cvvResultCode;
  final String? creditCardNumber;
  final String? creditCardCompany;

  factory PaymentDetails.fromJson(Map<String, dynamic> json) => PaymentDetails(
        creditCardBin: json["credit_card_bin"],
        avsResultCode: json["avs_result_code"],
        cvvResultCode: json["cvv_result_code"],
        creditCardNumber: json["credit_card_number"] ?? null,
        creditCardCompany: json["credit_card_company"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "credit_card_bin": creditCardBin,
        "avs_result_code": avsResultCode,
        "cvv_result_code": cvvResultCode,
        "credit_card_number": creditCardNumber ?? null,
        "credit_card_company": creditCardCompany ?? null,
      };
}

class Refund {
  Refund({
    required this.id,
    required this.adminGraphqlApiId,
    required this.createdAt,
    required this.note,
    required this.orderId,
    required this.processedAt,
    required this.restock,
    required this.userId,
    required this.orderAdjustments,
    required this.transactions,
    required this.refundLineItems,
    required this.duties,
  });

  final int? id;
  final String? adminGraphqlApiId;
  final DateTime? createdAt;
  final String? note;
  final int? orderId;
  final DateTime? processedAt;
  final bool? restock;
  final int? userId;
  final List<dynamic>? orderAdjustments;
  final List<Transaction>? transactions;
  final List<RefundLineItem>? refundLineItems;
  final List<dynamic>? duties;

  factory Refund.fromJson(Map<String, dynamic> json) => Refund(
        id: json["id"] ?? null,
        adminGraphqlApiId: json["admin_graphql_api_id"] ?? null,
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        note: json["note"] ?? null,
        orderId: json["order_id"] ?? null,
        processedAt: json["processed_at"] == null
            ? null
            : DateTime.parse(json["processed_at"]),
        restock: json["restock"] ?? null,
        userId: json["user_id"] ?? null,
        orderAdjustments: json["order_adjustments"] == null
            ? null
            : List<dynamic>.from(json["order_adjustments"].map((x) => x)),
        transactions: json["transactions"] == null
            ? null
            : List<Transaction>.from(
                json["transactions"].map((x) => Transaction.fromJson(x))),
        refundLineItems: json["refund_line_items"] == null
            ? null
            : List<RefundLineItem>.from(json["refund_line_items"]
                .map((x) => RefundLineItem.fromJson(x))),
        duties: json["duties"] == null
            ? null
            : List<dynamic>.from(json["duties"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? null,
        "admin_graphql_api_id": adminGraphqlApiId ?? null,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "note": note ?? null,
        "order_id": orderId ?? null,
        "processed_at":
            processedAt == null ? null : processedAt!.toIso8601String(),
        "restock": restock ?? null,
        "user_id": userId ?? null,
        "order_adjustments": orderAdjustments == null
            ? null
            : List<dynamic>.from(orderAdjustments!.map((x) => x)),
        "transactions": transactions == null
            ? null
            : List<dynamic>.from(transactions!.map((x) => x.toJson())),
        "refund_line_items": refundLineItems == null
            ? null
            : List<dynamic>.from(refundLineItems!.map((x) => x.toJson())),
        "duties":
            duties == null ? null : List<dynamic>.from(duties!.map((x) => x)),
      };
}

class RefundLineItem {
  RefundLineItem({
    required this.id,
    required this.lineItemId,
    required this.locationId,
    required this.quantity,
    required this.restockType,
    required this.subtotal,
    required this.subtotalSet,
    required this.totalTax,
    required this.totalTaxSet,
    required this.lineItem,
  });

  final int? id;
  final int? lineItemId;
  final int? locationId;
  final int? quantity;
  final String? restockType;
  final double? subtotal;
  final Set? subtotalSet;
  final double? totalTax;
  final Set? totalTaxSet;
  final LineItem? lineItem;

  factory RefundLineItem.fromJson(Map<String, dynamic> json) => RefundLineItem(
        id: json["id"] ?? null,
        lineItemId: json["line_item_id"] ?? null,
        locationId: json["location_id"] ?? null,
        quantity: json["quantity"] ?? null,
        restockType: json["restock_type"] ?? null,
        subtotal: json["subtotal"] == null ? null : json["subtotal"].toDouble(),
        subtotalSet: json["subtotal_set"] == null
            ? null
            : Set.fromJson(json["subtotal_set"]),
        totalTax:
            json["total_tax"] == null ? null : json["total_tax"].toDouble(),
        totalTaxSet: json["total_tax_set"] == null
            ? null
            : Set.fromJson(json["total_tax_set"]),
        lineItem: json["line_item"] == null
            ? null
            : LineItem.fromJson(json["line_item"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? null,
        "line_item_id": lineItemId ?? null,
        "location_id": locationId ?? null,
        "quantity": quantity ?? null,
        "restock_type": restockType ?? null,
        "subtotal": subtotal ?? null,
        "subtotal_set": subtotalSet == null ? null : subtotalSet!.toJson(),
        "total_tax": totalTax ?? null,
        "total_tax_set": totalTaxSet == null ? null : totalTaxSet!.toJson(),
        "line_item": lineItem == null ? null : lineItem!.toJson(),
      };
}

class Transaction {
  Transaction({
    required this.id,
    required this.adminGraphqlApiId,
    required this.amount,
    required this.authorization,
    required this.createdAt,
    required this.currency,
    required this.deviceId,
    required this.errorCode,
    required this.gateway,
    required this.kind,
    required this.locationId,
    required this.message,
    required this.orderId,
    required this.parentId,
    required this.processedAt,
    required this.receipt,
    required this.sourceName,
    required this.status,
    required this.test,
    required this.userId,
  });

  final int? id;
  final String? adminGraphqlApiId;
  final String? amount;
  final String? authorization;
  final DateTime? createdAt;
  final Currency? currency;
  final dynamic deviceId;
  final dynamic errorCode;
  final String? gateway;
  final String? kind;
  final dynamic locationId;
  final dynamic message;
  final int? orderId;
  final int? parentId;
  final DateTime? processedAt;
  final TransactionReceipt? receipt;
  final String? sourceName;
  final String? status;
  final bool? test;
  final dynamic userId;

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        id: json["id"] ?? null,
        adminGraphqlApiId: json["admin_graphql_api_id"] ?? null,
        amount: json["amount"] ?? null,
        authorization: json["authorization"] ?? null,
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        currency: json["currency"] == null
            ? null
            : currencyValues.map![json["currency"]],
        deviceId: json["device_id"],
        errorCode: json["error_code"],
        gateway: json["gateway"] ?? null,
        kind: json["kind"] ?? null,
        locationId: json["location_id"],
        message: json["message"],
        orderId: json["order_id"] ?? null,
        parentId: json["parent_id"] ?? null,
        processedAt: json["processed_at"] == null
            ? null
            : DateTime.parse(json["processed_at"]),
        receipt: json["receipt"] == null
            ? null
            : TransactionReceipt.fromJson(json["receipt"]),
        sourceName: json["source_name"] ?? null,
        status: json["status"] ?? null,
        test: json["test"] ?? null,
        userId: json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? null,
        "admin_graphql_api_id": adminGraphqlApiId ?? null,
        "amount": amount ?? null,
        "authorization": authorization ?? null,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "currency": currency == null ? null : currencyValues.reverse[currency],
        "device_id": deviceId,
        "error_code": errorCode,
        "gateway": gateway ?? null,
        "kind": kind ?? null,
        "location_id": locationId,
        "message": message,
        "order_id": orderId ?? null,
        "parent_id": parentId ?? null,
        "processed_at":
            processedAt == null ? null : processedAt!.toIso8601String(),
        "receipt": receipt == null ? null : receipt!.toJson(),
        "source_name": sourceName ?? null,
        "status": status ?? null,
        "test": test ?? null,
        "user_id": userId,
      };
}

class TransactionReceipt {
  TransactionReceipt();

  factory TransactionReceipt.fromJson(Map<String, dynamic> json) =>
      TransactionReceipt();

  Map<String, dynamic> toJson() => {};
}

class ShippingLine {
  ShippingLine({
    required this.id,
    required this.carrierIdentifier,
    required this.code,
    required this.deliveryCategory,
    required this.discountedPrice,
    required this.discountedPriceSet,
    required this.phone,
    required this.price,
    required this.priceSet,
    required this.requestedFulfillmentServiceId,
    required this.source,
    required this.title,
    required this.taxLines,
    required this.discountAllocations,
  });

  final int? id;
  final dynamic carrierIdentifier;
  final String? code;
  final dynamic deliveryCategory;
  final String? discountedPrice;
  final Set? discountedPriceSet;
  final dynamic phone;
  final String? price;
  final Set? priceSet;
  final dynamic requestedFulfillmentServiceId;
  final String? source;
  final String? title;
  final List<dynamic>? taxLines;
  final List<dynamic>? discountAllocations;

  factory ShippingLine.fromJson(Map<String, dynamic> json) => ShippingLine(
        id: json["id"] ?? null,
        carrierIdentifier: json["carrier_identifier"],
        code: json["code"] ?? null,
        deliveryCategory: json["delivery_category"],
        discountedPrice: json["discounted_price"] ?? null,
        discountedPriceSet: json["discounted_price_set"] == null
            ? null
            : Set.fromJson(json["discounted_price_set"]),
        phone: json["phone"],
        price: json["price"] ?? null,
        priceSet:
            json["price_set"] == null ? null : Set.fromJson(json["price_set"]),
        requestedFulfillmentServiceId: json["requested_fulfillment_service_id"],
        source: json["source"] ?? null,
        title: json["title"] ?? null,
        taxLines: json["tax_lines"] == null
            ? null
            : List<dynamic>.from(json["tax_lines"].map((x) => x)),
        discountAllocations: json["discount_allocations"] == null
            ? null
            : List<dynamic>.from(json["discount_allocations"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? null,
        "carrier_identifier": carrierIdentifier,
        "code": code ?? null,
        "delivery_category": deliveryCategory,
        "discounted_price": discountedPrice ?? null,
        "discounted_price_set":
            discountedPriceSet == null ? null : discountedPriceSet!.toJson(),
        "phone": phone,
        "price": price ?? null,
        "price_set": priceSet == null ? null : priceSet!.toJson(),
        "requested_fulfillment_service_id": requestedFulfillmentServiceId,
        "source": source ?? null,
        "title": title ?? null,
        "tax_lines": taxLines == null
            ? null
            : List<dynamic>.from(taxLines!.map((x) => x)),
        "discount_allocations": discountAllocations == null
            ? null
            : List<dynamic>.from(discountAllocations!.map((x) => x)),
      };
}

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap ??= map!.map((k, v) => MapEntry(v, k));
    return reverseMap!;
  }
}

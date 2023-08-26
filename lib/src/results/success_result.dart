class SuccessResult {
  SuccessResult({this.ip, this.security, this.location, this.network});

  /// Here, we're assigning values from the map to their specific local variable
  SuccessResult.fromJson(Map<String, dynamic> json) {
    ip = json["ip"];
    security =
        json["security"] != null ? Security.fromJson(json["security"]) : null;
    location =
        json["location"] != null ? Location.fromJson(json["location"]) : null;
    network =
        json["network"] != null ? Network.fromJson(json["network"]) : null;
  }
  String? ip;
  Security? security;
  Location? location;
  Network? network;

  /// Here, we're building a map of JSON. It is an inverse process of fromJson()
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["ip"] = ip;
    if (security != null) {
      data["security"] = security!.toJson();
    }
    if (location != null) {
      data["location"] = location!.toJson();
    }
    if (network != null) {
      data["network"] = network!.toJson();
    }
    return data;
  }
}

class Security {
  Security({this.vpn, this.proxy, this.tor, this.relay});

  /// Here, we're assigning values from the map to their specific local variable
  Security.fromJson(Map<String, dynamic> json) {
    vpn = json["vpn"];
    proxy = json["proxy"];
    tor = json["tor"];
    relay = json["relay"];
  }
  bool? vpn;
  bool? proxy;
  bool? tor;
  bool? relay;

  /// Here, we're building a map of JSON. It is an inverse process of fromJson()
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["vpn"] = vpn;
    data["proxy"] = proxy;
    data["tor"] = tor;
    data["relay"] = relay;
    return data;
  }
}

class Location {
  Location({
    this.city,
    this.region,
    this.country,
    this.continent,
    this.regionCode,
    this.countryCode,
    this.continentCode,
    this.latitude,
    this.longitude,
    this.timeZone,
    this.localeCode,
    this.metroCode,
    this.isInEuropeanUnion,
  });

  /// Here, we're assigning values from the map to their specific local variable
  Location.fromJson(Map<String, dynamic> json) {
    city = json["city"];
    region = json["region"];
    country = json["country"];
    continent = json["continent"];
    regionCode = json["region_code"];
    countryCode = json["country_code"];
    continentCode = json["continent_code"];
    latitude = json["latitude"];
    longitude = json["longitude"];
    timeZone = json["time_zone"];
    localeCode = json["locale_code"];
    metroCode = json["metro_code"];
    isInEuropeanUnion = json["is_in_european_union"];
  }
  String? city;
  String? region;
  String? country;
  String? continent;
  String? regionCode;
  String? countryCode;
  String? continentCode;
  String? latitude;
  String? longitude;
  String? timeZone;
  String? localeCode;
  String? metroCode;
  bool? isInEuropeanUnion;

  /// Here, we're building a map of JSON. It is an inverse process of fromJson()
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["city"] = city;
    data["region"] = region;
    data["country"] = country;
    data["continent"] = continent;
    data["region_code"] = regionCode;
    data["country_code"] = countryCode;
    data["continent_code"] = continentCode;
    data["latitude"] = latitude;
    data["longitude"] = longitude;
    data["time_zone"] = timeZone;
    data["locale_code"] = localeCode;
    data["metro_code"] = metroCode;
    data["is_in_european_union"] = isInEuropeanUnion;
    return data;
  }
}

class Network {
  Network({
    this.network,
    this.autonomousSystemNumber,
    this.autonomousSystemOrganization,
  });

  /// Here, we're assigning values from the map to their specific local variable
  Network.fromJson(Map<String, dynamic> json) {
    network = json["network"];
    autonomousSystemNumber = json["autonomous_system_number"];
    autonomousSystemOrganization = json["autonomous_system_organization"];
  }
  String? network;
  String? autonomousSystemNumber;
  String? autonomousSystemOrganization;

  /// Here, we're building a map of JSON. It is an inverse process of fromJson()
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["network"] = network;
    data["autonomous_system_number"] = autonomousSystemNumber;
    data["autonomous_system_organization"] = autonomousSystemOrganization;
    return data;
  }
}

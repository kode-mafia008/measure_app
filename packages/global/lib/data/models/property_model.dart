part of global;

class PropertyModel {
  final int? id;
  final int? noOfRooms;
  final int? listedBy;
  final String? title;
  final String? address;
  final bool? isKitchen;
  final double? lat;
  final double? lon;
  final bool? isOccupied;
  final int? floorLocated;
  final List<PropertyImages>? images;

  PropertyModel({
    this.id,
    this.noOfRooms,
    this.listedBy,
    this.title,
    this.address,
    this.isKitchen,
    this.lat,
    this.lon,
    this.isOccupied,
    this.floorLocated,
    this.images,
  });

  PropertyModel copyWith({
    int? id,
    int? noOfRooms,
    int? listedBy,
    String? title,
    String? address,
    bool? isKitchen,
    double? lat,
    double? lon,
    bool? isOccupied,
    int? floorLocated,
    List<PropertyImages>? images,
  }) =>
      PropertyModel(
        id: id ?? this.id,
        noOfRooms: noOfRooms ?? this.noOfRooms,
        listedBy: listedBy ?? this.listedBy,
        title: title ?? this.title,
        address : address  ?? this.address ,
        isKitchen: isKitchen ?? this.isKitchen,
        lat: lat ?? this.lat,
        lon: lon ?? this.lon,
        isOccupied: isOccupied ?? this.isOccupied,
        floorLocated: floorLocated ?? this.floorLocated,
        images: images ?? this.images,
      );

  factory PropertyModel.fromMap(Map<String, dynamic> json) => PropertyModel(
        id: json["id"],
        noOfRooms: json["no_of_rooms"],
        listedBy: json["listed_by"],
        title: json["title"],
        address: json["address"],
        isKitchen: json["is_kitchen"],
        lat: json["lat"]?.toDouble(),
        lon: json["lon"]?.toDouble(),
        isOccupied: json["is_occupied"],
        floorLocated: json["floor_located"],
        images: json["images"] == null
            ? []
            : List<PropertyImages>.from(
                json["images"]!.map((x) => PropertyImages.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "no_of_rooms": noOfRooms,
        "listed_by": listedBy,
        "title":title,
        "address":address,
        "is_kitchen": isKitchen,
        "lat": lat,
        "lon": lon,
        "is_occupied": isOccupied,
        "floor_located": floorLocated,
        "images": images == null
            ? []
            : List<dynamic>.from(images!.map((x) => x.toMap())),
      };
}

class PropertyImages {
  final int? id;
  final String? image;
  final int? propertyList;

  PropertyImages({
    this.id,
    this.image,
    this.propertyList,
  });

  PropertyImages copyWith({
    int? id,
    String? image,
    int? propertyList,
  }) =>
      PropertyImages(
        id: id ?? this.id,
        image: image ?? this.image,
        propertyList: propertyList ?? this.propertyList,
      );

  factory PropertyImages.fromMap(Map<String, dynamic> json) => PropertyImages(
        id: json["id"],
        image: json["image"],
        propertyList: json["propertyList"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "image": image,
        "propertyList": propertyList,
      };
}

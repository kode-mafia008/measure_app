part of global;




class UserModel {
    final int? userId;
    final String? role;
    final bool? isSuperuser;
    final bool? isActive;
    final bool? emailVerified;

    UserModel({
        this.userId,
        this.role,
        this.isSuperuser,
        this.isActive,
        this.emailVerified,
    });

    UserModel copyWith({
        int? userId,
        String? role,
        bool? isSuperuser,
        bool? isActive,
        bool? emailVerified,
    }) => 
        UserModel(
            userId: userId ?? this.userId,
            role: role ?? this.role,
            isSuperuser: isSuperuser ?? this.isSuperuser,
            isActive: isActive ?? this.isActive,
            emailVerified: emailVerified ?? this.emailVerified,
        );

    factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        userId: json["user_id"],
        role: json["role"],
        isSuperuser: json["is_superuser"],
        isActive: json["is_active"],
        emailVerified: json["email_verified"],
    );

    Map<String, dynamic> toMap() => {
        "user_id": userId,
        "role": role,
        "is_superuser": isSuperuser,
        "is_active": isActive,
        "email_verified": emailVerified,
    };
}



// To parse this JSON data, do
//
//     final userListModel = userListModelFromMap(jsonString);



class UserListModel {
    final int? id;
    final DateTime? lastLogin;
    final bool? isSuperuser;
    final String? firstName;
    final String? lastName;
    final bool? isStaff;
    final String? role;
    final String? email;
    final String? phoneNo;
    final dynamic userImage;
    final bool? isActive;
    final DateTime? dateJoined;
    final bool? emailVerified;

    UserListModel({
        this.id,
        this.lastLogin,
        this.isSuperuser,
        this.firstName,
        this.lastName,
        this.isStaff,
        this.role,
        this.email,
        this.phoneNo,
        this.userImage,
        this.isActive,
        this.dateJoined,
        this.emailVerified,
    });

    UserListModel copyWith({
        int? id,
        DateTime? lastLogin,
        bool? isSuperuser,
        String? firstName,
        String? lastName,
        bool? isStaff,
        String? role,
        String? email,
        String? phoneNo,
        dynamic userImage,
        bool? isActive,
        DateTime? dateJoined,
        bool? emailVerified,
    }) => 
        UserListModel(
            id: id ?? this.id,
            lastLogin: lastLogin ?? this.lastLogin,
            isSuperuser: isSuperuser ?? this.isSuperuser,
            firstName: firstName ?? this.firstName,
            lastName: lastName ?? this.lastName,
            isStaff: isStaff ?? this.isStaff,
            role: role ?? this.role,
            email: email ?? this.email,
            phoneNo: phoneNo ?? this.phoneNo,
            userImage: userImage ?? this.userImage,
            isActive: isActive ?? this.isActive,
            dateJoined: dateJoined ?? this.dateJoined,
            emailVerified: emailVerified ?? this.emailVerified,
        );

    factory UserListModel.fromMap(Map<String, dynamic> json) => UserListModel(
        id: json["id"],
        lastLogin: json["last_login"] == null ? null : DateTime.parse(json["last_login"]),
        isSuperuser: json["is_superuser"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        isStaff: json["is_staff"],
        role: json["role"],
        email: json["email"],
        phoneNo: json["phone_no"],
        userImage: json["user_image"],
        isActive: json["is_active"],
        dateJoined: json["date_joined"] == null ? null : DateTime.parse(json["date_joined"]),
        emailVerified: json["email_verified"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "last_login": lastLogin?.toIso8601String(),
        "is_superuser": isSuperuser,
        "first_name": firstName,
        "last_name": lastName,
        "is_staff": isStaff,
        "role": role,
        "email": email,
        "phone_no": phoneNo,
        "user_image": userImage,
        "is_active": isActive,
        "date_joined": dateJoined?.toIso8601String(),
        "email_verified": emailVerified,
    };
}

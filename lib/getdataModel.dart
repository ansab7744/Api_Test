
import 'dart:convert';

GetData getDataFromJson(String str) => GetData.fromJson(json.decode(str));

String getDataToJson(GetData data) => json.encode(data.toJson());

class GetData {
    final bool success;
    final Data data;
    final String message;
    final dynamic errors;

    GetData({
        required this.success,
        required this.data,
        required this.message,
        this.errors,
    });

    factory GetData.fromJson(Map<String, dynamic> json) => GetData(
        success: json["success"],
        data: Data.fromJson(json["data"]),
        message: json["message"],
        errors: json["errors"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
        "message": message,
        "errors": errors,
    };
}

class Data {
    final List<Lead> leads;
    final int totalCount;
    final int totalPage;
    final dynamic nextPageNo;
    final dynamic previousPageNo;
    final int currentPage;

    Data({
        required this.leads,
        required this.totalCount,
        required this.totalPage,
        this.nextPageNo,
        this.previousPageNo,
        required this.currentPage,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        leads: List<Lead>.from(json["leads"].map((x) => Lead.fromJson(x))),
        totalCount: json["total_count"],
        totalPage: json["total_page"],
        nextPageNo: json["next_page_no"],
        previousPageNo: json["previous_page_no"],
        currentPage: json["current_page"],
    );

    Map<String, dynamic> toJson() => {
        "leads": List<dynamic>.from(leads.map((x) => x.toJson())),
        "total_count": totalCount,
        "total_page": totalPage,
        "next_page_no": nextPageNo,
        "previous_page_no": previousPageNo,
        "current_page": currentPage,
    };
}

class Lead {
    final int id;
    final String source;
    final String name;
    final String mobile;
    final String email;
    final dynamic image;
    final String interest;
    final String location;
    final bool isAssigned;
    final String status;
    final String priority;
    final DateTime createdAt;
    final DateTime updatedAt;

    Lead({
        required this.id,
        required this.source,
        required this.name,
        required this.mobile,
        required this.email,
        this.image,
        required this.interest,
        required this.location,
        required this.isAssigned,
        required this.status,
        required this.priority,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Lead.fromJson(Map<String, dynamic> json) => Lead(
        id: json["id"],
        source: json["source"],
        name: json["name"],
        mobile: json["mobile"],
        email: json["email"],
        image: json["image"],
        interest: json["interest"],
        location: json["location"],
        isAssigned: json["is_assigned"],
        status: json["status"],
        priority: json["priority"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "source": source,
        "name": name,
        "mobile": mobile,
        "email": email,
        "image": image,
        "interest": interest,
        "location": location,
        "is_assigned": isAssigned,
        "status": status,
        "priority": priority,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

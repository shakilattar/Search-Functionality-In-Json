import 'package:flutter/material.dart';

class Products {
  String? pName;
  int? pId;
  int? pCost;
  int? pAvailability;
  String? pDetails;
  String? pCategory;
  String? pImageUrl;

  Products({
    required this.pName,
    required this.pId,
    required this.pCost,
    required this.pAvailability,
    required this.pDetails,
    required this.pCategory,
    required this.pImageUrl,
  });

  Products.fromJson(Map<String, dynamic> json) {
    pName = json['p_name'];
    pId = json['p_id'];
    pCost = json['p_cost'];
    pAvailability = json['p_availability'];
    pDetails = json['p_details'];
    pCategory = json['p_category'];
    pImageUrl = json['p_imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['p_name'] = this.pName;
    data['p_id'] = this.pId;
    data['p_cost'] = this.pCost;
    data['p_availability'] = this.pAvailability;
    data['p_details'] = this.pDetails;
    data['p_category'] = this.pCategory;
    data['p_imageUrl'] = this.pImageUrl;
    return data;
  }
}

// to define text that will search
// String text = '';

// var response = DefaultAssetBundle.of(context).loadString(key)

// // to define all of product list
// List<Products> products = [];
 
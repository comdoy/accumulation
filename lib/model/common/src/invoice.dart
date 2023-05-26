import 'package:accumulation/view_pages/home/src/page/resume_page.dart';
import 'package:flutter/material.dart';

class Invoice {
  final String customer;
  final String address;
  final List<LineItem> items;
  Invoice(this.customer, this.address, this.items);
  // double totalCost() {
  //   return items.fold(0, (previousValue, element) => previousValue + element.cost);
  // }
}

class LineItem {
  final String? description;
  final String? cost;

  LineItem(this.description, this.cost);
}

class InfoUser {
  final String? title;
  final IconData? icon;
  final IconData? iconfont;
  final ResumeCellKeys keys;
  final Map<String, String>? map;
  InfoUser(
    this.title,
    this.icon,
    this.iconfont,
    this.keys,
    this.map,
  );
}

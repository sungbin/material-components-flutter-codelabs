// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/foundation.dart';

class Product {
  Product({
    @required this.id,
    @required this.name,
    @required this.phone,
    @required this.star_count,
    @required this.location,
    @required this.description
  })  : assert(id != null),
        assert(name != null),
        assert(phone != null),
        assert(star_count != null),
        assert(location != null),
        assert(description != null);

  final int id;
  final String name;
  final String phone;
  final int star_count;
  final String location;
  final String description;
  bool is_favorite = false;

  String get assetName => 'assets/hotels/$id.jpg';

  @override
  String toString() => "$name (id=$id)";

  void toggle() => is_favorite = !is_favorite;
}

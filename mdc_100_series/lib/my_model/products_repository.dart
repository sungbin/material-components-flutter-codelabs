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

import 'product.dart';

class ProductsRepository {
  static List<Product> loadProducts() {
    const allProducts = <Product> [
      Product(
        id: 0,
        star_count: 1,
        location: 'Ramada',
        name: 'QWEKJ',
        phone: '010-2719-5839',
        description: 'English has developed over the course of more than 1,400 years. The earliest forms of English, a group of West Germanic (Ingvaeonic) dialects brought to Great Britain by Anglo-Saxon settlers in the 5th century, are collectively called Old English. Middle English began in the late 11th century with the Norman conquest of England; this was a period in which the language was influenced by French.[7] Early Modern English began in the late 15th century with the introduction of the printing press to London',
      ),
      Product(
        id: 1,
        star_count: 3,
        location: 'Ramada',
        name: 'SD',
        phone: '016-332-1283',
        description: 'Through the worldwide influence of the British Empire, and later the United States, Modern English has been spreading around the world since the 17th century. Through all types of printed and electronic media, and spurred by the emergence of the United States as a global superpower, English has become the leading language of international discourse and the lingua franca in many regions and professional contexts such as science, navigation and law',
      ),
      Product(
        id: 2,
        star_count: 5,
        location: 'Pohang',
        name: 'ABC',
        phone: '010-4827-1739',
        description: 'English is the most commonly spoken language in the United Kingdom, the United States, Canada, Australia, Ireland and New Zealand, and it is widely spoken in some areas of the Caribbean, Africa and South Asia.[11] It is a co-official language of the United Nations, the European Union and many other world and regional international organisations. It is the most widely spoken Germanic language, accounting for at least 70% of speakers of this Indo-European branch. English has a vast vocabulary, though counting how many words any language has is impossible.[12][13] English speakers are called "Anglophones".',
      ),
      Product(
        id: 3,
        star_count: 3,
        location: 'Silla Stay',
        name: 'ASDG',
        phone: '010-4827-1739',
        description: 'English has developed over the course of more than 1,400 years. The earliest forms of English, a group of West Germanic (Ingvaeonic) dialects brought to Great Britain by Anglo-Saxon settlers in the 5th century, are collectively called Old English. Middle English began in the late 11th century with the Norman conquest of England; this was a period in which the language was influenced by French.[7] Early Modern English began in the late 15th century with the introduction of the printing press to London',
      ),
      Product(
        id: 4,
        star_count: 1,
        location: 'Silla Stay',
        name: 'SD',
        phone: '010-1234-1234',
        description: 'Through the worldwide influence of the British Empire, and later the United States, Modern English has been spreading around the world since the 17th century. Through all types of printed and electronic media, and spurred by the emergence of the United States as a global superpower, English has become the leading language of international discourse and the lingua franca in many regions and professional contexts such as science, navigation and law',
      ),
      Product(
        id: 5,
        star_count: 1,
        location: 'Silla Stay',
        name: 'PDD',
        phone: '010-2719-5839',
        description: 'English is the most commonly spoken language in the United Kingdom, the United States, Canada, Australia, Ireland and New Zealand, and it is widely spoken in some areas of the Caribbean, Africa and South Asia.[11] It is a co-official language of the United Nations, the European Union and many other world and regional international organisations. It is the most widely spoken Germanic language, accounting for at least 70% of speakers of this Indo-European branch. English has a vast vocabulary, though counting how many words any language has is impossible.[12][13] English speakers are called "Anglophones".',
      ),
      Product(
        id: 6,
        star_count: 2,
        location: 'Silla Stay',
        name: 'ABC',
        phone: '010-1234-1234',
        description: 'Modern English grammar is the result of a gradual change from a typical Indo-European dependent marking pattern with a rich inflectional morphology and relatively free word order to a mostly analytic pattern with little inflection, a fairly fixed SVO word order and a complex syntax.[14] Modern English relies more on auxiliary verbs and word order for the expression of complex tenses, aspect and mood, as well as passive constructions, interrogatives and some negation',
      ),
      Product(
        id: 7,
        star_count: 1,
        location: 'Pohang',
        name: 'ABC',
        phone: '010-2718-1479',
        description: 'Through the worldwide influence of the British Empire, and later the United States, Modern English has been spreading around the world since the 17th century. Through all types of printed and electronic media, and spurred by the emergence of the United States as a global superpower, English has become the leading language of international discourse and the lingua franca in many regions and professional contexts such as science, navigation and law',
      ),
      Product(
        id: 8,
        star_count: 1,
        location: 'Silla Stay',
        name: 'PDD',
        phone: '016-332-1283',
        description: 'English is the most commonly spoken language in the United Kingdom, the United States, Canada, Australia, Ireland and New Zealand, and it is widely spoken in some areas of the Caribbean, Africa and South Asia.[11] It is a co-official language of the United Nations, the European Union and many other world and regional international organisations. It is the most widely spoken Germanic language, accounting for at least 70% of speakers of this Indo-European branch. English has a vast vocabulary, though counting how many words any language has is impossible.[12][13] English speakers are called "Anglophones".',
      ),
      Product(
        id: 9,
        star_count: 5,
        location: 'Silla Stay',
        name: 'PDD',
        phone: '010-1234-1234',
        description: 'English is the most commonly spoken language in the United Kingdom, the United States, Canada, Australia, Ireland and New Zealand, and it is widely spoken in some areas of the Caribbean, Africa and South Asia.[11] It is a co-official language of the United Nations, the European Union and many other world and regional international organisations. It is the most widely spoken Germanic language, accounting for at least 70% of speakers of this Indo-European branch. English has a vast vocabulary, though counting how many words any language has is impossible.[12][13] English speakers are called "Anglophones".',
      ),
      Product(
        id: 10,
        star_count: 1,
        location: 'Silla Stay',
        name: 'JAVA',
        phone: '010-4827-1739',
        description: 'English is the most commonly spoken language in the United Kingdom, the United States, Canada, Australia, Ireland and New Zealand, and it is widely spoken in some areas of the Caribbean, Africa and South Asia.[11] It is a co-official language of the United Nations, the European Union and many other world and regional international organisations. It is the most widely spoken Germanic language, accounting for at least 70% of speakers of this Indo-European branch. English has a vast vocabulary, though counting how many words any language has is impossible.[12][13] English speakers are called "Anglophones".',
      ),
      Product(
        id: 11,
        star_count: 1,
        location: 'Silla Stay',
        name: 'QWE',
        phone: '010-1234-1234',
        description: 'Modern English grammar is the result of a gradual change from a typical Indo-European dependent marking pattern with a rich inflectional morphology and relatively free word order to a mostly analytic pattern with little inflection, a fairly fixed SVO word order and a complex syntax.[14] Modern English relies more on auxiliary verbs and word order for the expression of complex tenses, aspect and mood, as well as passive constructions, interrogatives and some negation',
      ),
      Product(
        id: 12,
        star_count: 4,
        location: 'Pohang',
        name: 'ABC',
        phone: '010-1234-1234',
        description: 'English is the most commonly spoken language in the United Kingdom, the United States, Canada, Australia, Ireland and New Zealand, and it is widely spoken in some areas of the Caribbean, Africa and South Asia.[11] It is a co-official language of the United Nations, the European Union and many other world and regional international organisations. It is the most widely spoken Germanic language, accounting for at least 70% of speakers of this Indo-European branch. English has a vast vocabulary, though counting how many words any language has is impossible.[12][13] English speakers are called "Anglophones".',
      ),
      Product(
        id: 13,
        star_count: 3,
        location: 'Ramada',
        name: 'QWEKJ',
        phone: '010-2719-5839',
        description: 'English has developed over the course of more than 1,400 years. The earliest forms of English, a group of West Germanic (Ingvaeonic) dialects brought to Great Britain by Anglo-Saxon settlers in the 5th century, are collectively called Old English. Middle English began in the late 11th century with the Norman conquest of England; this was a period in which the language was influenced by French.[7] Early Modern English began in the late 15th century with the introduction of the printing press to London',
      ),
      Product(
        id: 14,
        star_count: 1,
        location: 'Silla Stay',
        name: 'PDD',
        phone: '010-2719-5839',
        description: 'Through the worldwide influence of the British Empire, and later the United States, Modern English has been spreading around the world since the 17th century. Through all types of printed and electronic media, and spurred by the emergence of the United States as a global superpower, English has become the leading language of international discourse and the lingua franca in many regions and professional contexts such as science, navigation and law',
      ),
      Product(
        id: 15,
        star_count: 1,
        location: 'Pohang',
        name: 'QWE',
        phone: '010-1234-1234',
        description: 'English has developed over the course of more than 1,400 years. The earliest forms of English, a group of West Germanic (Ingvaeonic) dialects brought to Great Britain by Anglo-Saxon settlers in the 5th century, are collectively called Old English. Middle English began in the late 11th century with the Norman conquest of England; this was a period in which the language was influenced by French.[7] Early Modern English began in the late 15th century with the introduction of the printing press to London',
      ),
      Product(
        id: 16,
        star_count: 1,
        location: 'Pohang',
        name: 'PDD',
        phone: '010-2718-1479',
        description: 'Through the worldwide influence of the British Empire, and later the United States, Modern English has been spreading around the world since the 17th century. Through all types of printed and electronic media, and spurred by the emergence of the United States as a global superpower, English has become the leading language of international discourse and the lingua franca in many regions and professional contexts such as science, navigation and law',
      ),
      Product(
        id: 17,
        star_count: 3,
        location: 'Ramada',
        name: 'ASDG',
        phone: '010-2719-5839',
        description: 'English is the most commonly spoken language in the United Kingdom, the United States, Canada, Australia, Ireland and New Zealand, and it is widely spoken in some areas of the Caribbean, Africa and South Asia.[11] It is a co-official language of the United Nations, the European Union and many other world and regional international organisations. It is the most widely spoken Germanic language, accounting for at least 70% of speakers of this Indo-European branch. English has a vast vocabulary, though counting how many words any language has is impossible.[12][13] English speakers are called "Anglophones".',
      ),
      Product(
        id: 18,
        star_count: 1,
        location: 'Pohang',
        name: 'QWE',
        phone: '016-332-1283',
        description: 'English has developed over the course of more than 1,400 years. The earliest forms of English, a group of West Germanic (Ingvaeonic) dialects brought to Great Britain by Anglo-Saxon settlers in the 5th century, are collectively called Old English. Middle English began in the late 11th century with the Norman conquest of England; this was a period in which the language was influenced by French.[7] Early Modern English began in the late 15th century with the introduction of the printing press to London',
      ),
      Product(
        id: 19,
        star_count: 2,
        location: 'Silla Stay',
        name: 'ABC',
        phone: '016-332-1283',
        description: 'English is the most commonly spoken language in the United Kingdom, the United States, Canada, Australia, Ireland and New Zealand, and it is widely spoken in some areas of the Caribbean, Africa and South Asia.[11] It is a co-official language of the United Nations, the European Union and many other world and regional international organisations. It is the most widely spoken Germanic language, accounting for at least 70% of speakers of this Indo-European branch. English has a vast vocabulary, though counting how many words any language has is impossible.[12][13] English speakers are called "Anglophones".',
      ),
      Product(
        id: 20,
        star_count: 1,
        location: 'Silla Stay',
        name: 'QWE',
        phone: '010-1234-1234',
        description: 'English is the most commonly spoken language in the United Kingdom, the United States, Canada, Australia, Ireland and New Zealand, and it is widely spoken in some areas of the Caribbean, Africa and South Asia.[11] It is a co-official language of the United Nations, the European Union and many other world and regional international organisations. It is the most widely spoken Germanic language, accounting for at least 70% of speakers of this Indo-European branch. English has a vast vocabulary, though counting how many words any language has is impossible.[12][13] English speakers are called "Anglophones".',
      ),
      Product(
        id: 21,
        star_count: 1,
        location: 'Silla Stay',
        name: 'SD',
        phone: '016-332-1283',
        description: 'English is the most commonly spoken language in the United Kingdom, the United States, Canada, Australia, Ireland and New Zealand, and it is widely spoken in some areas of the Caribbean, Africa and South Asia.[11] It is a co-official language of the United Nations, the European Union and many other world and regional international organisations. It is the most widely spoken Germanic language, accounting for at least 70% of speakers of this Indo-European branch. English has a vast vocabulary, though counting how many words any language has is impossible.[12][13] English speakers are called "Anglophones".',
      ),

    ];
    return allProducts;
  }
}

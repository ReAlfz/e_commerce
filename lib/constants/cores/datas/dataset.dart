import 'dart:math';

import 'package:e_commerce/constants/cores/assets/image_constants.dart';
import 'package:e_commerce/constants/cores/assets/image_dataset.dart';
import 'package:e_commerce/features/home_screen/models/catalog_model.dart';
import 'package:e_commerce/shared/global_models/product_model.dart';
import 'package:e_commerce/shared/global_models/variant_model.dart';

class Dataset {
  static final catalog = <CatalogModel>[
    CatalogModel(
      title: 'Phone',
      image: ImageConstants.phoneCatalog,
    ),
    CatalogModel(
      title: 'Keyboard',
      image: ImageConstants.keyboardCatalog,
    ),
    CatalogModel(
      title: 'Monitor',
      image: ImageConstants.monitorCatalog,
    ),
    CatalogModel(
      title: 'Mouse',
      image: ImageConstants.mouseCatalog,
    ),
    CatalogModel(
      title: 'Gadget',
      image: ImageConstants.headphoneCatalog,
    ),
    CatalogModel(
      title: 'Chair',
      image: ImageConstants.chairCatalog,
    ),
  ];

  static final _keyboard = <ProductModel>[
    ProductModel(
      productId: 0,
      title: 'Royal Kludge M75',
      description: 'description',
      stock: 42,
      price: 800000,
      category: 'Keyboard',
      favorite: false,
      images: [
        ImageDataset.m75Blue,
        ImageDataset.m75Black,
      ],
      variantColor: [
        VariantModel(name: 'Blue', price: 3000, image: ImageDataset.m75Blue),
        VariantModel(name: 'Black', price: 2000, image: ImageDataset.m75Black),
      ],
      variantSwitch: [
        VariantModel(
          name: 'Fast Silver Switch',
          price: 80000,
        ),
        VariantModel(
          name: 'Viridian Switch',
          price: 120000,
        ),
        VariantModel(
          name: 'Pale Green Switch',
          price: 95000,
        ),
      ],
      rating: 4.8,
      goodReview: 95,
      numberChat: 13,
      totalReview: 713,
    ),
    ProductModel(
      productId: 1,
      title: 'Royal Kludge M87 TKL',
      description: 'description',
      stock: 23,
      price: 1000000,
      category: 'Keyboard',
      favorite: false,
      images: [
        ImageDataset.m87TKLBlue,
        ImageDataset.m87TKLRed,
      ],
      variantColor: [
        VariantModel(
            name: 'Blue', price: 30000, image: ImageDataset.m87TKLBlue),
        VariantModel(name: 'Red', price: 30000, image: ImageDataset.m87TKLRed),
      ],
      rating: 4.2,
      goodReview: 92,
      numberChat: 11,
      totalReview: 313,
    ),
    ProductModel(
      productId: 2,
      title: 'Royal Kludge RK 92 Full Size',
      description: 'description',
      stock: 14,
      images: [
        ImageDataset.rk92,
      ],
      price: 1900000,
      category: 'Keyboard',
      favorite: false,
      variantSwitch: [
        VariantModel(
          name: 'Brown Switch',
          price: 200000,
        ),
        VariantModel(
          name: 'Blue Switch',
          price: 20000,
        ),
        VariantModel(
          name: 'Red Switch',
          price: 20000,
        ),
      ],
      rating: 4.0,
      goodReview: 90,
      numberChat: 13,
      totalReview: 113,
    ),
    ProductModel(
      productId: 3,
      title: 'Royal Kludge N80 Low-profile',
      description: 'description',
      stock: 5,
      price: 1290000,
      category: 'Keyboard',
      favorite: false,
      images: [
        ImageDataset.n80Red,
        ImageDataset.n80grey,
      ],
      variantColor: [
        VariantModel(
            name: 'Dune Red', price: 17000, image: ImageDataset.n80Red),
        VariantModel(
            name: 'Sandy Grey', price: 14000, image: ImageDataset.n80grey),
      ],
      variantSwitch: [
        VariantModel(name: 'Brown Switch', price: 90000),
        VariantModel(name: 'Red Switch', price: 80000),
      ],
      rating: 4.9,
      goodReview: 98,
      numberChat: 40,
      totalReview: 1253,
    ),
    ProductModel(
      productId: 4,
      title: 'Royal Kludge RK84',
      description: 'description',
      stock: 15,
      price: 1000000,
      category: 'Keyboard',
      favorite: false,
      images: [
        ImageDataset.rk84Black,
        ImageDataset.rk84White,
      ],
      variantColor: [
        VariantModel(
            name: 'Americano Black',
            price: 14000,
            image: ImageDataset.rk84Black),
        VariantModel(
            name: 'Macchiato White',
            price: 14000,
            image: ImageDataset.rk84White),
      ],
      rating: 4.3,
      goodReview: 95,
      numberChat: 14,
      totalReview: 813,
    ),
  ];

  static final _chair = <ProductModel>[
    ProductModel(
      productId: 5,
      title: 'dbE Asana Pro',
      description: 'description',
      stock: 6,
      price: 3800000,
      category: 'Chair',
      favorite: false,
      images: [
        ImageDataset.dbe_black,
        ImageDataset.dbe_grey,
      ],
      variantColor: [
        VariantModel(
            name: 'Black', price: 100000, image: ImageDataset.dbe_black),
        VariantModel(
            name: 'White', price: 180000, image: ImageDataset.dbe_grey),
      ],
      rating: 4.6,
      goodReview: 97,
      numberChat: 14,
      totalReview: 33,
    ),
    ProductModel(
      productId: 6,
      title: 'fantech oca259s',
      description: 'description',
      stock: 21,
      price: 900000,
      category: 'Chair',
      favorite: false,
      images: [
        ImageDataset.oca_all,
        ImageDataset.oca_grey,
      ],
      variantColor: [
        VariantModel(name: 'Black', price: 60000, image: ImageDataset.oca_all),
        VariantModel(name: 'Grey', price: 80000, image: ImageDataset.oca_grey),
      ],
      rating: 4.0,
      goodReview: 93,
      numberChat: 13,
      totalReview: 73,
    ),
    ProductModel(
      productId: 7,
      title: 'Oxihom FM7217',
      description: 'description',
      stock: 21,
      price: 1500000,
      category: 'Chair',
      favorite: false,
      images: [
        ImageDataset.oxihom_black,
        ImageDataset.oxihom_white,
      ],
      variantColor: [
        VariantModel(
            name: 'Black', price: 200000, image: ImageDataset.oxihom_black),
        VariantModel(
            name: 'White', price: 300000, image: ImageDataset.oxihom_white),
      ],
      rating: 4.5,
      goodReview: 93,
      numberChat: 10,
      totalReview: 33,
    ),
    ProductModel(
      productId: 8,
      title: 'Pexio Milson',
      description: 'description',
      stock: 3,
      price: 3500000,
      category: 'Chair',
      favorite: false,
      images: [ImageDataset.milson],
      rating: 4.9,
      goodReview: 99,
      numberChat: 55,
      totalReview: 373,
    ),
    ProductModel(
      productId: 9,
      title: 'Rexus NC-4',
      description: 'description',
      stock: 12,
      price: 900000,
      category: 'Chair',
      favorite: false,
      images: [
        ImageDataset.rexus_white,
        ImageDataset.rexus_black,
      ],
      variantColor: [
        VariantModel(
            name: 'Black', price: 60000, image: ImageDataset.rexus_black),
        VariantModel(
            name: 'White', price: 80000, image: ImageDataset.rexus_white),
      ],
      rating: 4.5,
      goodReview: 93,
      numberChat: 18,
      totalReview: 63,
    ),
  ];

  static final _phone = <ProductModel>[
    ProductModel(
      productId: 10,
      title: 'Honor Magic6 Pro',
      description: 'description',
      stock: 15,
      price: 1700000,
      category: 'Phone',
      favorite: false,
      images: [
        ImageDataset.honor_green,
        ImageDataset.honor_white,
      ],
      variantColor: [
        VariantModel(
            name: 'Green', price: 300000, image: ImageDataset.honor_green),
        VariantModel(
            name: 'White', price: 500000, image: ImageDataset.honor_white),
      ],
      rating: 4.6,
      goodReview: 92,
      numberChat: 15,
      totalReview: 63,
    ),
    ProductModel(
      productId: 11,
      title: 'Iphone 12',
      description: 'description',
      stock: 24,
      price: 7000000,
      category: 'Phone',
      favorite: false,
      images: [
        ImageDataset.iphone_black,
        ImageDataset.iphone_green,
        ImageDataset.iphone_purple,
      ],
      variantColor: [
        VariantModel(
            name: 'Black', price: 800000, image: ImageDataset.iphone_black),
        VariantModel(
            name: 'Green', price: 1000000, image: ImageDataset.iphone_green),
        VariantModel(
            name: 'Purple', price: 1000000, image: ImageDataset.iphone_purple),
      ],
      rating: 4.6,
      goodReview: 89,
      numberChat: 21,
      totalReview: 723,
    ),
    ProductModel(
      productId: 12,
      title: 'Samsung S24 Ultra',
      description: 'description',
      stock: 18,
      price: 16000000,
      category: 'Phone',
      favorite: false,
      images: [
        ImageDataset.samsung_purple,
        ImageDataset.samsung_gold,
      ],
      variantColor: [
        VariantModel(
            name: 'Purple', price: 1000000, image: ImageDataset.samsung_purple),
        VariantModel(
            name: 'Gold', price: 1200000, image: ImageDataset.samsung_gold),
      ],
      rating: 3.9,
      goodReview: 95,
      numberChat: 18,
      totalReview: 213,
    ),
    ProductModel(
      productId: 13,
      title: 'Vivo X100',
      description: 'description',
      stock: 23,
      price: 9500000,
      category: 'Phone',
      favorite: false,
      images: [
        ImageDataset.vivo_black,
        ImageDataset.vivo_blue,
      ],
      variantColor: [
        VariantModel(
            name: 'Black', price: 600000, image: ImageDataset.vivo_black),
        VariantModel(
            name: 'Purple', price: 800000, image: ImageDataset.vivo_blue),
      ],
      rating: 3.7,
      goodReview: 82,
      numberChat: 25,
      totalReview: 513,
    ),
    ProductModel(
      productId: 14,
      title: 'Xiaomi 14 Ultra',
      description: 'description',
      stock: 53,
      price: 22000000,
      category: 'Phone',
      favorite: false,
      images: [
        ImageDataset.xiaomi_black,
        ImageDataset.xiaomi_blue,
        ImageDataset.xiaomi_grey,
      ],
      variantColor: [
        VariantModel(
            name: 'Black', price: 200000, image: ImageDataset.xiaomi_black),
        VariantModel(
            name: 'Blue', price: 320000, image: ImageDataset.xiaomi_blue),
        VariantModel(
            name: 'Grey', price: 400000, image: ImageDataset.xiaomi_grey),
      ],
      rating: 4.1,
      goodReview: 93,
      numberChat: 19,
      totalReview: 813,
    ),
  ];

  static final _monitor = <ProductModel>[
    ProductModel(
      productId: 15,
      title: "Koorui 25N5C",
      description: 'description',
      stock: 31,
      price: 1300000,
      category: 'Monitor',
      favorite: false,
      images: [ImageDataset.koorui],
      rating: 3.6,
      goodReview: 87,
      numberChat: 42,
      totalReview: 563,
    ),
    ProductModel(
      productId: 16,
      title: 'Skyworth 27B1H',
      description: 'description',
      stock: 12,
      price: 1400000,
      category: 'Monitor',
      favorite: false,
      images: [
        ImageDataset.skyworth_27b1h_1,
        ImageDataset.skyworth_27b1h_2,
      ],
      rating: 4.4,
      goodReview: 95,
      numberChat: 129,
      totalReview: 1213,
    ),
    ProductModel(
      productId: 17,
      title: 'Skyworth F27G1Q',
      description: 'description',
      stock: 0,
      price: 4200000,
      category: 'Monitor',
      favorite: false,
      images: [ImageDataset.skyworth_f27g1q],
      rating: 4.5,
      goodReview: 95,
      numberChat: 30,
      totalReview: 973,
    ),
    ProductModel(
      productId: 18,
      title: 'Xiaomi G27I',
      description: 'description',
      stock: 13,
      price: 1800000,
      category: 'Monitor',
      favorite: false,
      images: [
        ImageDataset.xiaomi_g27i_1,
        ImageDataset.xiaomi_g27i_2,
      ],
      rating: 4.6,
      goodReview: 82,
      numberChat: 145,
      totalReview: 293,
    ),
    ProductModel(
      productId: 19,
      title: 'Xiaomi G34WQI',
      description: 'description',
      stock: 23,
      price: 3800000,
      category: 'Monitor',
      favorite: false,
      images: [
        ImageDataset.xiaomi_g34wqi_1,
        ImageDataset.xiaomi_g34wqi_2,
        ImageDataset.xiaomi_g34wqi_3,
      ],
      rating: 4.4,
      goodReview: 84,
      numberChat: 123,
      totalReview: 583,
    ),
  ];

  static final _mouse = <ProductModel>[
    ProductModel(
      productId: 20,
      title: 'Fantech Phantom II VX68',
      description: 'description',
      stock: 100,
      price: 130000,
      category: 'Mouse',
      favorite: false,
      images: [
        ImageDataset.fantech_black,
        ImageDataset.fantech_white,
      ],
      variantColor: [
        VariantModel(
            name: 'Black', price: 0, image: ImageDataset.fantech_black),
        VariantModel(
            name: 'White', price: 0, image: ImageDataset.fantech_white),
      ],
      rating: 4.0,
      goodReview: 89,
      numberChat: 13,
      totalReview: 73,
    ),
    ProductModel(
      productId: 21,
      title: 'Logitech G102',
      description: 'description',
      stock: 300,
      price: 200000,
      category: 'Mouse',
      favorite: false,
      images: [
        ImageDataset.logitech_all,
        ImageDataset.logitech_black,
        ImageDataset.logitech_white,
      ],
      variantColor: [
        VariantModel(
            name: 'Black', price: 0, image: ImageDataset.logitech_black),
        VariantModel(
            name: 'White', price: 0, image: ImageDataset.logitech_white),
      ],
      rating: 4.6,
      goodReview: 96,
      numberChat: 23,
      totalReview: 821,
    ),
    ProductModel(
      productId: 22,
      title: 'Magic Mouse',
      description: 'description',
      stock: 31,
      price: 900000,
      category: 'Mouse',
      favorite: false,
      images: [
        ImageDataset.magic_mouse_black,
        ImageDataset.magic_mouse_white,
      ],
      variantColor: [
        VariantModel(
            name: 'Black', price: 0, image: ImageDataset.magic_mouse_black),
        VariantModel(
            name: 'White', price: 0, image: ImageDataset.magic_mouse_white),
      ],
      rating: 3.8,
      goodReview: 86,
      numberChat: 32,
      totalReview: 153,
    ),
    ProductModel(
      productId: 23,
      title: 'Msi M99',
      description: 'description',
      stock: 500,
      price: 130000,
      category: 'Mouse',
      favorite: false,
      images: [ImageDataset.msi_m99],
      rating: 3.5,
      goodReview: 85,
      numberChat: 15,
      totalReview: 33,
    ),
    ProductModel(
      productId: 24,
      title: 'Rexus Daxa Air',
      description: 'description',
      stock: 21,
      price: 450000,
      category: 'Mouse',
      favorite: false,
      images: [
        ImageDataset.daxa_white,
        ImageDataset.daxa_black,
      ],
      variantColor: [
        VariantModel(name: 'White', price: 0, image: ImageDataset.daxa_white),
        VariantModel(name: 'Black', price: 0, image: ImageDataset.daxa_black)
      ],
      rating: 4.2,
      goodReview: 91,
      numberChat: 34,
      totalReview: 81,
    ),
  ];

  static final _ear = [
    ProductModel(
      productId: 25,
      title: 'AirPods',
      description: 'description',
      stock: 12,
      price: 300000,
      category: 'Gadget',
      favorite: false,
      images: [ImageDataset.airpods],
      rating: 4.2,
      goodReview: 98,
      numberChat: 32,
      totalReview: 363,
    ),
    ProductModel(
      productId: 26,
      title: 'Anker Q20I',
      description: 'description',
      stock: 21,
      price: 510000,
      category: 'Gadget',
      favorite: false,
      images: [ImageDataset.anker_q20i],
      rating: 4.0,
      goodReview: 92,
      numberChat: 53,
      totalReview: 623,
    ),
    ProductModel(
      productId: 27,
      title: 'IEM Kz D-Fi',
      description: 'description',
      stock: 32,
      price: 200000,
      category: 'Gadget',
      favorite: false,
      images: [ImageDataset.kz_dfi_1, ImageDataset.kz_dfi_2],
      rating: 4.5,
      goodReview: 91,
      numberChat: 32,
      totalReview: 1023,
    ),
    ProductModel(
      productId: 28,
      title: 'IEM Moondrop Lan',
      description: 'description',
      stock: 12,
      price: 600000,
      category: 'Gadget',
      favorite: false,
      images: [ImageDataset.lan1, ImageDataset.lan2],
      rating: 4.8,
      goodReview: 96,
      numberChat: 32,
      totalReview: 2513,
    ),
    ProductModel(
      productId: 29,
      title: 'Rexus Vonix F80',
      description: 'description',
      stock: 11,
      price: 130000,
      category: 'Gadget',
      favorite: false,
      images: [ImageDataset.vonix_white, ImageDataset.vonix_black],
      variantColor: [
        VariantModel(name: 'White', price: 0, image: ImageDataset.vonix_white),
        VariantModel(name: 'Black', price: 0, image: ImageDataset.vonix_black)
      ],
      rating: 4.1,
      goodReview: 94,
      numberChat: 32,
      totalReview: 76,
    ),
  ];

  static final List<ProductModel> list = [
    ..._keyboard,
    ..._chair,
    ..._phone,
    ..._monitor,
    ..._mouse,
    ..._ear,
  ];

  static List<ProductModel> get flashSaleHome {
    list.shuffle(Random());
    final flashList = list.take(10).toList();
    return flashList;
  }

  static List<ProductModel> get flashSaleDetail {
    list.shuffle();
    return list;
  }
}

import 'dart:math';

import 'package:e_commerce/constants/cores/assets/image_constants.dart';
import 'package:e_commerce/constants/cores/assets/image_dataset.dart';
import 'package:e_commerce/modules/features/home_screen/models/catalog_model.dart';
import 'package:e_commerce/modules/global_models/product_model.dart';
import 'package:e_commerce/modules/global_models/variant_model.dart';

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
      title: 'Headphone',
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
      images: [
        ImageDataset.m75Blue,
        ImageDataset.m75Black,
      ],
      variantColor: [
        VariantModel(name: 'Blue', price: 3000),
        VariantModel(name: 'Black', price: 2000),
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
    ),
    ProductModel(
      productId: 1,
      title: 'Royal Kludge M87 TKL',
      description: 'description',
      stock: 23,
      price: 1000000,
      images: [
        ImageDataset.m87TKLBlue,
        ImageDataset.m87TKLRed,
      ],
      variantColor: [
        VariantModel(name: 'Blue', price: 30000),
        VariantModel(name: 'Red', price: 30000),
      ],
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
    ),
    ProductModel(
      productId: 3,
      title: 'Royal Kludge N80 Low-profile',
      description: 'description',
      stock: 5,
      price: 1290000,
      images: [
        ImageDataset.n80Red,
        ImageDataset.n80grey,
      ],
      variantColor: [
        VariantModel(name: 'Dune Red', price: 14000),
        VariantModel(name: 'Sandy Grey', price: 14000),
      ],
      variantSwitch: [
        VariantModel(name: 'Brown Switch', price: 80000),
        VariantModel(name: 'Red Switch', price: 80000),
      ],
    ),
    ProductModel(
      productId: 4,
      title: 'Royal Kludge RK84',
      description: 'description',
      stock: 15,
      price: 1000000,
      images: [
        ImageDataset.rk84Black,
        ImageDataset.rk84White,
      ],
      variantColor: [
        VariantModel(name: 'Americano Black', price: 14000),
        VariantModel(name: 'Macchiato White', price: 14000),
      ],
    ),
  ];

  static final _chair = <ProductModel>[
    ProductModel(
      productId: 5,
      title: 'dbE Asana Pro',
      description: 'description',
      stock: 6,
      price: 3800000,
      images: [
        ImageDataset.dbe_black,
        ImageDataset.dbe_grey,
      ],
      variantColor: [
        VariantModel(name: 'Black', price: 100000),
        VariantModel(name: 'White', price: 180000),
      ],
    ),
    ProductModel(
      productId: 6,
      title: 'fantech oca259s',
      description: 'description',
      stock: 21,
      price: 900000,
      images: [
        ImageDataset.oca_all,
        ImageDataset.oca_grey,
      ],
      variantColor: [
        VariantModel(name: 'Black', price: 60000),
        VariantModel(name: 'Grey', price: 80000),
      ],
    ),
    ProductModel(
      productId: 7,
      title: 'Oxihom FM7217',
      description: 'description',
      stock: 21,
      price: 1500000,
      images: [
        ImageDataset.oxihom_black,
        ImageDataset.oxihom_white,
      ],
      variantColor: [
        VariantModel(name: 'Black', price: 200000),
        VariantModel(name: 'White', price: 300000),
      ],
    ),
    ProductModel(
      productId: 8,
      title: 'Pexio Milson',
      description: 'description',
      stock: 3,
      price: 3500000,
      images: [ImageDataset.milson],
    ),
    ProductModel(
        productId: 9,
        title: 'Rexus NC-4',
        description: 'description',
        stock: 12,
        price: 900000,
        images: [
          ImageDataset.rexus_white,
          ImageDataset.rexus_black,
        ],
        variantColor: [
          VariantModel(name: 'Black', price: 60000),
          VariantModel(name: 'White', price: 80000),
        ]),
  ];

  static final _phone = <ProductModel>[
    ProductModel(
      productId: 10,
      title: 'Honor Magic6 Pro',
      description: 'description',
      stock: 15,
      price: 1700000,
      images: [
        ImageDataset.honor_green,
        ImageDataset.honor_white,
      ],
      variantColor: [
        VariantModel(name: 'Green', price: 300000),
        VariantModel(name: 'White', price: 500000),
      ],
    ),
    ProductModel(
      productId: 11,
      title: 'Iphone 12',
      description: 'description',
      stock: 24,
      price: 7000000,
      images: [
        ImageDataset.iphone_black,
        ImageDataset.iphone_green,
        ImageDataset.iphone_purple,
      ],
      variantColor: [
        VariantModel(name: 'Black', price: 800000),
        VariantModel(name: 'Green', price: 1000000),
        VariantModel(name: 'Purple', price: 1000000),
      ],
    ),
    ProductModel(
      productId: 12,
      title: 'Samsung S24 Ultra',
      description: 'description',
      stock: 18,
      price: 16000000,
      images: [
        ImageDataset.samsung_purple,
        ImageDataset.samsung_gold,
      ],
      variantColor: [
        VariantModel(name: 'Purple', price: 1000000),
        VariantModel(name: 'Gold', price: 1200000),
      ],
    ),
    ProductModel(
      productId: 13,
      title: 'Vivo X100',
      description: 'description',
      stock: 23,
      price: 9500000,
      images: [
        ImageDataset.vivo_black,
        ImageDataset.vivo_blue,
      ],
      variantColor: [
        VariantModel(name: 'Black', price: 600000),
        VariantModel(name: 'Purple', price: 800000),
      ],
    ),
    ProductModel(
      productId: 14,
      title: 'Xiaomi 14 Ultra',
      description: 'description',
      stock: 53,
      price: 22000000,
      images: [
        ImageDataset.xiaomi_black,
        ImageDataset.xiaomi_blue,
        ImageDataset.xiaomi_grey,
      ],
      variantColor: [
        VariantModel(name: 'Black', price: 200000),
        VariantModel(name: 'Blue', price: 320000),
        VariantModel(name: 'Grey', price: 400000),
      ],
    ),
  ];

  static final _monitor = <ProductModel>[
    ProductModel(
      productId: 15,
      title: "Koorui 25N5C",
      description: 'description',
      stock: 31,
      price: 1300000,
      images: [ImageDataset.koorui],
    ),
    ProductModel(
      productId: 16,
      title: 'Skyworth 27B1H',
      description: 'description',
      stock: 12,
      price: 1400000,
      images: [
        ImageDataset.skyworth_27b1h_1,
        ImageDataset.skyworth_27b1h_2,
      ],
    ),
    ProductModel(
      productId: 17,
      title: 'Skyworth F27G1Q',
      description: 'description',
      stock: 0,
      price: 4200000,
      images: [ImageDataset.skyworth_f27g1q],
    ),
    ProductModel(
      productId: 18,
      title: 'Xiaomi G27I',
      description: 'description',
      stock: 13,
      price: 1800000,
      images: [
        ImageDataset.xiaomi_g27i_1,
        ImageDataset.xiaomi_g27i_2,
      ],
    ),
    ProductModel(
      productId: 19,
      title: 'Xiaomi G34WQI',
      description: 'description',
      stock: 23,
      price: 3800000,
      images: [
        ImageDataset.xiaomi_g34wqi_1,
        ImageDataset.xiaomi_g34wqi_2,
        ImageDataset.xiaomi_g34wqi_3,
      ],
    ),
  ];

  static final _mouse = <ProductModel>[
    ProductModel(
      productId: 20,
      title: 'Fantech Phantom II VX68',
      description: 'description',
      stock: 100,
      price: 130000,
      images: [
        ImageDataset.fantech_black,
        ImageDataset.fantech_white,
      ],
      variantColor: [
        VariantModel(name: 'Black', price: 0),
        VariantModel(name: 'White', price: 0),
      ],
    ),
    ProductModel(
      productId: 21,
      title: 'Logitech G102',
      description: 'description',
      stock: 300,
      price: 200000,
      images: [
        ImageDataset.logitech_all,
        ImageDataset.logitech_black,
        ImageDataset.logitech_white,
      ],
      variantColor: [
        VariantModel(name: 'Black', price: 0),
        VariantModel(name: 'White', price: 0),
      ],
    ),
    ProductModel(
      productId: 22,
      title: 'Magic Mouse',
      description: 'description',
      stock: 31,
      price: 900000,
      images: [
        ImageDataset.magic_mouse_black,
        ImageDataset.magic_mouse_white,
      ],
      variantColor: [
        VariantModel(name: 'Black', price: 0),
        VariantModel(name: 'White', price: 0),
      ],
    ),
    ProductModel(
      productId: 23,
      title: 'Msi M99',
      description: 'description',
      stock: 500,
      price: 130000,
      images: [ImageDataset.msi_m99],
    ),
    ProductModel(
      productId: 24,
      title: 'Rexus Daxa Air',
      description: 'description',
      stock: 21,
      price: 450000,
      images: [
        ImageDataset.daxa_white,
        ImageDataset.daxa_black,
      ],
    ),
  ];

  static final _ear = [
    ProductModel(
      productId: 25,
      title: 'AirPods',
      description: 'description',
      stock: 12,
      price: 300000,
      images: [ImageDataset.airpods],
    ),
    ProductModel(
      productId: 26,
      title: 'Anker Q20I',
      description: 'description',
      stock: 21,
      price: 510000,
      images: [ImageDataset.anker_q20i],
    ),
    ProductModel(
      productId: 27,
      title: 'IEM Kz D-Fi',
      description: 'description',
      stock: 32,
      price: 200000,
      images: [ImageDataset.kz_dfi_1, ImageDataset.kz_dfi_2],
    ),
    ProductModel(
      productId: 28,
      title: 'IEM Moondrop Lan',
      description: 'description',
      stock: 12,
      price: 600000,
      images: [ImageDataset.lan1, ImageDataset.lan2],
    ),
    ProductModel(
      productId: 29,
      title: 'Rexus Vonix F80',
      description: 'description',
      stock: 11,
      price: 130000,
      images: [ImageDataset.vonix_white, ImageDataset.vonix_black],
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

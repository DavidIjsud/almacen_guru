import 'dart:convert';

import 'package:tech_interview/features/checkout_show/data/data_sources/data_source_checkout.dart';
import 'package:tech_interview/features/checkout_show/data/dtos/show.dart';
import 'package:tech_interview/features/checkout_show/data/dtos/card_data.dart';
import 'package:tech_interview/features/checkout_show/domain/entities/order.dart';

class DataSourceCheckoutImpl implements DataSourceCheckout {
  @override
  Future<bool> executeCheckout(CardData cardData) async {
    //TODO: simulate a network call to payment gateway passing data as body or how the payment gateway requires
    return await Future.delayed(const Duration(seconds: 5), () {
      return true;
    });
  }

  @override
  Future<bool> executePayment(List<ItemOrdened> orden) async {
    //TODO: if executeCheckout is true, then executePayment to send data to backend using Payment object that include CardData and PaymentAmount
    return await Future.delayed(const Duration(seconds: 5), () {
      return true;
    });
  }

  @override
  Future<List<Show>> getShows() async {
    //TODO: this Future.delayed is to simulate the await for response from api
    return await Future.delayed(const Duration(seconds: 5), () {
      final Map<String, dynamic> resultFromApi =
          jsonDecode(fakeResponseOfShows);
      //TODO: we have to check wether the status of response is 200 as well.
      if (resultFromApi["status"] == true) {
        return List<Show>.from(
            resultFromApi['payload']['shows'].map((x) => Show.fromJson(x)));
      } else {
        return [];
      }
    });
  }
}

String fakeResponseOfShows = """{
    "status" : true,
    "message" : "Request success",
    "payload" : {
         "shows" : [
             {
                 "nameShow" : "Teatro Kids",
                 "descriptionShow" : "Sketch teatral para niños, para en beneficio de los niños con cancer y otras enfermedades terminales",
                 "priceShow" : 3000.0,
                 "serviceFee" : 0.0,
                 "orderProcessingFee" : 0.0,
                 "deliveryPrice" : 0.0,
                 "notesFromSeller" : "Mostrar codigo QR del ticket al ingresar al teatro",
                 "addressShow" : "Santiago-Chile, teatro Santiago nro 34"
             },
              {
                 "nameShow" : "Concierto de Daddy Yankee",
                 "descriptionShow" : "Ultima gira del big boss en Santiago-Chile, en el mejor teatro, imperdible!!!",
                 "priceShow" : 5000.0,
                 "serviceFee" : 100.0,
                 "orderProcessingFee" : 10.0,
                 "deliveryPrice" : 50.0,
                 "notesFromSeller" : "Verificar por el codigo QR la veracidad del ticket",
                 "addressShow" : "Santiago-Chile, teatro Santiago nro 44"
             },
             {
                 "nameShow" : "Partido Colo Colo Vs Real Madrid",
                 "descriptionShow" : "Partido historico entre grandes de dos paises se enfrentan esta noche apartir de las 20:00",
                 "priceShow" : 500.0,
                 "serviceFee" : 0.0,
                 "orderProcessingFee" : 0.0,
                 "deliveryPrice" : 100.0,
                 "notesFromSeller" : "Unico precio en cualquier sector.",
                 "addressShow" : "Estadio principal de Santiago de Chile."
             }
         ]
    }
}""";

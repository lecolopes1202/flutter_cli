import 'package:flutter/material.dart';
import 'package:Employee_Management/Model/hotelModel.dart';

class HoteisDetalhes extends StatelessWidget {
  hotelModel hotel;
  HoteisDetalhes({Key? key, required this.hotel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        children: [
          Image.network(hotel.foto,
              height: 250,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover),
          Padding(
            padding: EdgeInsets.only(top: 24, left: 24),
            child: Text(
              hotel.nome,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 60, left: 24),
            child: Text(
              hotel.endereco,
            ),
          ),
        ],
      ),
    );
  }
}

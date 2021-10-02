
import 'package:flutter/material.dart';
import 'package:Employee_Management/Model/hotel.dart';

class HoteisRepository extends ChangeNotifier {
  final List<Hotel> _hoteis = [
    Hotel(
      nome: 'Hotel X',
      endereco: 'R. João Negrão, 1072 - Rebouças - Centro, Curitiba - PR',
      foto:
          'https://lh5.googleusercontent.com/p/AF1QipP_xnSi5-sp9slSuMpSx-JlmvwvHGL1VJ_JcOGX=w408-h306-k-no',
      latitude: -25.4361979,
      longitude: -49.2624613,
    ),
    Hotel(
      nome: 'Hoteol Y',
      endereco: 'Av. Presidente Affonso Camargo 10 - Rebouças, Curitiba - PR',
      foto:
          'https://lh5.googleusercontent.com/p/AF1QipPnfQSsnvt6-VAxF-fUQ0onQCeRktJptOvSL_9F=w408-h306-k-no',
      latitude: -25.435538,
      longitude: -49.2623809,
    ),
    Hotel(
      nome: 'Hotel Z',
      endereco: 'R. Tibagi, 652 - Centro, Curitiba - PR',
      foto:
          'https://lh5.googleusercontent.com/p/AF1QipOB2w7C9Q_NTblNRhcxJtN3-s4_gSjHI1rs5cSM=w408-h544-k-no',
      latitude: -25.435260,
      longitude: -49.2620769,
    ),
  ];

  List<Hotel> get hoteis => _hoteis;
}

import 'dart:js';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
//import 'package:postos_locais/pages/postos_page.dart';
//import 'package:postos_locais/repositories/postos_repository.dart';
//import 'package:postos_locais/widgets/posto_detalhes.dart';
import 'package:Employee_Management/Screens/mapsPage.dart';
import 'package:Employee_Management/repositorio/hoteisRepository.dart';
import 'package:Employee_Management/widgets/hoteisDetalhes.dart';
//import 'package:Employee_Management/Model/hotel.dart';



class HoteisController extends ChangeNotifier {
  double lat = 0.0;
  double long = 0.0;
  String erro = '';
  Set<Marker> markers = Set<Marker>();
  GoogleMapController _mapsController; // talvez precise de um late  GoogleMapController _mapsController;
// olhar isso pro late https://blog.gskinner.com/archives/2021/03/flutter-lazy-instantiation-with-the-late-keyword.html

   //PostosController() {
    // getPosicao();
   //}
  get mapsController => _mapsController;

  onMapCreated(GoogleMapController gmc) async {
    _mapsController = gmc;
    getPosicao();
    loadPostos(); 
  }
// Depois arrumar pra vir do BD
  loadPostos() {
    final hoteis = HoteisRepository().hoteis;
    hoteis.forEach(( hotel) async {
      markers.add(
        Marker(
          markerId: MarkerId(hotel.nome), // depois adionar pelo ID do DB
          position: LatLng(hotel.latitude, hotel.longitude), //tbm
          icon: await BitmapDescriptor.fromAssetImage(
            ImageConfiguration(),
            'imagens/hotel.png',
          ),
          onTap: () => {
            /*showModalBottomSheet(
              context: appKey.currentState.context,
              builder: (context) => HotelDetalhes(hotel: hotel),
            )*/
          },
        ),
      );
    });
    notifyListeners();
  }

  getPosicao() async {
    try {
      Position posicao = await _posicaoAtual();
      lat = posicao.latitude;
      long = posicao.longitude;
      _mapsController.animateCamera(CameraUpdate.newLatLng(LatLng(lat, long)));
    } catch (e) {
      erro = e.toString();
    }
    notifyListeners();
  }
  //ver depois pra ficar atualizando com um tempo de amostragel PathGeolocator

  Future<Position> _posicaoAtual() async {
    LocationPermission permissao;

    bool ativado = await Geolocator.isLocationServiceEnabled();
    if (!ativado) {
      return Future.error('Por favor, habilite a localização no smartphone');
    }

    permissao = await Geolocator.checkPermission();
    if (permissao == LocationPermission.denied) {
      permissao = await Geolocator.requestPermission();
      if (permissao == LocationPermission.denied) {
        return Future.error('Você precisa autorizar o acesso à localização');
      }
    }

    if (permissao == LocationPermission.deniedForever) {
      return Future.error('Você precisa autorizar o acesso à localização');
    }

    return await Geolocator.getCurrentPosition();
  }
}

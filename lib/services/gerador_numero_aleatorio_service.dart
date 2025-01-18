import 'dart:math';

class GeradorNumeroAleatorioService {
   static int gerarNumAleatorio(int numMax) {
    Random numeroAleatorio = Random();
    return numeroAleatorio.nextInt(numMax);
  }
}
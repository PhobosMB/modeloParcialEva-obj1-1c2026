object eva01 {
  var campoAt= 2110
  var energia = 100
  method efectoDeSincroCon(piloto) {
    energia -= 25
    campoAt = 2150.min(campoAt+1)

  }
  method recargarEnergia(horas) { energia = 100.min(energia + 30*horas)}
  method puedeSincronizarCon(piloto) = piloto.puntosDeEntrenamiento() >= 4 and energia > 30
  method puntosQueOtorga() = 2
}

object eva02 {
  method campoAt()= 2114
  var energia = 100
  var modo = estandar
  method efectoDeSincroCon(piloto) {
    energia -= modo.consumo()
    energia = 0.max(energia-modo.consumo())

  }
  method cambiarModo(modoNuevo) {modo = modoNuevo}
  method recargarEnergia(horas) { energia = 100.min(energia + 25*horas)}
  method puedeSincronizarCon(piloto) = piloto.puntosDeEntrenamiento() >= 2 and energia > 20
  method puntosQueOtorga() = modo.puntosQueOtorga()
}

object estandar {
  method consumo() = 10
  method puntosQueOtorga() = 1
}

object ataque {
  method consumo() = 20
  method puntosQueOtorga() = 3
}

object berserk {
  method consumo() = 35
  method puntosQueOtorga() = 6
}

object eva00 {
  var campoAt= 2100
  method campoAt() = campoAt
  //Fuerza debe ser >= 0
  method mejoraCampoAt(fuerza) { campoAt = (campoAt+fuerza).min(2150)}
  method efectoDeSincroCon(piloto) { piloto.entrenar(self.puntosQueOtorga())}
  method puedeSincronizarCon(piloto) = true
  method puntosQueOtorga() = 1
}

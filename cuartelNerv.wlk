object nerv {
    const property evas = [] 
    const pilotos = []

    method registrarPiloto(piloto) { pilotos.add(piloto) }
    method registrarEva(eva) { evas.add(eva) }
    method registrarPilotos(piloto) { pilotos.addAll(piloto) }
    method registrarEvas(eva) { evas.addAll(eva) }

    method echarPiloto(piloto) { pilotos.remove(piloto) }
    method echarEva(eva) { evas.remove(eva) }
    method echarPilotos(piloto) { pilotos.removeAll(piloto) }
    method echarEvas(eva) { evas.removeAll(eva) }

    method intentarSincro(eva, piloto){
        if (self.puedenSincronizar(eva,piloto)){
            eva.efectoDeSincroCon(piloto)
            piloto.efectoDeSincroCon(eva)
        } else{
            self.error("No se pudieron sincronizar")
        }
      }
    method puedenSincronizar(eva,piloto) = eva.puedeSincronizarCon(piloto) and piloto.puedeSincronizarCon(eva)
}
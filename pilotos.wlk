import evas.*
import cuartelNerv.*

object asuka{
    var puntosDeEntrenamiento = 5
    var ultimoEvaSincronizado = eva00
    method efectoDeSincroCon(eva) {ultimoEvaSincronizado=eva
    puntosDeEntrenamiento += eva.puntosQueOtorga()}
    method puedeSincronizarCon(eva) = eva.puedeSincronizarCon(self)
    method estaSatisfecha() = ultimoEvaSincronizado.campoAt() > 2115
    method entrenar (puntos) {puntosDeEntrenamiento += puntos}
}

object shinji{
    var puntosDeEntrenamiento = 2
    var estaCansado=false
    const evasSincronizados = []
    method efectoDeSincroCon(eva) {
        puntosDeEntrenamiento += eva.puntosQueOtorga()
        estaCansado = true
        evasSincronizados.add(eva)
    }
    method puedeSincronizarCon(eva) = eva.puedeSincronizarCon(self) and !estaCansado
    method estaSatisfecha() = nerv.evas().all({ e => evasSincronizados.contains(e)})
    
    //evas del cuartel  = #[eva0,eva1,eva2]
    //evasSincronizados = #[eva1,eva0]
    //evasSincronizados = #[eva1,eva0,eva2]
    //evasSincronizados = #[eva1]
    }

    object rei{
     var puntosDeEntrenamiento = 0
     var cantidadDeSincros = 0
        method efectoDeSincroCon(eva) {puntosDeEntrenamiento += eva.puntosQueOtorga()
        cantidadDeSincros +=1
        }
     method puedeSincronizarCon(eva) = eva.puedeSincronizarCon(self) and eva.campoAt() >= 2110
     method estaSatisfecha() = cantidadDeSincros > 0
    }


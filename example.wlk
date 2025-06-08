class Universidad {
  var property honorarios
  var property provincia
  var donacion= 0
  method provincia() = provincia
  method honorarios()= honorarios
  method recibirDonacion(unImporte) {
    donacion += unImporte
  }
}

class ProfesionalVinculado {
  var property universidad
  method trabajaEn() = universidad.provincia()
  method honorarios()= universidad.honorarios()
  method universidad() = universidad
  method cobrar(unImporte) {
    const importe= unImporte / 2
    universidad.recibirDonacion(importe)
  } 

}

class ProfesionalAsociado{
  var property universidad
  method trabajaEn() = ["Entre Rios", "Santa Fe", "Corrientes"]
  method honorarios() = 3000
  method universidad()= universidad
  method cobrar(unImporte) {
    apl.recibirDonacion(unImporte)
  }
}

class ProfesionalLibre {
  var property provincias
  var property honorarios
  var property universidad
  var cobro =0
  method universidad()= universidad
  method trabajaEn() = provincias
  method honorarios() = honorarios
  method cobrar(unImporte){
    cobro += unImporte
  }
  method pasarDineroA(persona,monto) {
    if(monto <= cobro)
      persona.cobrar(monto)
      cobro= cobro - monto
  }

}

class Empresa {
  const property contratados = []
  const property clientes= []
  const honorarioReferencia= 2000
  method cuantosEstudiaronEn(uni) {
    return contratados.filter({c=>c.universidad() == uni}).size()
  }
  method profesionalesCaros() {
    return contratados.filter({c=>c.honorarios()> honorarioReferencia})
  }

  method universidadesFormadoras() {
    return contratados.filter({c=>c.universidad()}).asSet()
  }

  method profesionalBarato() {
    return contratados.min({c=>c.honorarios()})
  }

  method esAcotada() {
    return contratados.all({c=>c.trabajaEn().size() >= 3})
  }

  method puedeAtenderA(cliente) {
    return contratados.any({c=>cliente.puedeSerAtendida(c)})
  }
  method darServicioA(unSolicitante) {
    if(self.puedeAtenderA(unSolicitante)) {
       const profesional= contratados.find({c=>unSolicitante.puedeSerAtendida(c)})
       //contratados.filter({c=>unSolicitante.puedeSerAtendida(c)}).anyOne()
       const salario= profesional.honorarios() + honorarioReferencia
       profesional.cobrar(salario)
       clientes.add(unSolicitante)

    }
    else 
      self.error("no puede ser atendido")
  }
  method pocoAtractivo(unProfesional) {
    unProfesional.trabajaEn().all({p=>contratados.any({c=>c.trabajaEn().contains(p) && c.honorarios() < unProfesional.honorarios()})})
  }

  method cobraMasBarato(unProfesional) {
    return contratados.any({c=>c.honorarios() < unProfesional.honorarios()})
  }

}


class Persona {
  var property provincia
  method puedeSerAtendida(unProfesional) {
    return unProfesional.trabajaEn().contains(provincia)
  }
}

class Institucion {
  const property universidadesReconocidas
  method puedeSerAtendida(unProfesional){
    return universidadesReconocidas.contains(unProfesional.universidad())
  }
}

class Club {
  const property provincias
  method puedeSerAtendida(unProfesional){
    return provincias.any({p=>unProfesional.trabajaEn().contains(p)})
  }
}

object apl {
  var donacion= 0
  method recibirDonacion(unImporte) {
    donacion += unImporte
  }
}
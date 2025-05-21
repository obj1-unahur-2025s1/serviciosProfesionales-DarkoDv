
class Universidad {
  var property provincia
  var property honorarios
  method honorarios()= honorarios
  method provincia() =provincia
}


class VinculadosUniversidad {
  var property universidad 
  method trabajanEn()= universidad.provincia()
  method honorarios() = universidad.honorarios()
  method universidad()= universidad
}

class ProfesionalesLitoral{
  var property universidad 
  method trabajanEn() = ["EntreRios","Santa Fe", "Corrientes"]
  method honorarios()= 3000
  method universidad() = universidad

}

class ProfesionalesLibres {
  var property universidad
  var property honorarios
  var property provincias 
  method honorarios() = honorarios
  method provincias() = provincias
}

class Empresa {
  var property honorarios 
  var property universidades= #{}
 
  const prof= []
  method contratarProfesional(unprof){
    prof.add(unprof)
  }
  method cuantosProfesionales(unaUniversidad){
    prof.filter({p=>p.universidad()== unaUniversidad}).size()
  
  }

  method profesionalesCaros() {
    prof.filter({p=>p.honorarios()> self.honorarios()})

  }

  method universidadesFormadoras() {
    universidades.add({prof=>prof.universidad()})
    return(universidades)
  }

   method profesionalesBaratos() {
    prof.min({p=>p.honorarios()})

  }

  method esAcotado() {
    prof.any({p=>p.provincias().size()>= 3})
  }


  
  


}

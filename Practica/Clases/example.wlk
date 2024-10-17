class ChampDeLeagueOfLegends {
  var mana = 100
  var cooldownTP = 0
  method habilidadQ() { 
    mana = mana - 28
  }
  
  method teletransportar() {
    cooldownTP = cooldownTP + 300
  }

  method campear(tiempo) {
    mana = mana - tiempo
  }
}
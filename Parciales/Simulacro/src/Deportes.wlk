object futbol {
  method rejuvenece() = 1
}

class Polo {
  method rejuvenece() = 2
}

object waterpolo inherits Polo{
  override method rejuvenece() = super() * 2
}
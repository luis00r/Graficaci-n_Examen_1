type
  Punto = tuple[x, y: float]

proc calcularPuntoBezier(Puntos: seq[Punto], grado: int, parametro: float): Punto =
  var Q: seq[Punto] = newSeq[Punto](grado+1)
  for i in 0..grado:
    Q[i] = Puntos[i]
  for k in 1..grado:
    for i in 0..grado-k:
      let t = 1.0 - parametro
      Q[i] = (t * Q[i][0] + parametro * Q[i+1][0], t * Q[i][1] + parametro * Q[i+1][1])
  return Q[0]


let PuntosDeControl = @[(0.0, 0.0), (10.0, 20.0), (30.0, 4.0)]  
let gradoCurva = PuntosDeControl.len - 1  
let parametro = 0.8 
let PuntoEnCurva = calcularPuntoBezier(PuntosDeControl, gradoCurva, parametro)  
echo "Punto en la curva para el parámetro ", parametro, ": ", PuntoEnCurva

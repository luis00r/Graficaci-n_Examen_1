proc calcularPolinomiosBernstein(grado: int, valor: float): seq[float] =
  var coeficientes = newSeq[float](grado + 1)
  coeficientes[0] = 1.0
  var valorRestante = 1.0 - valor
  for i in 1..grado:
    var guardado = 0.0
    for j in 0..<i:
      var temporal = coeficientes[j]
      coeficientes[j] = guardado + valorRestante * temporal
      guardado = valor * temporal
    coeficientes[i] = guardado
  result = coeficientes

let gradoPolinomio = 4
let valorU = 0.8
let coeficientesBernstein = calcularPolinomiosBernstein(gradoPolinomio, valorU)
echo "Los coeficientes de los polinomios de Bernstein son:"
echo coeficientesBernstein

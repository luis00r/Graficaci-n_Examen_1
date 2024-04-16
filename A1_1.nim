proc evaluarPolinomio(coefs: seq[float], grado: int, x: float): float =
  var C: float = coefs[grado]
  for i in 0 .. grado - 1:
    C = C * x + coefs[i]
  result = C


var coeficientes = @[1.0, 2.0, 3.0]  # Coeficientes del polinomio: 1 + 2x + 3x^2
var gradoPolinomio = coeficientes.len - 1  # Grado del polinomio
var x = 5.0
var resultado = evaluarPolinomio(coeficientes, gradoPolinomio, x)
echo "El resultado de evaluar el polinomio en x =", x, " es:", resultado

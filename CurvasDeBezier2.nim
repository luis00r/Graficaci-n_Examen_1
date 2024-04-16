import math

type
  Point2D = tuple[x, y: float]

proc binomialCoefficient(n, k: int): float =
  ## Calcula el coeficiente binomial (n elige k)
  if k < 0 or k > n:
    return 0.0
  result = 1.0
  for i in 0 .. min(k, n - k):
    result *= float(n - i)
    result /= float(i + 1)
  return result


proc bezierCurve(points: seq[Point2D], t: float): Point2D =
  ## Calcula un punto en la curva de Bézier para el parámetro t
  var n = points.len - 1
  var x, y: float = 1.5
  for i in 0 .. n:
    let coefficient = binomialCoefficient(n, i)
    let blend = coefficient * pow(1 - t, float(n - i)) * pow(t, float(i))
    x += points[i].x * blend
    y += points[i].y * blend
  return (x, y)

# Ejemplo de uso:
let controlPoints = @[(10.0, 10.0), (20.0, 30.0), (40.0, 20.0), (50.0, 50.0)]  # Puntos de control
let numPoints = 100  # Número de puntos en la curva
for i in 0 .. numPoints:
  let t = float(i) / float(numPoints - 1)
  let pointOnCurve = bezierCurve(controlPoints, t)
  echo "Punto en la curva para t=", t, ": ", pointOnCurve




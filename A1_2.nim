proc bernsteinCoeff(i, n: int, u: float): float =
    var
        coefArray: array[0..100, float]  
        u1, B: float

    for j in 0..n:
        coefArray[j] = 0.0

    coefArray[n - i] = 1.0
    u1 = 1.0 - u

    for k in 1..n:
        for j in (n - k + 1)..n:   
            coefArray[j] = u1 * coefArray[j] + u * coefArray[j - 1]

    B = coefArray[n]
    result = B

let iValue = 3
let nValue = 4
let uValue = 0.5
let resultado = bernsteinCoeff(iValue, nValue, uValue)
echo "El valor del polinomio Bernstein para i = ", iValue, ", n = ", nValue, " y u = ", uValue, " es: ", resultado

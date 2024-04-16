# Definimos la función buscarIntervalo
proc buscarIntervalo(longitudNodos: int, grado: int, u: float, nodos: seq[float]): int =
    var inferior, superior, medio: int
    inferior = grado
    superior = longitudNodos + 1
    
    # Manejamos un caso especial
    if u == nodos[longitudNodos + 1]:
        return longitudNodos
    
    # Implementamos búsqueda binaria
    medio = (inferior + superior) div 2
    while u < nodos[medio] or u >= nodos[medio + 1]:
        if u < nodos[medio]:
            # Continuamos búsqueda binaria hacia la izquierda
            superior = medio
        else:
            inferior = medio
        medio = (inferior + superior) div 2
    
    return medio

# Ejemplo de uso
when isMainModule:
    let longitudNodos = 5
    let grado = 2
    let u = 2.5
    let nodos = @[0.0, 0.0, 0.0, 1.0, 2.0, 3.0, 4.0, 4.0, 4.0]
    let indiceIntervalo = buscarIntervalo(longitudNodos, grado, u, nodos)
    echo "El índice del intervalo de los nodos para u =", u, " es:", indiceIntervalo

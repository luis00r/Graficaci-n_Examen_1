proc ComputeBasisFuncs(index: int, parameter: float, degree: int, Knots: seq[float], BasisFuncs: var seq[float]) =
  # Calculate the nonvanishing basis functions

  var
    leftVals, rightVals: seq[float]
    savedVal, tempVal: float
    
  leftVals = newSeq[float](degree + 1)
  rightVals = newSeq[float](degree + 1)
    
  BasisFuncs[0] = 1.0
  for j in 1..degree:
    leftVals[j] = parameter - Knots[index + 1 - j]
    rightVals[j] = Knots[index + j] - parameter
    savedVal = 0.0
    for r in 0..<j:
      tempVal = BasisFuncs[r] / (rightVals[r + 1] + leftVals[j - r])
      BasisFuncs[r] = savedVal + rightVals[r + 1] * tempVal
      savedVal = leftVals[j - r] * tempVal
    BasisFuncs[j] = savedVal

when isMainModule:
  # Define the input parameters
  let index = 2
  let parameter = 0.9
  let degree = 2
  let Knots = @[0.5, 0.5, 0.5, 1.0, 2.0, 3.0, 3.0, 4.0]

  # Create a mutable sequence to store the results
  var BasisFuncs = newSeq[float](degree + 1)

  # Call the ComputeBasisFuncs function
  ComputeBasisFuncs(index, parameter, degree, Knots, BasisFuncs)

  # Print the results
  echo "The results of the basis functions are:"
  for j, value in BasisFuncs:
    echo "BasisFuncs[", j, "] = ", value

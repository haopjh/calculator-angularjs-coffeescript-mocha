# Controllers 
window.MyCtrl1 = ($scope, $http)->

  # Converts operator sign to words
  convert = (operator) ->
    if operator == 'multiply'
      $scope.actionSign = '*'
    else if operator == 'divide'
      $scope.actionSign = '/'
    else if operator == 'subtract'
      $scope.actionSign = '-'
    else if operator == 'add'
      $scope.actionSign = "+"
    else
      return false

  # http call for calculation API
  calculate = ->
    # Set the url
    url = "/api/" + $scope.action.toString() + "/" + 
      $scope.firstNum.toString() + "/" + $scope.secondNum.toString()

    $http(
        method: "GET"
        url: url
      ).success((data, status, headers, config) ->
        $scope.firstNum = data.result.toString()
        $scope.actionSign = undefined
        $scope.secondNum = undefined
      ).error (data, status, headers, config) ->
        alert "Theres an error with the API!" 

  # Take note that if the variable is 0, it will be a false 
  # in the if/else statement

  # Method to add input number to the appropriate location
  # The alogrithm would be to check if 2nd number exists.
  # If yes, it will append to that number, else it will check
  # if action exists. If action exists, it will set a new
  # 2nd number, else it will append to the 1st number. If 1st 
  # number does not exist, the input will be the 1st number.
  $scope.input = (number) ->
    # First checks if a calculation is just done recently
    # If true, resets the firstNum with the input number
    if $scope.completedCalculation
      $scope.firstNum = number.toString()
      # Resets the completedCalculation boolean
      $scope.completedCalculation = false
    else
      if $scope.secondNum
        $scope.secondNum += number.toString()
      else if $scope.actionSign
        $scope.secondNum = number.toString()
      else
        if $scope.firstNum
          $scope.firstNum += number.toString()
        else
          if number != 0
            $scope.firstNum = number.toString()

  # Adds operator to the equation.
  $scope.operator = (operator) ->
    if $scope.firstNum
      # If an operator is added after 2nd number is input, 
      # the calculation is will be done
      if $scope.actionSign and $scope.firstNum and $scope.secondNum
        
        calculate()

      # Continue to add operator to equation
      convert(operator)
      $scope.action = operator.toString()

  $scope.calculate = ->
    if $scope.actionSign and $scope.firstNum and $scope.secondNum
      calculate()

      # Checks if the equal sign is pressed for calculation
      # This boolean helps to remove old results upon new inputs
      $scope.completedCalculation = true
    else
      return false

  # Adds a decimal to the number
  $scope.decimal = ->
    # First checks if a calculation is just done recently
    # If true, resets the firstNum with the input decimal
    if $scope.completedCalculation
      $scope.firstNum = '0.'
      # Resets the completedCalculation boolean
      $scope.completedCalculation = false
    else
      if $scope.secondNum
        #Checks if the number already has a decimal
        if $scope.secondNum.indexOf('.') == -1
          $scope.secondNum += '.'
      else if $scope.actionSign
        # This inputs a 0. if there is no 2nd number
        $scope.secondNum = '0.'
      else if $scope.firstNum 
        if $scope.firstNum.indexOf('.') == -1
          $scope.firstNum += '.'
      else
        # This inputs a 0. if there is no 1st number
        $scope.firstNum = '0.'

  # Clears all scopes
  $scope.cancel = ->
    $scope.firstNum = undefined
    $scope.actionSign = undefined
    $scope.secondNum = undefined

  # Clear the last entry
  $scope.back = ->
    if $scope.secondNum
      size =  $scope.secondNum.length-1
      $scope.secondNum = $scope.secondNum[...size]
    else if $scope.actionSign
      $scope.actionSign = undefined
    else if $scope.firstNum
      size =  $scope.firstNum.length-1
      $scope.firstNum = $scope.firstNum[...size]




MyCtrl1.$inject = ['$scope', '$http']

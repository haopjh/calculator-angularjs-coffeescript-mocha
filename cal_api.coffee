# Import library files
restify 		= require 'restify'

# Create API server to listen to requests
server = restify.createServer()

# Create GET API that capture all params in the urls
server.get '/calculate/:action/:firstNum/:secondNum', (req, res, next) ->
	action = req.params.action
	firstNum = parseFloat req.params.firstNum
	secondNum = parseFloat req.params.secondNum
	result = 0
	if action == 'add'
		result = firstNum + secondNum
	else if action == 'subtract'
		result = firstNum - secondNum
	else if  action == 'divide'
		result = firstNum / secondNum
	else if action == 'multiply'
		result = firstNum * secondNum
	else
		res.send 'no such method'
	
	# parseFloat is used again to correct JavaScript's arithmatic error
	res.send {'result':parseFloat result.toPrecision 7}

# start server
server.listen 3000, ->
	console.log '%s listening at %s', server.name, server.url
# Import library files
restify 		= require 'restify'
mongoose		= require 'mongoose'

# Start and verify mongodb connection
mongoose.connect 'mongodb://localhost/test' 
db = mongoose.connection
db.on 'error', console.error.bind console, 'connection error:'
db.once 'open', ->
	console.log "Successfully connected to MongoDB"

# Create schema for recording calculations
calculationSchema = new mongoose.Schema
	action: String
	firstNumber: Number
	secondNumber: Number
	timeStamp: 
		type: Date
		default: Date.now

Calculation = mongoose.model 'calculation', calculationSchema

# Create API server to listen to requests
server = restify.createServer()
server.use restify.acceptParser server.acceptable
server.use restify.queryParser()
server.use restify.bodyParser()

# Create GET API that capture all params in the urls
server.get '/api/:action/:firstNum/:secondNum', (req, res, next) ->
	action = req.params.action
	firstNum = parseFloat req.params.firstNum
	secondNum = parseFloat req.params.secondNum
	result = undefined
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
	
	# Create Calculation object
	cal = new Calculation
		action: action
		firstNumber: firstNum
		secondNumber: secondNum

	cal.save (err, cal) ->
		# Handle Errors
		if err then console.log 'Erorr in saving calculation'

	# parseFloat is used again to correct JavaScript's arithmatic error
	res.send {'result':parseFloat result.toPrecision 11}

# Serve angularjs as frontend
server.get /.*/, restify.serveStatic(
  directory: "./public"
  default: 'app/index.html'
)
# start server
server.listen 3000, ->
	console.log '%s listening at %s', server.name, server.url
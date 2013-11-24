# Import library files
assert 	= require "assert"
request = require "request"


# Build Test Cases
# Addition
describe "Addition", ->
  it 'Should return 0.3 when 0.1 + 0.2', (done)->
  	request.get 'http://localhost:3000/api/add/0.1/0.2', 
  		(err, res, body) ->
    	json = JSON.parse body
    	assert.equal json.result, 0.3
    	done()

  it 'Should return 0 when 0 + 0', (done)->
  	request.get 'http://localhost:3000/api/add/0/0', 
  		(err, res, body) ->
    	json = JSON.parse body
    	assert.equal json.result, 0
    	done()

  it 'Should return 123.123 when 123 + 0.123', (done)->
  	request.get 'http://localhost:3000/api/add/123/0.123', 
  		(err, res, body) ->
    	json = JSON.parse body
    	assert.equal json.result, 123.123
    	done()

# Subtraction
describe "Subtraction", ->
  it 'Should return 0.1 when 0.2 - 0.1', (done)->
  	request.get 'http://localhost:3000/api/subtract/0.2/0.1', 
  		(err, res, body) ->
    	json = JSON.parse body
    	assert.equal json.result, 0.1
    	done()

  it 'Should return 0 when 0 - 0', (done)->
  	request.get 'http://localhost:3000/api/subtract/0/0', 
  		(err, res, body) ->
    	json = JSON.parse body
    	assert.equal json.result, 0
    	done()

  it 'Should return 0.123 when 1 - 0.877', (done)->
  	request.get 'http://localhost:3000/api/subtract/1/0.877', 
  		(err, res, body) ->
    	json = JSON.parse body
    	assert.equal json.result, 0.123
    	done()

# Division
describe "Division", ->
  it 'Should return 2 when 0.2 / 0.1', (done)->
  	request.get 'http://localhost:3000/api/divide/0.2/0.1', 
  		(err, res, body) ->
    	json = JSON.parse body
    	assert.equal json.result, 2
    	done()

  it 'Should return 0 when 0 / 1', (done)->
  	request.get 'http://localhost:3000/api/divide/0/1', 
  		(err, res, body) ->
    	json = JSON.parse body
    	assert.equal json.result, 0
    	done()

  it 'Should return 0.33333333333 when 1 / 3', (done)->
  	request.get 'http://localhost:3000/api/divide/1/3', 
  		(err, res, body) ->
    	json = JSON.parse body
    	assert.equal json.result, 0.33333333333
    	done()

# Multiplication
describe "Multiply", ->
  it 'Should return 0.02 when 0.2 * 0.1', (done)->
  	request.get 'http://localhost:3000/api/multiply/0.2/0.1', 
  		(err, res, body) ->
    	json = JSON.parse body
    	assert.equal json.result, 0.02
    	done()

  it 'Should return 0 when 0 * 0', (done)->
  	request.get 'http://localhost:3000/api/multiply/0/0', 
  		(err, res, body) ->
    	json = JSON.parse body
    	assert.equal json.result, 0
    	done()

  it 'Should return 4.08 when 1.2 * 3.4', (done)->
  	request.get 'http://localhost:3000/api/multiply/1.2/3.4', 
  		(err, res, body) ->
    	json = JSON.parse body
    	assert.equal json.result, 4.08
    	done()



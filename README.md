Calculator-angularjs-coffeescript-restify-mocha
=======================================

This is an calculator boilerplate which has AngularJS with Coffeescript as the front end and restify (node.js) as the backend (APIs).

To run the app:

- git clone https://github.com/haopjh/calculator-angularjs-coffeescript-mocha.git
- cd calculator-angularjs-coffeescript-mocha
- Run coffee server.coffee
- Enter localhost:3000/app/index.html to access the calculator

To run the mocha automated testing, enter 'mocha --compilers coffee:coffee-script test'

Calculator API's endpoint is localhost:3000/api/:action/:firstNum/:secondNum

<b>Take note</b>
- Restify is a leaner framework to provide routing for APIs as compared to Express

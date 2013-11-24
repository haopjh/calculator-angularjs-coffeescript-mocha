Calculator-angularjs-coffeescript-restify-mocha
=======================================

This is a calculator boilerplate which has AngularJS with Coffeescript as the front end and restify (node.js) as the backend (APIs).

To run the app:

- git clone https://github.com/haopjh/calculator-angularjs-coffeescript-mocha.git
- cd calculator-angularjs-coffeescript-mocha
- coffee server.coffee
- Type localhost:3000/app/index.html in the browser to access the calculator

To run the mocha automated testing, type <i>mocha --compilers coffee:coffee-script test</i>

Calculator API's endpoint is localhost:3000/api/:action/:firstNum/:secondNum

<b>Take note</b>
- Restify is a leaner framework to provide routing for APIs as compared to Express

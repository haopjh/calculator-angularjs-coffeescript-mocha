angular
  .module( 'myApp', ['ngRoute'])
  .config( ['$routeProvider', ($routeProvider)->

      $routeProvider.when('/cal', {templateUrl: 'partials/calculator.html', controller: MyCtrl1})
      $routeProvider.otherwise({redirectTo: '/cal'})
    ])

angular.bootstrap(document,['myApp'])
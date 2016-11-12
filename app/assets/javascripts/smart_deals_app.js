angular.module('smartDeals', [])
.controller('MainCtrl', [
'$scope',
function($scope){
  $scope.test = 'Hello world!';
  Web3 = require('web3');
  web33 = new Web3();
  $scope.web3 = web33.eth;
}]);
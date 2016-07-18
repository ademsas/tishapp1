var app = angular.module('orders', ['ngResource']);

$(document).on('ready page:load', function(){
	angular.bootstrap(document.body, ['shop'])
});

app.factory('models', ['$resource', function($resource){
	var orders_model = $resource("/orders/:id.json", {id: "@id"});
	var products_model = $resource("/products/:id.json", {id: "@id"});
	
  var x = {
    orders: orders_model,
		products: products_model
  };
  return x;
}]);

app.controller('OrdersCtrl', ['$scope', 'models', function($scope, models){
	$scope.orders = models.orders.query();
	$scope.products = models.products.query();
	$scope.newOrder = '';
}]);

if(!$scope.newOrder.product_id || $scope.newOrder.total === ''){ return; }

$scope.addOrder = function(){
  $scope.orders.push($scope.newOrder);
}

$scope.deleteOrder = function(order) {
	models.orders.delete(order);
	$scope.order.splice($scope.order.indexOf(order), 1);

<?php

use CodeIgniter\Router\RouteCollection;

/**
 * @var RouteCollection $routes
 */
$routes->get('/', 'Home::index');
$routes->get('/products', 'ProductController::index');
$routes->delete('/products/(:any)', 'ProductController::deleteByName/$1');
$routes->get('/products/(:num)', 'ProductController::show/$1');
$routes->post('/products', 'ProductController::store');
$routes->put('/products/(:num)', 'ProductController::update/$1');
// $routes->patch('/products/(:num)', 'ProductController::update/$1');
$routes->get('/products/category', 'ProductController::productsCategory');
$routes->get('/category/products', 'ProductController::categoryProducts');
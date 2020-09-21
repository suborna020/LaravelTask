<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Route::get('/', function () {
//     return view('welcome');
// });
Route::get('/', 'userController@welcome');

Auth::routes();

// POrtal works
Route::get('/home', 'HomeController@index')->name('home');
Route::get('/admin', 'Admin@index');
Route::get('/admin/exm_question', 'Admin@exm_question');
Route::post('/admin/exm_new_question', 'Admin@exm_new_question');

// POrtal works
Route::get('portal/portalSignup', 'PortalController@portalSignup');
Route::post('portal/portalSignup_sub', 'PortalController@portalSignup_sub');
Route::get('portal/portalLogin', 'PortalController@portalLogin');
Route::post('portal/portalLogin_sub', 'PortalController@portalLogin_sub');
Route::get('portal/portalDashboard', 'PortalOperation@portalDashboard');
Route::get('portal/portalLogout', 'PortalOperation@portalLogout');
Route::get('portal/exmForm', 'PortalOperation@exmForm');
Route::post('portal/submit_question', 'PortalOperation@submit_question');
Route::get('portal/show_result/{id}', 'PortalOperation@show_result');




//Route::get('portal/portalLogin_sub', 'PortalController@portalLogin_sub');

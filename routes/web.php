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

//Frontend
// Route::get('/', function () {
//     return redirect()->route('login');
// });

//home
Route::get('/', [App\Http\Controllers\Frontend\HomeController::class, 'index'])->name('home');

// //contact
// Route::get('contact', [App\Http\Controllers\Frontend\ContactController::class, 'index'])->name('contact');
// Route::post('contact-action', [App\Http\Controllers\Frontend\ContactController::class, 'contactAction'])->name('contact-action');

// //other
// Route::get('terms-and-conditions', [App\Http\Controllers\Frontend\TermsAndConditionsController::class, 'index'])->name('terms-and-conditions');
// Route::get('privacy-policy', [App\Http\Controllers\Frontend\PrivacyPolicyController::class, 'index'])->name('privacy-policy');
// // Route::get('sitemap', [App\Http\Controllers\Frontend\SitemapController::class, 'index'])->name('sitemap');
// Route::post('subscriber-action', [App\Http\Controllers\Frontend\SubscriberController::class, 'subscriberAction'])->name('subscriber-action');
// Route::get('subscription/verify/{verified_code}', [App\Http\Controllers\Frontend\SubscriberController::class, 'verify'])->name('subscription-verify');

//Backend
Route::group([], function(){
    //login, register, forgot password, reset password
    Auth::routes(['verify' => true, 'register' => false]);

    // Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

    Route::name('backend.')->group(function () {

        //Dashboard
        // Route::get('/', [App\Http\Controllers\Backend\DashboardController::class, 'index'])->name('dashboard.index');
        Route::get('dashboard', [App\Http\Controllers\Backend\DashboardController::class, 'index'])->name('dashboard.index');

        //Users
        Route::get('users/delete/{id}', [App\Http\Controllers\Backend\UserController::class, 'delete'])->name('users.delete');
        Route::post('users/list', [App\Http\Controllers\Backend\UserController::class, 'list'])->name('users.list');
        Route::post('users/actions', [App\Http\Controllers\Backend\UserController::class, 'actions'])->name('users.actions');
        Route::resource('users', App\Http\Controllers\Backend\UserController::class);

        //Roles
        Route::get('roles/delete/{id}', [App\Http\Controllers\Backend\RoleController::class, 'delete'])->name('roles.delete');
        Route::post('roles/list', [App\Http\Controllers\Backend\RoleController::class, 'list'])->name('roles.list');
        Route::resource('roles', App\Http\Controllers\Backend\RoleController::class);

        //Permissions
        Route::get('permissions/delete/{id}', [App\Http\Controllers\Backend\PermissionController::class, 'delete'])->name('permissions.delete');
        Route::post('permissions/list', [App\Http\Controllers\Backend\PermissionController::class, 'list'])->name('permissions.list');
        Route::post('permissions/actions', [App\Http\Controllers\Backend\PermissionController::class, 'actions'])->name('permissions.actions');
        Route::resource('permissions', App\Http\Controllers\Backend\PermissionController::class);

        //Settings
        Route::resource('settings', App\Http\Controllers\Backend\SettingsController::class);

        //My Account
        Route::get('myaccount', [App\Http\Controllers\Backend\MyaccountController::class, 'index'])->name('myaccount.index');
        Route::get('myaccount/profile', [App\Http\Controllers\Backend\MyaccountController::class, 'profile'])->name('myaccount.profile');
        Route::put('myaccount/update_profile', [App\Http\Controllers\Backend\MyaccountController::class, 'update_profile'])->name('myaccount.update_profile');
        Route::get('myaccount/change_password', [App\Http\Controllers\Backend\MyaccountController::class, 'change_password'])->name('myaccount.change_password');
        Route::put('myaccount/change_password_action', [App\Http\Controllers\Backend\MyaccountController::class, 'change_password_action'])->name('myaccount.change_password_action');
        Route::get('myaccount/change_avatar', [App\Http\Controllers\Backend\MyaccountController::class, 'change_avatar'])->name('myaccount.change_avatar');
        Route::post('myaccount/change_avatar_action', [App\Http\Controllers\Backend\MyaccountController::class, 'change_avatar_action'])->name('myaccount.change_avatar_action');
        Route::get('myaccount/logged_in_devices', [App\Http\Controllers\Backend\MyaccountController::class, 'logged_in_devices'])->name('myaccount.logged_in_devices');
        Route::get('myaccount/logout/all', [App\Http\Controllers\Backend\MyaccountController::class, 'logout_all_devices'])->name('myaccount.logout_all_devices');
        Route::get('myaccount/logout/{device_id}', [App\Http\Controllers\Backend\MyaccountController::class, 'logout_device'])->name('myaccount.logout_device');

         //polls routes
         Route::get('polls/view/{id}', [App\Http\Controllers\Backend\PollController::class, 'view'])->name('polls.view');
         Route::get('polls/delete/{id}', [App\Http\Controllers\Backend\PollController::class, 'delete'])->name('polls.delete');
         Route::post('polls/list', [App\Http\Controllers\Backend\PollController::class, 'list'])->name('polls.list');
         Route::resource('polls', App\Http\Controllers\Backend\PollController::class);

         // voter routes
        Route::get('voters/create/{poll_id}', [App\Http\Controllers\Backend\VoterController::class, 'create'])->name('voters.create');
        Route::post('voters/list', [App\Http\Controllers\Backend\VoterController::class, 'list'])->name('polls.list');
        Route::resource('voters', App\Http\Controllers\Backend\VoterController::class);



    });
});

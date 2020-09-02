<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;

use Illuminate\Http\Request;

class UserController extends Controller
{


    public function welcome()
    {
        // //----create data
        // $user = new User();
        // $user->name = 'ami6';
        // $user->email = 'ami6@gmail.com';
        // $user->password = bcrypt('password');
        // $user->save();

        //     //------select all
        // $user = User::all();
        // return $user;

        //      //----delete 
        // User::where('id',3)->delete();
        // //-----update
        // User::where('id', 2)->update(['name' => 'amiiiiiiiii2']);
        return view('welcome');
    }
}

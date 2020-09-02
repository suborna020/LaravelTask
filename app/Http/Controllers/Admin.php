<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class Admin extends Controller
{
    public function index()
    {
        // echo url('');
        // die;
        return view('admin.dashboard');
    }
    public function exm_category()
    {

        return view('admin.exm_category');
    }
}

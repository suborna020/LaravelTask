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
    public function exm_question()
    {

        return view('admin.exm_question');
    }
}

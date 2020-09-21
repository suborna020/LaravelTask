<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Validator;
use Session;
use App\oex_student;



class PortalController extends Controller
{
    public function portalSignup()
    {
        //session a login thaka kalin user new login page a na giye alwayas dashboard stay korar condition
        //exist session/redicating on dashboard
        if (Session::get('portal_session')) {
            return redirect(url('portal/portalDashboard'));
        }
        return view('portal.signup');
    }

    public function portalSignup_sub(Request $request)
    {
        $validator = Validator($request->all(), ['name' => 'required', 'email' => 'required', 'mobile_no' => 'required', 'password' => 'required']);
        if ($validator->passes()) {
            // ($is_exists) condition : if given email already exist on our database
            //where('email', $request->email) =db email == given email
            // $is_exists=get() method for fetching existing email line from database

            $is_exists = oex_student::where('email', $request->email)->get()->toArray();
            if ($is_exists) {
                $arr = array('status' => 'false', 'message' => 'E-Mail Already Exists');
            } else {
                $portal = new oex_student();
                $portal->name = $request->name;
                $portal->email = $request->email;
                $portal->mobile_no = $request->mobile_no;
                $portal->password = $request->password;
                $portal->status = 1;
                $portal->save();
                $arr = array('status' => 'true', 'message' => 'Success', 'reload' => url('portal/portalLogin'));
            }
        } else {
            $arr = array('status' => 'false', 'message' => $validator->errors()->all());
        }
        echo json_encode($arr);
    }

    public function portalLogin()
    {
        //session a login thaka kalin user new login page a na giye alwayas dashboard stay korar condition
        //exist session/redicating on dashboard
        if (Session::get('portal_session')) {
            return redirect(url('portal/portalDashboard'));
        }

        return view('portal.login');
    }
    public function portalLogin_sub(Request $request)
    {
        $portal = oex_student::where('email', $request->email)->where('password', $request->password)->get()->toArray();
        if ($portal) {
            if ($portal[0]['status'] == 1) {
                $request->session()->put('portal_session', $portal[0]['id']); //portal_session a id store kora
                $arr = array('status' => 'true', 'message' => 'success', 'reload' => url('portal/portalDashboard')); //after email passwrd match page will redirect into portal/dashboard
            } else {
                $arr = array('status' => 'false', 'message' => 'Your Account Deactived');
            }
        } else {
            $arr = array('status' => 'false', 'message' => 'Email And Password Not Match');
        }
        echo json_encode($arr);
    }
}

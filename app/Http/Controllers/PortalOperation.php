<?php

namespace App\Http\Controllers;

use Session;

use Validator;
use App\Oex_students;
use App\Oex_portal;
use App\Oex_exam_question_master;
use App\model\Oex_result;


use Illuminate\Http\Request;

class PortalOperation extends Controller
{
    public function portalDashboard()
    {
        //echo $session_data = Session::get('portal_session');
        if (!Session::get('portal_session')) {
            return redirect(url('portal/portalLogin'));
        }
        $data['portal_exams'] = Oex_portal::where('status', '1')->get()->toArray();
        return view('portal.dashboard', $data);
    }
    public function exmForm()
    {
        $data['all_question'] = Oex_exam_question_master::get()->toArray();

        return view('portal.exmForm', $data);
    }
    public function submit_question(Request $request)
    {
        $yes_ans = 0;
        $no_ans = 0;
        $data = $request->all(); //all data from the submitted form
        $result = array();
        for ($i = 1; $i <= $request->index; $i++) {
            //     ($i <= $request->index) form er ses question porjonto Loop ti cholbe
            if (isset($data['question' . $i])) {
                $question = Oex_exam_question_master::where('id', $data['question' . $i])->get()->first();
                if ($question->ans == $data['ans' . $i]) { //If (database answer =  quiz answr)
                    $result[$data['question' . $i]] = 'YES'; //$data['question' . $i] submitted form er question1,question2,....3,4.index data
                    $yes_ans++;
                } else {
                    $result[$data['question' . $i]] = 'NO';
                    $no_ans++;
                }
            }
        }
        $res = new Oex_result();
        $res->exam_id = $request->exam_id;
        $res->user_id = Session::get('portal_session'); //Getting session id
        $res->yes_ans = $yes_ans;
        $res->no_ans = $no_ans;
        $res->result_json = json_encode($result);
        $res->save();
        return redirect(url('portal/show_result/' . $res->id)); //($res->id)=Oex_result table id 
    }
    public function show_result($id)
    {
        $data['result_info'] = Oex_result::where('id', $id)->get()->first();
        //echo $session_data = Session::get('portal_session');
        $data['student_info'] = Oex_portal::select(['Oex_portals.*', 'oex_results.user_id as user_id', 'oex_results.created_at as emx_started'])
            ->join('oex_results', 'Oex_portals.id', '=', 'oex_results.user_id')
            ->get()->first();
        // echo "<pre>";
        // print_r($data);
        // die();


        return view('portal.show_result', $data);
    }

    public function portalLogout(Request $request)
    {
        $request->session()->forget('portal_session');
        return redirect(url('portal/portalLogin'));
    }
}
    //     public function dashboard()
    //     {
    //         if (!Session::get('portal_session')) {
    //             return redirect(url('portal/login'));
    //         }
    //         $data['portal_exams'] = Oex_exam_master::select(['oex_exam_masters.*', 'oex_categories.name as cat_name'])->join('oex_categories', 'oex_exam_masters.category', '=', 'oex_categories.id')->orderBy('id', 'desc')->where('oex_exam_masters.status', '1')->get()->toArray();
    //         return view('portal.dashboard', $data);
    //     }

<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Validator;
use App\Oex_exam_question_master;


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


    public function exm_new_question(Request $request)
    {
        // echo "<pre>";
        // print_r($request->all());
        // die;
        $validator = Validator::make($request->all(), ['exam_id' => 'required', 'question' => 'required', 'option1' => 'required', 'option2' => 'required', 'option3' => 'required', 'ans' => 'required']);
        if ($validator->passes()) {
            $question = new Oex_exam_question_master();
            $question->exam_id = $request->exam_id;
            $question->question = $request->question;
            $question->ans = $request->ans;
            $question->status = 1;
            $question->options = json_encode(array('option1' => $request->option1, 'option2' => $request->option2, 'option3' => $request->option3, 'option4' => $request->option4));
            $question->save();
            $arr = array('status' => 'true', 'message' => 'Question Successfully Added', 'reload' => url('admin/exm_question/'));
        } else {
            $arr = array('status' => 'false', 'message' => $validator->errors()->all());
        }
        echo json_encode($arr);
    }
}

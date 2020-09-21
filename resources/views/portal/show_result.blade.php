@extends('layouts.portal') {{--portal.blade.php page extend --}}
@section('title','Show result ')
@section('content')
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0 text-dark">Result</h1>
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active">Result</li>
                    </ol>
                </div><!-- /.col -->
            </div><!-- /.row -->
            <div class="print_btn" style="text-align: center">
                <button onclick="window.print()">Print</button>
            </div>
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-2">&nbsp;</div>
                <div class="col-sm-8">

                    <div class="card mt-4">
                        <div class="card-body">
                            <h2>Basic Information:</h2><br>
                            <table class="table">
                                <tr>
                                    <td>Name</td>
                                    <td>{{ $student_info->name }}</td>
                                </tr>
                                <tr>
                                    <td>E-Mail</td>
                                    <td>{{ $student_info->email }}</td>
                                </tr>
                                <tr>
                                    <td>Mobile No.</td>
                                    <td>{{ $student_info->mobile_no }}</td>
                                </tr>
                                <tr>
                                    <td>Exam completed date</td>
                                    <td>{{ date('d M,Y',strtotime($result_info->updated_at) ) }}</td>
                                    {{-- printing date of today --}}
                                    <td>/<?php echo date('Y-m-d'); ?></td>


                                </tr>
                            </table>
                            <hr>
                            <h2>Result Information</h2>
                            <table class="table">
                                <tr>
                                    <td>Pass Marks</td>
                                    <td>{{ $result_info->yes_ans }}</td>
                                </tr>
                                <tr>
                                    <td>Fail Marks</td>
                                    <td>{{ $result_info->no_ans }}</td>
                                </tr>
                                <tr>
                                    <td>Total</td>
                                    <td>{{ $result_info->yes_ans+$result_info->no_ans }}</td>
                                </tr>
                            </table>
                        </div>
                        <!-- /.card-body -->

                        <!-- /.card-footer-->
                    </div>
                    <!-- /.card -->
                </div>
            </div>
        </div>
    </section>
</div>
@endsection
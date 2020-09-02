@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">{{ __('Dashboard') }}</div>

                <div class="card-body">
                    @if (session('status'))
                    <div class="alert alert-success" role="alert">
                        {{ session('status') }}
                    </div>
                    @endif

                    {{ __('You are logged in!') }}<p></p>
                    <form action="">
                        <div class="form-group">
                            <label for="email">Email:</label>
                            <input type="email" class="form-control" id="email" placeholder="Enter email" name="email">
                        </div>

                        <div class="radio">
                            <label><input type="radio" name="optradio" checked>Option 1</label>
                        </div>
                        <div class="radio">
                            <label><input type="radio" name="optradio">Option 2</label>
                        </div>
                        <div class="radio ">
                            <label><input type="radio" name="optradio">Option 3</label>
                        </div>

                        <button type="submit" class="btn btn-default">Submit</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
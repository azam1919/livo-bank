@extends('layouts.app')
@section('content')


<div id="top_up">
    <div class="row">
        <div class="col-xl-3 col-md-6 mb-4">
            <a href="" style="text-decoration: none; color: #6c757d;">
                <div class="card h-100 border-bottom-card border-danger">
                    <div class="card-body">
                        <div class="d-flex">
                            <div class="flex-grow-1">
                                <h6>{{ _lang('Linking your Account') }}</h6>
                            </div>
                        </div>
                    </div>
                </div>
            </a>
        </div>

        <div class="col-xl-3 col-md-6  mb-4">
            <a href="" style="text-decoration: none; color: #6c757d;">
                <div class="card h-100 border-bottom-card border-info">
                    <div class="card-body">
                        <div class="d-flex">
                            <div class="flex-grow-1">
                                <h6>{{ _lang('Deposit Via Checque') }}</h6>
                            </div>
                        </div>
                    </div>
                </div>
            </a>
        </div>

        <div class="col-xl-3 col-md-6  mb-4">
            <a href="" style="text-decoration: none; color: #6c757d;">
                <div class="card h-100 border-bottom-card border-success">
                    <div class="card-body">
                        <div class="d-flex">
                            <div class="flex-grow-1">
                                <h6>{{ _lang('Deposit via ATM') }}</h6>
                            </div>
                        </div>
                    </div>
                </div>
            </a>
        </div>

        <div class="col-xl-3 col-md-6  mb-4">
            <a href="" style="text-decoration: none; color: #6c757d;">
                <div class="card h-100 border-bottom-card border-danger">
                    <div class="card-body">
                        <div class="d-flex">
                            <div class="flex-grow-1">
                                <h6>{{ _lang('Deposit Via Cash') }}</h6>
                            </div>
                        </div>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-xl-3 col-md-6  mb-4" style="cursor: not-allowed;">
            <a href="" style="text-decoration: none; color: #6c757d; pointer-events: none;  " >
                <div class="card h-100 border-bottom-card border-info">
                    <div class="card-body">
                        <div class="d-flex">
                            <div class="flex-grow-1">
                                <h6>{{ _lang('Redeem') }}</h6>
                            </div>
                        </div>
                    </div>
                </div>
            </a>
        </div>
    </div>
</div>

@endsection
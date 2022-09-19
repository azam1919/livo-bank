@extends('layouts.app')

@section('content')

@if(Auth::user()->user_type == 'customer' && Auth::user()->document_verified_at == null && get_option('enable_kyc') == 'yes')
<div class="row">
    <div class="col-lg-12">
        <div class="alert alert-danger">
            <strong><i class="mdi mdi-information-outline"></i> {{ _lang('Your account is not verified. Please submit all necessary documents') }}. <a href="{{ route('profile.document_verification') }}">{{ _lang('Submit Documents') }} </a></strong>
        </div>
    </div>
</div>
@endif

<div class="px-2 pt-3 text-center shadow " style="height: 190px">
    <!-- <img class="d-block mx-auto mb-4" src="../assets/brand/bootstrap-logo.svg" alt="" width="72" height="57"> -->
    <img src="{{ get_logo() }}" alt="" class="img-fluid">
    <h6 class="mt-3">{{ greeting_message() }} {{ Auth::user()->name }} </h6>
    <div class="row">
        <div class="col-4 sm-top" style="top:28px; cursor: pointer;">
            <a href="#" class="d-flex flex-column justify-content-center align-items-center">
                <i class="icofont-ui-user p-4 fs-45 fs-sm-20 shadow-lg bg-white" style="border-radius: 50%;color: grey"></i>
            </a>
            <span class="caption mt-5" style="margin-top: 10px">Cash In</span>
        </div>
        <div class="col-4 sm-top" style="top:28px; cursor: pointer;">
            <a href="#" class="d-flex flex-column justify-content-center align-items-center">
                <i class="icofont-ui-user p-4 fs-45 fs-sm-20 shadow-lg bg-white" style="border-radius: 50%;color: grey"></i>
            </a>
            <span class="caption mt-5" style="margin-top: 10px">Cash Out</span>
        </div>
        <div class="col-4 sm-top" style="top:28px; cursor: pointer;">
            <a href="#" class="d-flex flex-column justify-content-center align-items-center">
                <i class="icofont-ui-user p-4 fs-45 fs-sm-20 shadow-lg bg-white" style="border-radius: 50%;color: grey"></i>
            </a>
            <span class="caption mt-5" style="margin-top: 10px">Wire Transfer</span>
        </div>
    </div>
</div>
<div class="my-5"></div>
<div class="my-5 pb-1"></div>




<div class="row">
    <div class="col-xl-12">
        <div class="card mb-4">
            <div class="card-body" style="border-left: 10px solid #6574cd;">
                <div class="d-flex" style="justify-content: space-between;">
                    <!-- Add substr function to get the last 4 digit of the account -->
                    <h6>{{ _lang('Classic Account: ') }} {{ substr(Auth::user()->account_number, -4) }}</h6>
                    <!-- <h6 class="pt-1"><b>{{ Auth::user()->account_number }}</b></h6> -->
                    <!--  -->
                    <div class="dropdown">
                        <!-- <a class="" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="icofont-listine-dots"></i>
                        </a> -->
                        <span id="Accoutndropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="icofont-listine-dots"></i>
                        </span>
                        <div class="dropdown-menu mr-5" aria-labelledby="Accoutndropdown">
                            <a class="dropdown-item" href="#">Full Account</a>
                            <a class="dropdown-item" href="#">Create Savings Accounts</a>
                            <a class="dropdown-item" href="#">Transfer</a>
                            <a class="dropdown-item" href="#">Create Sub Account</a>
                            <a class="dropdown-item" role="button" id="collapse_all_acc">Collapse all Account</a>
                        </div>
                    </div>
                </div>
                <div class="d-flex" style="justify-content: space-between;">
                    <!-- <h6>{{ _lang('Avaiable Balance') }}</h6> -->
                    <h6>{{ _lang('xxxxxxxx') }}{{ substr(Auth::user()->account_number, -4) }}</h6>
                    @foreach($account_balance as $currency)
                    <h6 class="pt-1" id="balance" style="cursor: pointer;"><b>{{ decimalPlace($currency->balance, currency($currency->name)) }}</b></h6>
                    @endforeach
                </div>
            </div>
        </div>
    </div>
</div>
<div class="row child">
    <div class="col-xl-12">
        <div class="card mb-4">
            <div class="card-body" style="border-left: 10px solid #3490dc;">
                <div class="d-flex" style="justify-content: space-between;">
                    <!-- Add substr function to get the last 4 digit of the account -->
                    <h6>{{ _lang('Account Number: ') }} {{ substr(Auth::user()->account_number, -4) }}</h6>
                    <!-- <h6 class="pt-1"><b>{{ Auth::user()->account_number }}</b></h6> -->
                    <!--  -->
                    <div class="dropdown">
                        <span id="Accoutndropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="icofont-listine-dots"></i>
                        </span>
                        <div class="dropdown-menu mr-5" aria-labelledby="Accoutndropdown">
                            <a class="dropdown-item" href="#">Full Account</a>
                            <!-- <a class="dropdown-item" href="#">Create sub account</a>
                            <a class="dropdown-item" href="#">Collapse all Account</a> -->
                        </div>
                    </div>
                </div>
                <div class="d-flex" style="justify-content: space-between;">
                    <h6>{{ _lang('Avaiable Balance') }}</h6>
                    @foreach($account_balance as $currency)
                    <h6 class="pt-1"><b>{{ decimalPlace($currency->balance, currency($currency->name)) }}</b></h6>
                    @endforeach
                </div>
            </div>
        </div>
    </div>
</div>
<div class="row child">
    <div class="col-xl-12">
        <div class="card mb-4">
            <div class="card-body" style="border-left: 10px solid #3490dc;">
                <div class="d-flex" style="justify-content: space-between;">
                    <!-- Add substr function to get the last 4 digit of the account -->
                    <h6>{{ _lang('Account Number: ') }} {{ substr(Auth::user()->account_number, -4) }}</h6>
                    <!-- <h6 class="pt-1"><b>{{ Auth::user()->account_number }}</b></h6> -->
                    <!--  -->
                    <div class="dropdown">
                        <span id="Accoutndropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="icofont-listine-dots"></i>
                        </span>
                        <div class="dropdown-menu mr-5" aria-labelledby="Accoutndropdown">
                            <a class="dropdown-item" href="#">Full Account</a>
                            <!-- <a class="dropdown-item" href="#">Create sub account</a>
                            <a class="dropdown-item" href="#">Collapse all Account</a> -->
                        </div>
                    </div>
                </div>
                <div class="d-flex" style="justify-content: space-between;">
                    <h6>{{ _lang('Avaiable Balance') }}</h6>
                    @foreach($account_balance as $currency)
                    <h6 class="pt-1"><b>{{ decimalPlace($currency->balance, currency($currency->name)) }}</b></h6>
                    @endforeach
                </div>
            </div>
        </div>
    </div>
</div>
<div class="row" id="recent_trans">
    <div class="col-lg-12">
        <div class="card mb-4">
            <div class="card-header">
                {{ _lang('Recent Transactions') }}
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>{{ _lang('Date') }}</th>
                                <th>{{ _lang('Currency') }}</th>
                                <th>{{ _lang('Amount') }}</th>
                                <th>{{ _lang('Charge') }}</th>
                                <th>{{ _lang('Grand Total') }}</th>
                                <th>{{ _lang('DR/CR') }}</th>
                                <th>{{ _lang('Type') }}</th>
                                <th>{{ _lang('Method') }}</th>
                                <th>{{ _lang('Status') }}</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($recent_transactions as $transaction)
                            @php
                            $symbol = $transaction->dr_cr == 'dr' ? '-' : '+';
                            $class = $transaction->dr_cr == 'dr' ? 'text-danger' : 'text-success';
                            @endphp
                            <tr>
                                <td>{{ $transaction->created_at }}</td>
                                <td>{{ $transaction->currency->name }}</td>
                                @if($transaction->dr_cr == 'dr')
                                <td>{{ decimalPlace(($transaction->amount - $transaction->fee), currency($transaction->currency->name)) }}</td>
                                @else
                                <td>{{ decimalPlace(($transaction->amount + $transaction->fee), currency($transaction->currency->name)) }}</td>
                                @endif
                                <td>{{ $transaction->dr_cr == 'dr' ? '+ '.decimalPlace($transaction->fee, currency($transaction->currency->name)) : '- '.decimalPlace($transaction->fee, currency($transaction->currency->name)) }}</td>
                                <td><span class="{{ $class }}">{{ $symbol.' '.decimalPlace($transaction->amount, currency($transaction->currency->name)) }}</span></td>
                                <td>{{ strtoupper($transaction->dr_cr) }}</td>
                                <td>{{ str_replace('_',' ',$transaction->type) }}</td>
                                <td>{{ $transaction->method }}</td>
                                <td>{!! xss_clean(transaction_status($transaction->status)) !!}</td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function() {
        $('#recent_trans').hide();
        $('#balance').click(function() {
            $('#recent_trans').slideToggle('slow');
        });
        $('#collapse_all_acc').click(function() {
            // alert($(this).text());
            if ($(this).text() == 'Collapse all Account') {
                $('.child').slideUp();
                $(this).html("Expand all Account");
            } else if ($(this).text() == 'Expand all Account') {
                $('.child').slideDown();
                $(this).html("Collapse all Account");
            }
        });
    });
</script>
@endsection

<!-- 
<style>
    .icon-container {
        width: 60px;
        height: 60px;
        background-color: black;
        border-radius: 50%;
    }

    .bg-blue {
        background-color: #3490dc;
    }
</style>
-->

<!-- 
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
                <div class="card h-100 border-bottom-card border-info">
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
        <div class="col-xl-3 col-md-6  mb-4">
            <a href="" style="text-decoration: none; color: #6c757d;" disabled>
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
<div id="wire_transfer">
    <div class="row">
        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card h-100 border-bottom-card border-danger">
                <div class="card-body">
                    <div class="d-flex">
                        <div class="flex-grow-1">
                            <h6>{{ _lang('Active Loans') }}</h6>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-xl-3 col-md-6  mb-4">
            <div class="card h-100 border-bottom-card border-info">
                <div class="card-body">
                    <div class="d-flex">
                        <div class="flex-grow-1">
                            <h6>{{ _lang('Payment Requests') }}</h6>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-xl-3 col-md-6  mb-4">
            <div class="card h-100 border-bottom-card border-success">
                <div class="card-body">
                    <div class="d-flex">
                        <div class="flex-grow-1">
                            <h6>{{ _lang('Active Fixed Deposits') }}</h6>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-xl-3 col-md-6  mb-4">
            <div class="card h-100 border-bottom-card border-info">
                <div class="card-body">
                    <div class="d-flex">
                        <div class="flex-grow-1">
                            <h6>{{ _lang('Active Tickets') }}</h6>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="statement">
    <div class="row">
        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card h-100 border-bottom-card border-danger">
                <div class="card-body">
                    <div class="d-flex">
                        <div class="flex-grow-1">
                            <h6>{{ _lang('Active Loans') }}</h6>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-xl-3 col-md-6  mb-4">
            <div class="card h-100 border-bottom-card border-info">
                <div class="card-body">
                    <div class="d-flex">
                        <div class="flex-grow-1">
                            <h6>{{ _lang('Payment Requests') }}</h6>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-xl-3 col-md-6  mb-4">
            <div class="card h-100 border-bottom-card border-success">
                <div class="card-body">
                    <div class="d-flex">
                        <div class="flex-grow-1">
                            <h6>{{ _lang('Active Fixed Deposits') }}</h6>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-xl-3 col-md-6  mb-4">
            <div class="card h-100 border-bottom-card border-info">
                <div class="card-body">
                    <div class="d-flex">
                        <div class="flex-grow-1">
                            <h6>{{ _lang('Active Tickets') }}</h6>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="swap">
    <div class="row">
        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card h-100 border-bottom-card border-danger">
                <div class="card-body">
                    <div class="d-flex">
                        <div class="flex-grow-1">
                            <h6>{{ _lang('Active Loans') }}</h6>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-xl-3 col-md-6  mb-4">
            <div class="card h-100 border-bottom-card border-info">
                <div class="card-body">
                    <div class="d-flex">
                        <div class="flex-grow-1">
                            <h6>{{ _lang('Payment Requests') }}</h6>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-xl-3 col-md-6  mb-4">
            <div class="card h-100 border-bottom-card border-success">
                <div class="card-body">
                    <div class="d-flex">
                        <div class="flex-grow-1">
                            <h6>{{ _lang('Active Fixed Deposits') }}</h6>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-xl-3 col-md-6  mb-4">
            <div class="card h-100 border-bottom-card border-info">
                <div class="card-body">
                    <div class="d-flex">
                        <div class="flex-grow-1">
                            <h6>{{ _lang('Active Tickets') }}</h6>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div> 
-->
<!-- <div class="row">
    @foreach($account_balance as $currency)
    <div class="col-md">
        <div class="card mb-4">
            <div class="card-body">
                <h6>{{ $currency->name.' '._lang('Balance') }}</h6> 
                <h6 class="pt-1"><b>{{ decimalPlace($currency->balance, currency($currency->name)) }}</b></h6>
            </div>
        </div>
    </div>
    @endforeach
</div> -->
<!-- <div class="row">
    <div class="col-xl-3 col-md-6 mb-4">
        <div class="card h-100 border-bottom-card border-danger">
            <div class="card-body">
                <div class="d-flex">
                    <div class="flex-grow-1">
                        <h6>{{ _lang('Active Loans') }}</h6>
                    </div>
                    <div>
                        <a href="{{ route('loans.my_loans') }}"><i class="icofont-arrow-right"></i>{{ _lang('View') }}</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    -->

<!-- <div class="col-xl-3 col-md-6  mb-4">
        <div class="card h-100 border-bottom-card border-info">
            <div class="card-body">
                <div class="d-flex">
                    <div class="flex-grow-1">
                        <h6>{{ _lang('Payment Requests') }}</h6>
                    </div>
                    <div>
                        <a href="{{ route('payment_requests.index') }}"><i class="icofont-arrow-right"></i>{{ _lang('View') }}</a>
                    </div>
                </div>
            </div>
        </div>
    </div> -->

<!-- <div class="col-xl-3 col-md-6  mb-4">
        <div class="card h-100 border-bottom-card border-success">
            <div class="card-body">
                <div class="d-flex">
                    <div class="flex-grow-1">
                        <h6>{{ _lang('Active Fixed Deposits') }}</h6>
                    </div>
                    <div>
                        <a href="{{ route('fixed_deposits.history') }}"><i class="icofont-arrow-right"></i>{{ _lang('View') }}</a>
                    </div>
                </div>
            </div>
        </div>
    </div> -->

<!-- <div class="col-xl-3 col-md-6  mb-4">
        <div class="card h-100 border-bottom-card border-info">
            <div class="card-body">
                <div class="d-flex">
                    <div class="flex-grow-1">
                        <h6>{{ _lang('Active Tickets') }}</h6>
                    </div>
                    <div>
                        <a href="{{ route('tickets.my_tickets',['status' => 'active']) }}"><i class="icofont-arrow-right"></i>{{ _lang('View') }}</a>
                    </div>
                </div>
            </div>
        </div>
    </div> 
</div>-->

<!-- 
    <div class="row">
        <div class="col-lg-12">
            <div class="card mb-4">
                <div class="card-header">
                    {{ _lang('Up Comming Loan Payment') }}
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered">
                            <thead>
                                <th>{{ _lang('Loan ID') }}</th>
                                <th>{{ _lang('Next Payment Date') }}</th>
                                <th>{{ _lang('Status') }}</th>
                                <th class="text-right">{{ _lang('Amount to Pay') }}</th>
                                <th class="text-center">{{ _lang('Action') }}</th>
                            </thead>
                            <tbody>
                                @if(count($loans) == 0)
                                    <tr>
                                        <td colspan="5"><h6 class="text-center">{{ _lang('No Active Loan Available') }}</h6></td>
                                    </tr>
                                @endif

                                @foreach($loans as $loan)
                                <tr>
                                    <td>{{ $loan->loan_id }}</td>
                                    <td>{{ $loan->next_payment->repayment_date }}</td>
                                    <td>{!! $loan->next_payment->repayment_date >= date('Y-m-d') ? xss_clean(show_status(_lang('Upcoming'),'success')) : xss_clean(show_status(_lang('Due'),'danger')) !!}</td>
                                    <td class="text-right">{{ decimalPlace($loan->next_payment->amount_to_pay, currency($loan->currency->name)) }}</td>
                                    <td class="text-center"><a href="{{ route('loans.loan_payment',$loan->id) }}" class="btn btn-primary btn-sm">{{ _lang('Pay Now') }}</a></td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>	
-->
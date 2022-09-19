 @extends('layouts.app')

 @section('content')
     @if (Auth::user()->user_type == 'customer' &&
         Auth::user()->document_verified_at == null &&
         get_option('enable_kyc') == 'yes')
         <div class="row">
             <div class="col-lg-12">
                 <div class="alert alert-danger">
                     <strong><i class="mdi mdi-information-outline"></i>
                         {{ _lang('Your account is not verified. Please submit all necessary documents') }}. <a
                             href="{{ route('profile.document_verification') }}">{{ _lang('Submit Documents') }}
                         </a></strong>
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
                 <a href="/dashboard/deposit" class="d-flex flex-column justify-content-center align-items-center">
                     <i class="icofont-ui-user p-4 fs-45 fs-sm-20 shadow-lg bg-white"
                         style="border-radius: 50%;color: grey"></i>
                 </a>
                 <span class="caption mt-5" style="margin-top: 10px">Cash In</span>
             </div>
             <div class="col-4 sm-top" style="top:28px; cursor: pointer;">
                 <a href="#" class="d-flex flex-column justify-content-center align-items-center">
                     <i class="icofont-ui-user p-4 fs-45 fs-sm-20 shadow-lg bg-white"
                         style="border-radius: 50%;color: grey"></i>
                 </a>
                 <span class="caption mt-5" style="margin-top: 10px">Cash Out</span>
             </div>
             <div class="col-4 sm-top" style="top:28px; cursor: pointer;">
                 <a href="#" class="d-flex flex-column justify-content-center align-items-center">
                     <i class="icofont-ui-user p-4 fs-45 fs-sm-20 shadow-lg bg-white"
                         style="border-radius: 50%;color: grey"></i>
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
                         @foreach ($account_balance as $currency)
                             <h6 class="pt-1" class="balance" id="balance" style="cursor: pointer;">
                                 <b>{{ decimalPlace($currency->balance, currency($currency->name)) }}</b>
                             </h6>
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
                         @foreach ($account_balance as $currency)
                             <h6 class="pt-1"><b>{{ decimalPlace($currency->balance, currency($currency->name)) }}</b>
                             </h6>
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
                             <span id="Accoutndropdown" data-toggle="dropdown" aria-haspopup="true"
                                 aria-expanded="false">
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
                         @foreach ($account_balance as $currency)
                             <h6 class="pt-1"><b>{{ decimalPlace($currency->balance, currency($currency->name)) }}</b>
                             </h6>
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
                                 @foreach ($recent_transactions as $transaction)
                                     @php
                                         $symbol = $transaction->dr_cr == 'dr' ? '-' : '+';
                                         $class = $transaction->dr_cr == 'dr' ? 'text-danger' : 'text-success';
                                     @endphp
                                     <tr>
                                         <td>{{ $transaction->created_at }}</td>
                                         <td>{{ $transaction->currency->name }}</td>
                                         @if ($transaction->dr_cr == 'dr')
                                             <td>{{ decimalPlace($transaction->amount - $transaction->fee, currency($transaction->currency->name)) }}
                                             </td>
                                         @else
                                             <td>{{ decimalPlace($transaction->amount + $transaction->fee, currency($transaction->currency->name)) }}
                                             </td>
                                         @endif
                                         <td>{{ $transaction->dr_cr == 'dr' ? '+ ' . decimalPlace($transaction->fee, currency($transaction->currency->name)) : '- ' . decimalPlace($transaction->fee, currency($transaction->currency->name)) }}
                                         </td>
                                         <td><span
                                                 class="{{ $class }}">{{ $symbol . ' ' . decimalPlace($transaction->amount, currency($transaction->currency->name)) }}</span>
                                         </td>
                                         <td>{{ strtoupper($transaction->dr_cr) }}</td>
                                         <td>{{ str_replace('_', ' ', $transaction->type) }}</td>
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

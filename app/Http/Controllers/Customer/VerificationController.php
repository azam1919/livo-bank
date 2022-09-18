<?php

namespace App\Http\Controllers\Customer;

use Auth;
use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class VerificationController extends Controller
{
    //
    public function kyc_verify()
    {
        $alert_col = 'col-lg-8 offset-lg-2';
        $profile   = User::find(Auth::User()->id);
        return view('backend.verification.kyc_verify', compact('profile', 'alert_col'));
    }
}

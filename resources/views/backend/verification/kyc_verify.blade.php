@extends('layouts.app')
@section('content')
<div class="row">
	<div class="col-lg-8 offset-lg-2">
		<div class="card">
			<div class="card-header text-center">
				{{ _lang('KYC verification') }}
			</div>
			<div class="card-body">

				<form action="{{ route('profile.update') }}" autocomplete="off" class="form-horizontal form-groups-bordered validate" enctype="multipart/form-data" method="post">
					@csrf
					<div class="row">

						<div class="col-12">
							<div class="form-group">
								<label class="control-label">{{ _lang('Selfie') }} </label>
								<input type="file" class="form-control dropify" data-default-file="{{ $profile->profile_picture != '' ? asset('uploads/profile/'.$profile->profile_picture) : '' }}" name="selfie" data-allowed-file-extensions="png jpg jpeg PNG JPG JPEG" required>
							</div>
						</div>

						<!-- ID Card section start -->
						<div class="col-lg-6">
							<div class="form-group">
								<label class="control-label">{{ _lang('ID Card Front') }}</label>
								<input type="file" class="form-control dropify" data-default-file="{{ $profile->profile_picture != '' ? asset('uploads/profile/'.$profile->profile_picture) : '' }}" name="profile_picture" data-allowed-file-extensions="png jpg jpeg PNG JPG JPEG" required>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="form-group">
								<label class="control-label">{{ _lang('ID Card Back') }}</label>
								<input type="file" class="form-control dropify" data-default-file="{{ $profile->profile_picture != '' ? asset('uploads/profile/'.$profile->profile_picture) : '' }}" name="profile_picture" data-allowed-file-extensions="png jpg jpeg PNG JPG JPEG" required>
							</div>
						</div>
						<!-- ID Card section end -->
						<!-- Driver License section start -->
						<div class="col-lg-6">
							<div class="form-group">
								<label class="control-label">{{ _lang('Driver License Front') }}</label>
								<input type="file" class="form-control dropify" data-default-file="{{ $profile->profile_picture != '' ? asset('uploads/profile/'.$profile->profile_picture) : '' }}" name="profile_picture" data-allowed-file-extensions="png jpg jpeg PNG JPG JPEG" required>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="form-group">
								<label class="control-label">{{ _lang('Driver License Back') }}</label>
								<input type="file" class="form-control dropify" data-default-file="{{ $profile->profile_picture != '' ? asset('uploads/profile/'.$profile->profile_picture) : '' }}" name="profile_picture" data-allowed-file-extensions="png jpg jpeg PNG JPG JPEG" required>
							</div>
						</div>
						<!-- Driver License section end -->
						<!-- Voters Card section start -->
						<div class="col-lg-6">
							<div class="form-group">
								<label class="control-label">{{ _lang('Voters Card Front') }}</label>
								<input type="file" class="form-control dropify" data-default-file="{{ $profile->profile_picture != '' ? asset('uploads/profile/'.$profile->profile_picture) : '' }}" name="profile_picture" data-allowed-file-extensions="png jpg jpeg PNG JPG JPEG" required>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="form-group">
								<label class="control-label">{{ _lang('Voters Card Back') }}</label>
								<input type="file" class="form-control dropify" data-default-file="{{ $profile->profile_picture != '' ? asset('uploads/profile/'.$profile->profile_picture) : '' }}" name="profile_picture" data-allowed-file-extensions="png jpg jpeg PNG JPG JPEG" required>
							</div>
						</div>
						<!-- Voters Card section end -->
						<!-- Passport section start -->
						<div class="col-lg-6">
							<div class="form-group">
								<label class="control-label">{{ _lang('Passport Front') }}</label>
								<input type="file" class="form-control dropify" data-default-file="{{ $profile->profile_picture != '' ? asset('uploads/profile/'.$profile->profile_picture) : '' }}" name="profile_picture" data-allowed-file-extensions="png jpg jpeg PNG JPG JPEG" required>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="form-group">
								<label class="control-label">{{ _lang('Passport Back') }}</label>
								<input type="file" class="form-control dropify" data-default-file="{{ $profile->profile_picture != '' ? asset('uploads/profile/'.$profile->profile_picture) : '' }}" name="profile_picture" data-allowed-file-extensions="png jpg jpeg PNG JPG JPEG" required>
							</div>
						</div>
						<!-- Passport section end -->

						<div class="col-12">
							<div class="form-group">
								<button type="submit" class="btn btn-primary btn-block"><i class="icofont-check-circled"></i> {{ _lang('Upload') }}</button>
							</div>
						</div>
					</div>
				</form>

			</div>
		</div>
	</div>
</div>
@endsection
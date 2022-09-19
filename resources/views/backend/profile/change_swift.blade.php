@extends('layouts.app')

@section('content')
<div class="row">
	<div class="col-lg-8 offset-lg-2">
		<div class="card">
			<div class="card-header text-center">
				{{ _lang('Change Swift Code') }}
			</div>

			<div class="card-body">
				<form action="{{ route('profile.update_swift') }}" class="form-horizontal form-groups-bordered validate" enctype="multipart/form-data" method="post" accept-charset="utf-8">
					@csrf
					<div class="row">
						<div class="col-12">
							<div class="form-group">
								<label class="control-label">{{ _lang('Old Swfit Code') }}</label>
								<input type="swiftcode" class="form-control" name="oldswift" required>
							</div>
						</div>

						<div class="col-12">
							<div class="form-group">
								<label class="control-label">{{ _lang('New Swift Code') }}</label>
								<input type="swift" class="form-control" name="swift" required>
							</div>
						</div>

						<div class="col-12">
							<div class="form-group">
								<label class="control-label">{{ _lang('Confirm Swift Code') }}</label>
								<input type="swift" class="form-control" id="swift-confirm" name="swift_confirmation" required>
							</div>
						</div>

						<div class="col-12">
							<div class="form-group">
								<button type="submit" class="btn btn-primary btn-block"><i class="icofont-check-circled"></i> {{ _lang('Update Swift Code') }}</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
@endsection


@extends('layouts.frontend.app')

@section('title','Register')

@section('slider')
<div class="slider-breadcrumb-area text-center">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 offset-lg-3">
                <div class="breadcrumb-title">
                    <h4>{{ __('Register') }}</h4>
                </div>
                <nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
                    <ol class="breadcrumb justify-content-center">
                        <li class="breadcrumb-item"><a href="/">{{ __('Home') }}</a></li>
                        <li class="breadcrumb-item active" aria-current="page">{{ __('Register') }}</li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
</div>
<!-- breadcrumb area start -->
</div>
@endsection

@section('content')
<section>
    <div class="dashboard-area pt-150 pb-150">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3">
                    <div class="main-container">
                        <div class="header-section mb-4">
                            <h4>{{ __('Register') }}</h4>
                        </div>                        
                        <form method="POST" id="regform" action="{{ route('register') }}">
                        @csrf
                        <div class="login-section">
                            <h6>{{ __('Name') }}</h6>
                            <div class="form-group mb-2">
                                <input id="name" type="text" class="form-control @error('name') is-invalid @enderror" name="name" value="{{ old('name') }}" required autocomplete="name" autofocus placeholder="ادخل الاسم">
                            </div>
                             <h6>{{ __('E-Mail Address') }}</h6>
                            <div class="form-group mb-2">
                                <input id="email" type="email" class="form-control @error('email') is-invalid @enderror" name="email" value="@isset($request->email) {{ $request->email }} @else {{ old('email') }} @endisset" required autocomplete="email" placeholder="ادخل البريد الالكتروني">
                                @error('email')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                            <h6>{{ __('Phone') }}</h6>
                            <div class="form-group mb-2">
                                <input id="phone" type="tel" class="form-control @error('phone') is-invalid @enderror" name="phone" value="@isset($request->phone) {{ $request->phone }} @else {{ old('phone') }} @endisset" required autocomplete="phone" placeholder="ادخل رقم الهاتف">
                                @error('phone')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                            <h6>{{ __('Password') }}</h6>
                            <div class="form-group mb-4">
                                 <input id="password" type="password" class="form-control @error('password') is-invalid @enderror" name="password" required autocomplete="new-password" placeholder="ادخل كلمة المرور">
                                @error('password')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                            <h6>{{ __('Confirm Password') }}</h6>
                            <div class="form-group mb-2">
                                 <input id="password-confirm" type="password" class="form-control" name="password_confirmation" required autocomplete="new-password" placeholder="تاكيد كلمة المرور">
                            </div>

                            <h6>{{ __('Business Type') }}</h6>
                            <div class="form-group mb-2">
                                <select name="business_type" id="business_type" class="form-control" value="@isset($request->business_type) {{ $request->business_type }}  @endisset">
                                <option value="commercial">سجل تجاري</option>
                                <option value="freelancer">وثيقة عمل حر</option>
                                </select> 
                            </div>

                            <h6>{{ __('license number') }}</h6>
                            <div class="form-group mb-2">
                                <input id="license_number" type="string" class="form-control @error('license_number') is-invalid @enderror" name="license_number" value="@isset($request->license_number) {{ $request->license_number }}  @endisset" placeholder="ادخل كود الترخيص">
                                @error('license_number')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                    @enderror
                            </div>
         
                            @if(env('NOCAPTCHA_SECRET') != null)
                            <div class="form-group mb-2">

                             {!! NoCaptcha::renderJs(Session::get('locale')) !!}
                             {!! NoCaptcha::display() !!}

                             @if ($errors->has('g-recaptcha-response'))
                            <span class="text-danger">
                                <strong>{{ $errors->first('g-recaptcha-response') }}</strong>
                            </span>
                            @endif
                            </div>
                            @endif
                            
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="login-btn">
                                        <button type="submit" id="regbtn" class="btn btn-primary">{{ __('Register') }}</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                      </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
@endsection



@extends('layouts.docs.app')

@section('content')
<div class="dashboard-main-area">
    <div class="dashboard-title">
        <h2>{{ __('Payment gateway Install') }}</h2>
    </div>
    <div class="dashboard-des">
        <p>{{ __('يمكنك تثبيت بوابة الدفع الخاصة بك في لوحة تحكم البائع. فقط اتبع خطوتين لهذا. اذهب إلى:') }} <strong>"{{ __('yourdomain/merchant/gateway') }}"</strong>.</p>
    </div>
    <div class="main-container-area">
        <div class="step-area mt-5">
            <div class="step-title">
                <h5>{{ __('الخطوة 1: حدد بوابة الدفع للتثبيت باستخدام بيانات الاعتماد الخاصة بك.') }}</h5>
            </div>
            <div class="step-body">
                <div class="step-img">
                    <img class="img-fluid" src="{{ asset('frontend/assets/img/docs/payment-install/1.png') }}" alt="">
                </div>
            </div>
        </div>
        <div class="step-area mt-5">
            <div class="step-title">
                <h5>{{ __('الخطوة 2: أدخل معلومات البوابة الخاصة بك بما في ذلك بيانات الاعتماد') }}:</h5>
            </div>
            <div class="step-body">
                <div class="step-img">
                    <img class="img-fluid" src="{{ asset('frontend/assets/img/docs/payment-install/2.png') }}" alt="">
                </div>
            </div>
        </div>
    </div>
    <div class="next-page-link-area mt-100 mb-100">
        <div class="next-page-link f-right">
            <a href="{{ route('docs.form.generator') }}">{{ __('المدفوعات من خلال نموذج التاجر') }} <span class="iconify" data-icon="eva:arrow-ios-back-outline" data-inline="false"></span></a>
        </div>
    </div>
</div>
@endsection
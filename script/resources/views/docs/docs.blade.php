@extends('layouts.docs.app')

@section('content')
<div class="dashboard-main-area">
    <div class="dashboard-title">
        <h2>{{ config('app.name') }}{{ __(' دليل الاستخدام') }}</h2>
    </div>
    <div class="dashboard-des">
        <p>{{ __('اهلا  بكم في  '.config('app.name').' ستتعرف على كيفية تثبيت بوابة الدفع في لوحة تحكم البائع وغير ذلك الكثير..') }}</p>
    </div>
    <div class="quickstart-area">
        <div class="quickstart-title mt-5">
            <h4>{{ __('لمحة سريعة') }}</h4>
        </div>
        <div class="quick-start-card">
            <div class="row">
                <div class="col-lg-6">
                    <a href="{{ route('docs.payment.install') }}">
                        <div class="single-quick-start mb-30">
                            <div class="quick-start-img">
                                <img class="img-fluid" src="{{ asset('frontend/assets/img/docs/quick-step/1.png') }}" alt="">
                            </div>
                            <div class="quick-start-title">
                                <h6>{{ __('التسجيل(لوحة تحكم البائع)') }}</h6>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-6">
                    <a href="{{ route('docs.form.generator') }}">
                        <div class="single-quick-start mb-30">
                            <div class="quick-start-img">
                                <img class="img-fluid" src="{{ asset('frontend/assets/img/docs/quick-step/2.png') }}" alt="">
                            </div>
                            <div class="quick-start-title">
                                <h6>{{ __('توليد نموذج الفوترة والدفع') }}</h6>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-6">
                    <a href="{{ route('docs.payment.url') }}">
                        <div class="single-quick-start mb-30">
                            <div class="quick-start-img">
                                <img class="img-fluid" src="{{ asset('frontend/assets/img/docs/quick-step/3.png') }}" alt="">
                            </div>
                            <div class="quick-start-title">
                                <h6>{{ __('الدفع عبر الرابط المباشر (مزامنة التاجر)') }}</h6>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-6">
                    <a href="{{ route('docs.payment.api') }}">
                        <div class="single-quick-start mb-30">
                            <div class="quick-start-img">
                                <img class="img-fluid" src="{{ asset('frontend/assets/img/docs/quick-step/4.png') }}" alt="">
                            </div>
                            <div class="quick-start-title">
                                <h6>{{ __('بوابة دفع  API (تجريبي)') }}</h6>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <div class="next-page-link-area mt-100 mb-100">
        <div class="next-page-link f-right">
            <a href="{{ route('docs.payment.install') }}">{{ __('تثبيت بوابة الدفع (لوحة التاجر) ') }}<span class="iconify " data-icon="eva:arrow-ios-back-outline" data-inline="false"></span></a>
        </div>
    </div>
</div>
@endsection
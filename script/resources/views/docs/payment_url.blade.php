@extends('layouts.docs.app')

@section('content')
<div class="dashboard-main-area">
    <div class="dashboard-title">
        <h2>{{ __('المدفوعات من خلال URL لمرة واحدة') }}</h2>
    </div>
    <div class="dashboard-des">
        <p>{{ __('لإنشاء طلب جديد ، حدد إنشاء طلب واملأ النموذج ، سيتم إنشاء عنوان url جديد.') }}</p>
    </div>
    <div class="main-container-area">
        <div class="step-area mt-5">
            <div class="step-body">
                <div class="step-img">
                    <img class="img-fluid" src="{{ asset('frontend/assets/img/docs/url_copy/1.png') }}" alt="">
                </div>
            </div>
        </div>
        <div class="step-area mt-5">
            <div class="step-title">
                <h5>{{ __('الآن انسخ الرابط وأرسله إلى عميلك. سيطلع العميل على خيارات بوابة الدفع.') }}</h5>
            </div>
            <div class="step-body">
                <div class="step-img">
                    <img class="img-fluid mb-3" src="{{ asset('frontend/assets/img/docs/url_copy/2.png') }}" alt="">
                </div>
            </div>
        </div>
        <div class="step-area mt-5">
            <div class="step-title">
                <p>{{ __('بقية العملية هي نفس صيغة html.') }}</p>
            </div>
            <div class="step-body">
                <div class="step-img">
                    <img class="img-fluid" src="{{ asset('frontend/assets/img/docs/form_generate/4.png') }}" alt="">
                </div>
            </div>
        </div>
    </div>
    <div class="next-page-link-area mt-100 mb-100">
        <div class="next-page-link f-right">
            <a href="{{ route('docs.payment.api') }}">{{ __('المدفوعات من خلال API (عرض توضيحي مع ساعي البريد)') }} <span class="iconify" data-icon="eva:arrow-ios-back-outline" data-inline="false"></span></a>
        </div>
    </div>
</div>
@endsection
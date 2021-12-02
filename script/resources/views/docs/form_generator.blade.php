@extends('layouts.docs.app')

@section('content')
<div class="dashboard-main-area">
    <div class="dashboard-title">
        <h2>{{ __('المدفوعات من خلال نموذج التاجر') }}.</h2>
    </div>
    <div class="dashboard-des">
        <p>{{ __('لإنشاء نموذج html للمستخدمين ، انقر فوق منشئ النموذج من القائمة الجانبية ثم املأ القيم المطلوبة إذا لزم الأمر. ثم اضغط على زر توليد.') }}</p>
    </div>
    <div class="main-container-area">
        <div class="step-area mt-5">
            <div class="step-title">
                <h5>{{ __('الخطوة 1: انتقل إلى "موقعك / التاجر-تجاري / النموذج"') }}</h5>
            </div>
            <div class="step-body">
                <div class="step-img">
                    <img class="img-fluid" src="{{ asset('frontend/assets/img/docs/form_generate/1.png') }}" alt="">
                </div>
            </div>
        </div>
        <div class="step-area mt-5">
            <div class="step-title">
                <h5>{{ __('الخطوة 2: الآن يمكنك النقر فوق نسخ لنسخ كود html واستخدامه في ملف html الخاص بالمشروع.') }}</h5>
            </div>
            <div class="step-body">
                <div class="step-img">
                    <img class="img-fluid" src="{{ asset('frontend/assets/img/docs/form_generate/2.png') }}" alt="">
                </div>
            </div>
        </div>
        <div class="step-area mt-5">
            <div class="step-title">
                <h5>{{ __('الخطوة 3: الآن يمكن للمستخدم ملء النموذج وإرساله.') }}</h5>
            </div>
            <div class="step-body">
                <div class="step-img">
                    <img class="img-fluid" src="{{ asset('frontend/assets/img/docs/form_generate/3.png') }}" alt="">
                </div>
            </div>
        </div>
        <div class="step-area mt-5">
            <div class="step-title">
                <h5>{{ __('الخطوة 4: بعد الإرسال حدد بوابة الدفع.') }}</h5>
            </div>
            <div class="step-body">
                <div class="step-img">
                    <img class="img-fluid" src="{{ asset('frontend/assets/img/docs/form_generate/4.png') }}" alt="">
                </div>
            </div>
        </div>
        <div class="step-area mt-5">
            <div class="step-title">
                <h5>{{ __('الخطوة 5: أدخل معلومات بطاقتك الائتمانية إذا تطلب الأمر.') }}</h5>
            </div>
            <div class="step-body">
                <div class="step-img">
                    <img class="img-fluid" src="{{ asset('frontend/assets/img/docs/form_generate/5.png') }}" alt="">
                </div>
            </div>
        </div>
        <div class="step-area mt-5">
            <div class="step-title">
                <h5>{{ __('الخطوة 5: إذا نجحت عملية الدفع ، فسيتم إعادة توجيهك إلى صفحة النجاح أو إذا أضاف التاجر عنوان url الاحتياطي ، فسيتم إعادة توجيهك إلى موقع الويب المطلوب:') }}</h5>
            </div>
            <div class="step-body">
                <div class="step-img">
                    <img class="img-fluid" src="{{ asset('frontend/assets/img/docs/form_generate/6.png') }}" alt="">
                </div>
            </div>
        </div>
    </div>
    <div class="next-page-link-area mt-100 mb-100">
        <div class="next-page-link f-right">
            <a href="{{ route('docs.payment.url') }}">{{ __('المدفوعات من خلال عنوان URL لمرة واحدة (من إنشاء التاجر)') }} <span class="iconify" data-icon="eva:arrow-ios-back-outline" data-inline="false"></span></a>
        </div>
    </div>
</div>
@endsection
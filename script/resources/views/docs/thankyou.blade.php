@extends('layouts.docs.app')

@section('content')
<div class="dashboard-main-area">
    <div class="dashboard-title">
        <h2>{{ __('شكرا لك') }}</h2>
    </div>
    <div class="dashboard-des">
        <p>{{ __('شكرا لك على كل دعمك وحبك. مع التغيير يأتي النمو ، مع النمو يأتي الفهم والفهم يأتي القبول. نحبك من كل قلوبنا.') }}</p>
    </div>
    <div class="main-container-area">
        <div class="thankyou-img">
            <img class="img-fluid" src="{{ asset('frontend/assets/img/docs/thankyou.png') }}" alt="">
        </div>
    </div>
    <div class="next-page-link-area mt-100 mb-100">
       
    </div>
</div>  
@endsection
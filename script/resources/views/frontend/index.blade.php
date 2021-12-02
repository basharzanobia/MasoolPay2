@extends('layouts.frontend.app')

@section('slider')
    @include('layouts.frontend.partials.slider')
@endsection

@section('content')
@if(count($sections) > 0)
<!-- features area start -->
<section>
    <div class="features-area pt-100 pb-100">
        <div class="container">
            <div class="row">
                <div class="features-header-section text-center">
                    <h4>{{ __('Our Valuable Features') }}</h4>
                    <p>{{ __('features_des') }}</p>
                </div>
            </div>
            <div class="row">
                @foreach ($sections as $value)
                @php $jsonSection = json_decode($value->termMeta->value ) @endphp
                <div class="col-lg-4">
                    <div class="single-service text-center">
                        <div class="service-img">
                            <img src="{{ asset($jsonSection->image ?? '') }}" alt="">
                        </div>
                        <div class="service-title">
                            <h4>{{ $value->title }}</h4>
                        </div>
                        <div class="service-des">
                            <p>{{ $jsonSection->des }}</p>
                        </div>
                        <div class="service-btn">
                            <a href="{{ url('/service',$value->slug) }}">{{ __('Read More') }}</a>
                        </div>
                    </div>
                </div>
               
                @endforeach
            </div>
        </div>
    </div>
</section>
@endif
<!-- features area end -->
@if(!empty($quickStart))
<!-- about area start -->
<section>
    @php 
    $jsonQuick = json_decode($quickStart->quickStart->value ?? ''); 
    @endphp
    <div class="about-area pt-100 pb-100">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6">
                    <div class="about-title">
                        <h3>{{ $quickStart->title }}</h3>
                    </div>
                    <div class="about-des">
                        <p>{{ $jsonQuick->des ?? null }}</p>
                    </div>
                    <div class="about-menu">
                        <nav>
                            <ul>
                                @foreach ($jsonQuick->list ?? [] as $key => $val)
                                <li><span class="iconify" data-icon="akar-icons:check" data-inline="false"></span>{{ $val }}</li>
                                @endforeach
                            </ul>
                        </nav>
                    </div>
                    <div class="about-link">
                        <a href="{{ $jsonQuick->button_link }}"><span class="iconify" data-icon="akar-icons:circle-check" data-inline="false"></span>{{ $jsonQuick->button_name }}</a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="about-img">
                        <img class="img-fluid" src="{{ asset($jsonQuick->image ?? '')}}" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- about area end -->
@endif
<!-- customer-experience area start  -->
<section>
    <div class="customer-experience-area pb-100">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6">
                    <div class="about-img">
                        <img class="img-fluid" src="{{ asset($getawaySection->image ?? '')}}" alt="">
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="customer-experience-content">
                        <h3>{{ $getawaySection->first_title ?? '' }}</h3>
                        <p>{{ $getawaySection->first_des ?? '' }}</p>
                    </div>
                    <div class="customer-experience-content">
                        <h3>{{ $getawaySection->second_title ?? '' }}</h3>
                        <p>{{ $getawaySection->second_des ?? '' }}</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- customer-experience area end  -->
@if(count($plans) > 0)
<!-- pricing area start -->
<div class="pricing-area mb-100 pt-150 pb-150">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 offset-lg-3">
                <div class="pricing-header-area text-center">
                    <div class="pricing-header">
                        <h2>{{ __('Pricing Tables') }}</h2>
                        <p>{{ __('pricing_des') }}</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="row mt-5">
            @foreach($plans as $plan)
            <div class="col-lg-3">
                <div class="single-pricing {{ $plan->is_featured ? 'active' : '' }}">
                    <div class="pricing-type">
                        <h6>{{ $plan->name }}</h6>
                    </div>
                    <div class="pricing-price">
                        <sub>{{ App\Models\Option::where('key','currency_symbol')->first()->value }} {{ $plan->price }} /
                            @if ($plan->duration == 7)
                            {{ __('Per Week') }}
                        @elseif($plan->duration == 30)
                            {{ __('Per Month') }}
                        @elseif($plan->duration == 365)
                            {{ __('Per Year') }}
                        @else
                            {{ $plan->duration }} {{ __('Days') }}
                        @endif
                        </sub>
                    </div>
                    <div class="pricing-list">
                        <ul>
                            <li><span class="iconify" data-icon="akar-icons:check" data-inline="false"></span>{{ $plan->storage_limit }} {{ __('MB Storage limit') }}</li>
                            <li><span class="iconify" data-icon="akar-icons:check" data-inline="false"></span>{{ $plan->monthly_req }} {{ __('Monthly Request') }}</li>
                            <li><span class="iconify" data-icon="akar-icons:check" data-inline="false"></span>{{ $plan->daily_req }} {{ __('Daily Request') }}</li>
                            <li><span class="iconify" data-icon="akar-icons:{{ $plan->captcha=='1' ? 'check' : 'cross' }}" data-inline="false"></span>{{ __('Google Captcha') }}</li>
                            <li><span class="iconify" data-icon="akar-icons:{{ $plan->menual_req=='1' ? 'check' : 'cross' }}" data-inline="false"></span>{{ __('Menual Request') }}</li>
                            <li><span class="iconify" data-icon="akar-icons:{{ $plan->fraud_check=='1' ? 'check' : 'cross' }}" data-inline="false"></span>{{ __('Fraud Check') }}</li>
                            
                            
                            <li><span class="iconify" data-icon="akar-icons:{{ $plan->mail_activity=='1' ? 'check' : 'cross' }}" data-inline="false"></span>{{ __('Mail Activity') }}</li>
                        </ul>
                    </div>
                    <div class="pricing-btn">
                        <a href="{{ route('plan.check', $plan->id) }}">{{ __('Get Started') }}</a>
                    </div>
                </div>
            </div>         
            @endforeach
        </div>
    </div>
</div>
<!-- pricing area end -->
@endif


 <!-- Hero Section1-->
<section>
   <div class="paher">
      <div class="container">
           <div class="hero">
                <div class="row">
                    <div class="col-lg-6 order-2 order-lg-1 customer-experience-content">
                     <h1>طرق الدفع</h1>
                     <p class="lead">تتنوع وسائل الدفع في العمليات الإلكترونية لدى مسؤول باي ، نقدم للمستخدمين  امكانية الاختيار من بينهم بالطبع بأي الطرق المناسبة  ، بطاقات الدفع المسبق، الماستر كارد والفيزا ... بطاقات الائتمان بانواعها بالاضافة الى اهم واسرع طرق الدفع وهي البيبال يمكنكم الاعتماد عليها في جميع معاملاتكم . </p>
         
                    </div>
                <div class="col-lg-6 order-1 order-lg-2"><img src="/frontend/assets/img/pay.gif" alt="..." class="img-fluid"></div>
             </div>
        </div>
    </div>
   
</section>
<div class="blog-area mt-100 mb-100">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3">
                    <div class="pricing-header-area text-center">
                        <div class="pricing-header">
                            <h2>{{ __('تعرف علينا ') }}</h2>
                            <p>{{ __('فيديو تعريفي ') }}</p>
                        </div>
                     </div>
                </div>
                <div class="col-lg-6 offset-lg-1">
                    <div class="pricing-header-area text-center">
                        <div class="pricing-header">
                        <iframe width="1100" height="600" src="https://www.youtube.com/embed/s5HrEyEStYE" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                        </div>
                     </div>
                </div>
            </div>
        </div>
     </div>
</div>


 
<div class="agent">
<div class="container">
<div class="gtco-testimonials">
  <h2>آراء العملاء </h2>
  <div class="owl-carousel owl-carousel1 owl-theme">
    <div>
      <div class="card text-center"><img class="card-img-top" src="https://images.unsplash.com/photo-1572561300743-2dd367ed0c9a?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=300&ixid=eyJhcHBfaWQiOjF9&ixlib=rb-1.2.1&q=50&w=300" alt="">
        <div class="card-body">
          <h5>ربيع خطيب 
          </h5>
          <p class="card-text">“ من الخدمات المهمة لنا كأشخاص نعمل في مجال حر أن تكون هناك جهة توفر لنا الدفع الإلكتروني فلا يكون عقبة أمام المزيد من الانتشار لعملنا حول العالم. ” </p>
        
            <i class="fa fa-star" aria-hidden="true"></i>
           <i class="fa fa-star" aria-hidden="true"></i>
           <i class="fa fa-star" aria-hidden="true"></i>
           <i class="fa fa-star-o" aria-hidden="true"></i>
           <i class="fa fa-star-o" aria-hidden="true"></i>

        </div>
      </div>
    </div>
    <div>
      <div class="card text-center"><img class="card-img-top" src="https://images.unsplash.com/photo-1588361035994-295e21daa761?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=301&ixid=eyJhcHBfaWQiOjF9&ixlib=rb-1.2.1&q=50&w=301" alt="">
        <div class="card-body">
          <h5>تسنيم البيك
          </h5>
          <p class="card-text">“ عندما بدأت استخدام خدمات مسؤول باي أدركت مدى الأمانة والدقة في عملهم وبت أكثر راحة في العمل معهم واستلام مدفوعاتي. ” </p>
            
            <i class="fa fa-star" aria-hidden="true"></i>
           <i class="fa fa-star" aria-hidden="true"></i>
           <i class="fa fa-star" aria-hidden="true"></i>
           <i class="fa fa-star-o" aria-hidden="true"></i>
           <i class="fa fa-star-o" aria-hidden="true"></i>
        </div>
      </div>
    </div>
    <div>
      <div class="card text-center"><img class="card-img-top" src="https://images.unsplash.com/photo-1575377222312-dd1a63a51638?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=302&ixid=eyJhcHBfaWQiOjF9&ixlib=rb-1.2.1&q=50&w=302" alt="">
        <div class="card-body">
          <h5>رسول هملاني
          </h5>
          <p class="card-text">“ كانت خطوة الدفع الإلكتروني عائقاً أمام أي تعامل لي مع بعض العملاء ولكن عندما اعتمدت على مسؤول باي أصبحت الأمور أفضل. ” </p>
            
            <i class="fa fa-star" aria-hidden="true"></i>
           <i class="fa fa-star" aria-hidden="true"></i>
           <i class="fa fa-star" aria-hidden="true"></i>
           <i class="fa fa-star-o" aria-hidden="true"></i>
           <i class="fa fa-star-o" aria-hidden="true"></i>
        </div>
      </div>
    </div>
    <div>
      <div class="card text-center"><img class="card-img-top" src="https://images.unsplash.com/photo-1549836938-d278c5d46d20?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=303&ixid=eyJhcHBfaWQiOjF9&ixlib=rb-1.2.1&q=50&w=303" alt="">
        <div class="card-body">
          <h5>خالد طه
          </h5>
          <p class="card-text">“  من الخدمات المهمة لنا كأشخاص نعمل في مجال حر أن تكون هناك جهة توفر لنا الدفع الإلكتروني فلا يكون عقبة أمام المزيد من الانتشار لعملنا حول العالم.  ” </p>
            
            <i class="fa fa-star" aria-hidden="true"></i>
           <i class="fa fa-star" aria-hidden="true"></i>
           <i class="fa fa-star" aria-hidden="true"></i>
           <i class="fa fa-star-o" aria-hidden="true"></i>
           <i class="fa fa-star-o" aria-hidden="true"></i>
        </div>
      </div>
    </div>
  </div>
  </div>
</div>
</div>
 
<!-- blog area start -->
@if(($blogs->count() >0))
<section>
    <div class="blog-area mt-100 mb-100">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3">
                    <div class="pricing-header-area text-center">
                        <div class="pricing-header">
                            <h2>{{ __('Latest News') }}</h2>
                            <p>{{ __('news_des') }}</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row mt-4">
                @foreach($blogs as  $blog)
                <div class="col-lg-4">
                    <div class="single-news">
                        <div class="news-img">
                            <a href="{{ url('/blog',$blog->slug) }}"> <img class="img-fluid" src="{{ asset( $blog->thum_image->value ?? '')}}" alt=""></a>
                        </div>
                        <div class="news-content">
                            <div class="news-meta">
                                <span>
                                    <span class="iconify" data-icon="uil:calender" data-inline="false"></span>{{ $blog->created_at->isoFormat('LL') }}
                                </span>
                                <span>
                                    <span class="iconify" data-icon="bx:bxs-user" data-inline="false"></span> {{ __('By') }} {{ $blog->user->name }}</a>
                                </span>
                            </div>
                            <div class="news-title">
                                <a href="{{ url('/blog',$blog->slug) }}"><h3>{{ $blog->title }}</h3></a>
                            </div>
                            <div class="news-short-des">
                                <p>{{ Str::limit($blog->excerpt->value,150) }}</p>
                            </div>
                            <div class="news-btn">
                                <a href="{{ url('/blog',$blog->slug) }}">{{ __('Read More') }}</a>
                            </div>
                        </div>
                    </div>
                </div>
                @endforeach
            </div>
        </div>
    </div>
</section>
@endif
<!-- blog area end -->
<!-- Agents area start -->

<section>
<div class="container">
<div class="row">
<div class="col-md-6 col-sm-6 col-xs-12">
<h1>شركاء العمل</h1>
</div>
<div class="col-md-6 col-sm-6 col-xs-6 hidden-xs">
<div class="controls pull-right">
<a class="left fa fa-chevron-left btn btn-info " href="#carousel-example" data-slide="prev"></a><a class="right fa fa-chevron-right btn btn-info" href="#carousel-example" data-slide="next"></a>
</div>
</div>
</div>
<div id="carousel-example" class="carousel slide hidden-xs" data-ride="carousel" data-type="multi">
<div class="carousel-inner">
<div class="item active">
<div class="row">
<div class="col-md-3 col-sm-3 col-xs-12">
<div class="slider-item">
<div class="slider-image">
<img src="/frontend/assets/img/pab.png" class="img-responsive" alt="a" />
</div>
<div class="slider-main-detail">
<div class="slider-detail">
<div class="product-detail">
<h2> Pay Pal</h2>
</div>
 </div>
<div class="cart-section">
<div class="row">

</div>
</div>
</div>
</div>
</div>
<div class="col-md-3 col-sm-3 col-xs-12">
<div class="slider-item">
<div class="slider-image">
<img src="/frontend/assets/img/visa.png" class="img-responsive" alt="a" />
</div>
<div class="slider-main-detail">
<div class="slider-detail">
<div class="product-detail">
<h2> Visa Card</h2>
</div>
</div>
<div class="cart-section">
<div class="row">

</div>
</div>
</div>
</div>
 </div>
<div class="col-md-3 col-sm-3 col-xs-12">
<div class="slider-item">
<div class="slider-image">
<img src="/frontend/assets/img/master.png" class="img-responsive" alt="a" />
</div>
<div class="slider-main-detail">
<div class="slider-detail">
<div class="product-detail">
<h2> Master Card</h2>
</div>
</div>
<div class="cart-section">
<div class="row">

</div>
</div>
</div>
</div>
</div>
<div class="col-md-3 col-sm-3 col-xs-12">
<div class="slider-item">
<div class="slider-image">
<img src="/frontend/assets/img/desco.png" class="img-responsive" alt="a" />
</div>
<div class="slider-main-detail">
<div class="slider-detail">
<div class="product-detail">
<h2> Discover</h2>
</div>
</div>
<div class="cart-section">
<div class="row">

</div>
</div>
</div>
</div>
</div>
</div>
</div>
<div class="item">
<div class="row">
<div class="col-md-3 col-sm-3 col-xs-12">
<div class="slider-item">
<div class="slider-image">
<img src="/frontend/assets/img/amer.png" class="img-responsive" alt="a" />
</div>
<div class="slider-main-detail">
<div class="slider-detail">
<div class="product-detail">
<h2> American Express</h2>
</div>
</div>
<div class="cart-section">
<div class="row">


</div>
</div>
</div>
</div>
</div>
<div class="col-md-3 col-sm-3 col-xs-12">
<div class="slider-item">
<div class="slider-image">
<img src="/frontend/assets/img/atm.png" class="img-responsive" alt="a" />
 </div>
<div class="slider-main-detail">
<div class="slider-detail">
<div class="product-detail">
<h2> Credit Card</h2>
</div>
</div>
<div class="cart-section">
<div class="row">

</div>
</div>
</div>
</div>
</div>
<div class="col-md-3 col-sm-3 col-xs-12">
<div class="slider-item">
<div class="slider-image">
<img src="/frontend/assets/img/appl.png" class="img-responsive" alt="a" />
</div>
<div class="slider-main-detail">
<div class="slider-detail">
<div class="product-detail">
<h2> Appel Pay</h2>
</div>
</div>
<div class="cart-section">
<div class="row">


</div>
</div>
</div>
</div>
</div>
<div class="col-md-3 col-sm-3 col-xs-12">
<div class="slider-item">
<div class="slider-image">
<img src="/frontend/assets/img/google.png" class="img-responsive" alt="a" />
</div>
<div class="slider-main-detail">
<div class="slider-detail">
<div class="product-detail">
<h2> Google Pay</h2>
</div>
</div>
<div class="cart-section">
<div class="row">

</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/owl-carousel/1.3.3/owl.carousel.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/owl-carousel/1.3.3/owl.theme.min.css"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/owl-carousel/1.3.3/owl.carousel.css"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</section> 
<br> <br> 
<!-- Agents area end -->
@endsection


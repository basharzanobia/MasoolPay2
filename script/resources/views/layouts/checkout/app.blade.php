<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}" dir="{{(app()->isLocale('ar') ? 'rtl' : 'ltr')}}">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    {!! SEOMeta::generate(true) !!}
    {!! OpenGraph::generate(true) !!}
    {!! Twitter::generate(true) !!}
    {!! JsonLd::generate(true) !!}

    <!-- css here -->
    <link rel="stylesheet" href="{{ asset('frontend/assets/css/bootstrap.min.css')}}">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.rtl.min.css" integrity="sha384-gXt9imSW0VcJVHezoNQsP+TNrjYXoGcrqBZJpry9zJt8PCQjobwmhMGaDHTASo9N" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:ital,wght@0,300;0,400;0,600;0,700;0,800;0,900;1,300;1,400;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="{{ asset('frontend/assets/css/hc-offcanvas-nav.css') }}">
    <link rel="stylesheet" href="{{ asset('frontend/assets/css/default.css')}}">
    <link rel="stylesheet" href="{{ asset('frontend/assets/css/style.css')}}">
    <link rel="stylesheet" href="{{ asset('frontend/assets/css/responsive.css') }}">
    @stack('css')
</head>
<body>

    <div class="header-section-area">

        @yield('content')

    </div>

    <!-- js here -->
    <script src="{{ asset('frontend/assets/js/jquery-3.5.1.min.js')}}"></script>
    <script src="{{ asset('frontend/assets/js/bootstrap.bundle.min.js')}}"></script>
    <script src="{{ asset('frontend/assets/js/iconify.min.js')}}"></script>
    <script src="{{ asset('backend/admin/assets/js/form.js') }}"></script>
    <script src="{{ asset('frontend/assets/js/hc-offcanvas-nav.js') }}"></script>
    <script src="{{ asset('frontend/assets/js/script.js')}}"></script>
    <script src="{{ asset('frontend/assets/js/newsletter.js')}}"></script>
    <script src="{{ asset('backend/admin/assets/js/sweetalert2.all.min.js')}}"></script>

    @stack('js')



</body>
</html>

<header>
    @php
        $theme = App\Models\Option::where('key', 'theme_settings')->first();
        $theme = json_decode($theme->value);
    @endphp
    <div class="header-area">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-2">
                    <div class="logo-area">
                        <a href="{{ url('/') }}">
                            <img src="{{ asset('uploads/logo.png') }}" alt="">
                        </a>
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="header-btn f-right">
                        <a href="{{ $theme->new_account_url ?? null }}"> {{ $theme->new_account_button ?? '__("Create New Account")' }}</a>
                    </div>
                    <div class="header-menu f-right">
                        <div class="mobile-menu">
                            <a class="toggle f-right" href="#" role="button" aria-controls="hc-nav-1"><span class="iconify" data-icon="tabler:layout-grid" data-inline="false"></span></a>
                        </div>
                        <nav id="main-nav">
                            <ul>
                                {{ header_menu('header') }}
                             
                            </ul>
                        </nav>
                       
                    </div>
                </div>
                <div class="col-lg-2">
                          @php
                         $languages = App\Models\Language::where('status',1)->get();
                           @endphp
                            <div class="header-menu f-right">
                                 <select name="lang" class="form-select" id="lang">
                                        @foreach ($languages as $value)
                                            <option {{ App::getLocale() == $value->name ? 'selected' : '' }} value="{{ $value->name }}">{{ $value->data }}</option>
                                        @endforeach
                                  </select>
                            </div>
                </div>

                              
            </div>
        </div>
    </div>
</header>

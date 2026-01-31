<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="csrf-token" content="{{ csrf_token() }}">

        <title>{{ config('app.name', 'Laravel') }}</title>

        <link rel="preconnect" href="https://fonts.bunny.net">
        <link href="https://fonts.bunny.net/css?family=figtree:400,500,600&display=swap" rel="stylesheet" />

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">

        <style>
            /* Bootstrap ke saath height set karne ke liye custom style */
            .main-wrapper {
                min-height: 100vh;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                background-color: #f8f9fa; /* Light gray background */
            }
            .login-card {
                width: 100%;
                max-width: 450px;
                padding: 2rem;
                background: white;
                border-radius: 12px;
                box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            }
            .logo-container img, .logo-container svg {
                width: 100px;
                margin-bottom: 20px;
            }
        </style>
    </head>
    <body>
        <div class="main-wrapper">
            <div class="logo-container text-center">
                <a href="/">
                    <x-application-logo />
                </a>
            </div>

            <div class="login-card">
                {{ $slot }}
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>

{{--
<!--<!DOCTYPE html>-->
<!--<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">-->
<!--    <head>-->
<!--        <meta charset="utf-8">-->
<!--        <meta name="viewport" content="width=device-width, initial-scale=1">-->
<!--        <meta name="csrf-token" content="{{ csrf_token() }}">-->

<!--        <title>{{ config('app.name', 'Laravel') }}</title>-->

        <!-- Fonts -->
<!--        <link rel="preconnect" href="https://fonts.bunny.net">-->
<!--        <link href="https://fonts.bunny.net/css?family=figtree:400,500,600&display=swap" rel="stylesheet" />-->

        <!-- Scripts -->
        <!--@vite(['resources/css/app.css', 'resources/js/app.js'])-->
<!--        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">-->
<!--    </head>-->
<!--    <body class="font-sans text-gray-900 antialiased">-->
<!--        <div class="min-h-screen flex flex-col sm:justify-center items-center pt-6 sm:pt-0 bg-white-100 white:bg-white-900">-->
<!--            <div>-->
<!--                <a href="/">-->
<!--                    <x-application-logo class="w-20 h-20 fill-current text-gray-500" />-->
<!--                </a>-->
<!--            </div>-->

<!--            <div class="w-full sm:max-w-md mt-6 px-6 py-4 bg-white dark:bg-gray-800 shadow-md overflow-hidden sm:rounded-lg">-->
<!--                {{ $slot }}-->
<!--            </div>-->
<!--        </div>-->
<!--    </body>-->
<!--</html>-->
--}}
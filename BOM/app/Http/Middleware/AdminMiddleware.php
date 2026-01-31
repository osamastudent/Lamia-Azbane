<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AdminMiddleware
{
    public function handle(Request $request, Closure $next)
    {
        if (!Auth::check()) {
            return redirect('/login')->with('error', 'Please login first.');
        }

        if (Auth::user()->user_type != 2) {  // 2 = company admin
            abort(403, 'Unauthorized access.');
        }

        return $next($request);
    }
}

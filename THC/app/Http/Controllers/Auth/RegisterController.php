<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\Patient;
use App\Models\Roles;
use App\Models\User;
use Illuminate\Foundation\Auth\RegistersUsers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class RegisterController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Register Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles the registration of new users as well as their
    | validation and creation. By default this controller uses a trait to
    | provide this functionality without requiring any additional code.
    |
    */

    use RegistersUsers;

    /**
     * Where to redirect users after registration.
     *
     * @var string
     */
    // protected $redirectTo = '/home';
      protected $redirectTo = '/login';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest');
    }

    /**
     * Get a validator for an incoming registration request.
     *
     * @param  array  $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function validator(array $data)
    {

        return $abc = Validator::make($data, [
            'name' => ['required', 'string', 'max:255'],
            'father_husband_name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
            'password' => ['required', 'string', 'min:5', 'confirmed'],
            'dob' => ['required', 'date'],

            'phone' => ['required', 'string', 'max:15'],
            'profile_image' => ['required', 'file', 'mimes:png,jpg,jpeg,pdf', 'max:2048'],
            'gender' => ['required', 'string'],
            'age' => ['required', 'string'],
            'blood_group' => ['nullable', 'string' , 'max:500'],
        ]);

    }

    /**
     * Create a new user instance after a valid registration.
     *
     * @param  array  $data
     * @return \App\Models\User
     */
    protected function create(array $data)
    {
        return DB::transaction(function() use ($data){
        $user =  User::create([
            'name' => $data['name'],
            'father_husband_name' => $data['father_husband_name'] ?? null,
            'email' => $data['email'],
            'password' => Hash::make($data['password']),
            'dob' => $data['dob'],
        ]);

        $patientRole = Roles::where('title' , 'patient')->firstOrFail();
        if($patientRole){
            $user->role_id = $patientRole->id;
            $user->save();
        }

        $imagePath = null;
        if(isset($data['profile_image']) && $data['profile_image']->isValid()){
            $destinationPath = public_path('Patient/profile_images');
            if(!file_exists($destinationPath)){
                mkdir($destinationPath, 0777 , true);
            }
            $imageName = time() .'_'.$data['profile_image']->getClientOriginalName();
            $data['profile_image']->move($destinationPath , $imageName);
            $imagePath =  $imageName;
        }


        Patient::create([
            'user_id' => $user->id,
            'gender' => $data['gender'],
            'age' => $data['age'],
            'phone' => $data['phone'],
            'blood_group' => $data['blood_group'],
            'profile_image' => $imagePath,
        ]);



        return $user;
        });


    }

    protected function registered(Request $request, $user)
    {
        // Logout the user immediately after registration
        Auth::logout();
        // Redirect to login form with a success message
        return redirect()->route(route: 'login')->with('registration_status', 'Registration successful! Please login.');
    }
}

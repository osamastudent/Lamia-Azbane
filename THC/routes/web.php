<?php

use App\Http\Controllers\Admin\AdminDashboardController;
use App\Http\Controllers\Admin\DoctorsController;
use App\Http\Controllers\Admin\SpecializationController;
use App\Http\Controllers\Admin\DepartmentController;
use App\Http\Controllers\Auth\CustomAuthController;
use App\Http\Controllers\Doctor\DoctorDashboardController;
use App\Http\Controllers\Doctor\DoctorAppointmentController;
use App\Http\Controllers\Doctor\DoctorRegisterController;
use App\Http\Controllers\Doctor\DoctorScheduleController;
use App\Http\Controllers\Doctor\DoctortProfileController;
use App\Http\Controllers\Doctor\ProfileController;
use App\Http\Controllers\Patient\IntakeformController;
use App\Http\Controllers\Patient\AppointmentController;
use App\Http\Controllers\Patient\PatientDashboardController;
use App\Http\Controllers\Patient\PatientRegisterController;
use App\Http\Controllers\Patient\PatientProfileController;
use App\Http\Controllers\Patient\MyconsultationController;
use App\Http\Middleware\RoleCheck;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Auth;

Route::get('/', function () {
    return view('website.home');
});
Route::get('/about', function () {
    return view('website.about');
});
Route::get('/contact-us',function(){
    return view('website.contactus');
});
Route::get('/doctors',function(){
    return view('website.doctors');
});
Route::get('/services',function(){
    return view('website.services');
});

Auth::routes();


Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

// custom auth
Route::get('register', function () {
    return view('auth.register');
})->name('register')->middleware(middleware: 'redirect.role');


Route::get(uri: "login", action: [CustomAuthController::class, 'loginForm'])->name('login')->middleware('redirect.role');

Route::post(uri: "login", action: [CustomAuthController::class, 'userLogin'])->name(name: 'user.login');


Route::prefix('admin')->as('admin.')
    ->middleware(['auth', 'verified', 'role:admin'])->group(function () {
        Route::get('dashboard', [AdminDashboardController::class, 'index'])->name('dashboard');
        Route::get('doctors', [DoctorsController::class, 'getalldoctors'])->name('doctors');
        Route:: resource('specializations' , SpecializationController::class);
        Route:: resource('departments' , DepartmentController::class);
        Route::post('/admin/specializations/toggle-status', [SpecializationController::class, 'toggleStatus'])->name('specializations.toggleStatus');
        Route::get('doctors/assign', [DoctorsController::class, 'doctorAssign'])->name('doctors.assigned');
        Route::get('doctor/approve/{id}',[DoctorsController::class, 'approved'])->name('doctor.approved');
        Route::get('doctor/revoke/{id}',[DoctorsController::class, 'cancelapproval'])->name('doctor.cancel');
    
    });
Route::prefix('patient')->as('patient.')
    ->middleware(['auth', 'verified', 'role:patient'])->group(function () {
        Route::get('dashboard', [PatientDashboardController::class, 'index'])->name('dashboard');
        Route::get('intake',[IntakeformController::class,'createform'])->name('intake.form');
        Route::post('intake/sumit',[IntakeformController::class,'store'])->name('intake.store');
        Route::get('/recommended-doctors/{intakeId}',[IntakeformController::class,'showRecommendedDoctors'])->name('recommended.doctors');
        Route::get('/book-appointment/{doctor_id}',[AppointmentController::class,'create']);
        Route::post('/appointment/{doctor_id}/book',[AppointmentController::class,'store'])->name('appointment.store');
        Route::get('/doctor/{doctor_id}/slots', [AppointmentController::class, 'getSlots'])->name('doctor.slots');
        Route::get('/appointments', [AppointmentController::class, 'index'])->name('appointments.index');
        Route::get('/my-appointments', [AppointmentController::class, 'myAppointments'])->name('myAppointments');
        Route::get('/appointments/{id}/view', [AppointmentController::class, 'view'])->name('appointments.view');
        Route::get('my-consultation-note/{appointment}', [MyconsultationController::class, 'viewConsultationNote'])
        ->name('consultation.view');
        
        // Patient Profile
        Route::get('/profile', [PatientProfileController::class, 'view'])->name('profile.view');
        Route::get('/profile/edit', [PatientProfileController::class, 'edit'])->name('profile.edit');
        Route::post('/profile/update', [PatientProfileController::class, 'update'])->name('profile.update');

    });

//doctor
Route::prefix('doctor')->group(function () {
    Route::get('/register', [DoctorRegisterController::class, 'showRegisterForm'])->name('doctor.register.form');
    Route::post('/register', [DoctorRegisterController::class, 'register'])->name('doctor.register.post');


});

Route::prefix('doctor')->as('doctor.')
    ->middleware(['auth', 'verified', 'role:doctor'])
    ->group(function () {
        Route::get('/pending', [DoctorDashboardController::class, 'pending'])->name('pending');
    });

Route::prefix('doctor')->as('doctor.')
    ->middleware(['auth' , 'verified' , 'role:doctor' , 'doctor.approved'])->group(function () {
        Route::get('/dashboard', [DoctorDashboardController::class, 'index'])->name('dashboard');
        Route::get('/intake-form', [DoctorAppointmentController::class, 'index'])->name('intakeforms');
        Route::get('/schedule/create', [DoctorScheduleController::class, 'create'])->name('schedule.create');
        Route::get('/schedule', [DoctorScheduleController::class, 'index'])->name('schedule.index');
        Route::post('/schedule/store', [DoctorScheduleController::class, 'store'])->name('schedule.store');
        Route::get('/schedules/{id}/edit', [DoctorScheduleController::class, 'edit'])->name('schedule.edit');
        Route::put('/schedule/{id}', [DoctorScheduleController::class, 'update'])->name('schedule.update');
        Route::delete('/schedule/{id}/delete', [DoctorScheduleController::class, 'destroy'])->name('schedule.destroy');
        
        //appointment
        
        Route::get('/doctor/appointments/{id}/consult', [DoctorAppointmentController::class, 'consult'])->name('appointments.consult');
        Route::post('appointments/{id}/notes', [DoctorAppointmentController::class, 'storeNotes'])->name('appointments.storeNotes');
        Route::post('/appointments/{id}/autosave', [DoctorAppointmentController::class, 'autoSaveNotes'])->name('appointments.autoSave');
        Route::get('/appointments/{id}/view', [DoctorAppointmentController::class, 'view'])->name('appointments.view');
        Route::put('/appointments/{appointment}/status', [DoctorAppointmentController::class, 'updateStatus'])
        ->name('appointments.updateStatus');
        Route::get('/online/meetings', [DoctorAppointmentController::class, 'onlinemeetings'])->name('online.meetings.index');

        // doctor Profile
        Route::get('/profile', [DoctortProfileController::class, 'view'])->name('profile.view');
        Route::get('/profile/edit', [DoctortProfileController::class, 'edit'])->name('profile.edit');
        Route::post('/profile/update', [DoctortProfileController::class, 'update'])->name('profile.update');



    });

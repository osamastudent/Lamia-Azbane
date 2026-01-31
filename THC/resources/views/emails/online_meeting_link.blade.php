<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Online Consultation Link</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f9fafb;
            color: #1f2937;
            margin: 0;
            padding: 0;
        }

        .email-container {
            max-width: 600px;
            margin: 40px auto;
            background-color: #ffffff;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            padding: 30px;
        }

        .header {
            text-align: center;
            font-size: 20px;
            font-weight: 600;
            color: #0d47a1;
            margin-bottom: 20px;
        }

        p {
            font-size: 16px;
            line-height: 1.6;
        }

        a.button {
            display: inline-block;
            margin-top: 20px;
            padding: 12px 20px;
            background-color: #0d47a1;
            color: #ffffff !important;
            text-decoration: none;
            border-radius: 8px;
            font-weight: 500;
        }

        .footer {
            margin-top: 30px;
            font-size: 14px;
            color: #6b7280;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="email-container">
        <div class="header">
            THC Telehealth
        </div>

        <p>Hi {{ $appointment->patient_name }},</p>

        <p>Your online consultation with <strong>Dr. {{ Auth::user()->name }}</strong> is scheduled on 
           <strong>{{ \Carbon\Carbon::parse($appointment->appointment_date)->format('d M, Y') }}</strong> 
           at <strong>{{ \Carbon\Carbon::parse($appointment->appointment_time)->format('h:i A') }}</strong>.</p>

        <p>Click the button below to join your online meeting:</p>
        <a href="{{ $appointment->meeting_link }}" target="_blank" class="button">Join Meeting</a>

        <div class="footer">
            Thank you for choosing THC Telehealth.<br>
            &copy; {{ date('Y') }} THC Telehealth. All rights reserved.
        </div>
    </div>
</body>
</html>

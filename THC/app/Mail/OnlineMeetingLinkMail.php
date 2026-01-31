<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class OnlineMeetingLinkMail extends Mailable
{
    use Queueable, SerializesModels;

    public $appointment;

    /**
     * Create a new message instance.
     */
    public function __construct($appointment)
    {
        $this->appointment = $appointment;
    }

    /**
     * Build the message.
     */
    public function build()
    {
        return $this->subject('Your Online Consultation Link')
                    ->view('emails.online_meeting_link');
    }
}

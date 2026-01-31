<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class ConsultationNotesMail extends Mailable
{
    use Queueable, SerializesModels;

    public $note;
    public $appointment;
    public $patient;

    public function __construct($note, $appointment, $patient)
    {
        $this->note = $note;
        $this->appointment = $appointment;
        $this->patient = $patient;
    }

    public function build()
    {
        return $this->subject('Your Consultation Summary')
            ->markdown('emails.consultation_notes');
    }
}

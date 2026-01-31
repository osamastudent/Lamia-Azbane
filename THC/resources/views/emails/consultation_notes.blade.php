@component('mail::message')
# Dear {{ $patient->name }},

Your recent online consultation summary is ready.

---

**🩺 Diagnosis:**  
{{ $note->diagnosis }}

**💊 Treatment Plan:**  
{{ $note->treatment_plan }}

**📅 Follow-Up Advice:**  
{{ $note->follow_up ?? 'N/A' }}

---

If you have further symptoms or questions, please reach out to your doctor.

Thanks,<br>
**THC Telehealth Team**
@endcomponent

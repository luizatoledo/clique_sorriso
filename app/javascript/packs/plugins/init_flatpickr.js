import flatpickr from "flatpickr";
import $ from 'jquery';
import { csrfToken } from "@rails/ujs";

const initflatpickr = (dates_to_disable = []) => {
  flatpickr(".datepicker", {
    // enableTime: true,
    dateFormat: "d-m-Y",
    minDate: "today",
    maxDate: new Date().fp_incr(120),
    "disable": dates_to_disable,
    // minTime: "8:00",
    // maxTime: "17:00",
    // time_24hr: true
  });
};

// need a fetch that sends the dentist and gets back the unavailable days, then the function calls flatpicker with those restraints
// need a fetch that sends the dentist and the day chosen and gets back an array of available hours

// const getDentistSchedule = () => {
//   // jquery event listener for cocoon insertion
//   $(document).on('cocoon:after-insert', 'form', function(e) {
//     const procedures = document.querySelectorAll('.nested-fields > select');
//     const procedure = procedures[procedures.length - 1]
//     procedure.addEventListener('change', (event) => {
//       const procedureId = event.currentTarget.value;
//       const url = window.location.origin + '/dentists/unavailable'
//       fetch(url, {
//         method: "POST",
//         headers:{
//           "Accept": "application/json",
//           "Content-Type": "application/json",
//           "X-CSRF-Token": csrfToken()
//         },
//         body: JSON.stringify({ procedure_id: procedureId })
//       })
//       .then(response => response.json())
//       .then((data) => {
//         initflatpickr(data);
//         console.log(data);
//       });
//     });
//   });
// };

// function to make the time input available for the user to see
const showTimeInput = () => {
  const dateInput = document.querySelector('.appointment_date > input');
  dateInput.addEventListener('change', (event) => {
    const timeInput = document.querySelector('.new-appointment-hour');
    timeInput.classList.remove("d-none")
  });
};


export {initflatpickr, getDentistSchedule, showTimeInput}

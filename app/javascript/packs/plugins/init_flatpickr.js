import flatpickr from "flatpickr";
import $ from 'jquery';
import { csrfToken } from "@rails/ujs";

const initflatpickr = () => {
  flatpickr(".datepicker", {
    // enableTime: true,
    dateFormat: "d-m-Y",
    minDate: "today",
    maxDate: new Date().fp_incr(120),
    "disable": [
      function (date) {
        // return true to disable
        return (date.getDay() === 0 || date.getDay() === 6 );
      }
    ],
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

// function that will listen which procedures the user chooses and sends that to appoint/new
const sendProcedureInfo = () => {
  $(document).on('cocoon:after-insert', 'form', function(e) {
    const procedures = document.querySelectorAll('.nested-fields > select');
    const procedure = procedures[procedures.length - 1]
    procedure.addEventListener('change', (event) => {
      const procedureId = event.currentTarget.value;
      const url = window.location.origin + '/appointments/selected_procedures';
      fetch(url, {
        method: "POST",
        headers:{
          "Accept": "application/json",
          "Content-Type": "application/json",
          "X-CSRF-Token": csrfToken()
        },
        body: JSON.stringify({ procedure_id: procedureId })
      }).then(response => response.json())
      .then((data) => {
        console.log(data);
      });
    });
  });
};

const sendDayInfo = () => {
  const dateInput = document.querySelector('.appointment_date > input');
  dateInput.addEventListener('change',(event) => {
    const dateValue = event.currentTarget.value;
    const url = window.location.origin + '/appointments/selected_day';
    fetch(url, {
      method: "POST",
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "X-CSRF-Token": csrfToken()
      },
      body: JSON.stringify({date_picked: dateValue})
    }).then(response => response.json())
    .then((data) => {
      console.log(data);
    });
  });
};

export {initflatpickr, showTimeInput, sendProcedureInfo, sendDayInfo}

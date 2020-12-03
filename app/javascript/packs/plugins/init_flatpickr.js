import flatpickr from "flatpickr";

const initflatpickr = () => {
    flatpickr(".datepicker", {
        enableTime: true,
        dateFormat: "d-m-Y H:i",
        minDate: "today",
        maxDate: new Date().fp_incr(120),
        "disable": [
            function (date) {
                // return true to disable
                return (date.getDay() === 0 || date.getDay() === 6);

            }
        ],
        minTime: "8:00",
        maxTime: "17:00",
        time_24hr: true
    });
};

export {initflatpickr}


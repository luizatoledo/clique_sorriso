const displayAppointmentsLists = () => {
    const apoointmentsLists = document.querySelectorAll('.appointments-title');

    apoointmentsLists.forEach((apoointmentsList) => {
        apoointmentsList.addEventListener('click', (event) => {
            event.currentTarget.classList.toggle("active");
        });
    });
};
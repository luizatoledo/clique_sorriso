const displayAppointmentsLists = () => {
    const lists = document.querySelectorAll('.appointments-title'); 'div.entry-content > p'

    lists.forEach((list) => {
        list.addEventListener('click', (event) => {
            console.log(event);
            const content = event.currentTarget.nextElementSibling;
            console.log(content);
            content.classList.toggle("inactive");
        });
    });
};

export { displayAppointmentsLists };
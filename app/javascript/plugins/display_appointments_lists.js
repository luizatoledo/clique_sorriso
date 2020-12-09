const displayAppointmentsLists = () => {
    const lists = document.querySelectorAll('.appointments-title');

    lists.forEach((list) => {
        list.addEventListener('click', (event) => {
            console.log(event);
            const content = event.currentTarget.nextElementSibling;
            content.classList.toggle("inactive");
            const arrows = event.currentTarget.querySelectorAll('i')
            arrows.forEach((arrow) => { 
                arrow.classList.toggle("inactive");
             });
        });
    });
};

export { displayAppointmentsLists };
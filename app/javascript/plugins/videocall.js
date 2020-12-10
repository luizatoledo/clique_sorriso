import DailyIframe from '@daily-co/daily-js';

const initVideocall = () => {
  const video = document.querySelector('.videocall');
  // crossorigin src ="https://unpkg.com/@daily-co/daily-js";
  if (video) {
    // let callFrame = DailyIframe.wrap(myIframe);
    let callFrame = window.DailyIframe.createFrame({
      iframeStyle: {
        position: 'fixed',
        border: '1px solid black',
        width: '70vw',
        height: '60vh',
        right: '15em',
        bottom: '4em'
      },
      lang: 'pt',
      showLeaveButton: true,
      showFullscreenButton: true
    });
    callFrame.join({ url: 'https://cliquesorriso.daily.co/cliquesorriso' });
  };
};

export {initVideocall}
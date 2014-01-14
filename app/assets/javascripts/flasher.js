var flasherFeature = {

  init: function() {
    $popups = $('.pop-ups');
    alerts = $popups.find('.alert-message').text();
    notice = $popups.find('.notice-message').text();

    flasherFeature.setupAlerts();
    flasherFeature.setupNotices();
  },

  setupAlerts : function() {
    if (alerts) {
      Messenger().post({
        message: alerts,
        type: 'error'
      });
    }
  },

  setupNotices : function() {
    if (notice) {
      Messenger().post(notice);
    }
  }

};


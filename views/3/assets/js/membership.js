var Membership = function(options, hotel_id) {
  'use strict';
  var DOMAIN = 'https://app.thebookingfactory.com';
  var self = this;

  this.frame = null;

  this.renderVisibleBlock = function(container) {
    var hotel_string = hotel_id ? '?hotel_id='+hotel_id : '';
    $(container).append(
      '<iframe name="membership" src="'+DOMAIN+'/membership'+hotel_string+'"></iframe>'
    );

    this.frame = window.frames.membership;
  };

  this.renderInvisibleBlock = function() {
    var hotel_string = hotel_id ? '?hotel_id='+hotel_id : '';
    $('body').append(
      '<iframe name="membership" src="'+DOMAIN+'/membership'+hotel_string+'" style="width:0;height:0;border:none;"></iframe>'
    );
    this.frame = window.frames.membership;
  };

  this.getCredentials = function (callback) {
    this.getCredentialsCallback = callback;
    this.frame.postMessage(
      JSON.stringify(
        {
          method: 'getCredentials'
        }
      ),
      DOMAIN
    );
  };

  this.setCredentials = function (data) {
    this.frame.postMessage(
      JSON.stringify(
        {
          method: 'setCredentials',
          data: data
        }
      ),
      DOMAIN
    );
  };

  this.logout = function () {
    this.frame.postMessage(
      JSON.stringify(
        {
          method: 'logout'
        }
      ),
      DOMAIN
    );
  };

  this.initialize = function (member) {
    var self = this;
    if ( member !== null) {
      $('li.logout')
        .attr('style', 'display: block !important')
        .on('click', 'a', function (event) {
          event.preventDefault();
          self.logout();
          $('li.logout').removeAttr('style');
        });
    }
    if (options && options.init && typeof(options.init) === 'function') {
      options.init();
    }
  };

  this.loggedin = function () {
    $('li.logout')
      .attr('style', 'display: block !important')
      .on('click', 'a', function (event) {
        event.preventDefault();
        self.logout();
        $('li.logout').removeAttr('style');
      });
  };



  var msg_listener = function(event) {
    var response;
    if (event.origin !== DOMAIN) { return; }

    try {
      response = JSON.parse(event.data);
    } catch (error) {
      console.log(error);
    }

    if (response && typeof(self[response.method]) === 'function') {
      self[response.method](response.data);
    }
  };

  if (window.addEventListener) {
    window.addEventListener('message', msg_listener);
  } else {
    window.attachEvent('onmessage', msg_listener);
  }

  if (options && options.container) {
    this.renderVisibleBlock(options.container);
  } else {
    this.renderInvisibleBlock();
  }
};
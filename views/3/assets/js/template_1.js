$(document).ready(function () {
  function detectmob() {
    var check = false;
    (function(a){if(/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|mobile.+firefox|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows ce|xda|xiino|android|ipad|playbook|silk/i.test(a)||/1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(a.substr(0,4)))check = true})(navigator.userAgent||navigator.vendor||window.opera);
    return check;
  }

  function mobilecheck() {
    var check = false;
    (function(a){if(/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|mobile.+firefox|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows ce|xda|xiino/i.test(a)||/1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(a.substr(0,4)))check = true})(navigator.userAgent||navigator.vendor||window.opera);
    return check;
  }

  $(function() {
    if (mobilecheck() && !navigator.userAgent.match(/Windows Phone/i)) {
      $('nav').removeClass('other');
      var slideout = new Slideout({
        'panel': document.getElementById('panel'),
        'menu': document.getElementById('menu'),
        'padding': 256,
        'tolerance': 70
      });
    }

    if (location.href.indexOf('/book') == -1) {
      if ($('.insiders').length > 0) {
        membership = new Membership({container: '.insiders .container'}, $('body').data('hotel'));
      } else {
        membership = new Membership({}, $('body').data('hotel'));
      }
    }

    $('.open-menu').on('click', function(event) {
      event.preventDefault();

      if (slideout) { slideout.toggle(); }
    });

    $('#menu a:not(.dropdown-toggle)').on('click', function() {
      if (slideout) { slideout.close(); }
    });

    if ($('.jumbotron').length > 0) {
      $('.main-photo').css('height', $(window).height() + 'px');
    }

    if (detectmob() === false || navigator.userAgent.match(/Windows Phone/i)) {
      $('input.date').pickmeup({
        hide_on_select: true,
        format: 'd b Y',
        min: new Date(),
        change: function (e) {
          var date = new Date(e);
          $('input[name="dateFrom"]').val(date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + date.getDate());
        }
      }).prop('readonly', 'true');
    } else {
      today = new Date();
      $('input.date').replaceWith('<input type="date" class="date" min="'+today.getFullYear() + '-' + (today.getMonth() + 1) + '-' + today.getDate()+'">');
      $('input.date').on('change', function(e) {
        var date = new Date(e.currentTarget.value);
        $('input[name="dateFrom"]').val(date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + date.getDate());
      });
    }

    $('.booking-submit').on('click', function(event) {
      event.preventDefault();

      $('.booking-submit')
        .html('<i class="fa fa-spin fa-spinner"></i> Checking...')
        .prop('disabled', true);

      $.get($('.form form').attr('action').replace('/book', '/any_room?dateFrom='+$('input[name="dateFrom"]').val()+'&nights='+$('[name="nights"]').val()))
       .done(function(data) {
          if (data.count > 0) {
            $('.form form').submit();
          } else {
            $('.booking-submit')
              .html('Check available')
              .prop('disabled', false);

            $('.error').html("Sorry, we have no availability for these dates.").show();
            setTimeout(function() {
              $('.error').fadeOut(2500);
            }, 2500);
          }
       })
       .fail(function() {
          $('.booking-submit')
            .html('Check available')
            .prop('disabled', false);

          $('.error').html("Sorry, we have no availability for these dates.").show();
          setTimeout(function() {
            $('.error').fadeOut(2500);
          }, 2500);
       });
    });

    $('.booking-close').on('click', function(e) {
      e.preventDefault();
      $('.booking-form').addClass('hidden');
      $('html,body').removeClass('stop-scroll');
    });

    $('.booking-form-link').on('click', function(e) {
      e.preventDefault();
      if (slideout) { slideout.close(); }
      $('.slideout-open').removeClass('slideout-open');
      $('.booking-form').removeClass('hidden');
      $('html,body').addClass('stop-scroll');
    });

    var substructMenu = function () {
      if ($('.hidden-md:visible').length == 0) {
        var logoW = $('a.navbar-brand').outerWidth(),
        containerW = $('.navbar .container').width(),
        linksW = 0;

        $('#top-menu ul.nav>li>a').map(function(a,b) {linksW = linksW + $(b).outerWidth()});

        if (linksW > containerW - logoW) {
          if ($('#top-menu ul.nav li.substruct').length == 0) {
            $('#top-menu ul.nav .logout').before('<li class="dropdown substruct"><a class="dropdown-toggle" data-toggle="dropdown" href="">More <span class="caret"></span></a><ul class="dropdown-menu" role="menu"></ul></li>');
          }

          el = $('#top-menu ul.nav>li:eq('+($('.substruct').index() - 1)+')').detach();
          $('#top-menu ul.nav li.substruct ul').prepend(el);

          substructMenu();
        }
      }
    };

    setTimeout(substructMenu, 300);

    $(window).on('resize', function() {
      substructMenu();

      setFrameHeight();
    });

    $('.small-photos').on('click', 'li a', function(event) {
      event.preventDefault();

      var el  = $(event.currentTarget),
          img = el.closest('.room-page').find('.big-photo img');

      img.attr('src', el.attr('href'));
      el.closest('.room-page').find('.active').removeClass('active');
      el.closest('li').addClass('active');
    });


    $('#contact-form').on('submit', function (e) {
      e.preventDefault();

      var valid = true,
          data;

      $('#contact-form [name]:visible').each(function (index, el) {
        if ($(el).val() === '') {
          $(el).addClass('error');
          valid = false;
        } else {
          $(el).removeClass('error');
        }
      });

      if (valid) {
        $('#contact-form button')
          .prepend('<i class="fa fa-spin fa-spinner"></i> ')
          .prop('disabled', true);

        data = $('#contact-form').serializeArray();

        $.ajax({
          type: "POST",
          url: $('#contact-form').attr('action'),
          data: data,
          success: function (response) {
            $('#contact-form').replaceWith('<p>Your message was sent successfully. Thanks.</p>')
          },
          error: function (response) {
            if (response.responseJSON.status === 'Error') {
              alert(response.responseJSON.msg);
              $('#contact-form button')
                .prop('disabled', false)
                .find('i').remove();
            }
          },
          dataType: "JSON"
        });
      }
    });


    $('.show-more').on('click', function (event) {
      event.preventDefault();

      if ($('.invisible-questions:visible').length > 0) {
        $('.invisible-questions').slideUp(500);
        $('.show-more').html('Show more questions <i class="fa fa-caret-down"></i>');
      } else {
        $('.invisible-questions').slideDown(500);
        $('.show-more').html('Show less questions <i class="fa fa-caret-up"></i>');
      }
    });


    $('#top-menu .navbar-nav')
      .on('mouseover', '.dropdown', function (e) {
        $(e.currentTarget).toggleClass('open');
      })
      .on('mouseout', '.dropdown', function (e) {
        $(e.currentTarget).toggleClass('open');
      });

    var url_redirected = false;

    if ($('.404').length > 0) {
      setInterval(function () {
        var current = parseInt($('.seconds').html()),
            link;

        if (current === 0 && url_redirected === false) {
          url_redirected = true;
          window.location.href = window.location.origin + $('.navbar-brand').attr('href');
        } else {
          $('.seconds').html(current - 1);
        }
      }, 1000);
    }


    $('.btn-more-rooms').on('click', function(e) {
      $('.numbers-block').toggleClass('all-rooms')
      if ($('.numbers-block').hasClass('all-rooms')) {
        $(e.currentTarget).html('Hide rooms');
      } else {
        $(e.currentTarget).html('Show more rooms');
      }
    });


    $('.load-more').on('click', function(e) {
      e.preventDefault();
      var href = $(e.currentTarget).attr('href'),
          attrs_separator = href.indexOf('?') > -1 ? '&' : '?',
          attr = attrs_separator + 'page=' + $('.blog-record').length,
          baseURL = window.location.origin + window.location.pathname,
          last = window.location.search;

      if (baseURL[baseURL.length - 1] != '/') {
        baseURL = baseURL + '/';
      }

      $.get(window.location.origin + $(e.currentTarget).attr('href') + attr, function(data) {
        if (JSON.parse(data.objects).length > 0) {
          $.each(JSON.parse(data.objects), function(index, el) {
            $('.blog-records').append('<div class="blog-record"><h2><a href="'+baseURL+el.slug+last+'">'+el.title+'</a></h2><div class="blog-image"><div class="sticker"><div class="day">'+el.day+'</div><div class="month">'+el.month+'</div></div><img alt="10" src="'+el.img+'"></div>'+el.text+'<a href="'+baseURL+el.slug+last+'">Read more...</a></div>');
          });

          if (JSON.parse(data.objects).length < 2) { $('.load-more').hide(); }
        } else {
          $('.load-more').hide();
        }
      });
    });

    var setFrameHeight = function() {
      if ($('#booking-frame').length > 0) {
        var height = $(window).height() - $('.footer').outerHeight() - $('.copyright').outerHeight() - $('.main-photo').outerHeight();

        if (height < 500 || $(window).width() < 768) {
          clearInterval(window.resizeInterval);
          window.resizeInterval = setInterval(function() {
            $('#booking-frame').css('height', frames["booking-frame"].document.getElementById('panel').offsetHeight + 22 + 'px');
          }, 320);
        } else {
          $('#booking-frame').css('height', height+'px');
        }
      }
    };

    setFrameHeight();
  });
});

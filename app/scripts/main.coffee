$ ->
  allsections = $('body.home main section')
  header = $('header')
  nav = $('header nav')
  teaser = $('header #teaser')
  logo = $('header h1')
  navpos = nav.offset().top
  


  updateSecondaryNavigation = () ->
    for section in allsections
      do ->
        actual = $(section)
        #actualHeight = actual.height() + parseInt(actual.css('paddingTop').replace('px', '')) + parseInt(actual.css('paddingBottom').replace('px', ''))
        actualHeight = actual.height()
        actualAnchor = nav.find('a[href="#'+actual.attr('id')+'"]')
        if ( ( actual.offset().top - nav.height() <= $(window).scrollTop() ) && ( actual.offset().top +  actualHeight - nav.height() > $(window).scrollTop() ) ) 
          actualAnchor.addClass('active')
          console.log "active "
          console.log actualAnchor
        else
          actualAnchor.removeClass('active')



  $(window).on 'scroll', () ->
    
    if $(window).scrollTop() > $('header').height()
      if (Modernizr.mq('(min-width: 46.25em)'))
        $('body').addClass 'sticky-nav'
        
        if $(window).scrollTop() <= 776
          nav.css 'top', "#{$(window).scrollTop() - 776}px"
          logo.css 'top', "#{$(window).scrollTop() - 776}px"
        else
          nav.css 'top', '0px'
          logo.css 'top', "12px"
    else
      $('body').removeClass 'sticky-nav'
      
      
      nav.css 'top', "auto"
      teaser.css 'top', "auto"
      nav.css 'top', 'auto'
      nav.css 'bottom', '30px'
      logo.css 'top', "50px"
      logo.removeAttr 'style'
      if (Modernizr.mq('(min-width: 46.25em)'))
        teaser.css 'bottom', "115px"
      else
        teaser.css 'bottom', "0px"
    updateSecondaryNavigation()

  $(window).scroll() 

  $(window).on 'resize', () ->
    $(window).scroll() 


  nav.find('ul a').on 'click', (event) ->
    event.preventDefault()
    target = $(this.hash)
    offset = 1
    if this.hash == '#overview'
      offset = -50

    $('body,html').animate
      'scrollTop': target.offset().top - nav.height() + offset
      , 400

  

  #mobile shenenigans
  $('#mobile-menu-toggle').click (e) ->
    e.preventDefault()
    $(@).toggleClass('expanded').next().slideToggle('fast')

  $('#mobile-menu ul li a').on 'click', (e) ->
    e.preventDefault()
    $('#mobile-menu-toggle').toggleClass('expanded').next().slideToggle('fast')
    target = $(this.hash)
    offset = 80
    if this.hash == '#overview'
      offset = -50

    $('body,html').animate
      'scrollTop': target.offset().top - nav.height() + offset
      , 400



      



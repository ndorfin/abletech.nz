window.Abletech ||= {}
class Abletech.Quote
  'use strict'

  constructor: (elemID) ->
    @testimonials = document.getElementById(elemID)

  testimonials: null
  quotes: [
    {
      q: 'Abletech gave us outstanding technical know-how and support',
      a: 'Scott Ryburn',
      t: 'Product Manager, Sharesight'
    },{
      q: 'They were willing to go the extra mile',
      a: 'Scott Ryburn',
      t: 'Product Manager, Sharesight'
    },{
      q: 'Our web and mobile customers get an optimal user experience. We get a robust platform',
      a: 'Kelsi Doscher',
      t: 'Online Community Manager, Red Cross New Zealand'
    },{
      q: 'Abletech linked in a live environment with our internal database',
      a: 'Kelsi Doscher',
      t: 'Online Community Manager, Red Cross New Zealand'
    },{
      q: 'It enhanced our online presence',
      a: 'Kelsi Doscher',
      t: 'Online Community Manager, Red Cross New Zealand'
    },{
      q: 'Our web and mobile customers get an optimal user experience. We get a robust platform',
      a: 'Kelsi Doscher',
      t: 'Online Community Manager, Red Cross New Zealand'
    },{
      q: 'Abletech made the vision a reality',
      a: 'Gareth Jenkins',
      t: 'Founder, AED Locations'
    },{
      q: 'They integrated the iPhone app and GPS',
      a: 'Gareth Jenkins',
      t: 'Founder, AED Locations'
    },{
      q: 'They saved us significant time and made it look easy',
      a: 'Glen Wright',
      t: 'Senior Customer Manager, Auckland Transport'
    },{
      q: 'Abletech have a ‘can do’ attitude',
      a: 'Glen Wright',
      t: 'Senior Customer Manager, Auckland Transport'
    },{
      q: 'Abletech does the GIS coding and sends that back to us',
      a: 'Glen Wright',
      t: 'Senior Customer Manager, Auckland Transport'
    },{
      q: 'It enabled us to increase alternative modes of travel',
      a: 'Glen Wright',
      t: 'Senior Customer Manager, Auckland Transport'
    },{
      q: 'Abletech gave our database integrity',
      a: 'David Booth',
      t: 'Managing Director, MeatMail'
    },{
      q: 'We bulk import to an iPad based sales tool',
      a: 'David Booth',
      t: 'Managing Director, MeatMail'
    },{
      q: 'Thanks to Abletech we consistently get accurate data',
      a: 'David Booth',
      t: 'Managing Director, MeatMail'
    },{
      q: 'Complicated topography was tackled with great creativity and determination',
      a: 'Simon Kennett',
      t: 'Active Transport Co-ordinator, Greater Wellington Regional Council'
    },{
      q: 'The solution was absolutely world class',
      a: 'Simon Kennett',
      t: 'Active Transport Co-ordinator, Greater Wellington Regional Council'
    },{
      q: 'We’re confident it’s a world leader',
      a: 'Simon Kennett',
      t: 'Active Transport Co-ordinator, Greater Wellington Regional Council'
    }
  ]

  clearQuote: =>
    @testimonials.innerHTML = ''

  addRandomQuote: =>
    quotesLength = @quotes.length
    randomIndex = Math.floor(Math.random() * (quotesLength - 1) + 1)
    @testimonials.innerHTML = '\
      <blockquote>\
        <p>' + @quotes[randomIndex].q + '</p>\
        <footer>\
          <p>\
            <cite>' + @quotes[randomIndex].a + '</cite> - ' + @quotes[randomIndex].t + '\
          </p>\
        </footer>\
      </blockquote>'

  init: =>
    if @testimonials
      @clearQuote()
      @addRandomQuote()

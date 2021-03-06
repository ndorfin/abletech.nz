class NotFound.BlogRedirectHandler
  constructor: ({@path}) ->
    @blogURL = 'http://blog.abletech.nz'
    @blogMappings =
      '/continuous-delivery-with-cloud-66-and-travis-ci': '/102224982948/continuous-delivery-with-cloud-66-and-travis-ci'
      '/ruby-on-rails-bootcamp-summer-of-tech-2014': '/102225366863/ruby-on-rails-bootcamp-summer-of-tech-2014'
      '/ruby-on-rails-bootcamp-2013': '/102225710118/ruby-on-rails-bootcamp-2013'
      '/abletech-at-rubyconf-au-in-melbourne': '/102226385668/abletech-at-rubyconf-au-in-melbourne'
      '/work-from-waikanae-day': '/102229133633/work-from-waikanae-day'
      '/ruby-on-rails-bootcamp-for-2012': '/102229554278/ruby-on-rails-bootcamp-for-2012'
      '/learning-resources-for-ruby-on-rails': '/102229304228/learning-resources-for-ruby-on-rails'
      '/abletech-android-and-web-app-in-action': '/102229874968/abletech-android-and-web-app-in-action'
      '/storing-and-querying-spatial-data-using-elastic-search': '/102230091398/storing-and-querying-spatial-data-using-elastic-search'
      '/abletech-at-sxsw-2012': '/102230661903/abletech-at-sxsw-2012'
      '/configuring-an-ipv6-tunnel-on-ubuntu': '/102230835083/configuring-an-ipv6-tunnel-on-ubuntu'
      '/testing-http-interactions-in-rails-using-vcr': '/102230946263/testing-http-interactions-in-rails-using-vcr'
      '/7-steps-to-landing-a-summer-internship-with-abletech': '/102231121513/7-steps-to-landing-a-summer-internship-with-abletech'
      '/able-technology-have-moved': '/102231270958/able-technology-have-moved'
      '/abletech-at-adrenalin-forest-2': '/102231672083/abletech-at-adrenalin-forest-2'
      '/lastest-iphone-app-has-push-notifications': '/102231904728/lastest-iphone-app-has-push-notifications'
      '/abletech-team-does-lunch': '/102232137058/abletech-team-does-lunch'
      '/uploading-your-app-to-the-appstore': '/102232314823/uploading-your-app-to-the-appstore'
      '/able-technology-goes-wild-in-wellington': '/102232699073/able-technology-goes-wild-in-wellington'
      '/6-ways-to-get-the-most-out-of-webstock': '/102232862228/6-ways-to-get-the-most-out-of-webstock'
      '/abletech-kapiti-quad-biking': '/102233458848/abletech-kapiti-quad-biking'
      '/cameron-prebble-wins-outstanding-mashup': '/102233209858/cameron-prebble-wins-outstanding-mashup'
      '/a-cool-ror-job-in-a-cool-city': '/102233838758/a-cool-ror-job-in-a-cool-city'
      '/ruby-on-rails-training-course-26-28-october-2010': '/102234115038/ruby-on-rails-training-course-26-28-october-2010'
      '/nz-post-ratefinder-api-beta-released': '/102234298773/nz-post-ratefinder-api-beta-released'
      '/able-technology-acquires-projectx-on-line-mapping-and-addressing-capabilities': '/102234425023/able-technology-acquires-projectx-on-line-mapping-and-ad'
      '/rvm-gotcha-and-archflags-on-snow-leopard': '/102234787808/rvm-gotcha-and-archflags-on-snow-leopard'
      '/libxml-ree-2010-01-segmentation-fault-tracked-down': '/102234632408/libxml-ree-2010-01-segmentation-fault-tracked-down'
      '/osx-10-6-3-installs-new-ruby-with-faulty-bigdecimal': '/102234939923/osx-10-6-3-installs-new-ruby-with-faulty-bigdecimal'
      '/able-technology-sign': '/102235137148/able-technology-sign'
      '/country-and-currency-code-mappings': '/102235425953/country-and-currency-code-mappings'
      '/recurring-billing-of-expired-credit-cards': '/102235644338/recurring-billing-of-expired-credit-cards'
      '/oauth-presentation': '/102235778933/oauth-presentation'
      '/korimako-bellbird-iphone-ringtone': '/102236091903/korimako-bellbird-iphone-ringtone'
      '/recession-busting-free-offer': '/102236263088/recession-busting-free-offer'
      '/macbook-pro-speed-test': '/102236393073/macbook-pro-speed-test'
      '/installing-centos-on-vmware-fusion': '/102236488723/installing-centos-on-vmware-fusion'
      '/using-git-submodules-for-plugins': '/102236676063/using-git-submodules-for-plugins'
      '/serving-php-from-a-rails-app-with-passenger': '/102236772253/serving-php-from-a-rails-app-with-passenger'
      '/ree-on-mac-osx': '/102236918503/ree-on-mac-osx'
      '/rails-legacy-database-migration': '/102237206148/rails-legacy-database-migration'
      '/performance-issues-with-sub-queries-in-mysql-5': '/102237309303/performance-issues-with-sub-queries-in-mysql-5'
      '/display-access-keys-automatically': '/102237424243/display-access-keys-automatically'
      '/mysql-dual-master-active-passive-replication': '/102237546963/mysql-dual-master-active-passive-replication'
      '/false-positive-validation-warnings': '/102237649273/false-positive-validation-warnings'
      '/wanted-office-space-in-te-aro': '/102237851358/wanted-office-space-in-te-aro'
      '/clean-restarts-with-mongrel': '/102237971048/clean-restarts-with-mongrel'
      '/javascript-speed-test-results-updated-to-include-google-chrome': '/102238085853/javascript-speed-test-results-updated-to-include-google'
      '/javascript-speed-test-results': '/102238085853/javascript-speed-test-results-updated-to-include-google'
      '/testfixtures-plugin-for-ruby-on-rails': '/102238451888/testfixtures-plugin-for-ruby-on-rails'
      '/breadcrumb-trail-rails-plugin': '/102238577938/breadcrumb-trail-rails-plugin'
      '/sharesight-article-in-the-herald': '/102238831008/sharesight-article-in-the-herald'
      '/2008-budget-calculators': '/102238907353/2008-budget-calculators'
      '/increment-ruby-on-rails-migration-number': '/102238981303/increment-ruby-on-rails-migration-number'
      '/running-rails-in-a-subdirectory': '/102239107718/running-rails-in-a-subdirectory'
      '/thoughts-on-java-and-ruby-rails': '/102239168433/thoughts-on-java-and-ruby-rails'
      '/spec-ing-with-bigdecimal': '/102239323238/spec-ing-with-bigdecimal'
      '/view-youtube-videos-in-high-def': '/102239238048/view-youtube-videos-in-high-def'
      '/installing-git-on-mac-osx-10-5-leopard': '/102239417408/installing-git-on-mac-osx-10-5-leopard'
      '/experiences-with-mailqueue': '/102239476648/experiences-with-mailqueue'
      '/abletech-develops-sharesight': '/102239546923/abletech-develops-sharesight'
      '/new-release-of-my-auctions-gadget-for-trademe': '/102239742868/new-release-of-my-auctions-gadget-for-trademe'
      '/trademe-gadget-for-igoogle': '/102239818333/trademe-gadget-for-igoogle'
      '/url-anchors-conflict-with-javascript-focus-routines': '/102239884458/url-anchors-conflict-with-javascript-focus-routines'
      '/tumblr-blogging-engine': '/102240035638/tumblr-blogging-engine'
      '/introducing-ruby-on-rails-to-your-workplace': '/102240104248/introducing-ruby-on-rails-to-your-workplace'
      '/introducing-ruby-on-rails-to-the-enterprise': '/102240220293/introducing-ruby-on-rails-to-the-enterprise'
      '/firefox-2-breaks-kiwisaver-and-other-govt-sites': '/102240311343/firefox-2-breaks-kiwisaver-and-other-govt-sites'
      '/michael-speaking-at-railsconf-europe': '/102240458178/michael-speaking-at-railsconf-europe'
      '/training-and-consulting': '/102240846758/training-and-consulting'
      '/system-integration': '/102240608773/system-integration'
      '/web-application-development': '/102240540948/web-application-development'
      '/surf-s-up': '/102240961458/surf-s-up'
      '/italk-my-first-month': '/102241040058/italk-my-first-month'
      '/michael-speaking-at-web-standards': '/102241146168/michael-speaking-at-web-standards'
      '/howto-update-a-firefox-extension': '/102241240903/howto-update-a-firefox-extension'
      '/abletech-top-10': '/102241343118/abletech-top-10'
      '/howto-configure-italk-behind-a-firewall': '/102241418093/howto-configure-italk-behind-a-firewall'
      '/10-reasons-why-ruby-on-rails': '/102241675043/10-reasons-why-ruby-on-rails'
      '/white-paper-10-reasons-for-ruby-on-rails': '/102241675043/10-reasons-why-ruby-on-rails'
      '/ruby-on-rails-for-your-next-web-app': '/102241575018/ruby-on-rails-for-your-next-web-app'
      '/public-speaking': '/102241797798/public-speaking'
      '/fangs-visual-screen-reader': '/102241928963/fangs-visual-screen-reader'
      '/web-developer-toolbar-for-firefox-2-0-bon-echo': '/102242103458/web-developer-toolbar-for-firefox-2-0-bon-echo'
      '/new-rss-feed': '/102241989128/new-rss-feed'
      '/wellrailed': '/102242304798/wellrailed'
      '/contacts': '/102242246433/contacts'
      '/writeyourspecs-com': '/102242173063/writeyourspecs-com'
      '/michael-s-ruby-on-rails-presentation-at-webstock': '/102224269558/michael-s-ruby-on-rails-presentation-at-webstock'
      '/blog': '/'

  pathExists: =>
    @_newPath()?

  redirect: =>
    window.location.replace(@blogURL + @_newPath())

  _newPath: =>
    @blogMappings[@path] || @blogMappings['/blog' + @path] || @blogMappings['/blog/posts' + @path]



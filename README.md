The Abletech public-facing website.
===================================

The static website is hosted on Amazon S3, and published using the Amazon CloudFront CDN.

[![Build Status](https://travis-ci.org/AbleTech/abletech.nz.svg?branch=develop)](https://travis-ci.org/AbleTech/abletech.nz)

## Installation
1. Fork this repo
2. Clone into a local directory
3. Change to your new local directory
4. bundle install
5. bundle exec middleman server

## Building/Deploying UAT:

    git checkout develop
    git pull origin develop
    APP_ENV=staging bundle exec middleman build
    APP_ENV=staging AWS_BUCKET_ID_STAGING=AAAAA AWS_ACCESS_ID_STAGING=BBBBB AWS_SECRET_KEY_STAGING=CCCCC AWS_CLOUDFRONT_ID_STAGING=DDDDD bundle exec middleman s3_sync

## Building/Deploying PRODUCTION:

    git checkout master
    git pull origin master
    APP_ENV=production bundle exec middleman build
    APP_ENV=production AWS_BUCKET_ID_PRODUCTION=AAAAA AWS_ACCESS_ID_PRODUCTION=BBBBB AWS_SECRET_KEY_PRODUCTION=CCCCC AWS_CLOUDFRONT_ID_PRODUCTION=DDDDD bundle exec middleman s3_sync

## Methodologies used:

* Mobile First
* Responsive Web Design
* Styleguide-driven development
* Progressive Enhancement

## Memes used:

* humans.txt

## License

[![Creative Commons License][image-1]][1]
This work is licensed under a [Creative Commons Attribution-ShareAlike 4.0 International License][1].

[1]:   https://creativecommons.org/licenses/by-sa/4.0/

[image-1]: https://i.creativecommons.org/l/by-sa/4.0/88x31.png

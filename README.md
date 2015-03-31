The Abletech public-facing website.
===================================

The static website is hosted on Amazon S3. We also use the Amazon CloudFront CDN.

## Installation
1. Fork this repo
2. Clone into a local directory
3. Change to your new local directory
4. bundle install
5. bundle exec middleman server

## Building/Deploying UAT:

    git checkout develop
    git pull origin develop
    MM_ENV=staging bundle exec middleman build
    MM_ENV=staging AWS_ACCESS_ID_STAGING=XXXXXXXXXX AWS_SECRET_KEY_STAGING=YYYYYYYYYY AWS_CLOUDFRONT_ID_STAGING=ZZZZZZZZZZ bundle exec middleman s3_sync

## Building/Deploying PRODUCTION:

    git checkout master
    git pull origin master
    MM_ENV=production bundle exec middleman build
    MM_ENV=production AWS_ACCESS_ID=XXXXXXXXXX AWS_SECRET_KEY=YYYYYYYYYY AWS_CLOUDFRONT_ID=ZZZZZZZZZZ bundle exec middleman s3_sync

## Methodologies used:

* Mobile First
* Responsive Web Design
* Styleguide-driven development

## Memes used:

* humans.txt

## License

[![Creative Commons License][image-1]][1]
This work is licensed under a [Creative Commons Attribution-ShareAlike 4.0 International License][1].

[1]:   https://creativecommons.org/licenses/by-sa/4.0/

[image-1]: https://i.creativecommons.org/l/by-sa/4.0/88x31.png

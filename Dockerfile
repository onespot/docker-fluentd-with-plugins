FROM fluent/fluentd:v0.12.40-onbuild

# below RUN includes plugin as examples elasticsearch is not required
# you may customize including plugins as you wish

RUN apk add --update --virtual .build-deps \
        sudo build-base ruby-dev \
 && sudo gem install \
        fluent-plugin-cloudwatch-logs \
        fluent-plugin-ec2-metadata \
        fluent-plugin-datadog \
        fluent-plugin-loggly \
        fluent-plugin-s3 \
        fluent-plugin-forest \
 && sudo gem sources --clear-all \
 && apk del .build-deps \
 && rm -rf /var/cache/apk/* \
           /home/fluent/.gem/ruby/2.3.0/cache/*.gem

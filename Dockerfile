FROM fluent/fluentd:v0.12.40-onbuild

# below RUN includes plugin as examples elasticsearch is not required
# you may customize including plugins as you wish

RUN apk add --update --virtual .build-deps \
        sudo build-base ruby-dev \
 && sudo gem install \
        fluent-plugin-cloudwatch-logs -v 0.4.1 \
        fluent-plugin-ec2-metadata -v 0.0.15 \
        fluent-plugin-datadog -v 0.9.5 \
        fluent-plugin-loggly -v 0.0.9 \
        fluent-plugin-forest -v 0.3.3 \
 && sudo gem sources --clear-all \
 && apk del .build-deps \
 && rm -rf /var/cache/apk/* \
           /home/fluent/.gem/ruby/2.3.0/cache/*.gem

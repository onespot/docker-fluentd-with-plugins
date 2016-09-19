FROM fluent/fluentd:v0.12.29-onbuild
USER fluent
WORKDIR /home/fluent
ENV PATH /home/fluent/.gem/ruby/2.3.0/bin:$PATH
RUN gem install fluent-plugin-concat \
        fluent-plugin-cloudwatch-logs \
        fluent-plugin-s3 \
        fluent-plugin-loggly

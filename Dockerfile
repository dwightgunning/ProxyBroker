FROM python:alpine
WORKDIR /app
ADD requirements/ /app/requirements
RUN apk --no-cache add --update \
  gcc musl-dev git ca-certificates libffi-dev openssl \
  && pip install -r requirements/base.txt \
  && rm -rf /var/cache/apk/* \
  && rm -rf /tmp/*
ADD . /app
RUN pip install .
ENTRYPOINT ["proxybroker"]

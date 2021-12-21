### First Stage ###
FROM  python:3.7-alpine as base

RUN apk add build-base
RUN pip install --no-cache-dir flask
RUN pip install -U Flask-SQLAlchemy
RUN apk add --no-cache sqlite-libs

RUN pip install pyinstaller

WORKDIR /app
COPY . /app
RUN pyinstaller /app/app.py -F  --name "First_Flask_app" --add-data "/app/templates:/templates" --add-data "/app/*.db:/" --clean

### Second Stage ###

FROM alpine
COPY --from=base /app/dist/ /
ENTRYPOINT ["./First_Flask_app"]
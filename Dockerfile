# Usar la imagen base de Python 3 Alpine
FROM python:3.8-alpine

# Updating alpine and install all glance's dependencies
RUN apk update && apk upgrade

RUN apk add --no-cache linux-headers gcc python3-dev musl-dev

RUN pip install bottle

RUN pip install psutil==5.3.0

# Installs glances as a pip package
RUN pip install glances

# Runs glances on web client mode
CMD ["glances", "-w"]

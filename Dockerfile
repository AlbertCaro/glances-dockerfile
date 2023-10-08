# Using Python 3.8 image as a base
FROM python:3.8-alpine

# Update Alpine and then install Glances' dependencies
RUN apk update && \
    apk upgrade && \
    apk add --no-cache linux-headers gcc python3-dev musl-dev

# Install Glances dependencies
RUN pip install bottle psutil==5.3.0

# Install Glances as a pip package
RUN pip install glances

# Run Glances in web client mode
CMD ["glances", "-w"]

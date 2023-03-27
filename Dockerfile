# Using Python Alpine image
FROM python:3.11-alpine
# Create working directories
RUN mkdir -p /fedifetcher/artifacts/
# Define our Fedifetcher work dir
WORKDIR /fedifetcher
# Installing some packages
RUN apk add --update --no-cache bash dos2unix vim
# Copy crontab file
COPY ./crontab.fedifetcher /fedifetcher/
# Copy requirements file to install Python dependencies
COPY ./requirements.txt /fedifetcher/requirements.txt
# Copy start script
COPY ./docker-entrypoint.sh /fedifetcher/
RUN chmod 0775 /fedifetcher/docker-entrypoint.sh
# Upgrade pip and install Python dependencies
RUN pip install --no-cache-dir --upgrade pip
RUN pip install --no-cache-dir --upgrade -r /fedifetcher/requirements.txt
# Copy files and start via cron
COPY ./find_posts.py /fedifetcher/
ENTRYPOINT ["/fedifetcher/docker-entrypoint.sh"]

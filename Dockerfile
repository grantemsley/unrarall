FROM ubuntu:bionic

# Install
#RUN apk add --no-cache unrar cksfv bash cfv p7zip-full p7zip-rar
RUN apt-get update
RUN apt-get install -y cfv cksfv p7zip-full p7zip-rar unrar file
# Build
WORKDIR /src/
COPY . /src/
RUN cd /src

ENV CLEANMODE all
ENV DELAY 60

# Start the script
CMD ["bash", "./unrar-script.sh"]

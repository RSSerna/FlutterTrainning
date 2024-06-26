# Install dependencies
FROM debian:latest AS build-env

# Add the following two lines
# ARG API_URL
# ENV API_URL=$API_URL

RUN  apt-get update 
RUN  apt-get install -y curl git wget unzip libgconf-2-4 gdb libstdc++6 libglu1-mesa fonts-droid-fallback lib32stdc++6 python3 psmisc
RUN  apt-get clean

# Clone the flutter repo
RUN  git clone https://github.com/flutter/flutter.git -b stable /usr/local/flutter

# Set flutter path
ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"
    
# Enable flutter web
# RUN  flutter channel stable
# RUN  flutter upgrade
# RUN  flutter config --enable-web

# Run flutter doctor
RUN  flutter doctor -v

# Copy the app files to the container
COPY . /usr/local/bin/app

# Set the working directory to the app files within the container
WORKDIR /usr/local/bin/app

# Get App Dependencies
RUN  flutter clean

# Get App Dependencies
RUN  flutter pub get

# Build the app for the web
RUN  flutter build web --release 
#--dart-define API_URL=${API_URL:-}

# Document the exposed port
EXPOSE 8080

# Set the server startup script as executable
RUN  ["chmod", "+x", "/usr/local/bin/app/server/server.sh"]

# Start the web server
ENTRYPOINT [ "/usr/local/bin/app/server/server.sh" ]
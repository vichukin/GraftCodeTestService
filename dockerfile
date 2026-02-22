FROM mcr.microsoft.com/dotnet/aspnet:9.0

WORKDIR /usr/app

# Install wget, python3 + python3-dev and download GG
RUN mkdir -p /usr/app \
 && apt-get update \
 && apt-get install -y \
    wget \
    python3-dev \
 && wget -O /usr/app/gg.deb \
    https://github.com/grft-dev/graftcode-gateway/releases/latest/download/gg_linux_amd64.deb \
 && dpkg -i /usr/app/gg.deb \
 && rm /usr/app/gg.deb \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*
 
# You just need to copy your binaries with public interfaces
COPY /bin/Release/net8.0/publish/ /usr/app/

EXPOSE 80
EXPOSE 81
# And run Graftcode Gateway passing name of modules that should be exposed
# CMD ["gg","--modules", "/usr/app/GraftCodeTestServices.dll"]
CMD ["gg","--projectKey","eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIwMTljODc5NS05ZDc2LTc2NjktOTBmZS03NWQzZTEwM2U2MjIiLCJnYXRld2F5X25hbWUiOiJzcGVjaWZpYy13YWxudXQiLCJwaWQiOiIwMTljODc4OS05NjA5LTc2N2QtOGY1Ni1lZjVlZGRmNjI5ZDMiLCJwcm9qZWN0X25hbWUiOiJtb2NrZWQteWVsbG93c3RvbmUiLCJpYXQiOjE3NzE4MDEyNTUsIm5iZiI6MTc3MTgwMTI1NSwiZXhwIjoxNzg3NDM5NjU1LCJpc3MiOiJncmFmdGNvZGUtZ2F0ZXdheSIsImF1ZCI6ImdyYWZ0Y29kZS1hcGkifQ.7oJBDzBeCv-duFE_Ro0AJLzJSdJ4znjDE52ABZXu9zg","--modules", "/usr/app/GraftCodeTestServices.dll"]
# CMD ["gg", "--modules", "/usr/app/GraftCodeTestServices.dll"]

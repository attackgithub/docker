FROM microsoft/dotnet:2.2-sdk AS build
LABEL maintainer="warhorse@thedarkcloud.net"

WORKDIR /app

RUN git clone --recurse-submodules https://github.com/cobbr/Covenant

WORKDIR /app/Covenant/Covenant
RUN dotnet publish -c Release -o out

FROM microsoft/dotnet:2.2-aspnetcore-runtime AS runtime
WORKDIR /app
COPY --from=build /app/Covenant/Covenant/out .
COPY --from=build /app/Covenant/Covenant/Data ./Data
EXPOSE 7443 80 443
ENTRYPOINT ["dotnet", "Covenant.dll"]
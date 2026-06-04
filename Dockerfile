# Budowanie środowiska
FROM golang:alpine AS builder

# Instalacja certyfikatów SSL
RUN apk add --no-cache ca-certificates

WORKDIR /app

# Inicjalizacja modułu Go
RUN go mod init weatherapp

# Skopiowanie kodów źródłowych
COPY main.go index.html ./

# Kompilacja odchudzonej binarki
# CGO_ENABLED=0 pozwala na uruchomienie w scratch
# flaga -ldflags="-w -s" usuwa informacje debugowania
RUN CGO_ENABLED=0 GOOS=linux go build -ldflags="-w -s" -o weatherapp .

FROM scratch

# Etykieta zgodna ze standardem OCI 
LABEL org.opencontainers.image.authors="Kacper Kot"

# Skopiowanie certyfikatów sieciowych
COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/

COPY --from=builder /app/weatherapp /weatherapp

EXPOSE 8080

# Wymagany HEALTHCHECK z wykorzystaniem wbudowanej w program funkcji testującej
HEALTHCHECK --interval=30s --timeout=3s \
  CMD ["/weatherapp", "-health"]

# Uruchomienie aplikacji
CMD ["/weatherapp"]
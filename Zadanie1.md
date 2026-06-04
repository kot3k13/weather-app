## Kot Kacper - Technologie Chmurowe Zadanie 1 - część obowiązkowa

**Aplikacja pogodowa wyświetlająca dane o temperaturze oraz prędkości wiatru dla danego miasta korzystająca z Open-Meteo API**
- Napisana w języku go
- Jest "samodzielnym" plikiem wykonywalnym
- Uruchamiana na obrazie scratch

**Przykład użycia**

Budowanie obrazu:

```bash
docker build -t s101598/weather:v1 .
```

Uruchomienie kontenera:

```bash
docker run -d -p 8080:8080 --name pogodynka s101598/weather:v1
```

Sprawdzenie logów:

```bash
docker logs pogodynka
```

**Zrzuty ekranu zawarte w sprawozdaniu przesłanym na platformie moodle**
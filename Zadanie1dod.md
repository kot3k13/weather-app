## Kot Kacper - Technologie Chmurowe Zadanie 1 - część dodatkowa

**Aplikacja pogodowa wyświetlająca dane o temperaturze oraz prędkości wiatru dla danego miasta korzystająca z Open-Meteo API**
- Obraz jest dostępny na platformy linux/amd64 i linux/arm64
- Kod aplikacji pobierany jest w locie z repozytorium GitHub przy użyciu agenta SSH
- Pamięć podręczna (cache) dla buildera przechowywana jest w zewnętrznym rejestrze (Docker Hub)


**Przykład użycia**

Budowanie obrazu:

```bash
docker buildx build \
    -f Dockerfile2 \
    -t s101598/weather:v3 \
    --ssh default \
    --platform linux/amd64,linux/arm64 \
    --cache-to type=registry,ref=s101598/weather:cache,mode=max \
    --cache-from type=registry,ref=s101598/weather:cache \
    --provenance=false \
    --push .
```

Pobranie obrazu (z repozytorium):
```bash
docker pull s101598/weather:v3
```

Uruchomienie kontenera:

```bash
docker run -d -p 8080:8080 --name pogodynka_v3 s101598/weather:v3
```

Sprawdzenie logów:

```bash
docker logs pogodynka_v3
```

**Zrzuty ekranu znajdują się w sprawozdaniu przesłanym na moodle.**
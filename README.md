# ToDo App API

Proste REST API do zarządzania zadaniami, stworzone w celu demonstracji dobrych praktyk DevOps, konteneryzacji i automatyzacji CI/CD.

## Technologie

* **Backend:** Node.js (Express)
* **Baza danych:** MongoDB
* **Konteneryzacja:** Docker & Docker Compose
* **CI/CD:** GitHub Actions

---

## Jak uruchomić projekt?

Wymagane zainstalowane środowisko Docker oraz Docker Compose.

### 1. Uruchomienie aplikacji
W głównym katalogu projektu wykonaj:

```bash
docker compose up -d --build
```
curl http://localhost:3000/tasks

### 2. Dodawanie taska

```bash
curl -X POST http://localhost:3000/tasks \
   -H "Content-Type: application/json" \
   -d '{"name": "Zaliczyć projekt na 5.0"}'
```



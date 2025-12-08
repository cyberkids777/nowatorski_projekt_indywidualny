# ============================
# STAGE 1: Budowanie (Builder)
# ============================
FROM node:18-alpine AS builder

# Ustawiamy katalog roboczy
WORKDIR /usr/src/app

# Kopiujemy package.json (z folderu app, tak jak miałeś)
COPY app/package.json ./

# Instalujemy WSZYSTKIE zależności (w tym te potrzebne tylko do budowania)
RUN npm install

# Kopiujemy kod źródłowy
COPY app/ .

# ============================
# STAGE 2: Uruchamianie (Production)
# ============================
FROM node:18-alpine

WORKDIR /usr/src/app

# Kopiujemy TYLKO node_modules i kod z etapu 'builder'
# To jest kluczowy moment dla multi-stage build
COPY --from=builder /usr/src/app/node_modules ./node_modules
COPY --from=builder /usr/src/app/ .

EXPOSE 3000

CMD ["node", "server.js"]
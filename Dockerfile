# Używamy lekkiego obrazu Node.js
FROM node:18-alpine

# Ustawiamy katalog roboczy wewnątrz kontenera
WORKDIR /usr/src/app

# Kopiujemy pliki package.json (żeby zainstalować zależności)
COPY app/package.json ./

# Instalujemy zależności
RUN npm install

# Kopiujemy resztę kodu aplikacji
COPY app/ .

# Otwieramy port, na którym działa aplikacja
EXPOSE 3000

# Komenda startowa
CMD ["node", "server.js"]
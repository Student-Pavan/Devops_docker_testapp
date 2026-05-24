# 🚀 MongoDB + Mongo Express + Node.js Frontend with Docker

A simple Dockerized full-stack application using:

- 🌐 Node.js + Express Frontend
- 🍃 MongoDB
- 📊 Mongo Express
- 🐳 Docker

---

# 📁 Project Structure

```bash
.
├── public/
├── Dockerfile
├── mongodb.yaml
├── package.json
├── package-lock.json
├── server.js
└── README.md
```

---

# 🛠️ Technologies Used

- Node.js
- Express.js
- MongoDB
- Mongo Express
- Docker
- Docker Compose

---

# ⚙️ Prerequisites

Install:

- Docker Desktop

Verify installation:

```bash
docker --version
docker compose version
```

---

# 📦 Pull Docker Images

```bash
docker pull mongo
docker pull mongo-express
```

---

# 🌐 Create Docker Network

```bash
docker network create mongo-network
```

---

# ▶️ Start MongoDB Container

## Windows CMD

```cmd
docker run -d ^
-p 27017:27017 ^
--name mongo ^
--network mongo-network ^
-e MONGO_INITDB_ROOT_USERNAME=admin ^
-e MONGO_INITDB_ROOT_PASSWORD=qwerty ^
mongo
```

## PowerShell

```powershell
docker run -d `
-p 27017:27017 `
--name mongo `
--network mongo-network `
-e MONGO_INITDB_ROOT_USERNAME=admin `
-e MONGO_INITDB_ROOT_PASSWORD=qwerty `
mongo
```

---

# ▶️ Start Mongo Express Container

## Windows CMD

```cmd
docker run -d ^
-p 8081:8081 ^
--name mongo-express ^
--network mongo-network ^
-e ME_CONFIG_MONGODB_ADMINUSERNAME=admin ^
-e ME_CONFIG_MONGODB_ADMINPASSWORD=qwerty ^
-e ME_CONFIG_MONGODB_SERVER=mongo ^
mongo-express
```

## PowerShell

```powershell
docker run -d `
-p 8081:8081 `
--name mongo-express `
--network mongo-network `
-e ME_CONFIG_MONGODB_ADMINUSERNAME=admin `
-e ME_CONFIG_MONGODB_ADMINPASSWORD=qwerty `
-e ME_CONFIG_MONGODB_SERVER=mongo `
mongo-express
```

---

# 🐳 Build Node.js Application Image

```bash
docker build -t docker-test-app .
```

---

# ▶️ Run Node.js Container

## Windows CMD

```cmd
docker run -d ^
-p 3000:3000 ^
--name docker-app ^
--network mongo-network ^
docker-test-app
```

## PowerShell

```powershell
docker run -d `
-p 3000:3000 `
--name docker-app `
--network mongo-network `
docker-test-app
```

---

# 🌍 Access Applications

## Node.js Application

```bash
http://localhost:3000
```

## Mongo Express Dashboard

```bash
http://localhost:8081
```

### Login Credentials

```txt
Username: admin
Password: qwerty
```

---

# 📄 Example MongoDB Connection

Example from `server.js`:

```js
const mongoose = require("mongoose");

mongoose.connect(
  "mongodb://admin:qwerty@mongo:27017",
  {
    useNewUrlParser: true,
    useUnifiedTopology: true,
  }
);
```

---

# 📜 Example Dockerfile

```Dockerfile
FROM node:18

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 3000

CMD ["node", "server.js"]
```

---

# 📜 Example docker-compose.yml

```yaml
version: '3'

services:
  mongodb:
    image: mongo
    container_name: mongo
    ports:
      - "27017:27017"
    environment:
      MONGO_INITDB_ROOT_USERNAME: admin
      MONGO_INITDB_ROOT_PASSWORD: qwerty
    networks:
      - mongo-network

  mongo-express:
    image: mongo-express
    container_name: mongo-express
    ports:
      - "8081:8081"
    environment:
      ME_CONFIG_MONGODB_ADMINUSERNAME: admin
      ME_CONFIG_MONGODB_ADMINPASSWORD: qwerty
      ME_CONFIG_MONGODB_SERVER: mongodb
    networks:
      - mongo-network

  app:
    build: .
    container_name: docker-app
    ports:
      - "3000:3000"
    networks:
      - mongo-network
    depends_on:
      - mongodb

networks:
  mongo-network:
    driver: bridge
```

---

# ▶️ Run Using Docker Compose

```bash
docker compose up -d
```

Stop services:

```bash
docker compose down
```

---

# 🧹 Stop Containers

```bash
docker stop mongo mongo-express docker-app
```

---

# ❌ Remove Containers

```bash
docker rm mongo mongo-express docker-app
```

---

# 🧼 Remove Docker Network

```bash
docker network rm mongo-network
```

---

# 📊 Architecture

```text
Browser
   │
   ▼
Node.js App (3000)
   │
   ▼
MongoDB (27017)
   │
   ▼
Mongo Express (8081)
```



# 👨‍💻 Author

Pavan Kumar

```

^# Stage 1: Build frontend
FROM node:18-alpine AS client-builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Stage 2: Build backend
FROM node:18-alpine AS server-builder
WORKDIR /app
COPY server/package*.json .
RUN npm install
COPY server .

# Stage 3: Final image
FROM node:18-alpine
WORKDIR /app

# Copy frontend build
COPY --from=client-builder /app/build ./public

# Copy backend
COPY --from=server-builder /app .

# Install production dependencies
RUN npm install --production

# Environment variables
ENV MONGODB_URI=${MONGODB_URI}
ENV PORT=5000

# Start command
CMD ["node", "index.js"]

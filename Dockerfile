# Build frontend
FROM node:18-alpine AS client-builder
WORKDIR /app/client
COPY client/package*.json ./
RUN npm install
COPY client/ ./
RUN npm run build

# Build backend
FROM node:18-alpine AS server-builder
WORKDIR /app/server
COPY server/package*.json ./
RUN npm install
COPY server/ ./

# Final image
FROM node:18-alpine
WORKDIR /app

# Copy frontend build
COPY --from=client-builder /app/client/build ./client/build

# Copy backend
COPY --from=server-builder /app/server ./

# Install production dependencies
RUN npm install --production

# Environment variables
ENV MONGODB_URI=${MONGODB_URI}
ENV PORT=5000

# Serve frontend from backend
COPY --from=client-builder /app/client/build ./public

# Start command
CMD ["node", "index.js"]

# STAGE 1: Build Stage
# We use a full Node image to install dependencies
FROM node:20-alpine AS builder

# Set the working directory
WORKDIR /app

# Copy package files first (to leverage Docker cache)
COPY package*.json ./

# Install ALL dependencies
RUN npm install

# Copy the rest of your application code
COPY . .

# ---------------------------------------------------------

# STAGE 2: Production Stage
# We use a "slim" image to keep the final size small
FROM node:20-alpine AS runner

# Set environment to production
ENV NODE_ENV=production

WORKDIR /app

# ONLY copy the necessary files from the builder stage
# We don't need the cache or extra build tools here
COPY --from=builder /app/package*.json ./
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/server.js ./
COPY --from=builder /app/public ./public

# Expose the port the app runs on
EXPOSE 3000

# Start the application
CMD ["node", "server.js"]


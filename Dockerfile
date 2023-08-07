# syntax = docker/dockerfile:1.2
FROM node:20-slim AS base


FROM base AS builder
WORKDIR /app

COPY package.json \
     package-lock.json* \
     pnpm-lock.yaml* \
     yarn.lock* \
     ./

RUN \
if [ -f package-lock.json ]; \
    then npm ci; \
elif [ -f pnpm-lock.yaml ]; then \
    npm add --global pnpm && pnpm i --frozen-lockfile; \
elif [ -f yarn.lock ]; then \
    npm install --global yarn && yarn --frozen-lockfile; \
else \
    echo "Error: Package is missing a lockfile." && exit 1; \
fi

# Next.js build telemetry (https://nextjs.org/telemetry):
ENV NEXT_TELEMETRY_DISABLED 1

COPY . .
RUN npm run build


FROM base
WORKDIR /app
USER nobody:nogroup

# Copy only necessary files to reduce image size
# https://nextjs.org/docs/advanced-features/output-file-tracing
# Note: next.config.js: nextConfig must include: output: "standalone"
COPY --from=builder --chown=nobody:nogroup /app/.next/standalone ./
COPY --from=builder --chown=nobody:nogroup /app/.next/static ./.next/static
COPY --from=builder --chown=nobody:nogroup /app/public ./public

CMD ["node", "server.js"]

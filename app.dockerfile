# Use Node.js 18 LTS (alpine) for stability
FROM node:18-alpine

# Default environment variables if not provided
ARG NEXT_PUBLIC_WS_URL=ws://127.0.0.1:3001
ARG NEXT_PUBLIC_API_URL=http://127.0.0.1:3001/api
ENV NEXT_PUBLIC_WS_URL=${NEXT_PUBLIC_WS_URL}
ENV NEXT_PUBLIC_API_URL=${NEXT_PUBLIC_API_URL}

WORKDIR /home/perplexica

COPY ui /home/perplexica/

# Install dependencies
RUN yarn install --frozen-lockfile

# Build the project
RUN yarn build

# Start the application
CMD ["yarn", "start"]

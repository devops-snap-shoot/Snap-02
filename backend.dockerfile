# Use a compatible Node.js version (LTS 18)
FROM node:18-slim

# Install Python, make, and g++ to support node-gyp dependencies
RUN apt-get update && apt-get install -y python3 make g++

WORKDIR /home/perplexica

COPY src /home/perplexica/src
COPY tsconfig.json /home/perplexica/
COPY drizzle.config.ts /home/perplexica/
COPY package.json /home/perplexica/
COPY yarn.lock /home/perplexica/

RUN mkdir /home/perplexica/data

# Install dependencies
RUN yarn install --frozen-lockfile

# Build the project
RUN yarn build

# Start the application
CMD ["yarn", "start"]
 
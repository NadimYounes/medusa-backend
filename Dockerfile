FROM node:18.17.0

WORKDIR /app/medusa

COPY package.json .

RUN apt-get update

# Changed
# Update the package list and install Python 3
RUN apt-get update && apt-get install -y python3 python3-pip net-tools iputils-ping

# Symlink python to python3
RUN ln -s /usr/bin/python3 /usr/bin/python

# Install dependencies
RUN yarn --network-timeout 1000000

# Install the medusa-cli
RUN yarn global add @medusajs/medusa-cli@latest

COPY . .

RUN chmod +x develop.sh

EXPOSE 7001 9000

ENTRYPOINT ["./develop.sh"]

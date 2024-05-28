FROM node:18.17.0

WORKDIR /app/medusa

COPY package.json .

RUN apt-get update

# Changed
# Update the package list and install Python 3
RUN apt-get update && apt-get install -y python3 python3-pip

# Symlink python to python3
RUN ln -s /usr/bin/python3 /usr/bin/python

RUN npm install -g npm@latest

RUN npm install -g @medusajs/medusa-cli@latest

RUN npm install --loglevel=error

COPY . .

RUN chmod +x develop.sh

ENTRYPOINT ["./develop.sh", "develop"]

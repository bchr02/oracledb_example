FROM node:4

# SUPPRESS APT ERRORS
ARG DEBIAN_FRONTEND=noninteractive

# re-synchronize package index files from their sources
RUN apt-get update

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Bundle app source
COPY . /usr/src/app

# Install prerequisites
RUN mv oracle /opt
RUN ln -s /opt/oracle/instantclient/libclntsh.so.12.1 /opt/oracle/instantclient/libclntsh.so
RUN apt-get install libaio1
RUN touch /etc/ld.so.conf.d/oracle-instantclient.conf
RUN echo "/opt/oracle/instantclient" >> /etc/ld.so.conf.d/oracle-instantclient.conf
RUN ldconfig
ENV OCI_LIB_DIR=/opt/oracle/instantclient
ENV OCI_INC_DIR=/opt/oracle/instantclient/sdk/include

# INSTALL ORACLEDB
RUN npm install

# START APP
CMD [ "npm", "start" ]
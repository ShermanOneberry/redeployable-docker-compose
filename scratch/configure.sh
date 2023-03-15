mkdir -p certs
if [ ! -f "certs/domain.key" ] && [ ! -f "certs/domain.crt"]; then
    echo "Creating keys-cert pair"
    openssl req \
    -newkey rsa:4096 -nodes -sha256 -keyout certs/domain.key \
    -addext "subjectAltName = DNS:registry" \
    -x509 -days 365 -out certs/domain.crt \
    -subj "/C=SG/ST=Singapore/L=Singapore/O=Oneberry/CN=registry"
else
    echo "Cert and key already generated"
fi

mkdir -p nginx_certs
if [ ! -f "nginx_certs/domain.key" ] && [ ! -f "nginx_certs/domain.crt"]; then
    echo "Creating keys-cert pair"
    openssl req \
    -newkey rsa:4096 -nodes -sha256 -keyout nginx_certs/server.key \
    -addext "subjectAltName = DNS:192.168.56.102" \
    -x509 -days 365 -out nginx_certs/server.crt \
    -subj "/C=SG/ST=Singapore/L=Singapore/O=Oneberry/CN=registry"
else
    echo "Cert and key already generated"
fi
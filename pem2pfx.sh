#! /bin/sh

CERT_FILE=$1
KEY_FILE=$2
PFX_FILE=$3

if [ $# -ne 3 ]; then
	echo "Usage: $0 <CERTIFICATE FILE> <KEY FILE> <PFX FILE>"
	exit 1
fi

if [ ! -f $CERT_FILE ]; then
	echo "Certificate file '$CERT_FILE' not found."
	exit 1
fi

if [ ! -f $KEY_FILE ]; then
	echo "Key file '$KEY_FILE' not found."
	exit 1
fi

openssl pkcs12 -export -inkey $KEY_FILE -in $CERT_FILE -out $PFX_FILE


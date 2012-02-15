#! /bin/sh

XER_MODE=$1
PFX_FILE=$2
PEM_FILE=$3

if [ $# -ne 3 ]; then
	echo -e "Usage:\n\t $0 <OPTIONS> <PFX FILE> <PEM FILE>\n"
	echo -e "  OPTIONS:"
	echo -e "     CERT    Export Certificate from PKCS#12 file only"
	echo -e "     KEY     Export Private Key from PKCS#12 file only"
	echo -e "     ALL     Export Both Certificate and Private Key from"
	echo -e "             PKCS#12 file"
	exit 1
fi

if [ ! -f $PFX_FILE ]; then
	echo "PKCS#12 (.pfx) file '$PFX_FILE' not found."
	exit 1
fi

CMD_ARG=""

if [ $XER_MODE == "CER" ]; then
	CMD_ARG="-nokeys"
elif [ $XER_MODE == "KEY" ]; then
	CMD_ARG="-nocert"
fi

echo $CMD_ARG
openssl pkcs12 -in $PFX_FILE -out $PEM_FILE $CMD_ARG -nodes


# Restart ?
if $(curl -sSf localhost:8090 &> /dev/null)
then
	echo "Restarting ZAP..."
	curl "http://localhost:8090/JSON/core/action/shutdown/"
	sleep 4
fi

# Start
/Applications/OWASP\ ZAP.app/Contents/Java/zap.sh -daemon -port 8090 -config api.disablekey=true &

# Wait for it to init
while ! $(curl -sSf localhost:8090 &> /dev/null)
do
	echo "Waiting for proxy to start..."
	sleep 3
done
sleep 3

echo "Proxy is running..."
echo

#Install SNOW Windows

echo "Installing SNOW"

Mkdir "C:\Program Files\Snow Software\Inventory\Agent"

cd /C:/Program Files/Snow Software/Inventory/Agent/

msiexec /i https://s3.eu-west-2.amazonaws.com/dwp-cloudservices-ts-snowcloud-binaries/DWP_snowagent-6.3.0.x64.msi 

#Creating directory for the crypto keys

Mkdir "C:\Program Files\Snow Software\Inventory\Agent\my_cryptokeys"

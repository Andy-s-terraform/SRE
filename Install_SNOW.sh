#Install SNOW Windows

echo "Installing SNOW"

Mkdir "C:\Program Files\Snow Software\Inventory\Agent"

cd /C:/Program Files/Snow Software/Inventory/Agent/

msiexec /i https://File_location.msi 

#Creating directory for the crypto keys

Mkdir "C:\Program Files\Snow Software\Inventory\Agent\my_cryptokeys"

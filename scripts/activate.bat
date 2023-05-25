@echo off

echo Installing the product key...
slmgr /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX
echo Setting the KMS server to kms8.msguides.com
slmgr /skms kms8.msguides.com
echo Activating the product key...
slmgr /ato 
echo Checking the activation status...
slmgr /xpr
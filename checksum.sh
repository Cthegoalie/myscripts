#! /bin/bash

echo "File to validate?";
read FILE

echo "Checksum file?";
read SUM;

cat $SUM > temp1;
	echo "Starting check.";
sha256sum $FILE > temp2;

	echo "Check finished!";
	echo "$(awk '{print $1}' temp1)";
	echo "$(awk '{print $1}' temp2)";

if [[ "$(awk '{print $1}' temp1)" == "$(awk '{print $1}' temp2)" ]]
then
echo "Sums match!"
else
echo "Sums do not match!"
fi

rm temp*

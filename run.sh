#!/bin/sh

#Main functions
font_backup(){
su -c cp -f /system/fonts/NotoSansMyanmar-Bold.ttf backup/NotoSansMyanmar-Bold.ttf
su -c cp -f /system/fonts/NotoSansMyanmar-Regular.ttf backup/NotoSansMyanmar-Regular.ttf
su -c cp -f /system/fonts/NotoSansMyanmarUI-Bold.ttf backup/NotoSansMyanmarUI-Bold.ttf
su -c cp -f /system/fonts/NotoSansMyanmarUI-Regular.ttf backup/NotoSansMyanmarUI-Regular.ttf
}

font_replace(){
su -c cp -f NotoSansMyanmar-Bold.ttf /system/fonts/NotoSansMyanmar-Bold.ttf
su -c cp -f NotoSansMyanmar-Regular.ttf /system/fonts/NotoSansMyanmar-Regular.ttf
su -c cp -f NotoSansMyanmarUI-Bold.ttf /system/fonts/NotoSansMyanmarUI-Bold.ttf
su -c cp -f NotoSansMyanmarUI-Regular.ttf /system/fonts/NotoSansMyanmarUI-Regular.ttf
}

abort(){
[ "$1" ] && echo "ERROR: $1!"
echo "Please check your error in \"error.log\" and report it to creator."
exit 1
}

echo @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
echo @@____Unicode to Zawgyi changer___@@
echo @@__________by CH405 HE!N_________@@
echo @@__Visit http://www.facebook.com_@@
echo @@______/yhh.juliankevinhein______@@
echo @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@            
sleep 3

echo "*****RECORD STARTED*****" >> error.log
echo "checking root..."

if [ su ]
then

echo "mounting system rw..."
su -c mount -o remount,rw /system 2>> error.log
[ $? = 0 ] || abort "mount system fail"

echo checking system requirements...

if [[ -f /system/fonts/NotoSansMyanmar-Regular.ttf && -f /system/fonts/NotoSansMyanmar-Bold.ttf && -f /system/fonts/NotoSansMyanmarUI-Regular.ttf && -f /system/fonts/NotoSansMyanmarUI-Bold.ttf ]]
then


echo "backing up..."
[ -d backup ] && echo Folder already exist. overwriting... || mkdir backup.
font_backup 2>> error.log


echo "replacing..."
font_replace 2>> error.log
[ $? = 0 ] || abort "replacing error"

echo "set permission..."
su -c chmod 0644 /system/fonts/NotoSansMyanmar*.ttf
[ $? = 0 ] || abort "permission set fail"

echo "remounting system..."
su -c mount -o ro,remount /system 2>> error.log

if [ $? = 0 ] 
then
echo "======Done!======"
sleep 3
echo rebooting...
sleep 2
su -c reboot
else
echo "ERROR: ro remounting"
sleep 3
echo rebooting...
sleep 3
su -c reboot
fi

echo "******END RESULT******" >> error.log
echo " " >> error.log
echo " " >> error.log

else
 
   echo "This tool isn't befitting with your device:("
   exit 1
 
fi

else

   echo "No root access found. Please root your device first!"
   exit 1

fi
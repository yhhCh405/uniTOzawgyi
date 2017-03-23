echo Unicode to Zawgyi changer By CH405 HE!N
echo visit http://www.facebook.com/
echo yhh.juliankevinhein

echo checking root...
su="/system/bin/su" || "/system/xbin/su"

if [ -f "$su" ]
then

echo mounting system rw...
mount -o rw,remount /system

echo checking system requirements...
file="/system/fonts/NotoSansMyanmar-Regular.ttf" && "/system/fonts/NotoSansMyanmar-Bold.ttf" && "/system/fonts/NotoSansMyanmarUI-Regular.ttf" && "/system/fonts/NotoSansMyanmarUI-Bold.ttf"

if [ -f "$file" ]
then


echo backing up...
[ -d backup ] && echo Folder already exist. rewriting... || mkdir backup.
font_backup


echo replacing...
font_replace

echo set permission...
chmod 0644 /system/fonts/NotoSansMyanmar*.ttf

echo remounting system...
mount -o ro,remount /system

##Main functions
font_backup(){
cp -f /system/fonts/NotoSansMyanmar-Bold.ttf backup/NotoSansMyanmar-Bold.ttf
cp -f /system/fonts/NotoSansMyanmar-Regular.ttf backup/NotoSansMyanmar-Regular.ttf
cp -f /system/fonts/NotoSansMyanmarUI-Bold.ttf backup/NotoSansMyanmarUI-Bold.ttf
cp -f /system/fonts/NotoSansMyanmarUI-Regular.ttf backup/NotoSansMyanmarUI-Regular.ttf
}

font_replace(){
cp -f NotoSansMyanmar-Bold.ttf /system/fonts/NotoSansMyanmar-Bold.ttf
cp -f NotoSansMyanmar-Regular.ttf /system/fonts/NotoSansMyanmar-Regular.ttf
cp -f NotoSansMyanmarUI-Bold.ttf /system/fonts/NotoSansMyanmarUI-Bold.ttf
cp -f NotoSansMyanmarUI-Regular.ttf /system/fonts/NotoSansMyanmarUI-Regular.ttf
}

echo =====Done!=====

else
 
   echo "This tool isn't comparable with your device:("

fi

else

   echo "No root access found. Please root your device first"
   exit

fi
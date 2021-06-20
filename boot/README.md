
## Prepare system and USB disk

```bash
apt install dosfstools exfat-fuse -y

# get latest release from https://github.com/ventoy/Ventoy/releases
tar xzf release.tgz

sh Ventoy2Disk.sh { -i | -I | -u } /dev/XXX 

# more info here: https://www.ventoy.net/en/doc_start.html
```


## Download some ISOs

```bash
cd images/linux
wget https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-10.9.0-amd64-xfce-CD-1.iso
```


## Copy ISOs into the first partition on the disk in any directory hierarchy. Example:

```bash
mount /dev/sdc1 /mnt/sdc1
cp -a images /mnt/sdc1
umount /mnt/sdc1
```

These steps would help on fixing VMWare Workstation shared folder does not appear on Guest machine.
1. Create `/mnt/hgfs` directory, if not exists.
2. Add the following line to `/etc/fstab`: `vmhgfs-fuse /mnt/hgfs	fuse	defaults,allow_other	0	0`

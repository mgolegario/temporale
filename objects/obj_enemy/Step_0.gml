estado();

vspd+=grv;
vspd = clamp(vspd, vspd_min, vspd_max);

if life<=0 instance_destroy();
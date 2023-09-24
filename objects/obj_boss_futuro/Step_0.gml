estado();

vspd+=grv;
vspd = clamp(vspd, vspd_min, vspd_max);

if estado!=estado_morto{
if life<=0 estado=estado_morto;
}


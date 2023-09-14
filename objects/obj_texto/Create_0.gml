texto=["Texto bem legal apenas para textar mesmo tmj mano é isso ai msm n tem mais nada q isso nao é isso ai"];
fala=0;
texto_por_fala= texto[fala];
foi_falado= false;
troca_balao=0;

indice=1;
vel_txt=0.1;

vel_lenta= 0.4;
vel_txt= vel_lenta;

caixa[0,0]= noone;
caixa[0,1]= noone;

caixa_player[0,0]= spr_caixa_player_1;
caixa_player[0,1]= spr_caixa_player_2;

caixa_doutor[0,0]= spr_caixa_doutor_1;
caixa_doutor[0,1]= spr_caixa_doutor_2;

caixa=caixa_player[0,1];
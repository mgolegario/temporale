layer_create(-200,"dialogo");

if distance_to_object(obj_player) <= 35{
	if input_check_pressed("dialogo"){
	instance_create_layer(x,y, "dialogo",obj_texto);

	with obj_texto{
		texto=["Olhe bem meu filho, eu já tenho uma idade bem avançada, então nunca é meio dificil cair numa dessa",
		"tudo bem tudo bem tudo bem tudo bem tudo bem",
		"flw flw flw flw flw flw flw flw"];

		caixa[0,0]=caixa_doutor[0,0];
		caixa[0,1]=caixa_doutor[0,1];
	
	}

	}

}
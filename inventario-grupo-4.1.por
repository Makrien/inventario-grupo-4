programa
{
	inclua biblioteca Tipos --> tipos

	const cadeia LINHA_SIMPLES = "-----------------------------------\n"
	const cadeia LINHA_DUPLA = "===================================\n"
	
	funcao inicio()
	{
    inteiro opcao

		opcao = menuEscolherOpcao()
    escreva(opcao)

    escolha(opcao)
    {
      caso 1: // Função que apresenta a legenda dos produtos a partir de seus códigos
      caso 2: // Função que atualiza a quantidade dos produtos escolhidos pelo usuário
      caso 3: // Função que imprime os produtos em ordem alfabética
      caso 4: // Nada
    }
	}

	funcao inteiro menuEscolherOpcao()
	{
		cadeia opcaoCadeia
		inteiro opcaoInt = 0
		logico opcaoValida = falso

		cabecalho()
		
		faca
		{
			
			escreva(
				"[1] Produto por código\n",
				"[2] Atualizar quantidade\n",
				"[3] Imprimir produtos\n",
				"[4] Sair\n",
				LINHA_SIMPLES,
				"--> "
				)
			leia(opcaoCadeia)

			// Checa se é possível converter a cadeia lida do usuário em inteiro 
			se (tipos.cadeia_e_inteiro(opcaoCadeia, 10))
			{
				opcaoInt = tipos.cadeia_para_inteiro(opcaoCadeia, 10)				
			}
			
			limpa()

			// Checa se o valor da opção, já em inteiro, está dentro das possibilidades
			se (opcaoInt < 1 ou opcaoInt > 4) escreva("Opção inválida\n\n")
			senao opcaoValida = nao opcaoValida
		} enquanto (nao opcaoValida)
		
		retorne opcaoInt
	}

	funcao cabecalho()
	{
		escreva(
			LINHA_DUPLA,
			"       INSIRA TÍTULO CRIATIVO\n",
			LINHA_DUPLA
			)
	}
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1468; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */
programa
{
	inclua biblioteca Util --> u
	inclua biblioteca Tipos --> tipos
	inclua biblioteca Util --> util

	const cadeia LINHA_SIMPLES = "-----------------------------------\n"
	const cadeia LINHA_DUPLA = "===================================\n"
	
	funcao inicio()
	{
		inteiro opcao

		opcao = menuEscolherOpcao()
		escreva(opcao)
		sorteioEstoque()
		
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

<<<<<<< HEAD
	funcao sorteioEstoque()
	{
		inteiro i = 0
		inteiro x = 0
		inteiro p = 20
		inteiro t = 3
		cadeia produtos[] = {"camisa","camiseta","calça","bermuda"}
=======
	funcao sorteioEstoque(){
		const inteiro EST = 20
		cadeia tipos[] = {"camisa","camiseta","calça","Bermuda"}
>>>>>>> 642a9fffc91123ca29e7beae12b36b0b47079302
		cadeia cores[] = {"vermelho","preto","amarelo","azul","branco","verde"}
		cadeia tamanho[] = {"PP","P","M","G","GG"}
		cadeia produtos[EST]
		
<<<<<<< HEAD
		para ( i=0; i<p; i++)
		{
			estoque[i][0] = produtos[util.sorteia(0,3)]
			estoque[i][1] = cores[util.sorteia(0,5)]
			estoque[i][2] = tamanho[util.sorteia(0,4)]
			
			// Iteração que verifica repetição de itens
			para (inteiro j = 0; j < i; j++)
			{
				se (
					estoque[j][0] == estoque[i][0] e
					estoque[j][1] == estoque[i][1] e
					estoque[j][2] == estoque[i][2]
				)
				{
					i--
					// Tire as barras de comentário abaixo para debug
					//escreva("========= REPETIDO =========\n")
				}
			}
			// Tire as barras de comentário abaixo para debug
			// escreva(estoque[i][0], " ", estoque[i][1], " ", estoque[i][2], "\n")
		}
				
=======
		inteiro sorteio1, sorteio2, sorteio3
		cadeia item
		logico igual

		para (inteiro i=0; i<EST; i++){
			faca {
				igual = falso
				
				sorteio1 = u.sorteia(0, 3)
				sorteio2 = u.sorteia(0, 5)
				sorteio3 = u.sorteia(0, 4)
				
				item = tipos[sorteio1] + " " + cores[sorteio2] + " " + tamanho[sorteio3]
	
				para (inteiro j=0; j<EST; j++){
					se (item == produtos[j]) {
						igual = verdadeiro
						pare
					}					
				}
	
				se (nao igual)
					produtos[i] = item
			} enquanto (igual)
		}

		para (inteiro i=0; i<EST; i++){
			escreva(produtos[i] +"\n")
		}
>>>>>>> 642a9fffc91123ca29e7beae12b36b0b47079302
	}
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
<<<<<<< HEAD
 * @POSICAO-CURSOR = 617; 
=======
 * @POSICAO-CURSOR = 2207; 
>>>>>>> 642a9fffc91123ca29e7beae12b36b0b47079302
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */
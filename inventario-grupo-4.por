programa
{
	inclua biblioteca Util -->u
	inclua biblioteca Tipos --> tipos
	
	
	const cadeia LINHA_SIMPLES = "-----------------------------------\n"
	const cadeia LINHA_DUPLA = "===================================\n"
	const inteiro T =20

		cadeia vRoupas[] = {"Camisa", "Camiseta", "Calça", "Bermuda"}
		cadeia vCores[] = {"vermelho", "preto", "amarelo", "azul", "branco", "verde"}
		cadeia vTamanhos[] = {"PP", "P", "M", "G", "GG"}

		cadeia vProdutos[T]
		
	funcao inicio()
	{
		geradorEstoque()
		menu()
		
	}
	
	
	funcao menu(){
	    inteiro opcao
	
			opcao = menuEscolherOpcao()
	    escreva(opcao)
	
	    escolha(opcao)
	    {
	      caso 1: localizarCodigo(vProdutos)pare
	      caso 2: // Função que atualiza a quantidade dos produtos escolhidos pelo usuário
	      caso 3: imprimir() pare
	      caso 4: // Nada
	      caso contrario:escreva("Opção Inválida")
	    }

	}
	funcao geradorEstoque()
	{
		
		
		inteiro sorteio1, sorteio2, sorteio3
		cadeia item
		logico igual
		
		para(inteiro i=0; i <T; i++){
			faca{
				igual= falso
				
				sorteio1 = u.sorteia(0,3)
				sorteio2 = u.sorteia(0,5)
				sorteio3 = u.sorteia(0,4)
				item =  vRoupas[sorteio1] + " "+ vCores[sorteio2] +" "+ vTamanhos[sorteio3]
												
				para (inteiro j=0; j< T; j++){
				 	se(item == vProdutos[j]){
				 		igual = verdadeiro	
				 		pare
				 	}
				 					 	
				}
				se (nao igual)
					vProdutos[i] = item
			}enquanto (igual)
		}
			
		//para (inteiro t=0; t<T;t++){
			//escreva((t+1)," - ",vProdutos[t] +"\n")
		//}
		
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
	funcao pl(){ // pula uma linha
		escreva("\n")
	}
	
	funcao localizarCodigo(cadeia vetor[]){
		
		inteiro codProd
		cadeia codProd2

		pl()// pula uma linha
		escreva("Digite o código do produto.")
		leia(codProd2)
													
		
			se(tipos.cadeia_e_inteiro(codProd2, 10)){				
			   codProd = tipos.cadeia_para_inteiro(codProd2, 10)
			   se(codProd >= 1 e codProd < 20){
		 	   escreva(vetor[(codProd-1)])			 	
		 	   } senao escreva("opção inválida")			 	
			}senao escreva("opção inválida")
				
			
     } 
	funcao imprimir(){
		limpa()
		para (inteiro t=0; t<T;t++){
			escreva((t+1)," - ",vProdutos[t] +"\n")
		}
	}
		
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 3053; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */
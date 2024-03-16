programa
{
	inclua biblioteca Util -->u
	inclua biblioteca Tipos --> tipos
	inclua biblioteca Texto --> t
	
	
	const cadeia LINHA_SIMPLES = "-----------------------------------\n"
	const cadeia LINHA_DUPLA = "===================================\n"
	const inteiro T = 5

	cadeia vRoupas[] = {"Camisa", "Camiseta", "Calça", "Bermuda"}
	cadeia vCores[] = {"vermelho", "preto", "amarelo", "azul", "branco", "verde"}
	cadeia vTamanhos[] = {"PP", "P", "M", "G", "GG"}

	cadeia vProdutos[T]
	inteiro vQuantidade[T]
		
	funcao inicio()
	{	 
		geradorEstoque()
		inicializarVetores()
		
		menu()
		menuProduto()
		
		
		//localizarCodigo(vProdutos, vQuantidade)
		
		
	}
		
	funcao menu()
	{
	    inteiro opcao
	
		opcao = menuEscolherOpcao()
	   	escreva(opcao)
	
	    escolha(opcao)
	    {
	      caso 1: localizarCodigo(vProdutos, vQuantidade) // Função que apresenta a legenda dos produtos a partir de seus códigos
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
		/*
		para (inteiro t=0; t<T;t++){
			escreva((t+1)," - ",vProdutos[t] +"\n")
		}
		*/
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
		
	funcao localizarCodigo(cadeia vetor[], inteiro vQuant[]){
		
		inteiro codProd
		cadeia codProd2		
		inteiro i = 0
		inteiro vQuant0[3] 		
		//cadeia opcao = "n"
		logico localizou = falso
		
		

		faca{
			escreva("\nDigite o código do produto.")
			leia(codProd2)				
																														
			se(tipos.cadeia_e_inteiro(codProd2, 10)){				
			   codProd = tipos.cadeia_para_inteiro(codProd2, 10)			   
				   se(codProd >= 1 e codProd <= 3){		 	   
			 	   localizou = verdadeiro
			 	   i++
			 	   escreva(vetor[(codProd -1)])// exibir o produto selecionado 			 	 			 	   				  			   				 				   	 		 		
				   }senao escreva("\nOpção inválida")		 	   		 	   			 	
			}senao escreva("\nOpção inválida")
		 
		 }enquanto(localizou e i < 3)
		 escreva("\nObrigado por utilizar o programa!")
		 aguarde()
		 menu()	 
    }

	funcao menuProduto()
	{
    		 cadeia sOpcao
    		 inteiro opcao = 0 

    		 faca{
    		 
    	      escreva("[1] Adicionar quantidade para todos\n",
    	      	    "[2] Adicionar quantidade por código\n",
    	      	    "[3] Sair\n")

    	      leia(sOpcao)
    	      
    	      opcao = checarValidezInteiro(sOpcao)
    	      
    	      escolha(opcao)
    	      {
    	      	caso 1: adicionarQuantTodos() pare
    	      	caso 2: adicionarQuantCodigo() pare
    	      	caso 3: 
    	      		limpa()
    	      		menuEscolherOpcao() pare
    	      }
    	      se (opcao != 3)
			aguarde() 
    		 }enquanto(opcao != 3)  
    	}	

    	funcao adicionarQuantTodos()
    	{
    		cadeia qntdStr = ""
    		inteiro qntdInt = -1
    		
    		para (inteiro i = 0; i < T; i++)
    		{
    			se (vQuantidade[i] == -1)
    			{
    				escreva("Quantidade do produto ", i + 1, ": ")
    				leia(qntdStr)
    				qntdInt = checarValidezInteiro(qntdStr)
    				se (qntdInt == -1) i--
    				senao vQuantidade[i] = qntdInt
    			}
    		}

    		se(vQuantidadeCheio())
    		{
    			escreva(
    				"Quantidade inclusa para todos os produtos.\n",
    				"Entre os valores individualmente para substituí-los.\n"
    			)
    		}
    	}
 		
    	funcao adicionarQuantCodigo()
    	{
    		cadeia codigoStr
    		inteiro codigoInt = -1

    		cadeia qntdStr
		inteiro qntdInt = -1
    		
    		enquanto (codigoInt < 1 ou codigoInt > T)
    		{
    			escreva("Código do produto: ")
    			leia(codigoStr)

    			codigoInt = checarValidezInteiro(codigoStr)
    		}

		enquanto (qntdInt < 0)
		{
			escreva("Quantidade do produto ", codigoInt, ": ")
			leia(qntdStr)

			qntdInt = checarValidezInteiro(qntdStr)
		}
    		
		vQuantidade[codigoInt - 1] = qntdInt
    		
    	}

    	funcao logico adicionar(inteiro codProd,cadeia codProd2, inteiro i,inteiro vQuant0[], cadeia opcao){    	   		   		 				 
		 	 			
    		 		   escreva("\nInforme a quantidade do produto: ")
				   leia(vQuant0[codProd-1])
				   i++
		 se(i < 3){
			escreva("\nDeseja add nova quantidade de outro produto?")
			leia(opcao)
				se(t.caixa_alta(opcao) == "S"){
				retorne verdadeiro 	
				}				
			}senao escreva("\nVetor cheio")
			 retorne falso		   			
    }

	funcao inteiro validarInteiro(cadeia sOpcao) {
		se (tipos.cadeia_e_inteiro(sOpcao, 10)) {
			inteiro opcao = tipos.cadeia_para_inteiro(sOpcao, 10)
			retorne opcao
		}

		retorne -1
	}
   			
     funcao aguarde() {
			cadeia tecla
			escreva("\nPressione uma tecla para continuar...")
			leia(tecla)
	}

	funcao imprimir()
	{
		limpa()
		para (inteiro t=0; t<T;t++){
			escreva((t+1)," - ",vProdutos[t] +"\n")
		}
		// função adicionar qntd todos
		// função adicionar qntd por código
			// se qntd já incluída vQuantidade[i] != -1
				// avisar usuário e perguntar se tem ctz
	}
		
	funcao inteiro checarValidezInteiro(cadeia inputCru)
	{
		inteiro inputValido

		se (tipos.cadeia_e_inteiro(inputCru, 10))
		{
			inputValido = tipos.cadeia_para_inteiro(inputCru, 10)
			retorne inputValido
		}
		escreva(LINHA_SIMPLES, "Tipo de entrada inválida, número esperado.\n\n")
		retorne -1
	}				

	funcao inicializarVetores()
	{
		para (inteiro i = 0; i < T; i++)
		{
			vQuantidade[i] = -1
		}
	}

	funcao logico vQuantidadeCheio()
	{
		para (inteiro j = 0; j < T; j++)
		{
			se (vQuantidade[j] == -1) retorne falso
		}
		retorne verdadeiro
	}

	funcao pressioneParaContinuar(cadeia mensagem)
	{
		cadeia tecla

		escreva(mensagem, "Pressione qualquer tecla... ")
		leia(tecla)
	}



}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 663; 
 * @DOBRAMENTO-CODIGO = [18, 32, 49, 84, 121, 130, 160, 188, 214, 242, 257, 266, 272, 284, 297, 305, 314];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {vProdutos, 16, 8, 9}-{vQuantidade, 17, 9, 11};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */
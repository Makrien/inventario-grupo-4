programa
{
	inclua biblioteca Util --> u
	inclua biblioteca Tipos --> tipos
	inclua biblioteca Texto --> t

	// Define o tamanho do estoque, i.e. tamanho de matriz e vetor
	const inteiro T = 10

	// Vetores usados para gerar estoque por função sorteio
	cadeia vRoupas[] = {"Camisa    ", "Camiseta  ", "Calça     ", "Bermuda   "}
	cadeia vCores[] = {"vermelho  ", "preto     ", "amarelo   ", "azul      ", "branco    ", "verde     "}
	cadeia vTamanhos[] = {"PP", "P ", "M ", "G ", "GG"}

	cadeia vProdutos[T]
	inteiro vQuantidade[T]
		
	funcao inicio()
	{	 
		
		geradorEstoque()
		Ordem()
		inicializarVetoresInt()
		inteiro opcao
		faca
		{
			opcao = menuEscolherOpcao()
			menu(opcao)
		} enquanto (opcao != 5)
		
		escreva("\nObrigado por usar o programa INSIRA TÍTULO CRIATIVO.\n")
		//localizarCodigo(vProdutos, vQuantidade)
		
		
	}
		
	funcao menu(inteiro opcao)
	{
	    escolha(opcao)
	    {
	      caso 1: localizarCodigo(vProdutos, vQuantidade) pare// Função que apresenta a legenda dos produtos a partir de seus códigos
	      caso 2: menuProduto() pare// Função que atualiza a quantidade dos produtos escolhidos pelo usuário
	      caso 3: imprimir() pare
	      caso 4: escolherTipoExcluir() pare
	      caso 5: pare	      
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
				"[4] Excluir\n",
				"[5] Sair\n"
			)
			write("-", 35)	
			escreva("\n--> ")
			leia(opcaoCadeia)

			// Checa se é possível converter a cadeia lida do usuário em inteiro 
			opcaoInt = checarValidezInteiro(opcaoCadeia)
			
			limpa()

			// Checa se o valor da opção, já em inteiro, está dentro das possibilidades
			se (opcaoInt < 1 ou opcaoInt > 5) escreva("Opção inválida\n\n")
			senao opcaoValida = nao opcaoValida
		} enquanto (nao opcaoValida)
		
		retorne opcaoInt
	}

	funcao cabecalho()
	{
		write("=", 35)
		escreva("\n       INSIRA TÍTULO CRIATIVO\n")
		write("=", 35)
		escreva("\n")
	}
		
	funcao localizarCodigo(cadeia vetor[], inteiro vQuant[])
	{
		
		inteiro codProd
		cadeia codProd2		
		inteiro i = 0
		inteiro vQuant0[3] 		
		//cadeia opcao = "n"
		logico localizou = falso
		
		
		cabecalho()
		faca{
			escreva("\nDigite o código do produto.\n--> ")
			leia(codProd2)				
																														
			se(tipos.cadeia_e_inteiro(codProd2, 10)){				
			   codProd = tipos.cadeia_para_inteiro(codProd2, 10)			   
				   se(codProd >= 1 e codProd <= T){		 	   
			 	   localizou = verdadeiro
			 	   i++
			 	   escreva(vetor[(codProd -1)])// exibir o produto selecionado 			 	 			 	   				  			   				 				   	 		 		
				   }senao escreva("\nOpção inválida")		 	   		 	   			 	
			}senao escreva("\nOpção inválida")
		 
		 }enquanto(localizou e i < T)
		 escreva("\nObrigado por utilizar o programa!")
		 aguarde()

		 limpa()
    }

	funcao menuProduto()
	{
    		 cadeia sOpcao
    		 inteiro opcao = 0
		 
    		 faca{
    		 cabecalho()
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
    	      		pare
    	      }
    	      se (opcao != 3)
			aguarde()
			limpa()
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
    				"\nQuantidade inclusa para todos os produtos.\n",
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

    	funcao logico adicionar(inteiro codProd,cadeia codProd2, inteiro i,inteiro vQuant0[], cadeia opcao)
    	{    	   		   		 				 
		 	 			
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

	funcao inteiro validarInteiro(cadeia sOpcao)
	{
		se (tipos.cadeia_e_inteiro(sOpcao, 10)) {
			inteiro opcao = tipos.cadeia_para_inteiro(sOpcao, 10)
			retorne opcao
		}

		retorne -1
	}
   			
     funcao aguarde()
     {
			cadeia tecla
			escreva("\nPressione uma tecla para continuar...")
			leia(tecla)
	}

	funcao imprimir()
	{
		limpa()

		escreva("Código -    Tipo       Cor     Tamanho  Quantidade\n")
		write("-", 49)
		escreva("\n")
		
		para (inteiro t=0; t<T;t++)
		{
			se (vProdutos[t] == "")
			{
				
			}
			senao
			{
				se (t < 9) escreva ("  0", t + 1)
				senao escreva ("  ", t + 1)
				
				escreva("   -   ",vProdutos[t], "      ") 
				
				se (vQuantidade[t] == -1) escreva("   0\n")
				senao escreva(vQuantidade[t], "\n")
			}
		}

		write("-", 49)
		escreva("\n")

		aguarde()
		limpa()
	}
		
	funcao inteiro checarValidezInteiro(cadeia inputCru)
	{
		inteiro inputValido

		se (tipos.cadeia_e_inteiro(inputCru, 10))
		{
			inputValido = tipos.cadeia_para_inteiro(inputCru, 10)
			retorne inputValido
		}
		write("-", 35)
		escreva("\n")
		escreva("Tipo de entrada inválida, número esperado.\n\n")
		retorne -1
	}				

	funcao inicializarVetoresInt()
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

	funcao Ordem()
	{       
        
        caracter vProdutosC[T]

        obterPrimeiroCaracterVetor(vProdutos, vProdutosC)    
        ordenarVetorCadeia(vProdutosC)
        /*
        para (inteiro i=0; i<T; i++) {
			escreva(vProdutos[i] +"\n")
        }
        */
	}

	funcao ordenarVetorCadeia(caracter vProdutosC[])
	{
        para (inteiro i=0; i<T; i++)
        {            
            para (inteiro j=0; j<T-1; j++)
            {
                se (vProdutosC[j] > vProdutosC[j+1])
                {
                    cadeia aux
                    caracter temp
                    
                    temp = vProdutosC[j]
                    vProdutosC[j] = vProdutosC[j+1]
                    vProdutosC[j+1] = temp
                    
                    aux = vProdutos[j]
                    vProdutos[j] = vProdutos[j+1]
                    vProdutos[j+1] = aux
                }
            }
        }
    }

	funcao obterPrimeiroCaracterVetor(cadeia v[], caracter vProdutosC[])
	{
        para (inteiro i = 0; i < T; i++)
        {
        	  // separa o primeiro caracter em caixa alta e joga no vetor
            vProdutosC[i] = t.obter_caracter(t.caixa_alta(vProdutos[i]), 0)
        }
	}

	funcao write(cadeia a, inteiro n)
	{
		para (inteiro i = 0; i <=n; i++){
			escreva (a)
		}
	}

	funcao escolherTipoExcluir()
	{
		cadeia sOpcao
		inteiro opcao = 0
		
		faca
		{
			cabecalho()
			escreva(
				"[1] Excluir todos os cadastros\n",
				"[2] Excluir cadastro por índice\n",
				"[3] Sair\n"
			)
		
			leia(sOpcao)
		
			opcao = checarValidezInteiro(sOpcao)
		
			escolha(opcao)
			{
				caso 1: excluirCadastroTodos() pare
				caso 2: excluirCadastroIndividual() pare
				caso 3: 
					limpa()
					pare
			}
			
			se (opcao != 3)
			aguarde()
			limpa()
			
		} enquanto(opcao != 3)  
	}

	funcao excluirCadastroTodos()
	{
		para (inteiro n = 0; n < T; n++)
		{
			vProdutos[n] = ""
		}
	}

	funcao excluirCadastroIndividual()
	{
		cadeia indiceStr
		inteiro indiceInt = -1

		enquanto (indiceInt < 1 e indiceInt > T)
		{
			escreva("Código do produto a ser excluído: ")
			leia(indiceStr)

			indiceInt = checarValidezInteiro(indiceStr)
		}
		se (vProdutos[indiceInt] == "") escreva("Nenhum produto encontrado para exclusão.\n")
	}









	
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 9688; 
 * @DOBRAMENTO-CODIGO = [17, 36, 49, 84, 118, 126, 158, 187, 213, 241, 257, 267, 274, 307, 322, 330, 339, 347, 361, 384, 393, 400];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {vQuantidade, 16, 9, 11};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */
programa
{
	inclua biblioteca Matematica --> M
	inclua biblioteca Texto --> T
	inclua biblioteca Util --> U

	
	
const inteiro total = 25

	real Rporcentagem, porcentagempfazer, arrumado_porcentagem, pfazer_porcentagem
	cadeia enter, busca
	cadeia data[total], equipamento[total], nome[total], problema[total]		//vetores da fila
	cadeia Rdata[total], Requipamento[total], Rnome[total], Rproblema[total]	//vetores realizados
	inteiro pfazer = 0, arrumado = 0, n, soma, max_dia = 0
	caracter opcao 
	logico encontrado = falso

	
	funcao inicio()
	{
		menu()
	}

	funcao retornar()
	{
	escreva("\n\n=============================================================\n\n")
	escreva("Pressione [ENTER] para continuar.")
	leia(enter)
	menu()
	}
	
	funcao menu()
	{
	limpa()
	escreva("=============================================================\n\n")
	escreva("			GEEKS TECH 	          	  \n\n")
	escreva("=============================================================\n")

	escreva("Opção 1 - Cadasrtar novo equipamento.\n")
	escreva("Opção 2 - Executrar manutenção.\n")
	escreva("Opção 3 - Apresentar fila dos equipamentos para atendimento.\n")
	escreva("Opção 4 - Consultar proximo equipamento a ser atendido.\n")
	escreva("Opção 5 - Buscar equipamento.\n")
	escreva("Opção 6 - Exibir status da fila.\n")
	escreva("Opção 7 - Apresentar equipamentos consertados.\n")
	escreva("Opção 8 - Buscar os equipamentos consertados.\n")
	escreva("Opção 9 - Sair do programa.\n\n")
	escreva("Insira a opção aqui: ")
	leia(opcao)

		escolha(opcao)				//Sistema de escolha:
		{
			caso '1':				
			{
				cadastro()
				pare
			}

			caso '2':
			{
				manutencao()
				pare
			}

			caso '3':
			{
				fila()
				pare
			}

			caso '4':
			{
				consultar()
				pare
			}

			caso '5':
			{
				buscar()
				pare
			}

			caso '6':
			{
				status()
				pare
			}

			caso '7':
			{
				consertados()
				pare
			}

			caso '8':
			{
				buscar_consertados()
				pare
			}

			caso '9':
			{
				sair()
				pare
			}
		}
	
	}

	funcao cadastro()
	{
		se(max_dia > 25)
		{
			limpa()
			escreva("Numero maximo de clientes atingido!")

			retornar()
		}
		senao se(max_dia < 25)
		{
		limpa()
		escreva("Insira a data do atendimento:\n")
		leia(data[pfazer])
		
		limpa()
		escreva("Insira o nome do(a) proprietario:\n")
		leia(nome[pfazer])
		nome[pfazer] = T.caixa_alta(nome[pfazer])
		
		limpa()
		escreva("Insira o nome do equipamento:\n")
		leia(equipamento[pfazer])
		equipamento[pfazer] = T.caixa_alta(equipamento[pfazer])
		
		limpa()
		escreva("Qual o problema relatado?\n")
		leia(problema[pfazer])
		problema[pfazer] = T.caixa_alta(problema[pfazer])
		
		pfazer++
		max_dia++
		
		menu()
		}
	}

	funcao manutencao()
	{
		se(pfazer <= 0)
		{
			limpa()
			escreva("Nenhum cliente cadastrado!")

			retornar()
		}
		senao se(pfazer > 0)
		{
		limpa()
		escreva("Deseja realizar o atendimento ", data[0], " - " ,equipamento[0], " - " ,nome[0], " - " ,problema[0], "?[S/N]\n\n")
		leia(opcao)
			se(opcao == 'S')
			{
				n = 0
				
				Rdata[arrumado] = data[n]
				Requipamento[arrumado] = equipamento[n]
				Rnome[arrumado] = nome[n]
				Rproblema[arrumado] = problema[n]
				arrumado++
				
				para(n = 0; n < pfazer; n++)
				{
					equipamento[n] = equipamento[n+1]
					nome[n] = nome[n+1]
					problema[n] = problema[n+1]
					data[n] = data[n+1]
					U.aguarde(500)
				}

			}
			senao
			{
				menu()
			}
		}
		pfazer--
		menu()
	}

	funcao fila()
	{
		se(pfazer <= 0)
		{
			limpa()
			escreva("Nenhum cliente cadastrado!")

			retornar()
		}
		senao se(pfazer > 0)
		{
			limpa()
			escreva("Clientes para atendimento:\n\n")
		
			para(n = 0; n < pfazer; n++)
			{
				escreva(n+1, "° Cliente - Proprietario: ", nome[n], " - Data: ", data[n], " - Equipamento: ", equipamento[n], " - Problema relatado: ", problema[n], "\n\n")
			}
		}
		retornar()
	}

	funcao consultar()
	{
		se(pfazer <= 0)
		{
			limpa()
			escreva("Nenhum cliente cadastrado!")

			retornar()
		}
		senao se(pfazer > 0)
		{
		limpa()
		escreva("O proximo da fila é: \n")
		escreva("Proprietario: ", nome[0], "\nData: ", data[0], "\nEquipamento: ", equipamento[0], "\nProblema relatado: ", problema[0], "\n\n")
		}
	retornar()
	}

	funcao buscar()
	{
		se(pfazer <= 0)
		{
			limpa()
			escreva("Nenhum cliente cadastrado!")

			retornar()
		}
		senao se(pfazer > 0)
		{
		limpa()
		escreva("Coloque o nome do equipamento que deseja procurar: \n")
		leia(busca)
		busca = T.caixa_alta(busca)
		encontrado = falso
		
		para(n = 0;n < pfazer; n++)
		{
			se(equipamento[n] == busca)
			{
				escreva("Cliente N° ", n+1, ":\nProprietario: ", nome[n], "\nData: ", data[n], "\nEquipamento: ", equipamento[n], "\nProblema relatado: ", problema[n], "\n\n")
				encontrado = verdadeiro
			}
		}
			se(encontrado == falso)
			{
				escreva("ERRO: Nenhum cliente com o nome '", busca, "' foi encontrado!\n")
			}
		}
		retornar()	
	}

	funcao status()
	{
		se(pfazer <= 0)
		{
			limpa()
			escreva("Nenhum cliente cadastrado!")

			retornar()
		}
		senao se(pfazer > 0)
		{
		escreva("Clientes para serem atendidos:\n", pfazer, "\n\nClientes já atendidos:\n", arrumado, "\n\n")
		soma = pfazer + arrumado
		arrumado_porcentagem = arrumado
		pfazer_porcentagem = pfazer
		
		Rporcentagem = arrumado_porcentagem / soma
		arrumado_porcentagem = Rporcentagem * 100
		arrumado_porcentagem = M.arredondar(arrumado_porcentagem, 2)
		
		porcentagempfazer = pfazer_porcentagem / soma
		pfazer_porcentagem = porcentagempfazer * 100
		pfazer_porcentagem = M.arredondar(pfazer_porcentagem, 2)

		escreva("Porcentagem para fazer: ", pfazer_porcentagem, "%\n")
		escreva("Porcentagem ja feitos: ", arrumado_porcentagem, "%")
	
		}
		retornar()
	}

	funcao consertados()
	{
		se(arrumado <= 0)
		{
			limpa()
			escreva("Nenhum equipamento arrumado!")

			retornar()
		}
		senao se(pfazer > 0)
		{
		limpa()
		escreva("Ja arrumados:\n\n")
		
		para(n = 0; n < arrumado; n++)
		{
			escreva(n+1, " Cliente - Proprietario: ", Rnome[n], " - Data: ", Rdata[n], " - Equipamento: ", Requipamento[n], " - Problema relatado: ", Rproblema[n], "\n\n")
		}
		}
		retornar()
	}

	funcao buscar_consertados()
	{
		se(arrumado <= 0)
		{
			limpa()
			escreva("Nenhum equipamento consertado!")

			retornar()
		}
		senao se(pfazer > 0)
		{
		limpa()
		escreva("Coloque o nome do equipamento que deseja procurar:\n")
		leia(busca)
		busca = T.caixa_alta(busca)
		encontrado = falso
		
		para(n = 0;n < pfazer; n++)
		{
			se(Requipamento[n] == busca)
			{
				escreva("Cliente N° ", n+1, ":\nProprietario: ", Rnome[n], "\nData: ", Rdata[n], "\nEquipamento: ", Requipamento[n], "\nProblema relatado: ", Rproblema[n], "\n\n")
				encontrado = verdadeiro
			}
		}
			se(encontrado == falso)
			{
				escreva("ERRO: Nenhum equipamento com o nome '", busca, "' foi encontrado!\n")
			}
		}	
		retornar()
	}

	funcao sair()
	{
		limpa()
		escreva("Saindo do sistema...")
		U.aguarde(1000)
		sair2()
	}

	funcao sair2()
	{
		
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 5698; 
 * @DOBRAMENTO-CODIGO = [18, 23, 31, 109, 146, 189, 211, 229, 293, 315, 348, 356];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {data, 12, 8, 4};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */

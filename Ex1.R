# Exercicio 1
# 1- Amostra 
base = read.csv2('apartamento.csv')
set.seed(23072003)
dados = base[sample(nrow(base), 85),]  

# 2 - Modelo de Regressão Múltipla
modelo = lm(Valor ~ Area + Idade + Energia + Local, data=dados)
summary(modelo)

# P-Valor menor que 0.05:
# Area -> 2e-16 ✔️
# Idade -> 6.33e-06 ✔️
# Local -> 0.0136 ✔️ 
# Energia -> 0.1112 ❌

# Novo modelo:
novo_modelo = lm(Valor ~ Area + Idade + Local, data=dados)
summary(modelo)

# Novos P-Valores:
# Area -> 2e-16 ✔️
# Idade -> 6.92e-06 ✔️
# Local -> 0.00469 ✔️ 

# 3 - Interpretando os coeficientes:
# Valor 26.48175: Um apartamento "sem" area, idade e local, vale aproximadamente 26.5
# Area 1.10589: A cada unidade de aumento na área o valor do apartamento sobre em 1.1, quanto maior mais caro
# Idade -1.91406: A cada unidade de idade do imovel o valor cai em 1.9, quanto mais velho mais barato
# Local -16.58924: A cada "unidade de local" o valor cai em 16.6, no local 2 é mais barato que no local 1

# 4 - Interpretando o coeficiente de determinação ajustado:
# Adjusted R-squared:  0.7994
# #proximadamente 79.94% da variação do valor da variável dependente (Valor) pode ser explicada pelas 
#variáveis independentes (Area, Idade, Local), ajustado pelo número de preditores no modelo.

# 5 - Análise dos resíduos do modelo
par(mfrow = c(2, 2))
plot(modelo)

# Grafico 1 - Residuo vs Ajustado
# Parece haver uma leve curvatura, o que pode indicar que a relação entre as variáveis não 
# é totalmente linear e o modelo pode não estar capturando perfeitamente a estrutura dos dados.

# Gráfico 2 - QQ Plot
# Os pontos parecem se desviar nos extremoss, sugerindo uma possível violação da suposição de normalidade
# dos resíduos, especialmente nas extremidades superiores.

# Gráfico 3 - Scale-Location:
# O gráfico mostra uma tendência crescente, o que sugere que os resíduos têm variância não constante, 
# aumentando conforme os valores ajustados crescem.

# Gráfico 4 - Resíduos vs Leverage
# Algumas observações, como a 52 e a 39, parecem ter alta influência, o que significa que elas podem estar impactando 
# fortemente o ajuste do modelo. A linha de "Cook's distance" sugere que esses pontos podem ser potenciais outliers.















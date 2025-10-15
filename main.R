# =====================================================
# ESTUDO SOBRE TABELA DE FREQUÊNCIA EM LINGUAGEM R
# =====================================================

# A tabela de frequência é uma das ferramentas mais básicas e 
# importantes da estatística descritiva. Ela organiza os dados de 
# forma resumida, mostrando quantas vezes cada valor 
# aparece (frequência absoluta), como essa quantidade se acumula 
# ao longo dos dados (frequência acumulada) e qual a proporção 
# percentual que cada valor representa (frequência relativa e 
# relativa acumulada).

# Tipos de frequência:
# Frequência Absoluta (f): Número de vezes que um valor aparece nos dados.
# Frequência Acumulada (F): Soma acumulada das frequências absolutas até aquele ponto.
# Frequência Relativa (f%): Percentual que representa cada valor em relação ao total de observações.
# Frequência Relativa Acumulada (F%): Soma acumulada dos percentuais até aquele valor.

# Vetor com idades.
idades <- c(18, 19, 19, 20, 22, 22, 22, 22, 23, 23, 24, 25, 25, 26, 26, 27, 27, 27)

# Frequência Absoluta (f):
freq_absoluta <- table(idades)

# Visualizar frequência absoluta.
freq_absoluta

# Frequência acumulada (F):
freq_acumulada <- cumsum(as.vector(freq_absoluta))

# Visualizar frequência acumulada.
freq_acumulada

# Frequência relativa (f%):
freq_relativa <- prop.table(freq_absoluta) * 100

# Visualizar frequência relativa.
round(freq_relativa, 2)

# Frequência relativa acumulada (F%):
freq_rel_acumulada <- cumsum(as.vector(freq_relativa))

# Visualizar frequência relativa acumulada.
round(freq_rel_acumulada, 2)

# ==============================================================

# Instalar o pacote dplyr:
# install.packages("dplyr")

# Executar o pacote dplyr:
library(dplyr)

# Criar tabela de frequência
tabela_freq <- data.frame(idades) %>%
  group_by(idades) %>%
  summarise(frequencia = n()) %>%
  mutate(
    freq_acumulada = cumsum(frequencia),
    freq_relativa = round((frequencia / sum(frequencia)) * 100, 1),
    freq_rel_Acumulada = cumsum(freq_relativa)
  )

# Visualizar tabela
tabela_freq


# Gráfico de frequência absoluta.
barplot(
  tabela_freq$frequencia,
  names.arg = tabela_freq$idades,
  main = "Gráfico de Frequência Absoluta",
  xlab = "Idades",
  ylab = "Frequência",
  col = "skyblue",
  border = "darkblue"
)



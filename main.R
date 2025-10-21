# =====================================================
# ESTUDO SOBRE TABELA DE FREQUÊNCIA EM LINGUAGEM R
# =====================================================

# A distribuição de frequência é uma das ferramentas mais básicas e 
# importantes da estatística descritiva. Ela organiza os dados de 
# forma resumida, mostrando  o número de classes(intervalo de valores), 
# o ponto médios das classes, quantas vezes cada valor aparece 
# (frequência absoluta), como essa quantidade se acumula ao longo dos dados 
# (frequência absoluta acumulada), e qual a proporção percentual 
# que cada valor representa (frequência relativa e relativa acumulada).

# Tipos de frequência:
# Frequência Absoluta (f): Número de vezes que um valor aparece nos dados.
# Frequência Acumulada (F): Soma acumulada das frequências absolutas até aquele ponto.
# Frequência Relativa (f%): Percentual que representa cada valor em relação ao total de observações.
# Frequência Relativa Acumulada (F%): Soma acumulada dos percentuais até aquele valor.

# ------------------------------------------------------------
# Vetor com idades.
# ------------------------------------------------------------

idades <- c(18, 19, 19, 20, 22, 22, 22, 22, 23, 23, 24, 25, 25, 26, 26, 27, 27, 27)

# ------------------------------------------------------------
# Número de classes(k).
# ------------------------------------------------------------

# Quantidade de elementos.
n <- length(idades)
# Número de classes.
k <- ceiling(sqrt(n))

# ------------------------------------------------------------
# Limites e amplitude.
# ------------------------------------------------------------

idade_minima <- min(idades)
idade_maxima <- max(idades)
amplitude_total <- idade_maxima - idade_minima
amplitude_total
amplitude_classe <- ceiling(amplitude_total / k)

# Criar limites das classes
limites <- seq(idade_minima, idade_maxima + amplitude_classe, by = amplitude_classe)

# ------------------------------------------------------------
# Classes e frequências.
# ------------------------------------------------------------

classes <- cut(idades, breaks = limites, right = FALSE, include.lowest = TRUE)
freq_abs <- as.numeric(table(classes))
freq_rel <- round(prop.table(freq_abs) * 100, 2)
freq_abs_acum <- cumsum(freq_abs)
freq_rel_acum <- round(cumsum(freq_rel), 2)

# Pontos médios
lim_inf <- limites[-length(limites)]
lim_sup <- limites[-1]
pontos_medios <- (lim_inf + lim_sup) / 2

# ------------------------------------------------------------
# Tabela de distribuição de frequência.
# ------------------------------------------------------------

tabela_freq <- data.frame(
  Classe = paste("[", lim_inf, "-", lim_sup, ")", sep = ""),
  Ponto_Médio = pontos_medios,
  Freq_Absoluta = freq_abs,
  Freq_Relativa = freq_rel,
  Freq_Acumulada = freq_abs_acum,
  Freq_Rel_Acumulada = freq_rel_acum
)

print(tabela_freq)

# ------------------------------------------------------------
# Histograma.
# ------------------------------------------------------------

# Histograma básico com as classes
hist(idades,
     breaks = limites,             # usa os limites definidos manualmente
     right = FALSE,                # limites esquerdos inclusivos
     col = "lightblue",            # cor das barras
     border = "gray",              # cor da borda
     main = "Histograma das Idades",
     xlab = "Idades",
     ylab = "Frequência Absoluta")

# ------------------------------------------------------------
# Histograma com curva de densidade.
# ------------------------------------------------------------

# Exibe o histograma com densidade e sobrepõe a curva
hist(idades,
     breaks = limites,
     right = FALSE,
     freq = FALSE,                 # para mostrar densidade
     col = "lightgreen",
     border = "gray",
     main = "Histograma com Curva de Densidade",
     xlab = "Idades",
     ylab = "Densidade")

# Adiciona a curva de densidade
lines(density(idades), col = "red", lwd = 2)

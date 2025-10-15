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

freq_absoluta







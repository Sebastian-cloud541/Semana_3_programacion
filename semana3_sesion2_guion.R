# =============================================================================
# GUION DE CLASE — Semana 3 · Sesión 2: Vectores y Subsetting
# Fundamentos de Programación para Análisis Económico · UdeC-EAN
#
# Nombre: [Sebastián Navarrete Poblete]      Fecha: [25-08-2026]
#
# CÓMO USAR: corre cada línea con Cmd/Ctrl+Enter.
#   🔵 CORRE Y OBSERVA · ✏️ COMPLETA (____) · 🔮 PREDICE · 🟢 TU TURNO · ✅ Deberías ver
# =============================================================================


# -----------------------------------------------------------------------------
# BLOQUE A — Crear vectores
# -----------------------------------------------------------------------------
# c() = COMBINAR valores en un vector. La función más usada de R.

# 🔵 CORRE Y OBSERVA
ingresos <- c(450000, 920000, 380000, 510000, 280000)
ingresos
length(ingresos)        # cuántos elementos tiene

# ✅ Deberías ver: el vector y luego 5
# 💡 Todos los elementos comparten UN solo tipo (S3S1). Si mezclas, R coerciona.

## seq() y rep() — generar secuencias -----------------------------------------
# 🔵 CORRE Y OBSERVA
seq(2015, 2022)# secuencia de años, de 1 en 1
seq(10000,100000)

seq(0, 1, by = 0.1)        # de 0 a 1 en pasos de 0,25 (ej: tramos)
rep("Ñuble", 3)             # repetir un valor

# ✏️ COMPLETA: crea la secuencia de años 2000, 2002, ..., 2010 (pista: by = 2).
seq(2000, 2010, by = 2)

# 🟢 TU TURNO: con el atajo `:` crea el vector de años 2018 a 2026.
seq(2018,2026)

#HACER TABLA CON REGIONES Y AÑOS EN FORMA DE TABLA CON LOS COMANDOS APRENDIDOS:

rep(c("ñuble","maule"),3))

region <- 
año <- 

# -----------------------------------------------------------------------------
# BLOQUE B — Indexación (subsetting)
# -----------------------------------------------------------------------------
# El corchete [ ] extrae elementos por POSICIÓN (en R se cuenta desde 1).

# 🔵 CORRE Y OBSERVA

ingresos[1]                    # el primer elemento
ingresos[c(1, 3, 5)]           # primero, tercero y quinto
ingresos[-2]                   # TODOS menos el segundo (índice negativo)
length(ingresos)
# 🟢 TU TURNO: extrae los dos ÚLTIMOS ingresos del vector (posiciones 4 y 5).

ingresos[c(4,5)]
ingresos <- ingresos[-length(ingresos)]
print(ingresos)


## Seleccionar por CONDICIÓN: el subsetting lógico ----------------------------
# La forma más potente: quedarse con los elementos que cumplen una condición.
# 🔵 CORRE Y OBSERVA
ingresos > 400000              # vector lógico: TRUE/FALSE por elemento

# 🔮 PREDICE: ¿qué elementos quedan en la siguiente línea?
ingresos[ingresos > 400000]    # se queda solo con los TRUE

# 💡 Dentro del [ ] va un vector lógico (S3S1). Es la base de filter() (S5).

## Contar y resumir con condiciones -------------------------------------------
# 🔮 PREDICE: sum(...) ->     mean(...) ->
sum(ingresos > 400000)         # CUÁNTOS superan 400.000
mean(ingresos > 400000)        # qué PROPORCIÓN los supera
mean(ingresos[ingresos > 400000])   # promedio SOLO de los que superan
mean(ingresos)

# ✅ Deberías ver: 3 ... 0.6 ... 626666.7 (aprox.)
# 💡 sum()/mean() de una condición = contar y proporciones. Patrón clave del curso.


# -----------------------------------------------------------------------------
# BLOQUE C — Operaciones vectorizadas
# -----------------------------------------------------------------------------
# R aplica la operación a TODOS los elementos sin escribir un bucle.

# 🔵 CORRE Y OBSERVA
ingresos / 1000                # todos divididos por 1000, de una vez
ingresos * 1.10                # un aumento de 10% a todos

# ✏️ COMPLETA: aplica un IVA del 19% (multiplica todo el vector por 1.19).
ingresos * ____

## Operar dos vectores: elemento a elemento -----------------------------------
# 🔵 CORRE Y OBSERVA
salario_nominal <- c(450000, 920000, 380000)
ipc             <- c(1.000,  1.043,  1.087, 1.0)
salario_nominal / ipc          # cada salario por su propio IPC

# 💡 Mismo largo -> R opera POSICIÓN con posición (1º con 1º, 2º con 2º...).


# -----------------------------------------------------------------------------
# BLOQUE D — Ejemplo: salarios reales (junta toda la sesión)
# -----------------------------------------------------------------------------
# 🔵 CORRE Y OBSERVA
salario <- c(450000, 470000, 500000, 540000)
ipc     <- c(1.000,  1.043,  1.087,  1.135)
anios   <- 2020:2023

salario_real <- salario / ipc      # descuenta el efecto de la inflación
round(salario_real)
print(salario_real)
# 🔮 PREDICE: ¿en qué años el salario real superó los 460.000?
anios[salario_real > 460000]

# ✅ Deberías ver: 2023  (ojo: 2022 da 459982, queda JUSTO bajo el umbral)
#    El real corrige por inflación; el nominal engaña.

# 🟢 TU TURNO: ¿en qué años el salario real fue MENOR a 450.000? (usa < )
anios[salario_real < 450000]


# -----------------------------------------------------------------------------
# CIERRE — crear c()/seq()/rep() · seleccionar [ ] · condición v[v>x] ·
#          contar sum()/mean() · vectorizar.
# Puente Semana 4: un vector es UNA columna; varios juntos = un data frame.
# A1 (formativa, sin nota): script con vectores creados, manipulados y documentados.
# =============================================================================

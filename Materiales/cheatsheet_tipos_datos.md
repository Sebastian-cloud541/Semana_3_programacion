# Cheatsheet — Tipos de datos en R
### Semana 3 · Fundamentos de Programación para Análisis Económico · UdeC-EAN

> **Regla de oro:** el tipo decide qué puedes hacer. **Verifica antes de calcular.**

---

## Los 5 tipos fundamentales

| Tipo | Qué guarda | Cómo se crea | Ejemplo económico |
|---|---|---|---|
| `numeric` | números (con/sin decimales) | `x <- 850000` | salario, PIB, tasa |
| `character` | texto (entre comillas) | `r <- "Ñuble"` | región, sector, glosa |
| `logical` | `TRUE` / `FALSE` | `p <- ingreso < 216000` | ¿bajo línea de pobreza? |
| `factor` | categorías (con orden opcional) | `factor(x, levels=..., ordered=TRUE)` | nivel educativo |
| `Date` | fechas (días desde 1970-01-01) | `as.Date("2026-03-31")` | mes del IMACEC |

---

## Verificar el tipo (hazlo SIEMPRE primero)

```r
class(x)        # tipo de alto nivel  -> "numeric"   (lo que normalmente importa)
typeof(x)       # representación interna -> "double"  (cuando algo no cuadra)
is.numeric(x)   # pregunta sí/no -> TRUE             (ideal para chequeos)
str(x)          # resumen compacto del objeto
```

`is.*()` para cada tipo: `is.character()`, `is.logical()`, `is.factor()`,
y para fechas `inherits(x, "Date")`.

---

## Convertir entre tipos: `as.*()`

```r
as.numeric("480609")            # texto  -> número
as.character(2026)              # número -> texto
as.logical(c(1, 0))             # 1/0    -> TRUE/FALSE
as.factor(c("a", "b", "a"))     # texto  -> categoría
as.Date("2026-03-31")           # texto  -> fecha (formato "AAAA-MM-DD")
```

⚠️ **Cuidado al convertir texto a número:**

```r
as.numeric(c("12", "x", "30"))  # 12 NA 30   -> "x" se vuelve NA (+ warning)
as.numeric("90.000")            # 90 (¡NO 90000!) -> el "." se lee como DECIMAL
```

> Error silencioso típico de encuestas: separadores de miles (`.`), símbolos (`$`),
> códigos de "no responde" (`s/i`, `99`). **Limpia el texto antes de convertir.**

---

## Coerción automática (R convierte solo, sin avisar)

Jerarquía: `logical → numeric → character`. En un vector **todo comparte un tipo**.

```r
c(1, 2, "tres")    # "1" "2" "tres"  -> TODO se vuelve character
c(TRUE, 5, 10)     # 1 5 10          -> TRUE se vuelve numeric
```

> Por eso **una sola celda de texto vuelve TODA la columna texto** (y `mean()` falla).

---

## El patrón más útil: contar con `logical`

`TRUE` vale 1 y `FALSE` vale 0 → `sum()` cuenta, `mean()` da proporciones.

```r
ingreso <- c(120000, 480000, 350000, 90000)
sum(ingreso < 216000)    # 2    -> cuántos bajo la línea de pobreza
mean(ingreso < 216000)   # 0.5  -> tasa de pobreza (50%)
```

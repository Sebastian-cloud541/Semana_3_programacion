## Tarea 1 semana 3.
# Aprender a modificar vectores y manipulacion de datos
# autor: Sebastián Navarrete
# fecha: 27-08-2026 
# Que hace: Manipular datos economicos de salarios de trabajadores de forma coherente
# y lograr hacer un analisis entendible con conclusiones debatibles.
# - - - - - - - - - - - - - - - - - - - -- -  -- - - - - - - - - - -- - - - - - - -- 

salario <- c(450000 , 500000, 850000, 1000000)
mean(salario)
educ <- factor(c("media","tecnico","superior","basica")
               ,levels = c("basica", "media","tecnico","superior"),
                ordered = TRUE )
gastos <- c(200000, 475000, 300000, 900000)

class(educ)    #Los datos de educacion son un factor ordenado no numerico
class(salario)    # Estos serian los salarios de un grupo de trabajores    
class(gastos)    # Cantidad que gastan los trabajadores 

length(salario) 
length(educ)   
length(gastos) 

salario[3] # Salario del trabajador N*3
salario[-1] # salario de todos menos el primer trabajador 
gastos[c(1,2)] # Gastos del primer y segundo trabajador

sum(salario > 600000)   # los salarios que sean superior a 600000
mean(salario - gastos)  # promedio de salarios - el gasto
sum( gastos)            # Cuantos gastan en total los trabajadores  

ahorro <- (salario - gastos)   # Con esto creamos el vector de ahorro de trabajadores
ahorro[3]     # El ahorro del tercer trabajador
mean(ahorro)    
median(ahorro) 
sd(ahorro)     
quantile(gastos) 

## Estos datos muestran que el grupo de trabajadores ahorra en un promedio de 231250
## De esta manera se busca conocer el ahorro de cada trabajador

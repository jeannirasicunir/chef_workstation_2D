# Códido Chef Workstation Equipo 2D
Repositorio del proyecto de Chef Workstation del equipo 2D. En el proyecto de Chef que se muestra a continuación, se utilizaron los siguientes comandos: 

## Crear el repositorio de Chef
> chef generate repo proyecto_grupal

## Crear el cookbook 
> chef generate cookbook cookbooks/proyecto

## Crear las recetas 
### Primera receta
> chef generate recipe cookbooks/proyecto jeannirasic

### Segunda receta
> chef generate recipe cookbooks/proyecto ernestoflores

### Tercera receta
> chef generate recipe cookbooks/proyecto sergiocalalpa

## Correr las recetas
### Primera receta
> chef-client --local-mode --runlist 'recipe[proyecto::jeannirasic]' 

### Segunda receta
> chef-client --local-mode --runlist 'recipe[proyecto::ernestoflores]' 

### Tercera receta
> chef-client --local-mode --runlist 'recipe[proyecto::sergiocalalpa]' 
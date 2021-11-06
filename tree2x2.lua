local spruceLog = "minecraft:spruce_log"
local sapling = "minecraft:spruce_sapling"
local spruceLeaves = "minecraft:spruce_leaves"
local dirt = "minecraft:podzol"

local energiaPorBloco = 15

local function turnRight(numero)
	local numero = numero or 1
	for i = 1, numero do
		turtle.turnRight()
	end
end

local function turnLeft(numero)
	local numero = numero or 1
	for i = 1, numero do
		turtle.turnLeft()
	end
end

local function forward(numero)
	local numero = numero or 1
	for i = 1, numero do
		turtle.forward()
	end
end

local function back(numero)
	local numero = numero or 1
	for i = 1, numero do
		turtle.back()
	end
end

-------------------------------------------------

         ---CORTAR EMCIMA---

function digUp()
	repeat
		madeira, info = turtle.inspect()
        if info.name == spruceLog then
			turtle.dig()
			turtle.digUp()
            turtle.up()
        end
    until info.name ~= spruceLog
end

-------------------------------------------------

         ---NAO SELECIONAR---

function naoSelecionar(name)
    for i=1, 16 do
        local info = turtle.getItemDetail(i)
        if info and info.name ~= name then
            turtle.select(i)
			return true
        end
    end
	return false
end

-------------------------------------------------

         ---SE VIRAR---
		 
function turnAround()
	turtle.turnLeft()
	turtle.turnLeft()
end
-------------------------------------------------

         ---GUARDAR---
		 
function guardar()
	turnAround()
	while naoSelecionar(sapling) do
		turtle.drop()
	end
	turnAround()
end

-------------------------------------------------

         ---CORTAR EMBAIXO---

function digDown()
	repeat
        madeira, info = turtle.inspectDown()
        if info and info.name ~= dirt then
			turtle.dig()
            turtle.digDown()
            turtle.down()
        end
	until info.name == dirt
end



------------------------------------------------
local function selectItem(name)
	for i = 1, 16 do
		local info = turtle.getItemDetail(i)
		if info and info.name == name then
			turtle.select(i)
			return true
		end
	end
	return false
end


-------------------------------------------------

		---REABASTECER---

function refuel(reabastecer)
	local blocosComer = math.ceil(reabastecer / energiaPorBloco)
	selectItem(spruceLog)
	turtle.refuel(blocosComer)
end


-------------------------------------------------

         ---SELECIONAR E COLOCAR SAPLING---

local function colocar()
	selectItem(sapling)
	turtle.place()
	turnLeft()
	back()		
	turtle.place()
	turnRight()
	turtle.place()
	back()
	turtle.place() 
	back() 
end

-------------------------------------------------

         ---DETECTAR ARVORE---


function detectarArvore()
	local madeira, info = turtle.inspect()
    if madeira and info.name == spruceLog then
        return true
    end
	return false
end

-------------------------------------------------

         ---CORTAR ARVORE---

function cortar()
		turtle.dig()
		forward()
        digUp()
		turtle.turnLeft()
		turtle.dig()
		turtle.forward()
		turtle.turnRight()
		digDown()
		turtle.dig()
end

-------------------------------------------------

         ---INICIAR ACOES---

while true do
	turtle.suckDown()
	local energiaInicial = turtle.getFuelLevel()
	if detectarArvore() == true then
		cortar()
		colocar()
		refuel(energiaInicial - turtle.getFuelLevel())
		guardar()
	end
end
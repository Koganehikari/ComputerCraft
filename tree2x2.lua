spruceLog = "minecraft:spruce_log"
sapling = "minecraft:spruce_sapling"
spruceLeaves = "minecraft:spruce_leaves"
local dirt = "minecraft:podzol"

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

function naoSelecionar()
    for i=1, 16 do
        local info = turtle.getItemDetail(i)
        if not info or info.name ~= sapling then
            turtle.select(i)
            break
        end
    end
    return true
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
	naoSelecionar()
	turtle.drop()
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

-------------------------------------------------

		---REABASTECER---

function refuel()
	for f = 1, 16 do
	local info = turtle.getItemDetail(f)
		if info and info.name == spruceLog then
			turtle.select(f)
			turtle.refuel(5)
		end
	end
end


-------------------------------------------------

         ---SELECIONAR E COLOCAR SAPLING---

function selecionarColocar(sapling)
	for s = 1, 16 do
	local info = turtle.getItemDetail(s)
		if info and info.name == sapling then
			turtle.select(s)
			turtle.place()
			turtle.turnLeft()
			turtle.forward()
			turtle.turnRight()
			turtle.place()
			turtle.turnRight()
			turtle.place()
			turtle.turnLeft()
			turtle.back()
			turtle.place()
			turtle.turnRight()
			turtle.forward()
			turtle.forward()
			turtle.forward()
			turtle.turnLeft()
			turtle.forward()
			turtle.turnLeft()			
		end
	end
end

-------------------------------------------------

local function seMover()
	turnRight()
	forward()
	turnLeft()
	forward()
end

         ---DETECTAR ARVORE---


function detectarArvore()
	local leaves, info = turtle.inspect()
    if info and info.state.distance == 1 then
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
	if detectarArvore() == true then
		seMover()
		cortar()
		--selecionarColocar(sapling)
		--refuel()
		--guardar()
	end
end
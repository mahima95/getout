-- [Game Background]

local gameBg = display.newImage('cdr/bg.png')
gameBg.x=display.stageWidth/2
gameBg.y=display.stageHeight/2
-- [Words List Textfield]

local wordsList
local currentWords

-- [Letter Texfields Container]

local tfs = display.newGroup()

-- [Selection Line]

local line
local lines = display.newGroup()

-- [Alert]

local alert

-- List of words to find
local L1 = {'AXE', 'GUN', 'EGG'}
-- Multi-dimensional table, this is used as a 'map' to display the words in the stage
local L1Map = {{'E', 'X', 'A'},
               {'G', 0, 0},
               {'G', 'U', 'N'}}

local alphabet = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'}
local correct = 0 -- Number of found words




local gameListeners = {}
local buildSoup = {}
local startDraw = {}
local hitTestObjects = {}
local detectLetters = {}



function Main()
buildSoup()
   gameListeners('add')
end


function gameListeners(action)

    if(action == 'add') then
        gameBg:addEventListener('touch', startDraw)
        gameBg:addEventListener('touch', detectLetters)
    else
        gameBg:removeEventListener('touch', startDraw)
        gameBg:removeEventListener('touch', detectLetters)
    end
end

function buildSoup()
    for i = 1, 3 do
        for j = 1, 3 do
           
            local tf = display.newText('', 50, 50, 'Arial', 25)
             tf.rotation=90
            tf:setTextColor(102, 102, 102)
            tf.width = 50
            tf.height = 50
            tf.x = math.floor(display.stageWidth/2 -100 + (50 * i))
            tf.y = math.floor(display.stageHeight/2 -100+ (50 * j))

            -- Change 0's to Random Letters

            if(L1Map[j][i] == 0) then
                L1Map[j][i] = alphabet[math.floor(math.random() * table.maxn(alphabet))+1]
            end

            tf.text = L1Map[j][i]
            tfs:insert(tf)
        end
    end

    -- Add Words List

    local wordsString = ''

    for i = 1, #L1 do
        wordsString = wordsString .. ' ' .. L1[i]
    end

    wordsList = display.newText(wordsString, display.stageWidth/2,display.stageHeight/2+100 , 'Arial', 14)
    wordsList:setTextColor(238, 238, 238)

    currentWords = display.newText('', display.stageWidth/2,display.stageHeight/2+100, 'Arial', 14)
    currentWords:setTextColor(238, 146, 63)
end

function startDraw:touch(e)
    if(e.phase == 'began') then
        initX = e.x
        initY = e.y
    elseif(e.phase == 'ended') then
        line = display.newLine(initX, initY, e.x, e.y)
        line.width = 16
        line:setColor(255, 142, 42, 0.5)
        lines:insert(line)
    end
end


-- by jhocking
function hitTestObjects(obj1, obj2)
        local left = obj1.contentBounds.xMin <= obj2.contentBounds.xMin and obj1.contentBounds.xMax >= obj2.contentBounds.xMin
        local right = obj1.contentBounds.xMin >= obj2.contentBounds.xMin and obj1.contentBounds.xMin <= obj2.contentBounds.xMax
        local up = obj1.contentBounds.yMin <= obj2.contentBounds.yMin and obj1.contentBounds.yMax >= obj2.contentBounds.yMin
        local down = obj1.contentBounds.yMin >= obj2.contentBounds.yMin and obj1.contentBounds.yMin <= obj2.contentBounds.yMax
        return (left or right) and (up or down)
end

function detectLetters:touch(e)
    -- Code...


-- Get selected letters

    local selectedWord = ''

    for i = 1, tfs.numChildren do
        if(hitTestObjects(lines[lines.numChildren], tfs[i])) then
            selectedWord = selectedWord .. tfs[i].text
        end
    end

    -- Check if word is on list

        for j = 0, 3 do
            if(selectedWord == L1[j]) then

                currentWords.text = currentWords.text .. ' ' .. selectedWord
                currentWords:setReferencePoint(display.TopLeftReferencePoint)
                currentWords.x = 3
                correct = correct + 1
            end
        end

if(current==3) then
print(current)
end
end
Main()

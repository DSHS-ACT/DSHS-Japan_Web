local http = require("http")
local fs = require("fs")

local script_path = debug.getinfo(1).source:sub(2):match("(.*[/\\])") --상대 경로 확인하는 코드
local pages_path = script_path .. "pages/" --pages 폴더에서 html 가져옴
local fonts_path = pages_path .. "fonts/" --fonts 폴더에서 폰트 가져옴

local function processfiles(file_path, req, res)
    fs.readFile(file_path, function (err, data)
        if err then
            res:setHeader("Content-Type", "text/plain")
            res:setHeader("Status", "500 Internal Server Error")
            res:finish("Error: " .. err .. "\n")
        else
            res:setHeader("Content-Type", "text/html")
            res:setHeader("Status", "200 OK")
            res:finish(data)
        end
    end)
end

local server = http.createServer(function (req, res)
    if req.url == "/BMDOHYEON.ttf" then
        processfiles(fonts_path .. "BMDOHYEON.ttf", req, res)

    elseif req.url == "/" then
        processfiles(pages_path .. "index.html", req, res) --pages.path.."파일명"으로 경로 지정
    elseif req.url == "/index.html" then
        processfiles(pages_path .. "index.html", req, res)
    elseif req.url == "/Schedule.html" then
        processfiles(pages_path .. "Schedule.html", req, res)
    elseif req.url == "/Restaurant.html" then
        processfiles(pages_path .. "Restaurant.html", req, res)
    elseif req.url == "/Anime.html" then
        processfiles(pages_path .. "Anime.html", req, res)
    elseif req.url == "/Channel.html" then
        processfiles(pages_path .. "Channel.html", req, res)
    elseif req.url == "/Dotonbori.html" then
        processfiles(pages_path .. "Dotonbori.html", req, res)
    elseif req.url == "/House.html" then
        processfiles(pages_path .. "House.html", req, res)
    elseif req.url == "/Place.html" then
        processfiles(pages_path .. "Place.html", req, res)
    elseif req.url == "/Politics.html" then
        processfiles(pages_path .. "Politics.html", req, res)
    elseif req.url == "/Sports.html" then
        processfiles(pages_path .. "Sports.html", req, res)
    elseif req.url == "/USJ.html" then
        processfiles(pages_path .. "USJ.html", req, res)
    elseif req.url == "/Voca.html" then
        processfiles(pages_path .. "Voca.html", req, res)
    elseif req.url == "/Kaiyukan.html" then
        processfiles(pages_path .. "Kaiyukan.html", req, res)
    elseif req.url == "/Need.html" then
        processfiles(pages_path .. "Need.html", req, res)
    elseif req.url == "/OsakaCastle.html" then
        processfiles(pages_path .. "OsakaCastle.html", req, res)
    elseif req.url == "/Safety.html" then
        processfiles(pages_path .. "Safety.html", req, res)
    elseif req.url == "/Todaiji.html" then
        processfiles(pages_path .. "Todaiji.html", req, res)
    elseif req.url == "/Analogue.html" then
        processfiles(pages_path .. "Analogue.html", req, res)
    else
        res:setHeader("Content-Type", "text/plain")
        res:setHeader("Status", "404 Not Found")
        res:finish("Error: Page not found\n")
    end
end)

server:listen(8080, "0.0.0.0", function ()
    print("Server listening at http://0.0.0.0:8080/\nServer listening at http://localhost:8080/")
    --At desktop, use this link http://121.153.4.209:8080/
end)

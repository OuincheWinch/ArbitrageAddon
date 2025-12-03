-- VERSION: 0.9.9
-- AUTHOR: Ouinche
-- CONTACT, insults, donations : ouinche@gmail.com
-- Link : https://github.com/OuincheWinch/ArbitrageAddon/

local ADDON_NAME = "ArbitrageAddon"
local VERSION = "0.9.9"

-- ===============================================
-- I. LOCALIZATION (i18n) SETUP
-- ===============================================
local L = {}
local L_enGB = {
    ADDON_TITLE = "Arbitrage: The Great Migration v" .. VERSION,
    READY_FIRST = "Select Target First", READY = "Ready!",
    LAST_SCAN = "Last Scan:", NEVER = "Never",
    WARNING_DESYNC = "Warning: Scans are desynced (>30m gap)!",
    SCANNING = "SCANNING: %d%% (%d/%d) ~%d/s",
    SCAN_STARTED = "SCAN STARTED...", FINALIZING = "Finalizing...",
    SAVE_SCAN = "Arbitrage: Saved %s (%d items in %.1fs)",
    WAIT_SCAN = "|cffff0000Wait for scan!|r",
    ALL_RESOLVED = "Arbitrage: All items resolved!",
    RESOLVING_UNKNOWN = "Arbitrage: Resolving visible items...",
    COULD_NOT_RESOLVE = "Arbitrage: %d items could not be resolved",
    BTN_SET_ERA = "Set Target: ERA", BTN_SET_ANNIV = "Set Target: ANNIV",
    TARGET_SET = "Target: %s |cffff8800(Waiting...)|r",
    BTN_REFRESH = "Refresh List", BTN_CLEANUP = "Remove Duplicates",
    BTN_RESET = "Reset Data", BTN_RESET_BL = "Clear List",
    BTN_BLACKLIST = "Ignored Items", BTN_BACK = "Back to List",
    REMOVED_DUPS = "Removed %d duplicates",
    BLACKLIST_MODE = "|cffff0000[IGNORED ITEMS MODE]|r Right-Click to restore.",
    HEADER_FAV = "Fav", HEADER_NAME = "Item Name", HEADER_LIQ = "Liq.(ERA)",
    HEADER_ERA = "Era Price", HEADER_ANNIV = "Anniv Price", HEADER_PROFIT = "Profit",
    HEADER_PERCENT = "Profit %", FILTER_SEARCH = "Search:",
    FILTER_MIN_P = "Min %:", FILTER_MIN_G = "Min Gold:", FILTER_MIN_Q = "Min Quality:",
    CHK_HIDE_MISSING = "Hide Missing", CHK_ONLY_FAVS = "Only Favs",
    TOOLTIP_TITLE = "Arbitrage Data:", TOOLTIP_ERA_PRICE = "Era Price:",
    TOOLTIP_ANNIV_PRICE = "Anniv Price:", TOOLTIP_NOT_SEEN = "Not Seen",
    TOOLTIP_LIQUIDITY = "Era Liquidity:", TOOLTIP_PROFIT = "Potential Profit:",
    TOOLTIP_HISTORY = "--- Previous Scan ---", TOOLTIP_ERA_OLD = "Era (Old):",
    TOOLTIP_ANNIV_OLD = "Anniv (Old):", TOOLTIP_SHIFT_CLICK = "Shift+Click: Link to chat",
    TOOLTIP_ALT_RCLICK = "Alt+Right Click: Blacklist", TOOLTIP_RESTORE = "Right Click: Remove from Ignored List",
    POPUP_TITLE = "Reset ALL scan data?", POPUP_TEXT = "This will delete ERA and ANNIV scans!\n\nFavorites and Blacklist will be kept.",
    POPUP_BUTTON1 = "Yes, Reset", POPUP_BUTTON2 = "Cancel", RESET_DONE = "Arbitrage: All scan data reset! Rescan both servers now.",
    POPUP_BL_TITLE = "Clear Ignored Items List?", POPUP_BL_TEXT = "This will restore ALL ignored items to the main list.\n\nScan data will NOT be deleted.",
    RESET_BL_DONE = "Arbitrage: Ignored items list cleared.",
    CONTACT_TEXT = "|cffaaaaaaWant to Bug report? or yell at me ?|r |cff00ccffouinche@gmail.com|r"
}

local L_frFR = {
    ADDON_TITLE = "Arbitrage: La Grande Migration v" .. VERSION,
    READY_FIRST = "Choisir la Cible d'abord", READY = "Prêt !",
    LAST_SCAN = "Dernier Scan:", NEVER = "Jamais",
    WARNING_DESYNC = "Attention : Scans désynchronisés (>30m d'écart)!",
    SCANNING = "SCAN EN COURS : %d%% (%d/%d) ~%d/s",
    SCAN_STARTED = "SCAN DÉMARRÉ...", FINALIZING = "Finalisation...",
    SAVE_SCAN = "Arbitrage : %s sauvegardé (%d objets en %.1fs)",
    WAIT_SCAN = "|cffff0000Attendez le scan !|r",
    ALL_RESOLVED = "Arbitrage : Tous les objets résolus !",
    RESOLVING_UNKNOWN = "Arbitrage : Résolution des objets visibles...",
    COULD_NOT_RESOLVE = "Arbitrage : %d objets n'ont pu être résolus",
    BTN_SET_ERA = "Définir Cible: ERA", BTN_SET_ANNIV = "Définir Cible: ANNIV",
    TARGET_SET = "Cible : %s |cffff8800(Attente...)|r",
    BTN_REFRESH = "Rafraîchir Liste", BTN_CLEANUP = "Supprimer Doublons",
    BTN_RESET = "Réinitialiser Données", BTN_RESET_BL = "Vider Liste",
    BTN_BLACKLIST = "Objets Ignorés", BTN_BACK = "Retour Liste",
    REMOVED_DUPS = "%d doublons supprimés",
    BLACKLIST_MODE = "|cffff0000[MODE OBJETS IGNORÉS]|r Clic-Droit pour restaurer.",
    HEADER_FAV = "Fav", HEADER_NAME = "Nom d'Objet", HEADER_LIQ = "Liq.(ERA)",
    HEADER_ERA = "Prix Era", HEADER_ANNIV = "Prix Anniv", HEADER_PROFIT = "Profit",
    HEADER_PERCENT = "Profit %", FILTER_SEARCH = "Recherche:",
    FILTER_MIN_P = "Min %:", FILTER_MIN_G = "Min Or:", FILTER_MIN_Q = "Qualité Min:",
    CHK_HIDE_MISSING = "Cacher Manquants", CHK_ONLY_FAVS = "Favoris Seulement",
    TOOLTIP_TITLE = "Données d'Arbitrage:", TOOLTIP_ERA_PRICE = "Prix Era:",
    TOOLTIP_ANNIV_PRICE = "Prix Anniv:", TOOLTIP_NOT_SEEN = "Non Vu",
    TOOLTIP_LIQUIDITY = "Liquidité Era:", TOOLTIP_PROFIT = "Profit Potentiel:",
    TOOLTIP_HISTORY = "--- Scan Précédent ---", TOOLTIP_ERA_OLD = "Era (Ancien):",
    TOOLTIP_ANNIV_OLD = "Anniv (Ancien):", TOOLTIP_SHIFT_CLICK = "Maj+Clic : Lier au chat",
    TOOLTIP_ALT_RCLICK = "Alt+Clic Droit : Liste Noire", TOOLTIP_RESTORE = "Clic Droit : Retirer de la liste noire",
    POPUP_TITLE = "Réinitialiser TOUTES les données de scan ?", POPUP_TEXT = "Ceci supprimera les scans ERA et ANNIV !\n\nLes Favoris et la Liste Noire seront conservés.",
    POPUP_BUTTON1 = "Oui, Réinitialiser", POPUP_BUTTON2 = "Annuler",
    RESET_DONE = "Arbitrage : Toutes les données de scan réinitialisées ! Scanner les deux serveurs maintenant.",
    POPUP_BL_TITLE = "Vider la liste des ignorés ?", POPUP_BL_TEXT = "Ceci restaurera TOUS les objets ignorés dans la liste principale.\n\nLes données de scan NE SERONT PAS effacées.",
    RESET_BL_DONE = "Arbitrage : Liste des objets ignorés vidée.",
    CONTACT_TEXT = "|cffaaaaaaUn Bug ? Énervé ?|r |cff00ccffouinche@gmail.com|r"
}

local L_deDE = {
    ADDON_TITLE = "Arbitrage: Die Große Migration v" .. VERSION,
    READY_FIRST = "Ziel zuerst wählen", READY = "Bereit!",
    LAST_SCAN = "Letzter Scan:", NEVER = "Nie",
    WARNING_DESYNC = "Warnung: Scans sind desynchronisiert (>30 Min. Differenz)!",
    SCANNING = "SCANNEN: %d%% (%d/%d) ~%d/s",
    SCAN_STARTED = "SCAN GESTARTET...", FINALIZING = "Finalisiere...",
    SAVE_SCAN = "Arbitrage: %s gespeichert (%d Gegenstände in %.1fs)",
    WAIT_SCAN = "|cffff0000Auf Scan warten!|r",
    ALL_RESOLVED = "Arbitrage: Alle Gegenstände aufgelöst!",
    RESOLVING_UNKNOWN = "Arbitrage: Löse sichtbare Gegenstände auf...",
    COULD_NOT_RESOLVE = "Arbitrage: %d Gegenstände konnten nicht aufgelöst werden",
    BTN_SET_ERA = "Ziel festlegen: ERA", BTN_SET_ANNIV = "Ziel festlegen: ANNIV",
    TARGET_SET = "Ziel: %s |cffff8800(Warte...)|r",
    BTN_REFRESH = "Liste aktualisieren", BTN_CLEANUP = "Duplikate entfernen",
    BTN_RESET = "Daten zurücksetzen", BTN_RESET_BL = "Liste leeren",
    BTN_BLACKLIST = "Ignorierte Items", BTN_BACK = "Zurück",
    REMOVED_DUPS = "%d Duplikate entfernt",
    BLACKLIST_MODE = "|cffff0000[IGNORIERTE ITEMS]|r Rechtsklick zum Wiederherstellen.",
    HEADER_FAV = "Fav", HEADER_NAME = "Gegenstandsname", HEADER_LIQ = "Liq.(ERA)",
    HEADER_ERA = "Era-Preis", HEADER_ANNIV = "Anniv Preis", HEADER_PROFIT = "Gewinn",
    HEADER_PERCENT = "Gewinn %", FILTER_SEARCH = "Suche:",
    FILTER_MIN_P = "Min %:", FILTER_MIN_G = "Min Gold:", FILTER_MIN_Q = "Min Qualität:",
    CHK_HIDE_MISSING = "Fehlende ausblenden", CHK_ONLY_FAVS = "Nur Favoriten",
    TOOLTIP_TITLE = "Arbitrage-Daten:", TOOLTIP_ERA_PRICE = "Era-Preis:",
    TOOLTIP_ANNIV_PRICE = "Anniv Preis:", TOOLTIP_NOT_SEEN = "Nicht Gesehen",
    TOOLTIP_LIQUIDITY = "Era-Liquidität:", TOOLTIP_PROFIT = "Potenzieller Gewinn:",
    TOOLTIP_HISTORY = "--- Vorheriger Scan ---", TOOLTIP_ERA_OLD = "Era (Alt):",
    TOOLTIP_ANNIV_OLD = "Anniv (Alt):", TOOLTIP_SHIFT_CLICK = "Umschalt+Klick: In Chat verknüpfen",
    TOOLTIP_ALT_RCLICK = "Alt+Rechtsklick: Blacklist", TOOLTIP_RESTORE = "Rechtsklick: Von Liste entfernen",
    POPUP_TITLE = "ALLE Scan-Daten zurücksetzen?", POPUP_TEXT = "Dies löscht ERA- und ANNIV-Scans!\n\nFavoriten und Blacklist bleiben erhalten.",
    POPUP_BUTTON1 = "Ja, zurücksetzen", POPUP_BUTTON2 = "Abbrechen",
    RESET_DONE = "Arbitrage: Alle Scan-Daten zurückgesetzt! Beide Server jetzt neu scannen.",
    POPUP_BL_TITLE = "Ignorierte Liste leeren?", POPUP_BL_TEXT = "Dies stellt ALLE ignorierten Gegenstände wieder her.\n\nScan-Daten werden NICHT gelöscht.",
    RESET_BL_DONE = "Arbitrage: Liste der ignorierten Gegenstände geleert.",
    CONTACT_TEXT = "|cffaaaaaaBug melden? Oder mich anschreien?|r |cff00ccffouinche@gmail.com|r"
}

local L_esES = {
    ADDON_TITLE = "Arbitraje: La Gran Migración v" .. VERSION,
    READY_FIRST = "Seleccionar Objetivo primero", READY = "¡Listo!",
    LAST_SCAN = "Último Escaneo:", NEVER = "Nunca",
    WARNING_DESYNC = "Advertencia: ¡Escaneos desincronizados (>30m)!",
    SCANNING = "ESCANEANDO: %d%% (%d/%d) ~%d/s",
    SCAN_STARTED = "ESCANEO INICIADO...", FINALIZING = "Finalizando...",
    SAVE_SCAN = "Arbitraje: %s guardado (%d objetos en %.1fs)",
    WAIT_SCAN = "|cffff0000¡Espera el escaneo!|r",
    ALL_RESOLVED = "Arbitraje: ¡Todos los objetos resueltos!",
    RESOLVING_UNKNOWN = "Arbitraje: Resolviendo objetos visibles...",
    COULD_NOT_RESOLVE = "Arbitraje: %d objetos no pudieron resolverse",
    BTN_SET_ERA = "Establecer Objetivo: ERA", BTN_SET_ANNIV = "Establecer Objetivo: ANIV",
    TARGET_SET = "Objetivo: %s |cffff8800(Esperando...)|r",
    BTN_REFRESH = "Actualizar Lista", BTN_CLEANUP = "Eliminar Duplicados",
    BTN_RESET = "Restablecer Datos", BTN_RESET_BL = "Vaciar Lista",
    BTN_BLACKLIST = "Obj. Ignorados", BTN_BACK = "Volver",
    REMOVED_DUPS = "%d duplicados eliminados",
    BLACKLIST_MODE = "|cffff0000[MODO IGNORADOS]|r Clic Derecho para restaurar.",
    HEADER_FAV = "Fav", HEADER_NAME = "Nombre de Objeto", HEADER_LIQ = "Liq.(ERA)",
    HEADER_ERA = "Precio Era", HEADER_ANNIV = "Precio Aniv", HEADER_PROFIT = "Beneficio",
    HEADER_PERCENT = "Beneficio %", FILTER_SEARCH = "Buscar:",
    FILTER_MIN_P = "Mín %:", FILTER_MIN_G = "Mín Oro:", FILTER_MIN_Q = "Calidad Mín:",
    CHK_HIDE_MISSING = "Ocultar Faltantes", CHK_ONLY_FAVS = "Solo Favoritos",
    TOOLTIP_TITLE = "Datos de Arbitraje:", TOOLTIP_ERA_PRICE = "Precio Era:",
    TOOLTIP_ANNIV_PRICE = "Precio Aniv:", TOOLTIP_NOT_SEEN = "No Visto",
    TOOLTIP_LIQUIDITY = "Liquidez Era:", TOOLTIP_PROFIT = "Beneficio Potencial:",
    TOOLTIP_HISTORY = "--- Escaneo Anterior ---", TOOLTIP_ERA_OLD = "Era (Antiguo):",
    TOOLTIP_ANNIV_OLD = "Aniv (Antiguo):", TOOLTIP_SHIFT_CLICK = "Mayús+Clic: Enlazar al chat",
    TOOLTIP_ALT_RCLICK = "Alt+Clic Derecho: Lista Negra", TOOLTIP_RESTORE = "Clic Derecho: Restaurar objeto",
    POPUP_TITLE = "¿Restablecer TODOS los datos de escaneo?", POPUP_TEXT = "¡Esto eliminará los escaneos ERA y ANIV!\n\nLos Favoritos y la Lista Negra se conservarán.",
    POPUP_BUTTON1 = "Sí, Restablecer", POPUP_BUTTON2 = "Cancelar",
    RESET_DONE = "Arbitraje: ¡Todos los datos de escaneo restablecidos! Vuelve a escanear ambos servidores ahora.",
    POPUP_BL_TITLE = "¿Vaciar lista de ignorados?", POPUP_BL_TEXT = "Esto restaurará TODOS los objetos ignorados.\n\nLos datos de escaneo NO se borrarán.",
    RESET_BL_DONE = "Arbitraje: Lista de ignorados vaciada.",
    CONTACT_TEXT = "|cffaaaaaa¿Reportar un bug? ¿O gritarme?|r |cff00ccffouinche@gmail.com|r"
}

local L_itIT = {
    ADDON_TITLE = "Arbitraggio: La Grande Migrazione v" .. VERSION,
    READY_FIRST = "Seleziona prima il Bersaglio", READY = "Pronto!",
    LAST_SCAN = "Ultima Scansione:", NEVER = "Mai",
    WARNING_DESYNC = "Attenzione: Scansioni non sincronizzate (>30m di scarto)!",
    SCANNING = "SCANSIONE: %d%% (%d/%d) ~%d/s",
    SCAN_STARTED = "SCANSIONE AVVIATA...", FINALIZING = "Finalizzazione...",
    SAVE_SCAN = "Arbitraggio: %s salvato (%d oggetti in %.1fs)",
    WAIT_SCAN = "|cffff0000Attendi la scansione!|r",
    ALL_RESOLVED = "Arbitraggio: Tutti gli oggetti risolti!",
    RESOLVING_UNKNOWN = "Arbitraggio: Risoluzione oggetti visibili...",
    COULD_NOT_RESOLVE = "Arbitraggio: %d oggetti non risolti",
    BTN_SET_ERA = "Imposta Bersaglio: ERA", BTN_SET_ANNIV = "Imposta Bersaglio: ANNIV",
    TARGET_SET = "Bersaglio: %s |cffff8800(Attesa...)|r",
    BTN_REFRESH = "Aggiorna Lista", BTN_CLEANUP = "Rimuovi Duplicati",
    BTN_RESET = "Reimposta Dati", BTN_RESET_BL = "Svuota Lista",
    BTN_BLACKLIST = "Ogg. Ignorati", BTN_BACK = "Indietro",
    REMOVED_DUPS = "%d duplicati rimossi",
    BLACKLIST_MODE = "|cffff0000[MODO IGNORATI]|r Clic Destro per ripristinare.",
    HEADER_FAV = "Pref", HEADER_NAME = "Nome Oggetto", HEADER_LIQ = "Liq.(ERA)",
    HEADER_ERA = "Prezzo Era", HEADER_ANNIV = "Prezzo Anniv", HEADER_PROFIT = "Profitto",
    HEADER_PERCENT = "Profitto %", FILTER_SEARCH = "Ricerca:",
    FILTER_MIN_P = "Min %:", FILTER_MIN_G = "Min Oro:", FILTER_MIN_Q = "Qualità Min:",
    CHK_HIDE_MISSING = "Nascondi Mancanti", CHK_ONLY_FAVS = "Solo Preferiti",
    TOOLTIP_TITLE = "Dati Arbitraggio:", TOOLTIP_ERA_PRICE = "Prezzo Era:",
    TOOLTIP_ANNIV_PRICE = "Prezzo Anniv:", TOOLTIP_NOT_SEEN = "Non Visto",
    TOOLTIP_LIQUIDITY = "Liquidità Era:", TOOLTIP_PROFIT = "Profitto Potenziale:",
    TOOLTIP_HISTORY = "--- Scansione Precedente ---", TOOLTIP_ERA_OLD = "Era (Vecchio):",
    TOOLTIP_ANNIV_OLD = "Anniv (Vecchio):", TOOLTIP_SHIFT_CLICK = "Maiusc+Clic: Link in chat",
    TOOLTIP_ALT_RCLICK = "Alt+Clic Destro: Blacklist", TOOLTIP_RESTORE = "Clic Destro: Rimuovi da Lista",
    POPUP_TITLE = "Reimposta TUTTI i dati di scansione?", POPUP_TEXT = "Questo eliminerà le scansioni ERA e ANNIV!\n\nI Preferiti e la Blacklist verranno mantenuti.",
    POPUP_BUTTON1 = "Sì, Reimposta", POPUP_BUTTON2 = "Annulla",
    RESET_DONE = "Arbitraggio: Tutti i dati di scansione reimpostati! Riesegui la scansione di entrambi i server ora.",
    POPUP_BL_TITLE = "Svuotare lista ignorati?", POPUP_BL_TEXT = "Questo ripristinerà TUTTI gli oggetti ignorati.\n\nI dati di scansione NON verranno eliminati.",
    RESET_BL_DONE = "Arbitraggio: Lista oggetti ignorati svuotata.",
    CONTACT_TEXT = "|cffaaaaaaSegnalare un bug? O urlarmi contro?|r |cff00ccffouinche@gmail.com|r"
}

local locale = GetLocale()
if locale == "frFR" then L = L_frFR elseif locale == "deDE" then L = L_deDE elseif locale == "esES" or locale == "esMX" then L = L_esES elseif locale == "itIT" then L = L_itIT else L = L_enGB end

-- ===============================================
-- II. CONFIGURATION AND VARIABLES
-- ===============================================
local ITEMS_PER_TICK = 300
local MAX_DISPLAY_ROWS = 1000
local VISIBLE_ROWS = 30
local QUERY_BUDGET = 10
local STATUS_UPDATE_INTERVAL = 50

local frame = CreateFrame("Frame")
local isScanning = false
local currentTargetTable = nil
local processingIndex = 0
local totalItemsOnPage = 0
local currentSort = "profit"
local sortAscending = false
local lastAuctionCount = 0
local scanStableTimer = nil
local lastStatusUpdate = 0
local scrollOffset = 0
local scanStartTime = 0
local viewResolver = nil
local lastProgressTime = 0
local showBlacklistMode = false

local minPercentFilter = 400
local minGoldFilter = 0
local nameFilter = ""
local hideMissingEra = false
local onlyFavorites = false
local minQualityFilter = 0

local statusTextRef, lastScanEraRef, lastScanAnnivRef, warningTextRef, scrollContentRef, scrollFrameRef
local btnBlacklistRef
local headerButtons = {}
local rows = {}

local lowerNameFilter = ""
local minGoldCopper = 0
local comparisonPool = {}
local poolIndex = 1
local sortedResults = {}

local QUALITY_COLORS = {
    [0] = {r = 0.62, g = 0.62, b = 0.62}, [1] = {r = 1.00, g = 1.00, b = 1.00},
    [2] = {r = 0.12, g = 1.00, b = 0.00}, [3] = {r = 0.00, g = 0.44, b = 0.87},
    [4] = {r = 0.64, g = 0.21, b = 0.93}, [5] = {r = 1.00, g = 0.50, b = 0.00}
}
local QUALITY_NAMES = {[0]="Poor", [1]="Common", [2]="Uncommon", [3]="Rare", [4]="Epic", [5]="Legendary"}

-- ===============================================
-- III. UTILITY FUNCTIONS
-- ===============================================
local function GetTimestamp() return date("%d/%m %H:%M") end
local function UpdateStatus(text) if statusTextRef then statusTextRef:SetText(text) end end
local function ColorToHex(r, g, b) return string.format("%02x%02x%02x", r*255, g*255, b*255) end

local function CheckScanTimers()
    if not ArbitrageDB then return end
    local eraTime = ArbitrageDB.ERA_SCAN_TS or 0
    local annivTime = ArbitrageDB.ANNIV_SCAN_TS or 0
    local now = time()
    local isEraOld = (now - eraTime) > 7200
    local isAnnivOld = (now - annivTime) > 7200
    if lastScanEraRef then
        lastScanEraRef:SetText(L.LAST_SCAN .. " " .. (ArbitrageDB.ERA_LAST_SCAN or L.NEVER))
        lastScanEraRef:SetTextColor(isEraOld and 1 or 0.7, 0.7, 0.7)
    end
    if lastScanAnnivRef then
        lastScanAnnivRef:SetText(L.LAST_SCAN .. " " .. (ArbitrageDB.ANNIV_LAST_SCAN or L.NEVER))
        lastScanAnnivRef:SetTextColor(isAnnivOld and 1 or 0.7, 0.7, 0.7)
    end
    if warningTextRef then
        local gap = math.abs(eraTime - annivTime)
        if gap > 1800 and eraTime > 0 and annivTime > 0 then
            warningTextRef:SetText(L.WARNING_DESYNC); warningTextRef:Show()
        else warningTextRef:Hide() end
    end
end

-- Forward declaration
function RefreshList() end

local function ToggleFavorite(itemId)
    if not ArbitrageDB.FAVS then ArbitrageDB.FAVS = {} end
    ArbitrageDB.FAVS[itemId] = not ArbitrageDB.FAVS[itemId] or nil
    if not isScanning then RefreshList() end
end

local function ToggleBlacklist(itemId)
    ArbitrageDB.BLACKLIST = ArbitrageDB.BLACKLIST or {}
    ArbitrageDB.BLACKLIST[itemId] = not ArbitrageDB.BLACKLIST[itemId] or nil
    if not isScanning then RefreshList() end
end

local function UpdateHeaderVisuals()
    for key, btn in pairs(headerButtons) do
        btn:SetText(btn.origText .. (key == currentSort and (sortAscending and " ^" or " v") or ""))
    end
end

local function GetComparison()
    local comp = comparisonPool[poolIndex]
    if not comp then comp = {}; comparisonPool[poolIndex] = comp end
    poolIndex = poolIndex + 1
    return comp
end
local function ResetPool() poolIndex = 1 end
local itemIdPattern = "item:(%d+)"

-- ===============================================
-- RESOLUTION DYNAMIQUE (SCROLL FIX)
-- ===============================================
local function StartViewResolver()
    if viewResolver then return end
    viewResolver = C_Timer.NewTicker(0.1, function()
        if not sortedResults then return end
        local totalResults = #sortedResults
        local rowHeight = 20
        local startIndex = math.max(1, math.floor(scrollOffset / rowHeight) + 1)
        local endIndex = math.min(totalResults, startIndex + VISIBLE_ROWS + 2)
        
        local resolvedCount = 0
        local stillHasUnknown = false
        
        for i = startIndex, endIndex do
            local data = sortedResults[i]
            if data and (not data.name or data.name == "Unknown" or data.name == "") then
                stillHasUnknown = true
                local name, _, quality = GetItemInfo(data.id)
                if name then
                    data.name = name
                    data.quality = quality or 0
                    if currentTargetTable and ArbitrageDB[currentTargetTable] and ArbitrageDB[currentTargetTable][data.id] then
                        ArbitrageDB[currentTargetTable][data.id].name = name
                        ArbitrageDB[currentTargetTable][data.id].quality = quality or 0
                    end
                    resolvedCount = resolvedCount + 1
                end
            end
        end
        
        if resolvedCount > 0 then UpdateVisibleRows() end
        if not stillHasUnknown then if viewResolver then viewResolver:Cancel() end viewResolver = nil end
    end)
end

function UpdateVisibleRows()
    if not scrollFrameRef or not sortedResults then return end
    local totalResults = #sortedResults
    if totalResults == 0 then
        for i = 1, #rows do rows[i]:Hide() end
        return
    end
    
    local rowHeight = 20
    local startIndex = math.max(1, math.floor(scrollOffset / rowHeight) + 1)
    local endIndex = math.min(totalResults, startIndex + VISIBLE_ROWS - 1)
    local hasUnknownVisible = false
    
    for i = 1, #rows do rows[i]:Hide() end
    
    local rowIndex = 1
    for dataIndex = startIndex, endIndex do
        if rowIndex > VISIBLE_ROWS then break end
        local data = sortedResults[dataIndex]
        local row = rows[rowIndex]
        if not row then break end
        
        if not data.name or data.name == "Unknown" or data.name == "" then hasUnknownVisible = true end
        
        row:SetPoint("TOPLEFT", 0, -(dataIndex - 1) * rowHeight)
        row.itemId = data.id
        row.link = data.link
        
        if not row.chkFav then
            row.chkFav = CreateFrame("CheckButton", nil, row, "UICheckButtonTemplate")
            row.chkFav:SetPoint("LEFT", 2, 0); row.chkFav:SetSize(20, 20)
            row.chkFav:SetScript("OnClick", function(self) ToggleFavorite(self:GetParent().itemId) end)
        end
        
        if showBlacklistMode then row.chkFav:Hide()
        else row.chkFav:SetChecked(data.isFav and true or false); row.chkFav:Show() end
        
        local _, _, _, hex = GetItemQualityColor(data.quality)
        local nameToDisplay = (data.name and data.name ~= "" and data.name ~= "Unknown") and data.name or ("Item #" .. data.id)
        local displayName = hex and ("|c" .. hex .. nameToDisplay .. "|r") or nameToDisplay
        
        row.colName:SetText(string.format("%d. %s", dataIndex, displayName))
        
        if showBlacklistMode then
            row.colLiquidity:SetText(""); row.colEra:SetText(""); row.colAnniv:SetText("")
            row.colProfit:SetTextColor(1, 0, 0); row.colProfit:SetText("IGNORED"); row.colPercent:SetText("")
        else
            if row.colLiquidity then
                if data.eraQuantity and data.eraQuantity > 0 then
                    local c = data.eraQuantity >= 100 and "|cff00ff00" or (data.eraQuantity >= 20 and "|cffffff00" or "|cffff8800")
                    row.colLiquidity:SetText(string.format("%s%d (%d)|r", c, data.eraQuantity, data.eraAuctions))
                else row.colLiquidity:SetText("|cffff0000N/A|r") end
            end
            row.colEra:SetText((data.missing or not data.eraPrice) and "|cffff0000None|r" or GetCoinTextureString(math.floor(data.eraPrice)))
            row.colAnniv:SetText(GetCoinTextureString(math.floor(data.annivPrice)))
            local diffVal = math.floor(data.diff)
            row.colProfit:SetTextColor(diffVal > 0 and 0 or 1, diffVal > 0 and 1 or 0, 0)
            row.colProfit:SetText(diffVal > 0 and GetCoinTextureString(diffVal) or "-" .. GetCoinTextureString(math.abs(diffVal)))
            row.colPercent:SetText(data.missing and "MAX" or string.format("%.0f%%", data.percent))
        end
        row:Show(); rowIndex = rowIndex + 1
    end
    if hasUnknownVisible then StartViewResolver() end
end

-- ===============================================
-- IV. CORE LOGIC
-- ===============================================
function RefreshList()
    if isScanning or not scrollContentRef then return end
    if not (ArbitrageDB.ERA and ArbitrageDB.ANNIV) then return end
    
    UpdateHeaderVisuals(); ResetPool()
    wipe(sortedResults) -- Important: On nettoie la liste
    
    local queryCount = 0
    local hasNameFilter = nameFilter ~= ""
    lowerNameFilter = hasNameFilter and string.lower(nameFilter) or ""
    minGoldCopper = minGoldFilter * 10000
    local eraData, annivData = ArbitrageDB.ERA, ArbitrageDB.ANNIV
    local blacklist, favs = ArbitrageDB.BLACKLIST or {}, ArbitrageDB.FAVS or {}
    
    if showBlacklistMode then
        UpdateStatus(L.BLACKLIST_MODE)
        for itemId in pairs(blacklist) do
            local name, link, quality = GetItemInfo(itemId)
            name = name or "Unknown"
            if not hasNameFilter or string.find(string.lower(name), lowerNameFilter, 1, true) then
                local comp = GetComparison()
                comp.id, comp.name, comp.quality, comp.link = itemId, name, quality or 0, link
                comp.eraPrice, comp.annivPrice, comp.diff, comp.percent = 0,0,0,0
                table.insert(sortedResults, comp) -- INSERTION DIRECTE POUR EVITER LES TROUS
            end
        end
    else
        UpdateStatus("|cff00ff00" .. L.READY .. "|r")
        for itemId, annivItem in pairs(annivData) do
            if not blacklist[itemId] then
                local eraItem = eraData[itemId]
                local isFav = favs[itemId] == true
                local isMissingOnEra = not eraItem or not eraItem.price
                local eraPriceVal = eraItem and eraItem.price or 0
                local annivPrice = annivItem.price
                local diff = eraPriceVal - annivPrice
                local percent = isMissingOnEra and 9999999 or (eraPriceVal > annivPrice and annivPrice > 0 and (diff/annivPrice)*100 or 0)
                
                -- LOGIQUE: FAVORIS OU RENTABLE
                local isProfitable = (not (hideMissingEra and isMissingOnEra) and eraPriceVal > annivPrice and percent >= minPercentFilter and diff >= minGoldCopper)
                local pass = false
                if onlyFavorites then pass = isFav else pass = isFav or isProfitable end
                
                if pass then
                    local finalName, finalQuality = annivItem.name, annivItem.quality
                    if (not finalName or finalName == "Unknown") and queryCount < QUERY_BUDGET then
                        local dbName, _, dbQuality = GetItemInfo(itemId)
                        if dbName then
                            finalName, finalQuality = dbName, dbQuality
                            annivItem.name, annivItem.quality, annivItem.lowerName = dbName, dbQuality, string.lower(dbName)
                        else queryCount = queryCount + 1 end
                    end
                    
                    if (not finalQuality or finalQuality >= minQualityFilter) and (not hasNameFilter or (finalName ~= "Unknown" and string.find(annivItem.lowerName or "", lowerNameFilter, 1, true))) then
                        local comp = GetComparison()
                        comp.id, comp.name, comp.quality, comp.link = itemId, finalName, finalQuality or 0, annivItem.link
                        comp.eraPrice, comp.annivPrice, comp.diff, comp.percent = eraPriceVal, annivPrice, diff, percent
                        comp.isFav, comp.missing = isFav, isMissingOnEra
                        comp.eraQuantity, comp.eraAuctions = eraItem and eraItem.quantity or 0, eraItem and eraItem.auctions or 0
                        table.insert(sortedResults, comp) -- INSERTION DIRECTE POUR EVITER LES TROUS
                    end
                end
            end
        end
    end
    
    local compCount = #sortedResults
    if compCount > 1 and not showBlacklistMode then
        -- On définit la clé à trier
        local key = currentSort == "name" and "name" or 
                    currentSort == "era" and "eraPrice" or 
                    currentSort == "anniv" and "annivPrice" or 
                    currentSort == "percent" and "percent" or 
                    currentSort == "liquidity" and "eraQuantity" or "diff"
        
        table.sort(sortedResults, function(a,b)
            -- Sécurité anti-crash
            if not a or not b then return a ~= nil end 
            
            -- Cas spécial pour le tri par Favoris
            if currentSort == "fav" then 
                if a.isFav == b.isFav then 
                    return a.percent > b.percent -- Tri secondaire par % si statut fav identique
                end
                if sortAscending then
                    return not a.isFav -- Ascendant : Non-Fav d'abord
                else
                    return a.isFav -- Descendant : Fav d'abord
                end
            end
            
            -- Récupération des valeurs
            local va = a[key] or 0
            local vb = b[key] or 0
            
            -- Cas spécial pour les noms (texte)
            if key == "name" then 
                va = a.name or ""
                vb = b.name or ""
                if sortAscending then return va < vb else return va > vb end
            end
            
            -- Tri numérique standard
            if sortAscending then
                return va < vb -- Du plus petit au plus grand
            else
                return va > vb -- Du plus grand au plus petit
            end
        end)
    end

    
    if scrollFrameRef then scrollContentRef:SetHeight(math.max(1, compCount * 20)) end
    UpdateVisibleRows()
end

local function FinalizeScan()
    frame:SetScript("OnUpdate", nil)
    local scanDuration = GetTime() - scanStartTime
    UpdateStatus("|cffffff00" .. L.FINALIZING .. "|r")
    if scanStableTimer then scanStableTimer:Cancel() end
    
    scanStableTimer = C_Timer.After(0.5, function()
        if totalItemsOnPage > 1000 then
            ArbitrageDB[currentTargetTable .. "_LAST_SCAN"] = GetTimestamp()
            ArbitrageDB[currentTargetTable .. "_SCAN_TS"] = time()
            CheckScanTimers()
            print(string.format("|cff00ff00" .. L.SAVE_SCAN .. "|r", currentTargetTable, totalItemsOnPage, scanDuration))
        else UpdateStatus(L.READY_FIRST) end
        
        isScanning = false; lastStatusUpdate = 0
        RefreshList()
        C_Timer.After(0.2, function() if not showBlacklistMode then UpdateStatus("|cff00ff00" .. L.READY .. "|r") end end)
        scanStableTimer = nil
    end)
end

local function ProcessChunk()
    local targetDB = ArbitrageDB[currentTargetTable]
    if not targetDB then return end
    local currentBatchSize = GetNumAuctionItems("list")
    if not currentBatchSize or currentBatchSize == 0 then if GetTime()-lastProgressTime > 2 then FinalizeScan() end return end
    lastProgressTime = GetTime(); if currentBatchSize > totalItemsOnPage then totalItemsOnPage = currentBatchSize end
    if processingIndex > currentBatchSize then FinalizeScan(); return end
    
    local count = 0
    while processingIndex <= currentBatchSize and count < ITEMS_PER_TICK do
        local name, _, stackCount, quality, _, _, _, _, _, buyoutPrice, _, _, _, _, _, _, itemId = GetAuctionItemInfo("list", processingIndex)
        local link = GetAuctionItemLink("list", processingIndex)
        if not link and itemId then local _, l = GetItemInfo(itemId); link = l end
        if not itemId and link then itemId = tonumber(string.match(link, itemIdPattern)) end
        
        if itemId and stackCount and stackCount > 0 then
            local price = (buyoutPrice and buyoutPrice > 0) and buyoutPrice/stackCount or 0
            if price > 0 then
                local existing = targetDB[itemId]
                if not existing then
                    targetDB[itemId] = {id=itemId, name=name or "Unknown", lowerName=name and string.lower(name), price=price, link=link, quality=quality or 0, quantity=stackCount, auctions=1}
                else
                    if price < existing.price then existing.price, existing.link = price, link end
                    existing.quantity = (existing.quantity or 0) + stackCount
                    existing.auctions = (existing.auctions or 0) + 1
                    if name and existing.name == "Unknown" then existing.name, existing.quality, existing.lowerName = name, quality or 0, string.lower(name) end
                end
            end
        end
        processingIndex = processingIndex + 1; count = count + 1
    end
    
    if processingIndex - lastStatusUpdate >= STATUS_UPDATE_INTERVAL or processingIndex > currentBatchSize then
        local pct = math.min(100, math.floor((processingIndex/currentBatchSize)*100))
        UpdateStatus(string.format("|cffff8800"..L.SCANNING.."|r", pct, processingIndex, currentBatchSize, (GetTime()-scanStartTime > 0 and math.floor(processingIndex/(GetTime()-scanStartTime)) or 0)))
        lastStatusUpdate = processingIndex
    end
    if processingIndex > currentBatchSize then FinalizeScan() end
end

-- ===============================================
-- V. EVENT HANDLING
-- ===============================================
frame:RegisterEvent("ADDON_LOADED"); frame:RegisterEvent("AUCTION_ITEM_LIST_UPDATE")
frame:SetScript("OnEvent", function(self, event, arg1)
    if event == "ADDON_LOADED" and arg1 == ADDON_NAME then
        ArbitrageDB = ArbitrageDB or {}
        for _, k in pairs({"ERA", "ANNIV", "FAVS", "BLACKLIST", "ERA_HIST", "ANNIV_HIST"}) do ArbitrageDB[k] = ArbitrageDB[k] or {} end
        print("|cff00ff00" .. L.ADDON_TITLE .. " Loaded!|r /arbi"); CheckScanTimers()
    elseif event == "AUCTION_ITEM_LIST_UPDATE" then
        if currentTargetTable then
            local batchSize = GetNumAuctionItems("list")
            if batchSize and batchSize > 0 then
                if not isScanning then
                    lastAuctionCount, totalItemsOnPage, processingIndex, lastStatusUpdate = batchSize, batchSize, 1, 0
                    isScanning, scanStartTime, lastProgressTime = true, GetTime(), GetTime()
                    UpdateStatus("|cffff8800" .. L.SCAN_STARTED .. "|r"); frame:SetScript("OnUpdate", ProcessChunk)
                elseif isScanning and batchSize ~= lastAuctionCount then processingIndex, lastAuctionCount, lastProgressTime = 1, batchSize, GetTime() end
            end
        end
    end
end)

function SetTarget(targetTable)
    currentTargetTable = targetTable; lastAuctionCount = 0
    if viewResolver then viewResolver:Cancel(); viewResolver = nil end
    if ArbitrageDB[targetTable] then
        local hist = {}; for k, v in pairs(ArbitrageDB[targetTable]) do hist[k] = {id=v.id, name=v.name, price=v.price, link=v.link, quality=v.quality, quantity=v.quantity, auctions=v.auctions} end
        ArbitrageDB[targetTable .. "_HIST"] = hist
    end
    ArbitrageDB[targetTable] = {}; print("|cff00ff00Target: " .. targetTable .. ". Start scan.|r"); UpdateStatus(string.format(L.TARGET_SET, targetTable))
end

GameTooltip:HookScript("OnTooltipSetItem", function(self)
    if not ArbitrageDB then return end
    local _, link = self:GetItem(); if not link then return end
    local id = tonumber(string.match(link, itemIdPattern)); if not id then return end
    local era, anniv = ArbitrageDB.ERA and ArbitrageDB.ERA[id], ArbitrageDB.ANNIV and ArbitrageDB.ANNIV[id]
    if era or anniv then
        self:AddLine(" "); self:AddLine("|cff00ff00" .. L.TOOLTIP_TITLE .. "|r")
        if era then
            self:AddDoubleLine(L.TOOLTIP_ERA_PRICE, GetCoinTextureString(math.floor(era.price)))
            if era.quantity and era.quantity > 0 then
                local c = era.quantity >= 100 and "|cff00ff00" or (era.quantity >= 20 and "|cffffff00" or "|cffff8800")
                self:AddDoubleLine(L.TOOLTIP_LIQUIDITY, string.format("%s%d items (%d auctions)|r", c, era.quantity, era.auctions or 0))
            end
        else self:AddDoubleLine(L.TOOLTIP_ERA_PRICE, "|cffff0000" .. L.TOOLTIP_NOT_SEEN .. "|r") end
        
        if anniv then self:AddDoubleLine(L.TOOLTIP_ANNIV_PRICE, GetCoinTextureString(math.floor(anniv.price)))
        else self:AddDoubleLine(L.TOOLTIP_ANNIV_PRICE, "|cffff0000" .. L.TOOLTIP_NOT_SEEN .. "|r") end
        
        if era and anniv and anniv.price > 0 then
            local pct = ((era.price - anniv.price) / anniv.price) * 100
            if pct > 0 then self:AddDoubleLine(L.TOOLTIP_PROFIT, string.format("|cff00ff00%.0f%%|r", pct)) end
        end
        local hEra, hAnniv = ArbitrageDB.ERA_HIST and ArbitrageDB.ERA_HIST[id], ArbitrageDB.ANNIV_HIST and ArbitrageDB.ANNIV_HIST[id]
        if (hEra and era and hEra.price ~= era.price) or (hAnniv and anniv and hAnniv.price ~= anniv.price) then
            self:AddLine(" "); self:AddLine("|cffaaaaaa" .. L.TOOLTIP_HISTORY .. "|r")
            if hEra and era and hEra.price ~= era.price then self:AddDoubleLine(L.TOOLTIP_ERA_OLD, GetCoinTextureString(math.floor(hEra.price))) end
            if hAnniv and anniv and hAnniv.price ~= anniv.price then self:AddDoubleLine(L.TOOLTIP_ANNIV_OLD, GetCoinTextureString(math.floor(hAnniv.price))) end
        end
        self:AddLine(" "); self:AddLine(L.TOOLTIP_SHIFT_CLICK, 0.7, 1, 0.7); self:AddLine(L.TOOLTIP_ALT_RCLICK, 0.6, 0.6, 0.6)
    end
end)

-- ===============================================
-- VI. UI CREATION
-- ===============================================
local function CreateHeaderButton(parent, text, width, sortKey, xPos)
    local btn = CreateFrame("Button", nil, parent, "GameMenuButtonTemplate")
    btn:SetPoint("TOPLEFT", xPos, -130); btn:SetSize(width, 25); btn:SetText(text); btn:SetNormalFontObject("GameFontNormalSmall"); btn.origText = text
    btn:SetScript("OnClick", function() if isScanning then return end; if currentSort == sortKey then sortAscending = not sortAscending else currentSort = sortKey; sortAscending = false end; RefreshList() end)
    headerButtons[sortKey] = btn
end

local function CreateUI()
    if ArbitrageFrame then ArbitrageFrame:Show(); ArbitrageFrame:Raise(); return end
    local f = CreateFrame("Frame", "ArbitrageFrame", UIParent, "BasicFrameTemplateWithInset")
    f:SetSize(950, 650); f:SetPoint("CENTER"); f:SetMovable(true); f:EnableMouse(true); f:RegisterForDrag("LeftButton"); f:SetScript("OnDragStart", f.StartMoving); f:SetScript("OnDragStop", f.StopMovingOrSizing); f:SetFrameStrata("MEDIUM"); f:SetToplevel(true)
    f.title = f:CreateFontString(nil, "OVERLAY"); f.title:SetFontObject("GameFontHighlight"); f.title:SetPoint("LEFT", f.TitleBg, "LEFT", 5, 0); f.title:SetText(L.ADDON_TITLE)
    local btnMinimize = CreateFrame("Button", nil, f, "UIPanelCloseButton"); btnMinimize:SetSize(20, 20); btnMinimize:SetPoint("RIGHT", f.CloseButton, "LEFT", -3, 0); btnMinimize:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up"); btnMinimize:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down"); btnMinimize:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
    f.isMinimized = false; f.normalHeight = 650; f.minimizedHeight = 60; f.normalWidth = 950; f.minimizedWidth = 250
    
    local status = f:CreateFontString(nil, "OVERLAY", "GameFontNormalHuge"); status:SetPoint("TOP", f, "TOP", 0, -35); status:SetText(L.READY_FIRST); status:SetTextColor(1, 0.8, 0); statusTextRef = status
    local warn = f:CreateFontString(nil, "OVERLAY", "GameFontNormal"); warn:SetPoint("TOP", status, "BOTTOM", 0, -5); warn:SetTextColor(1, 0, 0); warn:SetText(""); warningTextRef = warn
    
    local btnScanEra = CreateFrame("Button", nil, f, "GameMenuButtonTemplate"); btnScanEra:SetPoint("TOPLEFT", f, "TOPLEFT", 20, -70); btnScanEra:SetSize(140, 30); btnScanEra:SetText(L.BTN_SET_ERA); btnScanEra:SetScript("OnClick", function() SetTarget("ERA") end)
    local lblEra = f:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall"); lblEra:SetPoint("TOPLEFT", btnScanEra, "BOTTOMLEFT", 5, -5); lblEra:SetText(L.LAST_SCAN.." "..L.NEVER); lblEra:SetTextColor(0.7, 0.7, 0.7); lastScanEraRef = lblEra
    local btnScanAnniv = CreateFrame("Button", nil, f, "GameMenuButtonTemplate"); btnScanAnniv:SetPoint("LEFT", btnScanEra, "RIGHT", 20, 0); btnScanAnniv:SetSize(140, 30); btnScanAnniv:SetText(L.BTN_SET_ANNIV); btnScanAnniv:SetScript("OnClick", function() SetTarget("ANNIV") end)
    local lblAnniv = f:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall"); lblAnniv:SetPoint("TOPLEFT", btnScanAnniv, "BOTTOMLEFT", 5, -5); lblAnniv:SetText(L.LAST_SCAN.." "..L.NEVER); lblAnniv:SetTextColor(0.7, 0.7, 0.7); lastScanAnnivRef = lblAnniv
    
    local lblName = f:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall"); lblName:SetPoint("TOPRIGHT", f, "TOPRIGHT", -250, -50); lblName:SetText(L.FILTER_SEARCH)
    local inputName = CreateFrame("EditBox", nil, f, "InputBoxTemplate"); inputName:SetSize(100, 20); inputName:SetPoint("LEFT", lblName, "RIGHT", 5, 0); inputName:SetAutoFocus(false); inputName:SetScript("OnTextChanged", function(self) nameFilter = self:GetText() end); inputName:SetScript("OnEnterPressed", function() if not isScanning then RefreshList() end end)
    local lblMinP = f:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall"); lblMinP:SetPoint("TOPRIGHT", f, "TOPRIGHT", -250, -75); lblMinP:SetText(L.FILTER_MIN_P)
    local inputPercent = CreateFrame("EditBox", nil, f, "InputBoxTemplate"); inputPercent:SetSize(40, 20); inputPercent:SetPoint("LEFT", lblMinP, "RIGHT", 5, 0); inputPercent:SetAutoFocus(false); inputPercent:SetNumeric(true); inputPercent:SetNumber(minPercentFilter); inputPercent:SetScript("OnTextChanged", function(self) minPercentFilter = self:GetNumber() end)
    local lblMinG = f:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall"); lblMinG:SetPoint("LEFT", inputPercent, "RIGHT", 15, 0); lblMinG:SetText(L.FILTER_MIN_G)
    local inputGold = CreateFrame("EditBox", nil, f, "InputBoxTemplate"); inputGold:SetSize(40, 20); inputGold:SetPoint("LEFT", lblMinG, "RIGHT", 5, 0); inputGold:SetAutoFocus(false); inputGold:SetNumeric(true); inputGold:SetNumber(minGoldFilter); inputGold:SetScript("OnTextChanged", function(self) minGoldFilter = self:GetNumber() end)
    local lblQuality = f:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall"); lblQuality:SetPoint("TOPLEFT", lblMinP, "BOTTOMLEFT", 0, -10); lblQuality:SetText(L.FILTER_MIN_Q)
    local dropdownQuality = CreateFrame("Button", "ArbitrageQualityDropdown", f, "UIDropDownMenuTemplate"); dropdownQuality:SetPoint("LEFT", lblQuality, "RIGHT", -15, -2); UIDropDownMenu_SetWidth(dropdownQuality, 110); local c = QUALITY_COLORS[0]; UIDropDownMenu_SetText(dropdownQuality, "|cff" .. ColorToHex(c.r,c.g,c.b) .. QUALITY_NAMES[0] .. "|r")
    UIDropDownMenu_Initialize(dropdownQuality, function(self, level) local info = UIDropDownMenu_CreateInfo(); for i = 0, 5 do local color = QUALITY_COLORS[i]; info.text = "|cff"..ColorToHex(color.r,color.g,color.b)..QUALITY_NAMES[i].."|r"; info.value = i; info.func = function(self) minQualityFilter = self.value; local c = QUALITY_COLORS[self.value]; UIDropDownMenu_SetText(dropdownQuality, "|cff"..ColorToHex(c.r,c.g,c.b)..QUALITY_NAMES[self.value].."|r"); if not isScanning then RefreshList() end end; info.checked = minQualityFilter == i; info.justifyH = "LEFT"; UIDropDownMenu_AddButton(info) end end)
    
    local chkHideMissing = CreateFrame("CheckButton", nil, f, "UICheckButtonTemplate"); chkHideMissing:SetPoint("TOPLEFT", lblQuality, "BOTTOMLEFT", -20, -5); chkHideMissing:SetSize(20, 20); chkHideMissing.text = chkHideMissing:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall"); chkHideMissing.text:SetPoint("LEFT", chkHideMissing, "RIGHT", 0, 0); chkHideMissing.text:SetText(L.CHK_HIDE_MISSING); chkHideMissing:SetScript("OnClick", function(self) hideMissingEra = self:GetChecked(); if not isScanning then RefreshList() end end)
    local chkOnlyFavs = CreateFrame("CheckButton", nil, f, "UICheckButtonTemplate"); chkOnlyFavs:SetPoint("LEFT", chkHideMissing.text, "RIGHT", 10, 0); chkOnlyFavs:SetSize(20, 20); chkOnlyFavs.text = chkOnlyFavs:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall"); chkOnlyFavs.text:SetPoint("LEFT", chkOnlyFavs, "RIGHT", 0, 0); chkOnlyFavs.text:SetText(L.CHK_ONLY_FAVS); chkOnlyFavs:SetScript("OnClick", function(self) onlyFavorites = self:GetChecked(); if not isScanning then RefreshList() end end)
    
    local btnCalc = CreateFrame("Button", nil, f, "GameMenuButtonTemplate"); btnCalc:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", -20, 15); btnCalc:SetSize(140, 30); btnCalc:SetText(L.BTN_REFRESH); btnCalc:SetScript("OnClick", function() if not isScanning then RefreshList() else print(L.WAIT_SCAN) end end)
    local btnCleanup = CreateFrame("Button", nil, f, "GameMenuButtonTemplate"); btnCleanup:SetPoint("RIGHT", btnCalc, "LEFT", -10, 0); btnCleanup:SetSize(140, 30); btnCleanup:SetText(L.BTN_CLEANUP); btnCleanup:SetScript("OnClick", function() if not ArbitrageDB then return end; local r = 0; for _, t in ipairs({"ERA","ANNIV"}) do if ArbitrageDB[t] then local seen, del = {}, {}; for id, d in pairs(ArbitrageDB[t]) do local k=(d.name or "").."_"..(d.price or 0); if seen[k] then table.insert(del,id); r=r+1 else seen[k]=true end end; for _, id in ipairs(del) do ArbitrageDB[t][id]=nil end end end; print("|cff00ff00"..string.format(L.REMOVED_DUPS, r).."|r"); if not isScanning then RefreshList() end end)
    local btnBlacklist = CreateFrame("Button", nil, f, "GameMenuButtonTemplate"); btnBlacklist:SetPoint("RIGHT", btnCleanup, "LEFT", -10, 0); btnBlacklist:SetSize(130, 30); btnBlacklist:SetText(L.BTN_BLACKLIST); btnBlacklistRef = btnBlacklist
    local btnReset = CreateFrame("Button", nil, f, "GameMenuButtonTemplate"); btnReset:SetPoint("RIGHT", btnBlacklist, "LEFT", -10, 0); btnReset:SetSize(100, 30); btnReset:SetText(L.BTN_RESET)
    btnBlacklist:SetScript("OnClick", function() if isScanning then return end; showBlacklistMode = not showBlacklistMode; if showBlacklistMode then btnBlacklist:SetText(L.BTN_BACK); btnReset:SetText(L.BTN_RESET_BL); btnCleanup:Hide(); btnCalc:Hide(); chkHideMissing:Hide(); chkOnlyFavs:Hide() else btnBlacklist:SetText(L.BTN_BLACKLIST); btnReset:SetText(L.BTN_RESET); btnCleanup:Show(); btnCalc:Show(); chkHideMissing:Show(); chkOnlyFavs:Show() end; RefreshList() end)
    btnReset:SetScript("OnClick", function() if showBlacklistMode then StaticPopup_Show("ARBITRAGE_RESET_BLACKLIST") else StaticPopup_Show("ARBITRAGE_RESET_CONFIRM") end end)
    local contactText = f:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall"); contactText:SetPoint("BOTTOMLEFT", f, "BOTTOMLEFT", 15, 15); contactText:SetText(L.CONTACT_TEXT)
    
    CreateHeaderButton(f, L.HEADER_FAV, 40, "fav", 20); CreateHeaderButton(f, L.HEADER_NAME, 220, "name", 65); CreateHeaderButton(f, L.HEADER_LIQ, 90, "liquidity", 290); CreateHeaderButton(f, L.HEADER_ERA, 110, "era", 390); CreateHeaderButton(f, L.HEADER_ANNIV, 110, "anniv", 510); CreateHeaderButton(f, L.HEADER_PROFIT, 110, "profit", 630); CreateHeaderButton(f, L.HEADER_PERCENT, 90, "percent", 750)
    
    local scrollFrame = CreateFrame("ScrollFrame", nil, f, "UIPanelScrollFrameTemplate"); scrollFrame:SetPoint("TOPLEFT", 20, -160); scrollFrame:SetPoint("BOTTOMRIGHT", -40, 50); scrollFrameRef = scrollFrame; scrollFrame:SetScript("OnVerticalScroll", function(self, offset) scrollOffset = offset; if not isScanning then UpdateVisibleRows() end end)
    local content = CreateFrame("Frame", nil, scrollFrame); content:SetSize(860, 10000); scrollFrame:SetScrollChild(content); scrollContentRef = content
    for i = 1, VISIBLE_ROWS do
        local row = CreateFrame("Button", nil, content); row:SetSize(860, 20); row:SetPoint("TOPLEFT", 0, -(i-1)*20); row:SetHighlightTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight", "ADD")
        row.colName = row:CreateFontString(nil, "OVERLAY", "GameFontNormal"); row.colName:SetPoint("LEFT", 30, 0); row.colName:SetWidth(240); row.colName:SetJustifyH("LEFT")
        row.colLiquidity = row:CreateFontString(nil, "OVERLAY", "GameFontHighlight"); row.colLiquidity:SetPoint("LEFT", 270, 0); row.colLiquidity:SetWidth(90); row.colLiquidity:SetJustifyH("CENTER")
        row.colEra = row:CreateFontString(nil, "OVERLAY", "GameFontHighlight"); row.colEra:SetPoint("LEFT", 370, 0); row.colEra:SetWidth(110); row.colEra:SetJustifyH("RIGHT")
        row.colAnniv = row:CreateFontString(nil, "OVERLAY", "GameFontHighlight"); row.colAnniv:SetPoint("LEFT", 490, 0); row.colAnniv:SetWidth(110); row.colAnniv:SetJustifyH("RIGHT")
        row.colProfit = row:CreateFontString(nil, "OVERLAY", "GameFontGreen"); row.colProfit:SetPoint("LEFT", 610, 0); row.colProfit:SetWidth(110); row.colProfit:SetJustifyH("RIGHT")
        row.colPercent = row:CreateFontString(nil, "OVERLAY", "GameFontGreen"); row.colPercent:SetPoint("LEFT", 730, 0); row.colPercent:SetWidth(90); row.colPercent:SetJustifyH("RIGHT")
        row:RegisterForClicks("LeftButtonUp", "RightButtonUp"); row:SetScript("OnClick", function(self, button) if IsShiftKeyDown() and self.link then if ChatEdit_GetActiveWindow() then ChatEdit_InsertLink(self.link) else if not ChatFrame1EditBox:IsVisible() then ChatFrame_OpenChat("") end; ChatEdit_InsertLink(self.link) end return end if button == "RightButton" then if showBlacklistMode or IsAltKeyDown() then if self.itemId then ToggleBlacklist(self.itemId) end end end end); row:SetScript("OnEnter", function(self) if not self.itemId then return end; GameTooltip:SetOwner(self, "ANCHOR_RIGHT"); if self.link then GameTooltip:SetHyperlink(self.link) else GameTooltip:SetItemByID(self.itemId) end; GameTooltip:Show() end); row:SetScript("OnLeave", function() GameTooltip:Hide() end)
        rows[i] = row
    end
    btnMinimize:SetScript("OnClick", function(self) local p = self:GetParent(); if p.isMinimized then p:SetSize(p.normalWidth, p.normalHeight); p.isMinimized = false; self:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up"); self:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down"); scrollFrame:Show(); btnReset:Show(); btnScanEra:Show(); btnScanAnniv:Show(); lblEra:Show(); lblAnniv:Show(); lblName:Show(); inputName:Show(); lblMinP:Show(); inputPercent:Show(); lblMinG:Show(); inputGold:Show(); lblQuality:Show(); dropdownQuality:Show(); warn:Show(); contactText:Show(); btnBlacklist:Show(); if not showBlacklistMode then btnCalc:Show(); btnCleanup:Show(); chkHideMissing:Show(); chkOnlyFavs:Show() end; for _, b in pairs(headerButtons) do b:Show() end else p:SetSize(p.minimizedWidth, p.minimizedHeight); p.isMinimized = true; self:SetNormalTexture("Interface\\Buttons\\UI-Panel-MaximizeButton-Up"); self:SetPushedTexture("Interface\\Buttons\\UI-Panel-MaximizeButton-Down"); scrollFrame:Hide(); btnCalc:Hide(); btnCleanup:Hide(); btnReset:Hide(); btnScanEra:Hide(); btnScanAnniv:Hide(); lblEra:Hide(); lblAnniv:Hide(); lblName:Hide(); inputName:Hide(); lblMinP:Hide(); inputPercent:Hide(); lblMinG:Hide(); inputGold:Hide(); lblQuality:Hide(); dropdownQuality:Hide(); chkHideMissing:Hide(); chkOnlyFavs:Hide(); btnBlacklist:Hide(); warn:Hide(); contactText:Hide(); for _, b in pairs(headerButtons) do b:Hide() end end end)
    CheckScanTimers()
    
    -- AUTO LOAD IF DATA EXISTS
    if ArbitrageDB.ERA and next(ArbitrageDB.ERA) and ArbitrageDB.ANNIV and next(ArbitrageDB.ANNIV) then
        UpdateStatus("|cff00ff00Cached Data|r")
        RefreshList()
    end
end

StaticPopupDialogs["ARBITRAGE_RESET_CONFIRM"] = { text = L.POPUP_TITLE .. "\n|cffff0000" .. L.POPUP_TEXT .. "|r", button1 = L.POPUP_BUTTON1, button2 = L.POPUP_BUTTON2, OnAccept = function() ArbitrageDB.ERA = {}; ArbitrageDB.ANNIV = {}; ArbitrageDB.ERA_HIST = {}; ArbitrageDB.ANNIV_HIST = {}; ArbitrageDB.ERA_LAST_SCAN = nil; ArbitrageDB.ANNIV_LAST_SCAN = nil; ArbitrageDB.ERA_SCAN_TS = nil; ArbitrageDB.ANNIV_SCAN_TS = nil; print("|cff00ff00" .. L.RESET_DONE .. "|r"); UpdateStatus("|cffffff00" .. L.READY_FIRST .. "|r"); CheckScanTimers(); RefreshList() end, timeout = 0, whileDead = true, hideOnEscape = true, preferredIndex = 3 }
StaticPopupDialogs["ARBITRAGE_RESET_BLACKLIST"] = { text = L.POPUP_BL_TITLE .. "\n|cffff0000" .. L.POPUP_BL_TEXT .. "|r", button1 = L.POPUP_BUTTON1, button2 = L.POPUP_BUTTON2, OnAccept = function() ArbitrageDB.BLACKLIST = {}; print("|cff00ff00" .. L.RESET_BL_DONE .. "|r"); RefreshList() end, timeout = 0, whileDead = true, hideOnEscape = true, preferredIndex = 3 }

SLASH_ARBITRAGE1 = "/arbi"
SlashCmdList["ARBITRAGE"] = function() CreateUI() end

-- VERSION: 0.9.9
-- AUTHOR: Ouinche
-- CONTACT, insults, donations : ouinche@gmail.com
-- Link : https://github.com/OuincheWinch/ArbitrageAddon/
function SwapWearable( unit, target_model, new_model )
    local wearable = unit:FirstMoveChild()
    while wearable ~= nil do
        if wearable:GetClassname() == "dota_item_wearable" then
            if wearable:GetModelName() == target_model then
                wearable:SetModel( new_model )
                return
            end
        end
        wearable = wearable:NextMovePeer()
    end
end

-- Returns a wearable handle if its the passed target_model
function GetWearable( unit, target_model )
    local wearable = unit:FirstMoveChild()
    while wearable ~= nil do
        if wearable:GetClassname() == "dota_item_wearable" then
            if wearable:GetModelName() == target_model then
                return wearable
            end
        end
        wearable = wearable:NextMovePeer()
    end
    return false
end

function HideWearable( unit, target_model )
    local wearable = unit:FirstMoveChild()
    while wearable ~= nil do
        if wearable:GetClassname() == "dota_item_wearable" then
            if wearable:GetModelName() == target_model then
                wearable:AddEffects(EF_NODRAW)
                return
            end
        end
        wearable = wearable:NextMovePeer()
    end
end

function ShowWearable( unit, target_model )
    local wearable = unit:FirstMoveChild()
    while wearable ~= nil do
        if wearable:GetClassname() == "dota_item_wearable" then
            if wearable:GetModelName() == target_model then
                wearable:RemoveEffects(EF_NODRAW)
                return
            end
        end
        wearable = wearable:NextMovePeer()
    end
end

function PrintWearables( unit )
    print("---------------------")
    print("Wearable List of "..unit:GetUnitName())
    print("Main Model: "..unit:GetModelName())
    local wearable = unit:FirstMoveChild()
    while wearable ~= nil do
        if wearable:GetClassname() == "dota_item_wearable" then
            local model_name = wearable:GetModelName()
            if model_name ~= "" then print(model_name) end
        end
        wearable = wearable:NextMovePeer()
    end
end
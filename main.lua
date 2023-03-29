local mx9 = {__drawn={}};

function mx9:IsMouseOver(Positions) 
    local x1, y1, x2, y2 = Positions[1], Positions[2], Positions[3], Positions[4];
    local mouseLoc = game:GetService('UserInputService'):GetMouseLocation();
    return (mouseLoc.X >= x1 and mouseLoc.X <= (x1 + (x2 - x1))) and (mouseLoc.Y >= y1 and mouseLoc.Y <= (y1 + (y2 - y1)));
end

function mx9:DrawImage(imageUrl, posX, posY, sizeX, sizeY, rounding): table 
    local Image = Drawing.new("Image")
    Image.Visible = true;
    Image.ZIndex = 1;
    Image.Data = game:HttpGet(imageUrl);
    Image.Transparency = 1;
    Image.Size = Vector2.new(sizeX, sizeY);
    Image.Position = Vector2.new(posX, posY);
    Image.Rounding = rounding

    table.insert(mx9.__drawn, Image);

    local SettersGetters = {};

    function SettersGetters:GetPosition() 
        return Image.Position;
    end

    function SettersGetters:SetPosition(Position) 
        Image.Position = Position;
    end

    function SettersGetters:GetSize() 
        return Image.Size
    end

    function SettersGetters:SetProperty(PropertyName, PropertyValue) 
        Image[PropertyName] = PropertyValue;
    end

    function SettersGetters:SetProperties(Properties) 
        for _, property in next, Properties do 
            Image[property[1]] = property[2];
        end
    end

    function SettersGetters:Remove() 
        Image:Remove();
    end

    return SettersGetters;
end

function mx9:DrawSquare(posX, posY, sizeX, sizeY, colorBg): table 
    local Square = Drawing.new("Square")
    Square.Visible = true;
    Square.ZIndex = 1;
    Square.Transparency = 1;
    Square.Color = colorBg;
    Square.Thickness = 1;
    Square.Size = Vector2.new(sizeX, sizeY);
    Square.Position = Vector2.new(posX, posY);
    Square.Filled = true;

    table.insert(mx9.__drawn, Square);

    local SettersGetters = {};

    function SettersGetters:GetPosition()
        if not Square then return end
        return Square.Position;
    end

    function SettersGetters:SetPosition(Position) 
        Square.Position = Position;
    end

    function SettersGetters:GetSize() 
        return Square.Size
    end

    function SettersGetters:SetProperty(PropertyName, PropertyValue) 
        Square[PropertyName] = PropertyValue;
    end

    function SettersGetters:SetProperties(Properties) 
        for _, property in next, Properties do 
            Square[property[1]] = property[2];
        end
    end

    function SettersGetters:Remove() 
        Square:Remove();
    end

    return SettersGetters;
end

function mx9:DrawString(textStr, posX, posY, size, font, colorBg): table 
    local Text = Drawing.new("Text")
    Text.Visible = true;
    Text.ZIndex = 1;
    Text.Transparency = 1;
    Text.Text = textStr;
    Text.Size = size;
    Text.Color = colorBg;
    Text.Center = false;
    Text.Outline = false;
    Text.OutlineColor = colorBg;
    Text.Position = Vector2.new(posX, posY);
    Text.Font = font;

    table.insert(mx9.__drawn, Text);

    local SettersGetters = {};

    function SettersGetters:GetTextBounds()
        return Text.TextBounds
    end

    function SettersGetters:GetPosition() 
        return Text.Position;
    end

    function SettersGetters:SetPosition(Position) 
        Text.Position = Position;
    end

    function SettersGetters:SetProperty(PropertyName, PropertyValue) 
        Text[PropertyName] = PropertyValue;
    end

    function SettersGetters:SetProperties(Properties) 
        for _, property in next, Properties do 
            Text[property[1]] = property[2];
        end
    end

    function SettersGetters:Remove() 
        Text:Remove();
    end

    return SettersGetters;
end

function mx9:DrawCircle(posX, posY, radius, filled, colorBg): table 
    local Circle = Drawing.new("Circle")
    Circle.Visible = true;
    Circle.ZIndex = 1;
    Circle.Transparency = 1;
    Circle.Color = colorBg;
    Circle.Thickness = 1;
    Circle.NumSides = 360;
    Circle.Radius = radius;
    Circle.Filled = filled;
    Circle.Position = Vector2.new(posX, posY);

    table.insert(mx9.__drawn, Circle);

    local SettersGetters = {};

    function SettersGetters:GetPosition() 
        return Circle.Position;
    end

    function SettersGetters:GetTextBounds() 
        return Circle.TextBounds;
    end

    function SettersGetters:SetPosition(Position) 
        Circle.Position = Position;
    end

    function SettersGetters:SetProperty(PropertyName, PropertyValue) 
        Circle[PropertyName] = PropertyValue;
    end

    function SettersGetters:SetProperties(Properties) 
        for _, property in next, Properties do 
            Circle[property[1]] = property[2];
        end
    end

    function SettersGetters:Remove() 
        Circle:Remove();
    end

    return SettersGetters;
end

return mx9;
